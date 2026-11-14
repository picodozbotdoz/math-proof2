"""Pilot 50 R1 (openai in-corpus 7/8) on Modal (app `crossmath-pilot-50-r1`), 2026-11-14.

Lane A3 pre-stage — STAGED, NOT RUN (gated on A7's G7b verdict; see
research/pilots/50/R1-prework.md §5 for the execution protocol).

Substrate: the DONOR pin (openai-math lean tree, toolchain v4.34.1, mathlib d13f23b7) —
A7's gprobe.py `g7` recipe: tarball = the pruned import closure of
OAI/NumberTheory/DirichletL/Nonvanishing.lean (+ lakefile.lean, lake-manifest.json,
lean-toolchain, patches/), `lake exe cache get` (one retry against the artifact-cache
outage), `lake build OAI.NumberTheory.DirichletL.Nonvanishing`, then each staged
`.lean` consumer file elaborated inside the tree via `lake env lean`. Verdict
conventions per run_m4.py/run_m4b2.py (error contexts incl. error(<code>) forms, sorry
detection, axioms report). Base image textually identical to lean_probe/axbump/run_m4
(shared layer cache); the v4.34.1 toolchain is installed at function start (the g7
pattern). Ephemeral `modal run` only — NO volume, NO secret, NO deploy.

Usage (via run_r1.sh, which stages world-readable copies):
    modal run run_r1.py --dir <stage-dir>
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]


app = modal.App("crossmath-pilot-50-r1")

DONOR_ROOT = "/home/doz/zcode-workdir/openai-math/lean"
TARGET = "OAI.NumberTheory.DirichletL.Nonvanishing"
TARGET_FILE = "OAI/NumberTheory/DirichletL/Nonvanishing.lean"
DONOR_TOOLCHAIN = "leanprover/lean4:v4.34.1"

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        # Textually identical to run_m4.py / axbump.py / gprobe.py (shared layer cache).
        "curl -sSfL https://github.com/leanprover/elan/releases/download/v4.2.4/elan-x86_64-unknown-linux-gnu.tar.gz | tar xz -C /tmp",
        "mkdir -p /opt/elan",
        "ELAN_HOME=/opt/elan /tmp/elan-init -y --default-toolchain none",
        f"ELAN_HOME=/opt/elan /opt/elan/bin/elan toolchain install {TOOLCHAIN}",
    )
    .run_commands(
        "git init /opt/mathlib",
        f"cd /opt/mathlib && git remote add origin {MATHLIB_URL}",
        f"cd /opt/mathlib && git fetch --depth 1 origin {MATHLIB_REV} && git checkout -q FETCH_HEAD",
        "cd /opt/mathlib && ELAN_HOME=/opt/elan /opt/elan/bin/lake exe cache get",
    )
    .env({"ELAN_HOME": "/opt/elan", "PATH": "/opt/elan/bin:/usr/local/bin:/usr/bin:/bin"})
)


def _sh(cmd, cwd, timeout):
    import subprocess
    try:
        r = subprocess.run(cmd, cwd=cwd, shell=True, capture_output=True, text=True,
                           timeout=timeout)
        return r.returncode, r.stdout + r.stderr
    except subprocess.TimeoutExpired as e:
        out = e.stdout or ""
        if isinstance(out, bytes):
            out = out.decode(errors="replace")
        return "TIMEOUT", out


def _condense(out, limit=120000):
    keep = [l for l in out.splitlines() if not l.startswith(("✔", "⣿"))]
    return "\n".join(keep)[:limit]


def donor_closure_tarball():
    """The pruned OAI closure (gprobe.py g7's builder, verbatim logic)."""
    import io, pathlib, tarfile

    root = pathlib.Path(DONOR_ROOT)

    def to_path(mod):
        if not mod.startswith("OAI."):
            return None
        rel = "OAI/" + mod[4:].replace(".", "/") + ".lean"
        return rel if (root / rel).exists() else None

    seen, frontier = {TARGET_FILE}, [TARGET_FILE]
    while frontier:
        rel = frontier.pop()
        for line in (root / rel).read_text(errors="replace").splitlines():
            s = line.strip()
            if s.startswith("import "):
                nxt = to_path(s[len("import "):].strip())
                if nxt and nxt not in seen:
                    seen.add(nxt)
                    frontier.append(nxt)
    buf = io.BytesIO()
    with tarfile.open(fileobj=buf, mode="w:gz") as tf:
        for extra in ["lakefile.lean", "lake-manifest.json", "lean-toolchain"]:
            tf.add(str(root / extra), arcname=extra)
        # the lakefile's post_update hooks require the compatibility patches
        tf.add(str(root / "patches"), arcname="patches")
        for s in sorted(seen):
            tf.add(str(root / s), arcname=s)
    print(f"[r1] OAI Nonvanishing closure: {len(seen)} files, "
          f"tarball {buf.tell() // 1024 // 1024} MB")
    return buf.getvalue()


image = image.add_local_python_source("modal_telemetry")


@app.function(image=image, **SPEC, secrets=CAP, timeout=3 * 60 * 60)
@telemetered
def run(tarball: bytes, files: dict, order: list):
    import io, pathlib, re, tarfile, time

    _sh(f"ELAN_HOME=/opt/elan /opt/elan/bin/elan toolchain install {DONOR_TOOLCHAIN}",
        "/", 900)
    work = pathlib.Path("/work")
    work.mkdir()
    tarfile.open(fileobj=io.BytesIO(tarball)).extractall(work / "lean")

    d = work / "lean"
    summary = {}
    rc, out = None, ""
    for attempt in range(2):  # artifact-cache outage retry
        rc, out = _sh("lake exe cache get", d, 1800)
        print(f"\n=== OAI cache (attempt {attempt + 1}): rc={rc}", flush=True)
        if rc == 0:
            break
        print(_condense(out, 4000), flush=True)
        time.sleep(60)
    if rc != 0:
        summary["cache"] = f"FAIL rc={rc}"
    else:
        rc, out = _sh(f"lake build {TARGET}", d, 2 * 3600)
        e = [l for l in out.splitlines() if ": error" in l]
        failed = sorted({m for m in re.findall(r"✖ \[\d+/\d+\] Building (\S+)", out)})
        summary["build"] = ("OK" if rc == 0 and not e else
                            f"FAIL rc={rc} errors={len(e)} failed_modules={len(failed)}")
        print(f"\n=== OAI build: {summary['build']}; failed: {failed[:40]}", flush=True)
        print(_condense(out), flush=True)
        if rc == 0:
            for rel in order:
                p = d / rel
                p.write_text(files[rel])
                print(f"\n=== {rel}", flush=True)
                rco, out2 = _sh(f"lake env lean {rel}", d, 2400)
                errors = [l for l in out2.splitlines()
                          if ": error" in l or l.startswith("error")]
                sorry = [l for l in out2.splitlines()
                         if "declaration uses 'sorry'" in l]
                axioms = [l for l in out2.splitlines()
                          if "'does not depend on any axioms'" in l
                          or "depends on axioms:" in l]
                verdict = "OK" if (rco == 0 and not errors and not sorry) else \
                    f"FAIL rc={rco} errors={len(errors)} sorry={len(sorry)}"
                summary[rel] = verdict
                print(f"[r1] {rel}: {verdict}", flush=True)
                if axioms:
                    print("---- axioms ----", flush=True)
                    print("\n".join(axioms), flush=True)
                lines = out2.splitlines()
                err_lines = [i for i, l in enumerate(lines) if ": error" in l]
                if err_lines:
                    print("---- error contexts ----", flush=True)
                    shown = 0
                    for i in err_lines:
                        if shown >= 80:
                            break
                        print("\n".join(lines[max(0, i - 1):i + 25]), flush=True)
                        print("···", flush=True)
                        shown += 1
                elif out2.strip():
                    print("---- output tail ----", flush=True)
                    print("\n".join(lines[-30:]), flush=True)

    print("\n=== SUMMARY", flush=True)
    for k, v in summary.items():
        print(f"{k}: {v}", flush=True)
    return summary


@app.local_entrypoint()
def main(dir: str = "./stage"):
    from pathlib import Path

    stage = Path(dir)
    files, order = {}, []
    for p in sorted(stage.glob("*.lean")):
        files[p.name] = p.read_text()
        order.append(p.name)
    if not order:
        raise SystemExit(f"no .lean files found in {dir}")
    print(f"[r1] staging {order}")
    print(run.remote(donor_closure_tarball(), files=files, order=order))
