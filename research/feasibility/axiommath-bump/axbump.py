"""AxiomMath clones on the cross-math-fronttier pin (app `crossmath-axbump`), 2026-11-13.

Checks the `dev/claude` bump (toolchain v4.36.0-rc2, mathlib ff2494ea) of the sibling
clones in /home/doz/zcode-workdir/axiommath/:
  (a) statement check: elaborate the mathlib-only Challenge files of ZetaZeros,
      ZetaZerosV2, DedekindZetaZeroFree against the cached /opt/mathlib (sorry allowed:
      Challenge files are statement-only);
  (b) full `lake build` of ZetaZeros and ZetaZerosV2 (+ its PrimeNumberTheoremAnd
      dependency, redirected to the bumped local clone).
Same image recipe as research/pilots/32/run_pilot.py. Ephemeral `modal run` only.

    modal run axbump.py --root /home/doz/zcode-workdir/axiommath
"""

import modal

app = modal.App("crossmath-axbump")

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
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

REPOS = ["ZetaZeros", "ZetaZerosV2", "PrimeNumberTheoremAnd", "DedekindZetaZeroFree"]
CHALLENGES = ["ZetaZeros/Challenge/Basic.lean", "ZetaZerosV2/Challenge/Basic.lean",
              "DedekindZetaZeroFree/Challenge/DedekindZetaChallenge.lean"]
BUILDS = [("ZetaZeros", ["ZetaZeros"]),
          ("ZetaZerosV2", ["ZetaZeros", "PrimeNumberTheoremAnd"])]


@app.function(image=image, cpu=16.0, memory=65536, timeout=3 * 60 * 60)
def run(tarball: bytes, only: str = ""):
    import io, re, subprocess, tarfile, pathlib

    work = pathlib.Path("/work")
    work.mkdir()
    tarfile.open(fileobj=io.BytesIO(tarball)).extractall(work)

    def sh(cmd, cwd, timeout):
        try:
            r = subprocess.run(cmd, cwd=cwd, shell=True, capture_output=True, text=True,
                               timeout=timeout)
            return r.returncode, r.stdout + r.stderr
        except subprocess.TimeoutExpired as e:
            return "TIMEOUT", (e.stdout or b"").decode(errors="replace") if isinstance(e.stdout, bytes) else (e.stdout or "")

    def errs(out):
        return [l for l in out.splitlines() if "error:" in l]

    summary = {}
    # (a) statement check against the cached mathlib
    for rel in ([] if only else CHALLENGES):
        dst = pathlib.Path("/opt/mathlib") / ("AxChallenge_" + rel.split("/")[0] + ".lean")
        dst.write_text((work / rel).read_text())
        rc, out = sh(f"lake env lean {dst.name}", "/opt/mathlib", 1800)
        e = errs(out)
        summary[f"challenge {rel}"] = "OK" if rc == 0 and not e else f"FAIL rc={rc} errors={len(e)}"
        print(f"\n=== challenge {rel}: {summary[f'challenge {rel}']}", flush=True)
        print("\n".join(e[:15]), flush=True)

    # (b) full builds; ZetaZerosV2's PNT+ points at the bumped clone
    lf = work / "ZetaZerosV2/lakefile.toml"
    lf.write_text(re.sub(r'(name\s*=\s*"PrimeNumberTheoremAnd"\s*\n)git\s*=\s*"[^"]*"\s*\nrev\s*=\s*"[^"]*"',
                         r'\1path = "../PrimeNumberTheoremAnd"', lf.read_text()))
    for repo, targets in [b for b in BUILDS if not only or b[0] in only.split(",")]:
        d = work / repo
        for step, cmd, t in [("update", "lake update", 1800),
                             ("cache", "lake exe cache get", 1800),
                             ("build", "lake build " + " ".join(targets), 2 * 3600)]:
            rc, out = sh(cmd, d, t)
            print(f"\n=== {repo} {step}: rc={rc}", flush=True)
            if step == "update":
                # the post-update cache hook may fail; report the resolved mathlib and go on
                _, rev = sh("git -C .lake/packages/mathlib rev-parse HEAD", d, 60)
                print(f"[axbump] resolved mathlib {rev.strip()}", flush=True)
                if rc != 0:
                    print("\n".join(l for l in out.splitlines() if "✔" not in l)[:4000], flush=True)
                continue
            if step == "build" or rc != 0:
                e = errs(out)
                failed = sorted({m for m in re.findall(r"✖ \[\d+/\d+\] Building (\S+)", out)})
                summary[f"build {repo}"] = ("OK" if rc == 0 and not e else
                                            f"FAIL rc={rc} step={step} errors={len(e)} failed_modules={len(failed)}")
                print("failed modules:", failed[:200], flush=True)
                # every error with its context (drop progress lines)
                print("\n".join(l for l in out.splitlines()
                                if not l.startswith(("✔", "⣿", "info:")))[:200000], flush=True)
                break
    print("\n=== SUMMARY", flush=True)
    for k, v in summary.items():
        print(f"{k}: {v}", flush=True)
    return summary


@app.local_entrypoint()
def main(root: str, only: str = ""):
    import io, tarfile, pathlib
    buf = io.BytesIO()
    with tarfile.open(fileobj=buf, mode="w:gz") as tf:
        for r in REPOS:
            tf.add(str(pathlib.Path(root) / r), arcname=r,
                   filter=lambda ti: None if "/.git" in ti.name or "/.lake" in ti.name else ti)
    print(run.remote(buf.getvalue(), only))
