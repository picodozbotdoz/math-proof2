#!/usr/bin/env python3
"""41H3 pre-solve ARCHIVAL re-run (custody settlement, 2026-11-21).

Rebuilds the M-tranche pre-solve scan of record (H3-M-candidates.md, 2026-11-20,
whose scripts were ephemeral by design) as a PERSISTED generator + checker, re-runs
all three scan classes at BOTH closed fibers with per-fiber counts, and archives the
exact-integer host matrices, the target tables, the word census, the controls and the
scan results under outputs/.

Everything is rebuilt from the recorded formulas only:

* Host: tauceti `TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean` — `spinCup` :91
  (cup(T,F) = -q, cup(F,T) = 1, parallel 0), `spinCap` :99 (cap(T,F) = 1,
  cap(F,T) = -q^-1, parallel 0), `spinGenerator` :153 (identity off strands {j,k};
  entry = cup(s_j,s_k) * cap(t_j,t_k)), `spinRep` :300 (e_i -> generator on strands
  (i, i+1)). n = 4 -> 16 configurations (Fin 4 -> Bool), integer matrices at both
  fibers (q_spin = 1: cup/cap in {-1,1}; q_spin = -1: cup/cap = 1).
* Fiber pairing (record note §1): q_spin = 1  <-> delta = -2 <-> target table M_minus
  (the deformation's q = -1 table, (-1)^phiQ — the cumsum-bijection Walsh table,
  41H Thm B); q_spin = -1 <-> delta = +2 <-> target table M_plus = eth's sigma
  (the deformation's q = +1 table, (-1)^(phiQ+tau)).
* Targets: phiQ/tau verbatim from `research/pilots/41/Core.lean:106-121`
  (phiQ = p1q1+p1q2+p1q3+p2q2+p2q3+p3q3; tau = q1p2p3 + p1q2p3 + p1p2q3).
* K class: block-diagonal functionals on the 16-config space, sector decomposition
  by #True spins (dims 1,4,6,4,1) — the generators preserve #True (cup/cap force
  s_j != s_k and t_j != t_k with off-strands fixed), so word products are
  block-diagonal and the 70-dim block-diagonal functional class is EXACT
  (record note §1/§2-S3; precharter P5: realization = tr(K * W_p * W_p') = m(p,p')).
* Scan classes (record note §1):
  1. canonical-13 reduced words (epsilon; e_i; the 5 two-letter reduced words;
     the 4 reduced three-letter words) — ALL C(13,8) = 1287 8-word subsets.
  2. natural-monomial family: the 8 square-free subset words w_P = prod_{i in P} e_i
     (P = the 8 subsets of {1,2,3}), ALL order conventions (2 for the pair {1,2},
     2 for the pair {2,3}, 4 reduced triple orders => 16) x ALL scalar variants
     ({1,delta}^7 on the 7 non-empty words => 128) => 2048 variants per fiber.
  3. random L <= 4 sweep: 2500 seeded random 8-subsets of the L <= 4 image census
     per fiber (37 distinct images per the note's S1).
* Assignment model: a dictionary assigns the 8 words to the 8 blocks (40320
  bijections). Realization condition: exists block-diagonal K with
  tr(K * W_{pi(p)} * W_{pi(p')}) = m(p,p') for all 64 ordered block pairs.
  For a FIXED 8-word subset the equation coefficient rows {vec70(W_a W_b)} are
  assignment-independent — the assignment only permutes which target entry pairs
  with which row — so the full 40320-assignment orbit test batches as ONE matmul
  against the left-null-space basis of the 64x70 system (the record's
  "gather-batch assignment solver", ~35 ms/subset).
* Residual metric (matching the record note's ~7.1 for far tables): the 2-NORM of
  the left-null projection of the assignment-transported target — for a rank-14
  monomial subspace a random +-1 table sits at ||t||*sqrt(null/64) ~ 7.1, planted
  solutions at ~1e-13. Survivor = some assignment with residual < 1e-8.
* Auto-skip: subsets whose 8 word images are linearly dependent cannot realize a
  nonsingular target (Gram rank <= span dim < 8 < rank(m) = 8) — recorded as
  rank-skips, not systems.

Run:  python3 h3_presolve_archive.py [--quick]
Writes outputs/ (JSON + text) and prints a summary. Deterministic (fixed seeds).
"""
import itertools
import json
import sys
import time
from fractions import Fraction
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
OUT = HERE / "outputs"
OUT.mkdir(exist_ok=True)

