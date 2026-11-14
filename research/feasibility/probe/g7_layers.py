"""G7b via cached Modal image layers (2026-11-14, replaces gprobe.py's ephemeral g7 build).

Why: run26/run28 built the 7,061-job openai Nonvanishing closure inside one ephemeral
container. Any stop (timeout, session death, user cancel) threw the whole build away.
Here the build is a CHAIN OF IMAGE LAYERS. Modal snapshots each `run_function` step's
filesystem as a cached layer, so:
  * every finished layer persists and is reused by later `modal run`s with no rebuild;
  * a failure or stop loses at most the one layer in flight;
  * the final probe / R1 elaborations run on the cached top layer, re-runnable cheaply.

Layers (deterministic; `g7_layers_plan.json`, computed from the donor's import graph):
  L0  base: debian + elan v4.2.4 + toolchain v4.34.1 (no ff2494ea mathlib — unneeded here)
  L1  the pruned donor tree (2,924-file Nonvanishing closure + lakefile/manifest/patches)
  L2  `lake exe cache get` (donor-pin mathlib d13f23b7 oleans) + the 12 lean4341 patches
  L3  chunk0: the external-package entry points the closure imports
  L4… chunks 1..N: OAI modules in topological order, ~20k source lines each
Every layer runs at the guideline default spec (2 CPU / 4 GB soft) under `@telemetered`
(AGENTS.md § Modal usage guidelines). Do NOT change the plan file or the layer functions
casually: that invalidates the cache from the changed layer upward.

  modal run --detach g7_layers.py                      # build/reuse layers, then G7b + R1
  modal run g7_layers.py --files a.lean,b.lean         # re-elaborate files on the top layer
"""
import json
import pathlib
import sys

import modal

