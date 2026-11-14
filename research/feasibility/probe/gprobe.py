"""AxiomMath donor probes on the cross-math-fronttier pin (app `crossmath-gprobe`), 2026-11-13.

Cycle-2 lane A7: empirically verify the AxiomMath donor statements ELABORATE in our
environment (mathlib ff2494ea, toolchain v4.36.0-rc2), and audit donor axioms. Three functions:

  probe(files, order)  — mathlib-only statement probes (G1a DZDF transcription, G3 Weil
                         transcription, G4 AreaLaw transcription); identical method to
                         lean_probe.py (files written into /opt/mathlib, `lake env lean`).
  g2(tarball, probes)  — build ZetaZerosV2 + redirected PrimeNumberTheoremAnd (the exact
                         axiommath-bump v2-run9 build), then elaborate ProbeG2 INSIDE the
                         built tree: direct donor imports + `#print axioms` (donor hygiene).
  g1b(tarball, t)      — bounded `lake build` attempt of DedekindZetaZeroFree with its
                         TauCeti dependency redirected to the local clone (d92acc5c = the
                         pinned rev): measures what resolves, what breaks first, and the
                         build progress rate on our mathlib pin.

Same image recipe as lean_probe.py / axbump.py (elan v4.2.4, toolchain v4.36.0-rc2, mathlib
ff2494ea + `lake exe cache get`). Ephemeral `modal run` only — NO volume/secret/deploy.

Usage (via research/feasibility/probe/run_gprobe.sh):
    modal run gprobe.py --dir <stage> --mode probe|g2|g1b [--root <dir>] \
        [--members a,b] [--build-timeout <s>]
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]


app = modal.App("crossmath-gprobe")

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        # Textually identical to lean_probe.py / axbump.py so the layer cache is shared.
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


def _errs(out):
    return [l for l in out.splitlines() if "error:" in l]


def _seed_mathlib(d):
    """Make workspace `d` build without Reservoir / the mathlib artifact service (the
    2026-11-13 ~22:05 outage): patch its lake-manifest's mathlib + dep revs to the
    image's (ff2494ea-compatible) pins and pre-place /opt/mathlib and its materialized
    dep packages (batteries/aesop/Qq/…, olens included) into .lake/packages/."""
    import json, pathlib, shutil

    d = pathlib.Path(d)
    img_man = json.loads((pathlib.Path("/opt/mathlib") / "lake-manifest.json").read_text())
    img_revs = {p["name"]: p for p in img_man["packages"]}
    man = d / "lake-manifest.json"
    m = json.loads(man.read_text())
    for p in m["packages"]:
        if p["name"] == "mathlib":
            p["rev"] = MATHLIB_REV
        elif p["name"] in img_revs and "rev" in img_revs[p["name"]]:
            p["rev"] = img_revs[p["name"]]["rev"]
    man.write_text(json.dumps(m, indent=2))
    pkgs = d / ".lake" / "packages"
    pkgs.mkdir(parents=True, exist_ok=True)
    dst = pkgs / "mathlib"
    if not dst.exists():
        # copy .lake/build (the olens) but not .lake/packages (copied to workspace level)
        shutil.copytree("/opt/mathlib", dst, symlinks=True,
                        ignore=shutil.ignore_patterns("packages"))
    src_deps = pathlib.Path("/opt/mathlib/.lake/packages")
    if src_deps.exists():
        for dep in src_deps.iterdir():
            tgt = pkgs / dep.name
            if dep.name != "mathlib" and dep.is_dir() and not tgt.exists():
                shutil.copytree(dep, tgt, symlinks=True)
    # cache get installed the DEP packages' olens/traces inside mathlib's own build dir
    # (the image never materialized .lake/packages); redistribute them per package so a
    # from-source rebuild of a dep at least finds its own deps' olens on LEAN_PATH.
    dep_topdirs = {"batteries": "Batteries", "aesop": "Aesop", "Qq": "Qq", "Cli": "Cli",
                   "importGraph": "ImportGraph", "LeanSearchClient": "LeanSearchClient",
                   "proofwidgets": "ProofWidgets", "plausible": "Plausible"}
    for dep, top in dep_topdirs.items():
        tgt = pkgs / dep
        if not tgt.is_dir():
            continue
        for sub in ["lib/lean", "build/ir"]:
            src = pathlib.Path("/opt/mathlib/.lake/build") / sub / top
            if src.exists():
                (tgt / ".lake/build" / sub).mkdir(parents=True, exist_ok=True)
                dst = tgt / ".lake/build" / sub / top
                if not dst.exists():
                    shutil.copytree(src, dst, symlinks=True)
    print(f"[seed] mathlib pre-seeded at {MATHLIB_REV[:12]} + dep olens redistributed",
          flush=True)


def _elan_ensure(toolchain):
    _sh(f"ELAN_HOME=/opt/elan /opt/elan/bin/elan toolchain install {toolchain}", "/", 900)


def _update_cache(d, tag, tries=4):
    """lake update + cache get with retries against the 2026-11-13 artifact-service
    outage; falls back to _seed_mathlib when the service stays down. Returns ok bool."""
    import time

    for step, cmd in [("update", "lake update"), ("cache", "lake exe cache get")]:
        ok = False
        for attempt in range(tries):
            rc, out = _sh(cmd, d, 2400 if step == "update" else 1800)
            print(f"\n=== {tag} {step} (attempt {attempt + 1}): rc={rc}", flush=True)
            if rc == 0:
                ok = True
                break
            print(_condense(out, 3000), flush=True)
            time.sleep(60)
        if not ok:
            print(f"[{tag}] {step} still failing after {tries} attempts — seeding", flush=True)
            _seed_mathlib(d)
            return False
    return True


def _condense(out, limit=120000):
    """Drop lake progress noise (✔/✖/⣿ lines), keep everything else, bounded."""
    keep = [l for l in out.splitlines() if not l.startswith(("✔", "⣿"))]
    return "\n".join(keep)[:limit]


image = image.add_local_python_source("modal_telemetry")


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def probe(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")

    def sh(cmd, timeout=1800):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[probe] mathlib rev {MATHLIB_REV[:12]} ({MATHLIB_REV})", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[probe] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[probe] CACHE-MISS: olean cache incomplete — aborting.", flush=True)
        return {"ProbeSmoke": "CACHE-MISS"}

    for rel, content in files.items():
        p = repo / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(content)

    results = {}
    for rel in order:
        print(f"\n=== {rel}", flush=True)
        try:
            r = sh(["lake", "env", "lean", rel], timeout=1500)
        except subprocess.TimeoutExpired:
            print(f"[probe] TIMEOUT (1500s) elaborating {rel}", flush=True)
            results[rel] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if ": error:" in l or l.startswith("error:")]
        warnings = [l for l in out.splitlines()
                    if ": warning:" in l and "declaration uses" in l]
        verdict = "OK" if r.returncode == 0 else f"FAIL rc={r.returncode}"
        results[rel] = verdict if not errors else f"FAIL ({len(errors)} errors)"
        print(f"[probe] {rel}: {verdict}; errors={len(errors)}, sorry-warnings={len(warnings)}",
              flush=True)
        if out.strip():
            print("---- output (up to 12000 chars) ----", flush=True)
            print(out[:12000], flush=True)

    print("\n[probe] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[probe]   {rel}: {v}", flush=True)
    return results


@app.function(image=image, **SPEC, secrets=CAP, timeout=3 * 60 * 60)
@telemetered
def g2(tarball: bytes, probes: dict):
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
    for step, cmd, t in [("update", "lake update", 1800),
                         ("cache", "lake exe cache get", 1800),
                         ("build", "lake build ZetaZeros", 2 * 3600)]:
        rc, out = _sh(cmd, d, t)
        print(f"\n=== ZetaZerosV2 {step}: rc={rc}", flush=True)
        if step == "update":
            _, rev = _sh("git -C .lake/packages/mathlib rev-parse HEAD", d, 60)
            print(f"[g2] resolved mathlib {rev.strip()}", flush=True)
            continue
        if step == "build":
            e = _errs(out)
            done = len(re.findall(r"✔ \[\d+/\d+\]", out))
            summary["build"] = ("OK" if rc == 0 and not e else
                                f"FAIL rc={rc} errors={len(e)}")
            print(f"[g2] build {summary['build']}; progress-marks={done}", flush=True)
            print(_condense(out), flush=True)
            if rc != 0:
                return summary
    # Direct-import probe inside the built tree.
    for name, content in probes.items():
        p = d / name
        p.write_text(content)
        rc, out = _sh(f"lake env lean {name}", d, 1500)
        e = _errs(out)
        summary[f"probe {name}"] = "OK" if rc == 0 and not e else f"FAIL rc={rc} errors={len(e)}"
        print(f"\n=== probe {name}: {summary[f'probe {name}']}", flush=True)
        print(out[:20000], flush=True)
    print("\n=== SUMMARY", flush=True)
    for k, v in summary.items():
        print(f"{k}: {v}", flush=True)
    return summary


@app.function(image=image, **SPEC, secrets=CAP, timeout=3 * 60 * 60)
@telemetered
def g1b(tarball: bytes, build_timeout: int = 2700):
    import io, pathlib, re, tarfile

    work = pathlib.Path("/work")
    work.mkdir()
    tarfile.open(fileobj=io.BytesIO(tarball)).extractall(work)

    # DZDF's TauCeti git dep -> the local clone at the exact pinned rev (d92acc5c).
    lf = work / "DedekindZetaZeroFree/lakefile.toml"
    patched = re.sub(
        r'(name\s*=\s*"TauCeti"\s*\n)git\s*=\s*"[^"]*"\s*\nrev\s*=\s*"[^"]*"',
        r'\1path = "../tauceti"', lf.read_text())
    lf.write_text(patched)

    d = work / "DedekindZetaZeroFree"
    summary = {}
    for step, cmd, t in [("update", "lake update", 2400),
                         ("cache", "lake exe cache get", 1800),
                         ("build", "lake build DedekindZetaZeroFree", build_timeout)]:
        rc, out = _sh(cmd, d, t)
        print(f"\n=== DZDF {step}: rc={rc}", flush=True)
        if step == "update":
            _, rev = _sh("git -C .lake/packages/mathlib rev-parse HEAD", d, 60)
            print(f"[g1b] resolved mathlib {rev.strip()}", flush=True)
            print(_condense(out, 8000), flush=True)
            if rc != 0:
                summary["update"] = f"FAIL rc={rc}"
                break
            continue
        if step == "cache":
            print(_condense(out, 4000), flush=True)
            if rc != 0:
                summary["cache"] = f"FAIL rc={rc}"
                break
            continue
        e = _errs(out)
        done = re.findall(r"(✔|✖) \[(\d+)/(\d+)\]", out)
        n_ok = sum(1 for m in done if m[0] == "✔")
        total = int(done[-1][2]) if done else 0
        if rc == "TIMEOUT":
            summary["build"] = (f"TIMEOUT after {build_timeout}s — {n_ok}/{total} modules done "
                                f"(lake job counter), {len(e)} errors so far")
        else:
            summary["build"] = ("OK" if rc == 0 and not e else f"FAIL rc={rc} errors={len(e)}")
        print(f"[g1b] build {summary['build']}", flush=True)
        print(f"[g1b] progress: {n_ok} modules reported done of {total} scheduled so far",
              flush=True)
        print(_condense(out), flush=True)
    print("\n=== SUMMARY", flush=True)
    for k, v in summary.items():
        print(f"{k}: {v}", flush=True)
    return summary


@app.function(image=image, **SPEC, secrets=CAP, timeout=3 * 60 * 60)
@telemetered
def g5a(tarball: bytes, probes: dict):
    """Build AreaLaw2D's statement layer (OpenAI.Statements) with Physlib fetched from the
    donor's own pinned git rev, then elaborate the G5a probe inside the tree."""
    import io, pathlib, re, tarfile

    work = pathlib.Path("/work")
    work.mkdir()
    tarfile.open(fileobj=io.BytesIO(tarball)).extractall(work)

    d = work / "AreaLaw2D"
    _update_cache(d, "AreaLaw2D")
    summary = {}
    for step, cmd, t in [("build", "lake build OpenAI.Statements", 2 * 3600)]:
        rc, out = _sh(cmd, d, t)
        print(f"\n=== AreaLaw2D {step}: rc={rc}", flush=True)
        e = _errs(out)
        failed = sorted({m for m in re.findall(r"✖ \[\d+/\d+\] Building (\S+)", out)})
        summary["build"] = ("OK" if rc == 0 and not e else
                            f"FAIL rc={rc} errors={len(e)} failed_modules={len(failed)}")
        print(f"[g5a] build {summary['build']}; failed modules: {failed[:50]}", flush=True)
        print(_condense(out), flush=True)
        if rc != 0:
            break
    if summary.get("build") == "OK":
        for name, content in probes.items():
            p = d / name
            p.write_text(content)
            rc, out = _sh(f"lake env lean {name}", d, 1500)
            e = _errs(out)
            summary[f"probe {name}"] = ("OK" if rc == 0 and not e else
                                        f"FAIL rc={rc} errors={len(e)}")
            print(f"\n=== probe {name}: {summary[f'probe {name}']}", flush=True)
            print(out[:20000], flush=True)
    print("\n=== SUMMARY", flush=True)
    for k, v in summary.items():
        print(f"{k}: {v}", flush=True)
    return summary