N_STRANDS = 4
N_CONFIGS = 1 << N_STRANDS  # 16
TOL_RANK = 1e-9             # relative singular-value cut for exact integer matrices
TOL_SURVIVOR = 1e-8         # max-abs residual for a survivor (plants land ~1e-13)
SEED = 20261121


# --------------------------------------------------------------------------
# exact host construction (tauceti formulas, integer at both fibers)
# --------------------------------------------------------------------------
def config_index(bits):
    """bits = tuple of 4 bools (s0..s3) -> flat index (s0 is the high bit)."""
    v = 0
    for b in bits:
        v = 2 * v + int(b)
    return v


def sector_of(bits):
    """Magnetization sector = number of True spins (the generator-preserving
    decomposition; dims (1,4,6,4,1) at n=4)."""
    return sum(bits)


def spin_generator(qs, i, j):
    """spinGenerator on strands (i, j) at spin parameter qs (integer +/-1).
    cup(T,F) = -qs, cup(F,T) = 1, cap(T,F) = 1, cap(F,T) = -qs^-1 (integer at qs^2=1)."""
    cup = {(True, False): -qs, (False, True): 1, (True, True): 0, (False, False): 0}
    cap = {(True, False): 1, (False, True): -qs, (True, True): 0, (False, False): 0}
    E = np.zeros((N_CONFIGS, N_CONFIGS), dtype=np.int64)
    for s in itertools.product([False, True], repeat=N_STRANDS):
        for t in itertools.product([False, True], repeat=N_STRANDS):
            if all(s[l] == t[l] for l in range(N_STRANDS) if l not in (i, j)):
                E[config_index(s), config_index(t)] = cup[(s[i], s[j])] * cap[(t[i], t[j])]
    return E


def host_fiber(qs):
    """The three TL_4 generator matrices at spin parameter qs."""
    return [spin_generator(qs, 0, 1), spin_generator(qs, 1, 2), spin_generator(qs, 2, 3)]


# --------------------------------------------------------------------------
# targets (Core.lean:106-121 verbatim)
# --------------------------------------------------------------------------
def phi_q(p, q):
    p1, p2, p3 = p
    q1, q2, q3 = q
    return (p1 & q1) + (p1 & q2) + (p1 & q3) + (p2 & q2) + (p2 & q3) + (p3 & q3)


def tau(p, q):
    p1, p2, p3 = p
    q1, q2, q3 = q
    return (q1 & p2 & p3) + (p1 & q2 & p3) + (p1 & p2 & q3)


BLOCKS = list(itertools.product([0, 1], repeat=3))


def target_table(deformation_q):
    """sigma_deformation-q(p,p') as an 8x8 int table over Block x Block."""
    m = np.zeros((8, 8), dtype=np.int64)
    for a, p in enumerate(BLOCKS):
        for b, q in enumerate(BLOCKS):
            m[a, b] = (-1) ** (phi_q(p, q) + (tau(p, q) if deformation_q == 1 else 0))
    return m


# exact determinant (Fraction Gaussian elimination) for the C1 consistency check
def exact_det(mat):
    A = [[Fraction(int(x)) for x in row] for row in mat]
    n = len(A)
    det = Fraction(1)
    for c in range(n):
        piv = next((r for r in range(c, n) if A[r][c] != 0), None)
        if piv is None:
            return 0
        if piv != c:
            A[c], A[piv] = A[piv], A[c]
            det = -det
        det *= A[c][c]
        inv = A[c][c]
        for r in range(c + 1, n):
            if A[r][c] != 0:
                f = A[r][c] / inv
                for k in range(c, n):
                    A[r][k] -= f * A[c][k]
    return int(det)


# --------------------------------------------------------------------------
# block-diagonal coordinates (70) and the scanner
# --------------------------------------------------------------------------
def sector_layout():
    """(sector id per config, per-sector config lists)."""
    bits = list(itertools.product([False, True], repeat=N_STRANDS))
    sectors = {}
    for b in bits:
        sectors.setdefault(sector_of(b), []).append(config_index(b))
    return sectors


SECTORS = sector_layout()
BD_COORDS = [(c, d) for s in sorted(SECTORS) for c in SECTORS[s] for d in SECTORS[s]]
assert len(BD_COORDS) == 70, len(BD_COORDS)

