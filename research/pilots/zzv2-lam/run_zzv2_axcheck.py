"""G2 Part (ii) — the eta-trio DONOR-TREE full-coverage axcheck (app `crossmath-pilot-zzv2-lam-axcheck`).

Minted at the iter-6 close signal (lane R1, 2026-11-21) per the G2 pre-stage
`qa/iter4-review/r1-g2pool-iter6-prestage.md` §3.3/§5: the eta files carry
`import ZetaZeros` — plain-substrate stages FAIL BY DESIGN — so the FULL-COVERAGE
custody (all 27 top-level publics: eta-r2 6 + eta-r3 5 + eta-r4 16) fires INSIDE
the built ZetaZerosV2 donor tree (the m4b2/n3v2 precedent). Input files are
STAGED COPIES = repo bytes + the standard axcheck appendum (`#print axioms` on
every top-level public theorem; the make_axcheck theorem_full_names census) —
repo files untouched.

Mechanism VERBATIM from run_zzv2.py (which is the m4b2 recipe): tarball
ZetaZerosV2 + PrimeNumberTheoremAnd minus .git/.lake; V2's PNT+ dep → local
clone; `lake update` → mathlib ff2494ea; `lake exe cache get`;
`taskset -c 0,1 lake build ZetaZeros`; then each staged consumer elaborated at
the V2 workspace root via `lake env lean`. Image run_commands BYTE-IDENTICAL to
the family (layer sharing). Ephemeral `modal run` only — NO volume, NO secret,
NO deploy.

AGENTS.md § Modal usage guidelines compliance: SPEC 2 cpu / 4 GB (soft) +
@telemetered + LEAN_NUM_THREADS=2 (all inherited verbatim from run_zzv2.py).

Usage (stage dir = the appendum'd eta copies, world-readable):
    modal run run_zzv2_axcheck.py --dir /tmp/crossmath-zzv2-axcheck-stage \
        --root /home/doz/zcode-workdir/axiommath
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]


app = modal.App("crossmath-pilot-zzv2-lam-axcheck")

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        # Textually identical to run_m4.py / axbump.py / gprobe.py / run_zzv2.py (shared layer cache).
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


image = image.add_local_python_source("modal_telemetry")


@app.function(image=image, **SPEC, secrets=CAP, timeout=3 * 60 * 60)
@telemetered
def run(tarball: bytes, files: dict, order: list):
    import io, pathlib, re, tarfile

    work = pathlib.Path("/work")
    work.mkdir()
    tarfile.open(fileobj=io.BytesIO(tarball)).extractall(work)

    # ZetaZerosV2's PrimeNumberTheoremAnd dep -> the bumped local clone (axbump pattern).
    lf = work / "ZetaZerosV2/lakefile.toml"
    patched = re.sub(
        r'(name\s*=\s*"PrimeNumberTheoremAnd"\s*\n)git\s*=\s*"[^"]*"\s*\nrev\s*=\s*"[^"]*"',
        r'\1path = "../PrimeNumberTheoremAnd"', lf.read_text())
    lf.write_text(patched)

    d = work / "ZetaZerosV2"
    summary = {}
    import time
    for step, cmd, t, tries in [("update", "lake update", 1800, 1),
                                ("cache", "lake exe cache get", 1800, 2)]:
        rc, out = None, ""
        for attempt in range(tries):
            rc, out = _sh(cmd, d, t)
            print(f"\n=== ZetaZerosV2 {step} (attempt {attempt + 1}): rc={rc}", flush=True)
            if rc == 0:
                break
            print(_condense(out, 3000), flush=True)
            time.sleep(30)
        if step == "update":
            _, rev = _sh("git -C .lake/packages/mathlib rev-parse HEAD", d, 60)
            print(f"[zzv2ax] resolved mathlib {rev.strip()}", flush=True)
        if rc != 0:
            summary[f"{step}"] = f"FAIL rc={rc}"
            print("\n=== SUMMARY", flush=True)
            for k, v in summary.items():
                print(f"{k}: {v}", flush=True)
            return summary
    # CPU cap: taskset hard-caps the build phase at the SPEC's 2 CPUs (lake v4.36.0-rc2
    # has NO -j flag; the run-14 telemetry-disposition class).
    rc, out = _sh("taskset -c 0,1 lake build ZetaZeros", d, 2 * 3600)
    e = [l for l in out.splitlines() if "error:" in l]
    done = len(re.findall(r"✔ \[\d+/\d+\]", out))
    summary["build"] = "OK" if rc == 0 and not e else f"FAIL rc={rc} errors={len(e)}"
    print(f"\n=== ZetaZerosV2 build: rc={rc} progress-marks={done}", flush=True)
    print(_condense(out), flush=True)
    if rc != 0:
        print("\n=== SUMMARY", flush=True)
        for k, v in summary.items():
            print(f"{k}: {v}", flush=True)
        return summary

    # Staged axcheck consumers elaborated inside the built tree (the appendum tail
    # prints #print axioms for every top-level public theorem — the FULL-COVERAGE run).
    for rel in order:
        p = d / rel
        p.write_text(files[rel])
        print(f"\n=== {rel}", flush=True)
        try:
            rco, out2 = _sh(f"lake env lean {rel}", d, 2400)
        except Exception as exc:  # timeout path already returns via _sh
            summary[rel] = f"EXC {exc}"
            continue
        errors = [l for l in out2.splitlines()
                  if ": error" in l or l.startswith("error")]
        sorry = [l for l in out2.splitlines() if "declaration uses 'sorry'" in l]
        axioms = [l for l in out2.splitlines() if "'does not depend on any axioms'" in l
                  or "depends on axioms:" in l]
        verdict = "OK" if (rco == 0 and not errors and not sorry) else \
            f"FAIL rc={rco} errors={len(errors)} sorry={len(sorry)}"
        summary[rel] = verdict + f" [axiom-lines={len(axioms)}]"
        print(f"[zzv2ax] {rel}: {verdict} [axiom-lines={len(axioms)}]", flush=True)
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
def main(dir: str = "./stage", root: str = "/home/doz/zcode-workdir/axiommath"):
    import io, pathlib, tarfile

    stage = pathlib.Path(dir)
    files, order = {}, []
    for p in sorted(stage.glob("*.lean")):
        files[p.name] = p.read_text()
        order.append(p.name)
    if not order:
        raise SystemExit(f"no .lean files found in {dir}")
    buf = io.BytesIO()
    with tarfile.open(fileobj=buf, mode="w:gz") as tf:
        for m in ["ZetaZerosV2", "PrimeNumberTheoremAnd"]:
            tf.add(str(pathlib.Path(root) / m), arcname=m,
                   filter=lambda ti: None if "/.git" in ti.name or "/.lake" in ti.name else ti)
    print(f"[zzv2ax] staging {order}; tarball {buf.tell() // 1024 // 1024} MB")
    print(run.remote(buf.getvalue(), files=files, order=order))