HERE = pathlib.Path("/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
if modal.is_local():
    sys.path.insert(0, str(HERE))
from modal_telemetry import SPEC, telemetered  # noqa: E402

DONOR = pathlib.Path("/home/doz/zcode-workdir/openai-math/lean")
PLAN = json.loads((HERE / "g7_layers_plan.json").read_text()) if modal.is_local() else None
WORK = "/work/lean"
LAYER_TIMEOUT = 3 * 60 * 60

app = modal.App("crossmath-g7-layers")

PATCH_DEPS = ["fixed-point-theorems", "PrimeNumberTheoremAnd", "Zeta3Irrational",
              "rellich-kondrachov", "carleson", "StrongPNT", "AbsorptionCutoff", "AINTLIB",
              "ClassFieldTheory", "schoenflies-lean", "SphereEversion", "gromov"]


def _sh(cmd, timeout):
    """Run in WORK, stream non-progress lines + every 50th progress line; raise on failure
    (a failed layer must NOT be cached as if it succeeded)."""
    import subprocess
    import time
    p = subprocess.Popen(cmd, cwd=WORK, shell=True, stdout=subprocess.PIPE,
                         stderr=subprocess.STDOUT, text=True, bufsize=1)
    t0, k, tail = time.time(), 0, []
    for line in p.stdout:
        line = line.rstrip("\n")
        tail = (tail + [line])[-60:]
        if line.startswith(("✔", "⣿")):
            k += 1
            if k % 50 == 0:
                print(f"[{int(time.time() - t0)}s] {line}", flush=True)
        else:
            print(line, flush=True)
        if time.time() - t0 > timeout:
            p.kill()
            raise RuntimeError(f"TIMEOUT {timeout}s: {cmd}")
    p.wait()
    if p.returncode != 0:
        print("\n".join(tail), flush=True)
        raise RuntimeError(f"rc={p.returncode}: {cmd}")


@telemetered
def prep():
    _sh("lake exe cache get", 3600)
    import subprocess
    for label in PATCH_DEPS:
        dep = f"{WORK}/.lake/packages/{label}"
        patch = f"{WORK}/patches/{label}-lean4341.patch"
        if subprocess.run(f"git -C {dep} apply --check --reverse {patch}", shell=True,
                          capture_output=True).returncode == 0:
            print(f"[patch] {label}: already applied", flush=True)
            continue
        r = subprocess.run(f"git -C {dep} apply {patch}", shell=True, capture_output=True,
                           text=True)
        if r.returncode != 0:
            raise RuntimeError(f"patch {label} failed: {r.stdout}{r.stderr}")
        print(f"[patch] {label}: applied", flush=True)


@telemetered
def build_chunk(idx: int, targets: list):
    print(f"[layer] chunk {idx}: {len(targets)} targets", flush=True)
    # The image builder reports nproc=18 at cpu=2 (run29 telemetry, prep layer): without a
    # cap, Lake's task pool and every lean child would size to 18 threads and overrun the
    # 2-CPU / 4 GB spec. LEAN_NUM_THREADS (Lean runtime) bounds both to the spec.
    _sh("LEAN_NUM_THREADS=2 lake build " + " ".join(targets), LAYER_TIMEOUT - 300)


def _stage_tree():
    """Local copy of the pruned closure (read-only donor untouched)."""
    st = pathlib.Path("/tmp/claude-1000/-home-doz-zcode-workdir-cross-math-fronttier/"
                      "0c05f22f-8c59-44ab-86be-924ae3d3ad47/scratchpad/g7tree")
    import shutil
    if not (st / "lakefile.lean").exists():
        st.mkdir(parents=True, exist_ok=True)
        for x in ["lakefile.lean", "lake-manifest.json", "lean-toolchain"]:
            shutil.copy2(DONOR / x, st / x)
        shutil.copytree(DONOR / "patches", st / "patches", dirs_exist_ok=True)
        for r in PLAN["files"]:
            (st / r).parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(DONOR / r, st / r)
    return st


def _layered_image():
  image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        "curl -sSfL https://github.com/leanprover/elan/releases/download/v4.2.4/elan-x86_64-unknown-linux-gnu.tar.gz | tar xz -C /tmp",
        "mkdir -p /opt/elan",
        "ELAN_HOME=/opt/elan /tmp/elan-init -y --default-toolchain none",
        "ELAN_HOME=/opt/elan /opt/elan/bin/elan toolchain install leanprover/lean4:v4.34.1",
    )
    .env({"ELAN_HOME": "/opt/elan", "PATH": "/opt/elan/bin:/usr/local/bin:/usr/bin:/bin",
          "TELE_INTERVAL": "120"})
    .add_local_python_source("modal_telemetry", copy=True)
    .add_local_dir(str(_stage_tree()), WORK, copy=True)
    .run_function(prep, **SPEC, timeout=LAYER_TIMEOUT)
    .run_function(build_chunk, **SPEC, timeout=LAYER_TIMEOUT,
                  kwargs={"idx": 0, "targets": PLAN["chunk0"]})
)
  for i, c in enumerate(PLAN["chunks"], start=1):
      image = image.run_function(build_chunk, **SPEC, timeout=LAYER_TIMEOUT,
                                 kwargs={"idx": i, "targets": c})
  return image.run_function(build_chunk, **SPEC, timeout=LAYER_TIMEOUT,
                            kwargs={"idx": 999, "targets": [PLAN["target"]]})


# Inside Modal containers the layer chain is not re-derived (no local files there).
image = _layered_image() if modal.is_local() else modal.Image.debian_slim()


@app.function(image=image, **SPEC, timeout=60 * 60)
@telemetered
def elaborate(files: dict):
    import subprocess
    out = {}
    for name, content in files.items():
        (pathlib.Path(WORK) / name).write_text(content)
        r = subprocess.run(f"LEAN_NUM_THREADS=2 lake env lean {name}", cwd=WORK, shell=True,
                           capture_output=True, text=True, timeout=2400)
        txt = r.stdout + r.stderr
        errs = [l for l in txt.splitlines() if ": error" in l]
        sw = [l for l in txt.splitlines() if "declaration uses" in l and "sorry" in l]
        out[name] = f"{'OK' if r.returncode == 0 and not errs else 'FAIL'} rc={r.returncode} errors={len(errs)} sorry-warnings={len(sw)}"
        print(f"\n=== {name}: {out[name]}\n{txt[:40000]}", flush=True)
    print("\n=== SUMMARY", flush=True)
    for k, v in out.items():
        print(f"{k}: {v}", flush=True)
    return out


@app.local_entrypoint()
def main(files: str = ""):
    if files:
        names = [pathlib.Path(f) for f in files.split(",") if f]
    else:
        names = [HERE / "ProbeG7b_OAI_SevenEighths.lean",
                 HERE.parent.parent / "pilots/50/R1probe.lean",
                 HERE.parent.parent / "pilots/50/R1.lean"]
    print(elaborate.remote({p.name: p.read_text() for p in names}))