# selector matrix: vec16x16 -> the 70 block-diagonal coordinates (row-major vec)
BD_MAT = np.zeros((70, N_CONFIGS * N_CONFIGS), dtype=np.float64)
for i, (c, d) in enumerate(BD_COORDS):
    BD_MAT[i, c * N_CONFIGS + d] = 1.0


def bd_stack(mats):
    """(k, 16, 16) integer matrices -> (k, 70) block-diagonal coordinate vectors."""
    return np.stack([np.asarray(M, dtype=np.float64).reshape(-1)
                     for M in mats]) @ BD_MAT.T


def word_images(gens, words):
    """Matrix images of words given as tuples of generator indices (None = epsilon)."""
    out = []
    for w in words:
        M = np.eye(N_CONFIGS, dtype=np.int64)
        for g in (w or []):
            M = M @ gens[g]
        out.append(M)
    return out


# the 13 canonical reduced words (record note §1), as generator-index tuples
CANONICAL_13 = [
    (),
    (0,), (1,), (2,),
    (0, 1), (1, 0), (0, 2), (1, 2), (2, 1),
    (0, 1, 2), (0, 2, 1), (1, 0, 2), (2, 1, 0),
]

# the natural-monomial family: square-free subset words, all order conventions
# (2 for pair {0,1}, 2 for pair {1,2}, 4 reduced triple orders) — pair {0,2}
# commutes (|i-j| = 2), so it contributes no convention
def natural_words(order):
    """order = dict: 'p01' in {0,1}, 'p12' in {0,1}, 'triple' in {0,1,2,3}.
    Returns the 8 word tuples for the 8 subsets P of {0,1,2}."""
    pair01 = [(0, 1), (1, 0)][order["p01"]]
    pair12 = [(1, 2), (2, 1)][order["p12"]]
    triples = [(0, 1, 2), (0, 2, 1), (1, 0, 2), (2, 1, 0)][order["triple"]]
    return [
        (),
        (0,), (1,), (2,),
        pair01, pair12, (0, 2),          # pairs {0,1}, {1,2}, {0,2}
        triples,                          # the triple {0,1,2}
    ]


# assignment-orbit machinery: t_sigma[(a,b)] = m[sigma(a), sigma(b)]
def build_perm_index():
    perms = np.array(list(itertools.permutations(range(8))), dtype=np.int64)
    a_idx = np.repeat(np.arange(8), 8)
    b_idx = np.tile(np.arange(8), 8)
    return perms, perms[:, a_idx] * 8 + perms[:, b_idx]  # (40320, 64)


PERMS, PERM_IDX = build_perm_index()


def gram_orbit(m_flat):
    """All 40320 assignment-transports of the target table, as (40320, 64)."""
    return m_flat[PERM_IDX]


def scan_subset(word_mats, m_orbit):
    """One 8-word subset at one fiber. Returns dict with rank info and residuals.
    m_orbit: (40320, 64) — the assignment orbit of THIS fiber's target."""
    W = np.stack([np.asarray(M, dtype=np.float64) for M in word_mats])
    prods = np.matmul(W[:, None], W[None, :])          # (8,8,16,16)
    V = prods.reshape(64, N_CONFIGS * N_CONFIGS) @ BD_MAT.T   # (64, 70) rows = pairs
    # left-null basis of the 64x70 system: t is realizable iff t is orthogonal to N
    u, s, _ = np.linalg.svd(V, full_matrices=True)
    tol = TOL_RANK * max(1.0, s[0])
    r = int(np.sum(s > tol))
    N = u[:, r:]                       # (64, 64 - r) orthonormal left-null basis
    res = m_orbit @ N                  # (40320, 64 - r)
    worst = np.linalg.norm(res, axis=1)  # per-assignment residual (2-norm)
    return {
        "phi_rank": int(r),
        "word_span_rank": int(np.linalg.matrix_rank(bd_stack(word_mats), tol=tol)),
        "min_residual": float(worst.min()),
        "survivor": bool(worst.min() <= TOL_SURVIVOR),
    }


