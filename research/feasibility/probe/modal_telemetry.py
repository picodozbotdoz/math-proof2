"""Shared Modal resource telemetry (AGENTS.md § "Modal usage guidelines", 2026-11-14).

Every crossmath Modal function is declared at the default spec (`SPEC`: 2 CPU / 4 GB,
soft limits) and decorated with `@telemetered`. The decorator samples the container every
`TELE_INTERVAL` seconds (default 60) and prints one line per sample:

    [tele] t=<s> cpu=<cores used> mem=<cgroup MB> anon=<sum RssAnon MB> peak=<MB>
           procs=<lean/lake count> [OVER cpu|mem]

A sample is flagged OVER when cpu > SPEC cpu or cgroup memory > SPEC memory. Any OVER
line triggers the guideline's investigation step (code/logic/math) — it never silently
justifies a bigger spec. A final `[tele] SUMMARY` line records maxima and OVER counts.

Usage in a Modal script (the image mounts this module; no image rebuild):

    sys.path.insert(0, PROBE_DIR)   # local import path
    from modal_telemetry import SPEC, telemetered
    image = image.add_local_python_source("modal_telemetry")

    @app.function(image=image, **SPEC, timeout=...)
    @telemetered
    def run(...): ...
"""
import functools
import os
import threading
import time

SPEC = {"cpu": 2.0, "memory": 4096}
_LIM_CPU = SPEC["cpu"]
_LIM_MB = SPEC["memory"]


def _read(path):
    try:
        with open(path) as f:
            return f.read()
    except OSError:
        return None


def _cg_mem_mb():
    for p in ("/sys/fs/cgroup/memory.current", "/sys/fs/cgroup/memory/memory.usage_in_bytes"):
        v = _read(p)
        if v and v.strip().isdigit():
            return int(v) / 2**20
    mi = _read("/proc/meminfo") or ""
    kv = {l.split(":")[0]: int(l.split()[1]) for l in mi.splitlines() if len(l.split()) >= 2}
    if "MemTotal" in kv and "MemAvailable" in kv:
        return (kv["MemTotal"] - kv["MemAvailable"]) / 1024
    return -1.0


def _cg_peak_mb():
    v = _read("/sys/fs/cgroup/memory.peak")
    return int(v) / 2**20 if v and v.strip().isdigit() else -1.0


def _cpu_usec():
    st = _read("/sys/fs/cgroup/cpu.stat")
    if st:
        for l in st.splitlines():
            if l.startswith("usage_usec"):
                return int(l.split()[1])
    s = _read("/proc/stat")
    if s:
        f = s.splitlines()[0].split()[1:]
        busy = sum(int(x) for i, x in enumerate(f) if i not in (3, 4))
        return busy * 10**6 // os.sysconf("SC_CLK_TCK")
    return None


def _procs():
    n, anon = 0, 0
    for pid in os.listdir("/proc"):
        if not pid.isdigit():
            continue
        cmd = _read(f"/proc/{pid}/cmdline") or ""
        if "lean" in cmd or "lake" in cmd:
            n += 1
            for l in (_read(f"/proc/{pid}/status") or "").splitlines():
                if l.startswith("RssAnon:"):
                    anon += int(l.split()[1])
    return n, anon / 1024


def telemetered(fn):
    @functools.wraps(fn)
    def wrapper(*a, **kw):
        interval = int(os.environ.get("TELE_INTERVAL", "60"))
        stop = threading.Event()
        stats = {"max_cpu": 0.0, "max_mem": 0.0, "max_anon": 0.0, "over": 0, "n": 0}
        t0 = time.time()

        def loop():
            last_t, last_u = time.time(), _cpu_usec()
            while not stop.wait(interval):
                now, u = time.time(), _cpu_usec()
                cpu = ((u - last_u) / 1e6 / (now - last_t)) if (u is not None and last_u is not None) else -1.0
                last_t, last_u = now, u
                mem, peak = _cg_mem_mb(), _cg_peak_mb()
                n, anon = _procs()
                flags = []
                if cpu > _LIM_CPU * 1.05:
                    flags.append("cpu")
                if mem > _LIM_MB:
                    flags.append("mem")
                stats["n"] += 1
                stats["max_cpu"] = max(stats["max_cpu"], cpu)
                stats["max_mem"] = max(stats["max_mem"], mem, peak)
                stats["max_anon"] = max(stats["max_anon"], anon)
                if flags:
                    stats["over"] += 1
                print(f"[tele] t={int(now - t0)}s cpu={cpu:.2f} mem={mem:.0f}MB anon={anon:.0f}MB "
                      f"peak={peak:.0f}MB procs={n}" + (f" OVER {'|'.join(flags)}" if flags else ""),
                      flush=True)

        th = threading.Thread(target=loop, daemon=True)
        print(f"[tele] start {fn.__name__}: spec cpu={_LIM_CPU} mem={_LIM_MB}MB "
              f"nproc={os.cpu_count()} interval={interval}s", flush=True)
        th.start()
        try:
            return fn(*a, **kw)
        finally:
            stop.set()
            print(f"[tele] SUMMARY {fn.__name__}: wall={int(time.time() - t0)}s "
                  f"max_cpu={stats['max_cpu']:.2f} max_mem={stats['max_mem']:.0f}MB "
                  f"max_anon={stats['max_anon']:.0f}MB samples={stats['n']} "
                  f"OVER={stats['over']}", flush=True)
    return wrapper