@app.function(image=image, **SPEC, secrets=CAP, timeout=3 * 60 * 60)
@telemetered
def g6a(tarball: bytes, build_timeout: int = 2400):
    """Price a partial StacksFrontier build: bounded `lake build
    Weil.LeanEval.WeilConjectures` (the RH/purity statement closure; Weil-side closure
    measured locally = 69 modules, 68 direct StacksFrontier imports). Stacks is fetched
    from the Weil lakefile's own pin (AxiomMath/Stacks @ 012108f6, toolchain v4.34.0-rc2,
    mathlib 16edf57d — root pins v4.36.0-rc2 / ff2494ea win). Records the total lake job
    count (the StacksFrontier closure size), first errors, and the build rate."""
    import io, pathlib, re, tarfile

    work = pathlib.Path("/work")
    work.mkdir()
    tarfile.open(fileobj=io.BytesIO(tarball)).extractall(work)

    d = work / "Weil"
    _update_cache(d, "Weil")
    summary = {}
    for step, cmd, t in [("build", "lake build Weil.LeanEval.WeilConjectures", build_timeout)]:
        rc, out = _sh(cmd, d, t)
        print(f"\n=== Weil {step}: rc={rc}", flush=True)
        e = _errs(out)
        done = re.findall(r"(✔|✖) \[(\d+)/(\d+)\]", out)
        n_ok = sum(1 for m in done if m[0] == "✔")
        total = int(done[-1][2]) if done else 0
        failed = sorted({m for m in re.findall(r"✖ \[\d+/\d+\] Building (\S+)", out)})
        if rc == "TIMEOUT":
            summary["build"] = (f"TIMEOUT after {build_timeout}s — lake total jobs {total}, "
                                f"{n_ok} done, {len(e)} errors so far")
        else:
            summary["build"] = ("OK" if rc == 0 and not e else f"FAIL rc={rc} errors={len(e)}")
        print(f"[g6a] build {summary['build']}", flush=True)
        print(f"[g6a] progress: {n_ok}/{total} lake jobs; failed modules: {failed[:50]}",
              flush=True)
        print(_condense(out), flush=True)
    print("\n=== SUMMARY", flush=True)
    for k, v in summary.items():
        print(f"{k}: {v}", flush=True)
    return summary