def scan_class(word_subsets, m_orbit, label, fiber, log):
    """Scan a list of 8-word (matrix) subsets; rank-skips recorded, not systems.
    Pass 1 builds each scanned subset's left-null basis (cheap); pass 2 batch-tests
    the 40320-assignment orbit against concatenated bases (one fat matmul per
    chunk — amortizes the orbit-matrix read)."""
    scanned = skipped = survivors = 0
    min_res = float("inf")
    ranks = []
    t0 = time.time()
    bases = []  # (N, phi_rank) per scanned subset
    for mats in word_subsets:
        if np.linalg.matrix_rank(bd_stack(mats), tol=TOL_RANK) < 8:
            skipped += 1
            continue
        W = np.stack([np.asarray(M, dtype=np.float64) for M in mats])
        V = np.matmul(W[:, None], W[None, :]).reshape(
            64, N_CONFIGS * N_CONFIGS) @ BD_MAT.T
        u, s, _ = np.linalg.svd(V, full_matrices=True)
        r = int(np.sum(s > TOL_RANK * max(1.0, s[0])))
        bases.append((u[:, r:], r))
        scanned += 1

    CHUNK = 8
    for lo in range(0, len(bases), CHUNK):
        chunk = bases[lo:lo + CHUNK]
        Ncat = np.concatenate([b[0] for b in chunk], axis=1)
        res = m_orbit @ Ncat                       # (40320, sum(64-r))
        offs = np.cumsum([0] + [b[0].shape[1] for b in chunk])
        for j, (_, r) in enumerate(chunk):
            worst = np.linalg.norm(res[:, offs[j]:offs[j + 1]], axis=1)
            m_res = float(worst.min())
            ranks.append(r)
            min_res = min(min_res, m_res)
            if m_res <= TOL_SURVIVOR:
                survivors += 1
                log(f"    SURVIVOR at {label}/{fiber} subset #{lo + j} "
                    f"(residual {m_res:.3e})")
    dt = time.time() - t0
    systems = scanned * 40320
    log(f"  {label} [{fiber}]: subsets={scanned + skipped} scanned={scanned} "
        f"rank-skipped={skipped} systems={systems} survivors={survivors} "
        f"min_residual={min_res:.4f} wall={dt:.1f}s "
        f"({1000.0 * dt / max(scanned, 1):.1f} ms/scanned-subset)")
    return {
        "subsets_total": scanned + skipped, "subsets_scanned": scanned,
        "subsets_rank_skipped": skipped, "systems_tested": systems,
        "survivors": survivors,
        "min_residual_over_all_assignments": None if min_res == float("inf") else min_res,
        "phi_rank_min": int(min(ranks)) if ranks else None,
        "phi_rank_max": int(max(ranks)) if ranks else None,
    }


# --------------------------------------------------------------------------
# controls
# --------------------------------------------------------------------------
def run_controls(gens, m_orbit, fiber, log, rng):
    """Planted solutions (must be detected at ~1e-13) + random +-1 tables
    (expected residual ~ ||m||*sqrt(nullfrac) ~ 7.1)."""
    # -- plants: random integer K on random independent canonical subsets,
    #    random assignment; the realized table is planted as the target.
    canon = word_images(gens, CANONICAL_13)
    detected = 0
    plant_res = []
    tries = 0
    while detected < 20 and tries < 200:
        tries += 1
        idx = rng.choice(len(canon), size=8, replace=False)
        mats = [canon[i] for i in idx]
        if np.linalg.matrix_rank(bd_stack(mats), tol=TOL_RANK) < 8:
            continue
        W = np.stack([np.asarray(M, dtype=np.float64) for M in mats])
        V = np.matmul(W[:, None], W[None, :]).reshape(
            64, N_CONFIGS * N_CONFIGS) @ BD_MAT.T
        k = rng.integers(-3, 4, size=70).astype(np.float64)
        t = V @ k                                    # exact integer target (float)
        t_orbit = gram_orbit(t)                      # transport over assignments
        u, s, _ = np.linalg.svd(V, full_matrices=True)
        r = int(np.sum(s > TOL_RANK * max(1.0, s[0])))
        res = np.linalg.norm(t_orbit @ u[:, r:], axis=1)
        if res.min() <= TOL_SURVIVOR:
            detected += 1
            plant_res.append(float(res.min()))
    log(f"  controls [{fiber}]: plants detected {detected}/20 "
        f"(max planted residual {max(plant_res):.2e})")
    # -- random +-1 tables against a fixed scanned subset's null space
    base = None
    for _ in range(200):
        idx = rng.choice(len(canon), size=8, replace=False)
        mats = [canon[i] for i in idx]
        if np.linalg.matrix_rank(bd_stack(mats), tol=TOL_RANK) == 8:
            base = mats
            break
    assert base is not None
    W = np.stack([np.asarray(M, dtype=np.float64) for M in base])
    V = np.matmul(W[:, None], W[None, :]).reshape(
        64, N_CONFIGS * N_CONFIGS) @ BD_MAT.T
    u, s, _ = np.linalg.svd(V, full_matrices=True)
    r = int(np.sum(s > TOL_RANK * max(1.0, s[0])))
    N = u[:, r:]
    rand_tabs = rng.choice([-1.0, 1.0], size=(100, 64))
    res = np.linalg.norm(rand_tabs @ N, axis=1)
    log(f"  controls [{fiber}]: 100 random +-1 tables vs a rank-{r} monomial "
        f"subspace: residual min {res.min():.3f} / median {np.median(res):.3f} "
        f"/ max {res.max():.3f}  (record note: ~7.1)")
    return {
        "plants_detected": detected, "plants_requested": 20,
        "plant_residual_max": float(max(plant_res)),
        "random_pm1_residual_min": float(res.min()),
        "random_pm1_residual_median": float(np.median(res)),
        "random_pm1_residual_max": float(res.max()),
        "null_dim_at_reference_subset": int(64 - r),
    }


