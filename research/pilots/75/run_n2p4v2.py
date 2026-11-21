"""Pilot 75-N2 P4-V2 fire on Modal (app `crossmath-pilot-75-p4v2`), 2026-11-21.

Lane R8 (worktree agent-05, iter6 seed-1 fire grant: 1 fire + <=2 fix rounds).
The run_n2p3v2 recipe (ZetaZerosV2 + PrimeNumberTheoremAnd tarballs, PNT+ redirect,
`lake update` -> mathlib ff2494ea, `lake exe cache get` (2 tries), `lake build
ZetaZeros`) EXTENDED with the pilot-11 chain pattern: the N2 chain (Pa..N2P3e,
N2P3V2, N2P4 — staged under legal module names by run_n2p4v2.sh) is compiled to
.olean in dependency order inside the built tree with LEAN_PATH = chain:v2base, so
the consumer `N2-P4V2.lean` (at the V2 workspace root) can `import ZetaZeros` AND
the chain — the cross-substrate composition (NEW mechanism; the P4 uniform card
proofs). Image recipe byte-identical to run_n2p3v2.py (shared layer cache).
Ephemeral `modal run` only — NO volume, NO secret, NO deploy.

RUNNER ONE-LINERS (binding, al3d run-9 record + D4): (1) sorry filter matches BOTH
quote forms (anchored regex); (2) error filter = anchored `(?:^|: )error[:(]`
(catches `error(lean.*)`); (3) error-context DISPLAY uses the same regex as the
count. The lake-build step keeps the build-log `"error:"` substring check (lake
output, not lean diagnostics).

Usage (via run_n2p4v2.sh, which stages world-readable copies incl. the renames):
    modal run run_n2p4v2.py --dir <stage-dir> --root /home/doz/zcode-workdir/axiommath
"""

import modal
import re

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

_LEAN_ERROR_RE = re.compile(r"(?:^|: )error[:(]")
_LEAN_SORRY_RE = re.compile(r"declaration uses ['`]sorry['`]")

app = modal.App("crossmath-pilot-75-p4v2")

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        # Textually identical to run_n2p3v2.py / run_n2p2d.py (shared layer cache).
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

# The N2 chain in dependency order (staged names; N2P3V2 independent of the chain —
# imports Mathlib + ZetaZeros only; N2P4 last = the card pair).
CHAIN_ORDER = ["Pa.lean", "N2P0.lean", "N2P1.lean", "N2P2c.lean", "N2P3.lean",
               "N2P2d.lean", "N2P3e.lean", "N2P3V2.lean", "N2P4.lean"]


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
            print(f"[n2p4v2] resolved mathlib {rev.strip()}", flush=True)
        if rc != 0:
            summary[f"{step}"] = f"FAIL rc={rc}"
            print("\n=== SUMMARY", flush=True)
            for k, v in summary.items():
                print(f"{k}: {v}", flush=True)
            return summary
    rc, out = _sh("lake build ZetaZeros", d, 2 * 3600)
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

    # The V2 workspace's LEAN_PATH (resolves ZetaZeros + mathlib + deps).
    _, base = _sh("lake env printenv LEAN_PATH", d, 60)
    base = base.strip()
    print(f"[n2p4v2] V2 LEAN_PATH base: {base}", flush=True)
    if not base:
        summary["leanpath"] = "FAIL empty"
        return summary

    # Chain compilation inside the built tree (pilot-11 pattern): chain/ dir on
    # LEAN_PATH ahead of the V2 base; each module to .olean in dependency order.
    chain = d / "n2chain"
    chain.mkdir()
    for name in CHAIN_ORDER:
        (chain / name).write_text(files[name])
    envp = (f'ELAN_HOME=/opt/elan PATH=/opt/elan/bin:/usr/local/bin:/usr/bin:/bin '
            f'LEAN_PATH="{chain}:{base}"')
    for name in CHAIN_ORDER:
        stem = name[:-len(".lean")]
        print(f"\n=== chain {name}", flush=True)
        rc, out = _sh(f'cd {chain} && {envp} lean -o {stem}.olean {name}', d, 2100)
        errors = [l for l in out.splitlines() if _LEAN_ERROR_RE.search(l)]
        sorryw = [l for l in out.splitlines() if _LEAN_SORRY_RE.search(l)]
        verdict = "OK" if (rc == 0 and not errors and not sorryw) else \
            f"FAIL rc={rc} errors={len(errors)} sorry={len(sorryw)}"
        summary[f"chain/{name}"] = verdict
        print(f"[n2p4v2] chain {name}: {verdict}", flush=True)
        if verdict != "OK":
            lines = out.splitlines()
            err_lines = [i for i, l in enumerate(lines) if _LEAN_ERROR_RE.search(l)]
            if err_lines:
                print("---- error contexts ----", flush=True)
                for i in err_lines[:5]:
                    print("\n".join(lines[max(0, i - 1):i + 25]), flush=True)
                    print("···", flush=True)
            elif out.strip():
                print("---- output tail ----", flush=True)
                print("\n".join(lines[-30:]), flush=True)

    # Consumer elaboration at the V2 workspace root (cross-substrate: ZetaZeros +
    # the chain on one LEAN_PATH).
    for rel in order:
        if rel in CHAIN_ORDER:
            continue  # already compiled above
        p = d / rel
        p.write_text(files[rel])
        print(f"\n=== {rel}", flush=True)
        rc, out = _sh(f'{envp} lean {rel}', d, 2400)
        errors = [l for l in out.splitlines() if _LEAN_ERROR_RE.search(l)]
        sorryw = [l for l in out.splitlines() if _LEAN_SORRY_RE.search(l)]
        axioms = [l for l in out.splitlines() if "does not depend on any" in l
                  or "depends on axioms" in l]
        verdict = "OK" if (rc == 0 and not errors and not sorryw) else \
            f"FAIL rc={rc} errors={len(errors)} sorry={len(sorryw)}"
        summary[rel] = verdict
        print(f"[n2p4v2] {rel}: {verdict}", flush=True)
        if axioms:
            print("---- axioms ----", flush=True)
            print("\n".join(axioms), flush=True)
        lines = out.splitlines()
        err_lines = [i for i, l in enumerate(lines) if _LEAN_ERROR_RE.search(l)]
        if err_lines:
            print("---- error contexts ----", flush=True)
            shown = 0
            for i in err_lines:
                if shown >= 80:
                    break
                print("\n".join(lines[max(0, i - 1):i + 25]), flush=True)
                print("···", flush=True)
                shown += 1
        elif out.strip():
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
    missing = [n for n in CHAIN_ORDER if n not in files]
    if missing:
        raise SystemExit(f"chain files missing from stage: {missing}")
    if "N2-P4V2.lean" not in files:
        raise SystemExit("consumer N2-P4V2.lean missing from stage")
    buf = io.BytesIO()
    with tarfile.open(fileobj=buf, mode="w:gz") as tf:
        for mod in ["ZetaZerosV2", "PrimeNumberTheoremAnd"]:
            tf.add(str(pathlib.Path(root) / mod), arcname=mod,
                   filter=lambda ti: None if "/.git" in ti.name or "/.lake" in ti.name else ti)
    print(f"[n2p4v2] staging {order}; tarball {buf.tell() // 1024 // 1024} MB", flush=True)
    print(run.remote(buf.getvalue(), files=files, order=order), flush=True)