def _sh_stream(cmd, cwd, timeout, every=100):
    """Like _sh, but streams output: prints every non-progress line plus every `every`-th
    progress line live, so a detached run's `modal app logs` shows where the build is
    (attempt 5, run27: the run26 build ran silently until its 9000 s cap)."""
    import subprocess, time
    p = subprocess.Popen(cmd, cwd=cwd, shell=True, stdout=subprocess.PIPE,
                         stderr=subprocess.STDOUT, text=True, bufsize=1)
    t0, lines, k = time.time(), [], 0
    for line in p.stdout:
        lines.append(line.rstrip("\n"))
        if line.startswith(("✔", "⣿")):
            k += 1
            if k % every == 0:
                print(f"[{int(time.time() - t0)}s] {line.rstrip()}", flush=True)
        else:
            print(line.rstrip(), flush=True)
        if time.time() - t0 > timeout:
            p.kill()
            return "TIMEOUT", "\n".join(lines)
    p.wait()
    return p.returncode, "\n".join(lines)


g7vol = modal.Volume.from_name("crossmath-g7-tree", create_if_missing=True)
G7_SNAP = "/vol/oai-lean.tar"


def _g7_restore(work, tarball):
    """Restore the persisted donor tree (resume), else unpack the fresh closure tarball."""
    import io, os, tarfile
    if os.path.exists(G7_SNAP):
        rc, _ = _sh(f"tar xf {G7_SNAP} -C {work}", "/", 3600)
        print(f"[g7] restored persisted tree from volume: rc={rc}", flush=True)
    tarfile.open(fileobj=io.BytesIO(tarball)).extractall(work / "lean")