# --------------------------------------------------------------------------
# main
# --------------------------------------------------------------------------
def main(quick=False):
    t00 = time.time()
    log_lines = []

    def log(msg):
        print(msg, flush=True)
        log_lines.append(msg)

    rng = np.random.default_rng(SEED)
    results = {
        "protocol": "see module docstring — rebuilt from H3-M-candidates.md formulas",
        "seed": SEED,
        "tolerances": {"rank": TOL_RANK, "survivor": TOL_SURVIVOR},
        "fibers": {},
    }

    n_random = 400 if quick else 2500          # --quick: reduced random sweep
    m_plus = target_table(+1)                  # eth's sigma: (-1)^(phiQ+tau)
    m_minus = target_table(-1)                 # (-1)^phiQ
    for m, name in ((m_plus, "M_plus"), (m_minus, "M_minus")):
        log(f"target {name}: det = {exact_det(m)} (C1: |det| = 8^4 = 4096), "
            f"rank = {np.linalg.matrix_rank(m.astype(float))}")

    for fiber, qs, m, mname in (
            ("m_plus",  -1, m_plus,  "M_plus (deformation q=+1, eth's sigma)"),
            ("m_minus", +1, m_minus, "M_minus (deformation q=-1, (-1)^phiQ)")):
        log(f"=== fiber {fiber}: q_spin = {qs} (delta = {-2*qs}), target {mname}")
        gens = host_fiber(qs)

        # --- S1 reproduction: the word-image census ---
        census = {}
        for L in (3, 4):
            words = [w for l in range(L + 1)
                     for w in itertools.product(range(3), repeat=l)]
            imgs = word_images(gens, words)
            seen, uniq = set(), []
            for M in imgs:
                key = M.tobytes()
                if key not in seen:
                    seen.add(key)
                    uniq.append(M)
            span = int(np.linalg.matrix_rank(bd_stack(uniq), tol=TOL_RANK))
            census[f"L{L}_distinct_images"] = len(uniq)
            census[f"L{L}_span_dim"] = span
            log(f"  S1 census: L<={L} words={len(words)} distinct images="
                f"{len(uniq)} span dim={span} (record: 24/13 at L<=3, 37/14 at L<=4)")
        if census["L3_distinct_images"] != 24 or census["L3_span_dim"] != 13 \
                or census["L4_distinct_images"] != 37 or census["L4_span_dim"] != 14:
            log("  WARNING: census does not reproduce the record's S1 numbers")

        # --- assignment orbit of this fiber's target (built once) ---
        m_orbit = gram_orbit(m.astype(np.float64).reshape(-1))

        # --- controls ---
        controls = run_controls(gens, m_orbit, fiber, log,
                                np.random.default_rng(SEED + 1))

        # --- class 1: canonical-13 subsets ---
        canon_mats = word_images(gens, CANONICAL_13)
        subsets = list(itertools.combinations(range(13), 8))
        cls1 = scan_class([[canon_mats[i] for i in s] for s in subsets],
                          m_orbit, "canonical-13 C(13,8)", fiber, log)

        # --- class 2: natural-monomial family (16 orders x 128 scalar variants) ---
        delta = -2 * qs
        variants = []
        for p01 in (0, 1):
            for p12 in (0, 1):
                for tri in range(4):
                    base8 = natural_words({"p01": p01, "p12": p12, "triple": tri})
                    imgs = word_images(gens, base8)
                    for scalars in itertools.product([1, delta], repeat=7):
                        mats = [imgs[0]] + [s * imgs[i + 1]
                                            for i, s in enumerate(scalars)]
                        variants.append(mats)
        cls2 = scan_class(variants, m_orbit, "natural-monomial 16x128", fiber, log)

        # --- class 3: random L<=4 subsets (seeded; the 37-image census pool) ---
        words_l4 = [w for l in range(5)
                    for w in itertools.product(range(3), repeat=l)]
        imgs = word_images(gens, words_l4)
        seen, uniq = {}, []
        for w, M in zip(words_l4, imgs):
            key = M.tobytes()
            if key not in seen:
                seen[key] = w
                uniq.append(M)
        r3 = None
        if quick:
            log("  random-L4: SKIPPED (--quick)")
            r3 = {"skipped_quick": True}
        else:
            pools = []
            for _ in range(n_random):
                idx = rng.choice(len(uniq), size=8, replace=False)
                pools.append([uniq[i] for i in idx])
            r3 = scan_class(pools, m_orbit, f"random-L4 ({n_random}/fiber)",
                            fiber, log)

        results["fibers"][fiber] = {
            "q_spin": qs, "delta": -2 * qs, "target": mname,
            "s1_census": census, "controls": controls,
            "class1_canonical13": cls1,
            "class2_natural": cls2,
            "class3_random_L4": r3,
        }

    # --- archive exact matrices/tables ---
    for fiber, qs in (("m_plus", -1), ("m_minus", +1)):
        gens = host_fiber(qs)
        names = ["E1", "E2", "E3"]
        with open(OUT / f"host_generators_qspin{qs:+d}.txt", "w") as fh:
            fh.write(f"# spin host generators at q_spin = {qs:+d} "
                     f"(delta = {-2*qs}); tauceti MarkovTrace.lean:91/:99/:153 formulas\n")
            for nm, G in zip(names, gens):
                fh.write(f"\n# {nm} = spinGenerator on strands (0{nm[1]},...)\n")
                for row in G:
                    fh.write(" ".join(f"{v:4d}" for v in row) + "\n")
    with open(OUT / "target_tables.txt", "w") as fh:
        fh.write("# deformation-q=+1 table M_plus = (-1)^(phiQ+tau)  (eth's sigma)\n")
        for row in m_plus:
            fh.write(" ".join(f"{v:3d}" for v in row) + "\n")
        fh.write("\n# deformation-q=-1 table M_minus = (-1)^phiQ\n")
        for row in m_minus:
            fh.write(" ".join(f"{v:3d}" for v in row) + "\n")

    # --- totals + reconciliation against the record note's counts ---
    tot = {}
    for fiber, d in results["fibers"].items():
        for cls in ("class1_canonical13", "class2_natural", "class3_random_L4"):
            c = d[cls]
            if "systems_tested" in c:
                tot.setdefault(cls, {}).setdefault(fiber, c["systems_tested"])
    results["totals_per_fiber"] = tot
    results["totals_both_fibers"] = {
        cls: sum(v.values()) for cls, v in tot.items()}
    results["record_note_counts"] = {
        "class1_canonical13": 103_219_200,
        "class2_natural": 82_575_360,
        "class3_random_L4": 13_870_080,
    }
    log(f"TOTALS per fiber: {json.dumps(results['totals_per_fiber'])}")
    log(f"TOTALS both fibers: {json.dumps(results['totals_both_fibers'])}")
    log(f"record-note counts (no per-fiber split): "
        f"{json.dumps(results['record_note_counts'])}")

    survivors = sum(
        d[c].get("survivors", 0)
        for d in results["fibers"].values()
        for c in ("class1_canonical13", "class2_natural", "class3_random_L4")
        if "survivors" in d[c])
    log(f"GRAND TOTAL SURVIVORS: {survivors}")

    with open(OUT / "scan_results.json", "w") as fh:
        json.dump(results, fh, indent=1)

    log(f"wall total: {time.time() - t00:.1f}s")
    with open(OUT / "run_log.txt", "w") as fh:
        fh.write("\n".join(log_lines) + "\n")


if __name__ == "__main__":
    main(quick="--quick" in sys.argv)
