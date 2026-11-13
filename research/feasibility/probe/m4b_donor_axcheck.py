"""M4b DONOR-TREE axcheck (lane A1 sweep machinery, 2026-11-14) — dry-run of the
FINAL-SWEEP-PLAN-C2.md §0a Step-B caveat pattern for AxPilot42_M4b.

The final M4b (primary route) imports the BUILT donor `ZetaZeros` (ZetaZerosV2), which
the plain mathlib-only `axcheck_probe.py` cannot resolve. This probe reuses lane A3's
donor-tree pattern verbatim (run_m4b2.py: tarball ZetaZerosV2 + PrimeNumberTheoremAnd
minus .git/.lake, redirect V2's PNT+ dep to the local clone, lake update -> cache get
(one retry vs the artifact-cache outage) -> lake build ZetaZeros) and then elaborates the
staged AXCHECK copy (verbatim M4b + appended #print axioms for all theorems; repo file
untouched) at the V2 workspace root via `lake env lean`. OK criterion: rc=0, 0 errors,
0 sorry-warnings, 0 sorryAx lines, every axiom line subset of the standard triad.
Image text identical to run_m4b2.py / axbump.py / gprobe.py (shared layer cache).

Ephemeral `modal run` only — no volume, no secret, no deploy.

Usage (via run_m4b_donor_axcheck.sh):
    modal run m4b_donor_axcheck.py --dir <stage-dir> --root /home/doz/zcode-workdir/axiommath
"""

import modal

app = modal.App("crossmath-probe")

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        # NOTE 2026-11-14 (A1): the leanprover-community/elan release URL is DEAD (repo
        # gone, 404 — fresh builds of run_m4b2.py's image text fail on it; its layers
        # only survive via Modal cache). leanprover/elan is the live mirror of v4.2.4
        # and matches axcheck_probe.py's warm image byte-for-byte.
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


@app.function(image=image, cpu=16.0, memory=65536, timeout=3 * 60 * 60)
def run(tarball: bytes, files: dict, order: list):
    import io, pathlib, re, tarfile, time

    work = pathlib.Path("/work")
    work.mkdir()
    tarfile.open(fileobj=io.BytesIO(tarball)).extractall(work)

    lf = work / "ZetaZerosV2/lakefile.toml"
    patched = re.sub(
        r'(name\s*=\s*"PrimeNumberTheoremAnd"\s*\n)git\s*=\s*"[^"]*"\s*\nrev\s*=\s*"[^"]*"',
        r'\1path = "../PrimeNumberTheoremAnd"', lf.read_text())
    lf.write_text(patched)

    d = work / "ZetaZerosV2"
    summary = {}
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
            print(f"[donor-ax] resolved mathlib {rev.strip()}", flush=True)
        if rc != 0:
            summary[step] = f"FAIL rc={rc}"
            print("\n=== SUMMARY", flush=True)
            for k, v in summary.items():
                print(f"{k}: {v}", flush=True)
            return summary
    rc, out = _sh("lake build ZetaZeros", d, 2 * 3600)
    e = [l for l in out.splitlines() if "error:" in l]
    summary["build"] = "OK" if rc == 0 and not e else f"FAIL rc={rc} errors={len(e)}"
    print(f"\n=== ZetaZerosV2 build: rc={rc}", flush=True)
    print(_condense(out), flush=True)
    if rc != 0:
        print("\n=== SUMMARY", flush=True)
        for k, v in summary.items():
            print(f"{k}: {v}", flush=True)
        return summary

    for rel in order:
        (d / rel).write_text(files[rel])
        print(f"\n=== {rel} (donor-tree axcheck)", flush=True)
        rco, out2 = _sh(f"lake env lean {rel}", d, 3000)
        errors = [l for l in out2.splitlines() if ": error" in l or l.startswith("error")]
        sorry = [l for l in out2.splitlines() if "declaration uses 'sorry'" in l]
        axioms = [l for l in out2.splitlines()
                  if "depends on axioms" in l]  # incl. 'does not depend on any axioms'
        sorryax = [l for l in axioms if "sorryAx" in l]
        verdict = ("OK" if (rco == 0 and not errors and not sorry and not sorryax)
                   else f"FAIL rc={rco} errors={len(errors)} sorry={len(sorry)} "
                        f"sorryAx={len(sorryax)}")
        summary[rel] = verdict
        print(f"[donor-ax] {rel}: {verdict}; axiom-lines={len(axioms)} "
              f"(in-file donor-audit prints may duplicate)", flush=True)
        if axioms:
            print("---- axioms ----", flush=True)
            print("\n".join(axioms), flush=True)
        lines = out2.splitlines()
        err_lines = [i for i, l in enumerate(lines) if ": error" in l]
        if err_lines:
            print("---- error contexts ----", flush=True)
            for i in err_lines[:10]:
                print("\n".join(lines[max(0, i - 1):i + 12]), flush=True)
                print("···", flush=True)

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
    print(f"[donor-ax] staging {order}; tarball {buf.tell() // 1024 // 1024} MB")
    print(run.remote(buf.getvalue(), files=files, order=order))