def _g7_save(work):
    rc, _ = _sh(f"tar cf {G7_SNAP}.tmp -C {work} lean && mv {G7_SNAP}.tmp {G7_SNAP}",
                "/", 3600)
    g7vol.commit()
    print(f"[g7] persisted tree to volume: rc={rc}", flush=True)


def _g7_elab(d, probes, summary):
    for name, content in probes.items():
        p = d / name
        p.write_text(content)
        rc2, out2 = _sh(f"lake env lean {name}", d, 2400)
        e2 = [l for l in out2.splitlines() if ": error" in l]
        sw = [l for l in out2.splitlines() if "declaration uses" in l and "sorry" in l]
        summary[f"probe {name}"] = ("OK" if rc2 == 0 and not e2 else
                                    f"FAIL rc={rc2} errors={len(e2)}") + \
            f" sorry-warnings={len(sw)}"
        print(f"\n=== probe {name}: {summary[f'probe {name}']}", flush=True)
        print(out2[:40000], flush=True)


@app.function(image=image, **SPEC, secrets=CAP, timeout=4 * 60 * 60,
              volumes={"/vol": g7vol})
@telemetered
def g7elab(probes: dict):
    """Re-elaborate consumer files inside the persisted, already-built donor tree
    (no rebuild beyond lake's no-op check): the R1 fix-iteration path."""
    import pathlib
    work = pathlib.Path("/work"); work.mkdir()
    _elan_ensure("leanprover/lean4:v4.34.1")
    _sh(f"tar xf {G7_SNAP} -C {work}", "/", 3600)
    d = work / "lean"
    summary = {}
    _g7_elab(d, probes, summary)
    print("\n=== SUMMARY", flush=True)
    for k, v in summary.items():
        print(f"{k}: {v}", flush=True)
    return summary


@app.function(image=image, **SPEC, secrets=CAP, timeout=24 * 60 * 60,
              volumes={"/vol": g7vol})
@telemetered
def g7(tarball: bytes, probes: dict):
    """G7 primary: axiom audit of openai-math's own 7/8 quasi-RH theorems
    (OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re,
    OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re) at the DONOR's own pin
    (v4.34.1 / mathlib d13f23b7) — axioms are pin-independent, and building at the donor
    pin avoids the v4.34→v4.36 drift entirely. Tarball = pruned Nonvanishing closure
    (2924 files) + lakefile + manifest + lean-toolchain + patches/.

    Flow fix (run22, 2026-11-14): the donor lakefile's SECOND patch tier (post_update —
    12 deps incl. rellich-kondrachov, whose absence broke run19's build with 9
    type-mismatch errors in 3 RellichKondrachov modules) only fires on `lake update`,
    which this flow skips on purpose (no Reservoir exposure; run19 showed cache.mathlib.org
    works while Reservoir was down for g5a/g6a). We reproduce the hook's exact behavior:
    for each of the 12 deps, git-apply-check preflight → apply → reverse-verify, using the
    donor's own patches/<label>-lean4341.patch (lakefile.lean:306-355 post_update pkg do).
    Attempt 3 (run24, 2026-11-14): build cap raised 7200→9000 s and function cap
    3 h→4 h — run22 proved the patch tier but was killed mid-build by the lane's
    execution-window interruption; the caps now cover a full 7,075-job compile.
    Attempt 5 (run27): run26 TIMEOUT at 2520/7061 jobs under the 9000 s cap — now
    cpu 16→64, memory 64→128 GB (run28 — OVER-PROVISIONED: measured ~19 concurrent lean
    workers and low memory use; right-sized to 24 cpu / 32 GB for later runs), build cap
    76000 s, function cap 24 h (Modal max),
    streamed progress, and the client launches with `modal run --detach`."""
    import io, pathlib, re, tarfile

    work = pathlib.Path("/work")
    work.mkdir()
    _g7_restore(work, tarball)

    _elan_ensure("leanprover/lean4:v4.34.1")
    d = work / "lean"
    summary = {}
    rc, out = _sh("lake exe cache get", d, 1800)
    print(f"\n=== OAI cache: rc={rc}", flush=True)
    print(_condense(out, 6000), flush=True)
    if rc != 0:
        summary["cache"] = f"FAIL rc={rc}"
    else:
        post_update_deps = ["fixed-point-theorems", "PrimeNumberTheoremAnd",
                            "Zeta3Irrational", "rellich-kondrachov", "carleson",
                            "StrongPNT", "AbsorptionCutoff", "AINTLIB", "ClassFieldTheory",
                            "schoenflies-lean", "SphereEversion", "gromov"]
        applied = []
        for label in post_update_deps:
            dep = d / ".lake" / "packages" / label
            patch = d / "patches" / f"{label}-lean4341.patch"
            if not dep.is_dir() or not patch.exists():
                print(f"[g7] patch {label}: SKIP (dep dir or patch file missing)", flush=True)
                continue
            rc_r, _ = _sh(f"git -C {dep} apply --check --reverse {patch}", d, 60)
            if rc_r == 0:
                print(f"[g7] patch {label}: already applied", flush=True)
                continue
            rc_c, out_c = _sh(f"git -C {dep} apply --check {patch}", d, 60)
            if rc_c != 0:
                print(f"[g7] patch {label}: CONFLICT\n{out_c[:800]}", flush=True)
                continue
            rc_a, out_a = _sh(f"git -C {dep} apply {patch}", d, 60)
            ok = rc_a == 0
            print(f"[g7] patch {label}: {'applied' if ok else 'FAIL ' + out_a[:800]}",
                  flush=True)
            if ok:
                applied.append(label)
        summary["patches"] = f"{len(applied)}/12 applied: {','.join(applied)}"
        rc, out = _sh_stream("lake build OAI.NumberTheory.DirichletL.Nonvanishing", d, 76000)
        _g7_save(work)
        e = _errs(out)
        done = re.findall(r"(✔|✖) \[(\d+)/(\d+)\]", out)
        n_ok = sum(1 for m in done if m[0] == "✔")
        total = int(done[-1][2]) if done else 0
        failed = sorted({m for m in re.findall(r"✖ \[\d+/\d+\] Building (\S+)", out)})
        summary["build"] = ("OK" if rc == 0 and not e else
                            f"FAIL rc={rc} errors={len(e)} failed_modules={len(failed)}")
        print(f"\n=== OAI build: {summary['build']}; {n_ok}/{total} jobs; "
              f"failed: {failed[:40]}", flush=True)
        print(_condense(out), flush=True)
        if rc == 0:
            _g7_elab(d, probes, summary)
    print("\n=== SUMMARY", flush=True)
    for k, v in summary.items():
        print(f"{k}: {v}", flush=True)
    return summary


@app.local_entrypoint()
def main(dir: str = "./probes", mode: str = "probe", root: str = "",
         members: str = "", build_timeout: int = 2700):
    import io, pathlib, tarfile

    stage = pathlib.Path(dir)
    if mode == "probe":
        files, order = {}, []
        # G2/G5a import donor libraries and are elaborated inside built trees instead.
        skip = {"ProbeG2_ZetaZerosV2.lean", "ProbeG5a_AreaLaw_Physlib.lean"}
        for p in sorted(stage.glob("ProbeG*.lean")):
            if p.name in skip:
                continue
            files[p.name] = p.read_text()
            order.append(p.name)
        if not order:
            raise SystemExit(f"no .lean probe files found in {dir}")
        print(f"[gprobe] staging {order}")
        print(probe.remote(files=files, order=order))
    elif mode == "g2":
        buf = io.BytesIO()
        with tarfile.open(fileobj=buf, mode="w:gz") as tf:
            for m in ["ZetaZerosV2", "PrimeNumberTheoremAnd"]:
                tf.add(str(pathlib.Path(root) / m), arcname=m,
                       filter=lambda ti: None if "/.git" in ti.name or "/.lake" in ti.name else ti)
        probes = {"ProbeG2_ZetaZerosV2.lean":
                  (stage / "ProbeG2_ZetaZerosV2.lean").read_text()}
        print(g2.remote(buf.getvalue(), probes))
    elif mode == "g5a":
        buf = io.BytesIO()
        with tarfile.open(fileobj=buf, mode="w:gz") as tf:
            tf.add(str(pathlib.Path(root) / "AreaLaw2D"), arcname="AreaLaw2D",
                   filter=lambda ti: None if "/.git" in ti.name or "/.lake" in ti.name else ti)
        probes = {"ProbeG5a_AreaLaw_Physlib.lean":
                  (stage / "ProbeG5a_AreaLaw_Physlib.lean").read_text()}
        print(g5a.remote(buf.getvalue(), probes))
    elif mode == "g7":
        import io, tarfile
        root = pathlib.Path("/home/doz/zcode-workdir/openai-math/lean")

        def to_path(mod):
            if not mod.startswith("OAI."):
                return None
            rel = "OAI/" + mod[4:].replace(".", "/") + ".lean"
            return rel if (root / rel).exists() else None

        target = "OAI/NumberTheory/DirichletL/Nonvanishing.lean"
        seen, frontier = {target}, [target]
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
        print(f"[gprobe] OAI Nonvanishing closure: {len(seen)} files, "
              f"tarball {buf.tell() // 1024 // 1024} MB")
        probes = {"ProbeG7b_OAI_SevenEighths.lean":
                  (stage / "ProbeG7b_OAI_SevenEighths.lean").read_text()}
        # run27: the staged pilot-50 R1 consumer files ride the same build (R1-prework
        # §5 steps 1–2; their verdict is only selected if G7b PASSes).
        p50 = pathlib.Path("/home/doz/zcode-workdir/cross-math-fronttier/research/pilots/50")
        for f in ["R1probe.lean", "R1.lean"]:
            if (p50 / f).exists():
                probes[f] = (p50 / f).read_text()
        print(g7.remote(buf.getvalue(), probes))
    elif mode == "g7elab":
        probes = {}
        for f in members.split(","):
            f = f.strip()
            if f:
                probes[pathlib.Path(f).name] = pathlib.Path(f).read_text()
        print(g7elab.remote(probes))
    elif mode == "g6a":
        buf = io.BytesIO()
        with tarfile.open(fileobj=buf, mode="w:gz") as tf:
            tf.add(str(pathlib.Path(root) / "Weil"), arcname="Weil",
                   filter=lambda ti: None if "/.git" in ti.name or "/.lake" in ti.name else ti)
        print(g6a.remote(buf.getvalue(), build_timeout))
    elif mode == "g1b":
        buf = io.BytesIO()
        with tarfile.open(fileobj=buf, mode="w:gz") as tf:
            for m in members.split(","):
                m = m.strip()
                tf.add(m, arcname=pathlib.Path(m).name,
                       filter=lambda ti: None if "/.git" in ti.name or "/.lake" in ti.name else ti)
        print(g1b.remote(buf.getvalue(), build_timeout))
    else:
        raise SystemExit(f"unknown mode {mode}")
