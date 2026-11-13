# liu1-hygiene-sweep — full-tree audit of the registered Liu-1 clone (completes A5's liu1-as-donor.md)

Lane A1, 2026-11-13 (task queue item 1). Companion to and completion of
`research/novelty/liu1-as-donor.md` (A5, which was grep-level over 7 fetched root files;
its §2 explicitly deferred the full-tree sweep to "H's registered clone"). Clone audited:
`/home/doz/zcode-workdir/liu-zerofree` — git `7d10420de90efa2f082a06a342fc7accbd57ab37`
("Add files via upload", 2026-10-08; single-commit local history), toolchain
`leanprover/lean4:v4.34.1` (NOT our v4.36.0-rc2). Every claim below verified in the clone
this session; commands recorded.

## 1. Hygiene inventory — all files, not just roots

Own tree = **220 `.lean` files** (root 9 entry/layer files + `lakefile.lean`;
`analytic_high/` 63, `analytic_high_v2/` 60, `analytic_low/` 51, `geometry/` 9,
`moment_adapters/` 26). `upstream/` contains **no `.lean` files** — only
`closure_manifest.json` + two patches (§5).

| Check (command, scope = whole tree excl. `upstream/`) | Result |
|---|---|
| `grep -rnE "\bsorry\b" --include="*.lean"` | **0 hits** |
| `grep -rn "native_decide"` | **0 hits** |
| `grep -rnE "^\s*axiom \w"` (axiom declarations) | **0 hits** |
| `grep -rn "sorryAx\|\badmit\b"` | **0 hits** |
| `#print axioms` sites | 56+ files (entry files incl. `RHZeroFreeExtension.lean:36–39`, `CombinedPaperVerification.lean:136–157`) |

This confirms and completes A5's root-file-level finding at full-tree scale: **zero sorry,
zero native_decide, zero axiom declarations in all 220 own files.**

## 2. verify.py EXPECTED-22 vs actual declarations — 22/22, none missing, none extra required

`verify.py:12` requires the 22 names as `CombinedPaper.<name>` in the replayed entry file's
`#print axioms` output (`verify.py:71–73`, ENTRY = `RHZeroFreeExtension/CombinedPaperVerification.lean`
`:10`, ALLOWED = {propext, Classical.choice, Quot.sound} `:11`). All 22 exist as declarations
in that file (`grep "theorem <name>"`):

| # | Decl | Line | # | Decl | Line |
|---|---|---|---|---|---|
| 1 | `rational_parameters` | CombinedPaperVerification.lean:23 | 12 | `algebraic_family_bound` | :80 |
| 2 | `algebraic_parameters` | :28 | 13 | `algebraic_hecke_nonzero` | :83 |
| 3 | `balanced_signal_matching` | :32 | 14 | `algebraic_dirichlet_nonzero` | :88 |
| 4 | `rational_boundary` | :37 | 15 | `algebraic_zeta_nonzero` | :95 |
| 5 | `algebraic_boundary` | :41 | 16 | `original_hecke_nonzero` | :100 |
| 6 | `boundary_order` | :44 | 17 | `original_dirichlet_nonzero` | :105 |
| 7 | `original_family_bound` | :50 | 18 | `original_zeta_nonzero` | :112 |
| 8 | `preliminary_family_bound` | :56 | 19 | `rational_endpoint` | :117 |
| 9 | `rational_family_bound` | :60 | 20 | `algebraic_endpoint` | :124 |
| 10 | `rational_hecke_nonzero` | :63 | 21 | `scalar_obstruction` | :130 |
| 11 | `rational_dirichlet_nonzero` | :68 | 22 | (`rational_zeta_nonzero`) | :75 |

Note the three-tier structure this exposes (richer than A5's 7-file view): **original**
(7/8, upstream fidelity: `original_family_bound : beta ≤ 7/8`), **algebraic** (exact surd
`B_new`), **rational** (rounded `B_r`) — each tier with its own hecke/dirichlet/zeta
nonvanishing triple, plus endpoint and obstruction lemmas.

## 3. Per-headline triad verdicts

No kernel outputs ship with the clone (`verification/` absent; `git log` single upload
commit), so verdicts are **stated-hygiene + command-level**, not in-repo kernel-witnessed:

| Headline | Evidence class | Verdict |
|---|---|---|
| `RHZeroFreeExtension.beta_star_le / hecke_nonzero / dirichlet_nonzero / zeta_nonzero` (RHZeroFreeExtension.lean:16–39) | inline `#print axioms` ×4 (:36–39); 0 sorry/axiom/native_decide tree-wide; docstring asserts triad; verify.py enforces ALLOWED at replay time | **TRIAD-clean by construction** (pending one kernel replay — see §5 blocker) |
| `CombinedPaper.*` ×22 (CombinedPaperVerification.lean:23–157) | inline `#print axioms` ×22 (:136+); verify.py parses output and requires deps ⊆ ALLOWED + all 22 present (`verify.py:71–78`) | same |
| Layer files (`Actual*`, `V2*`, `analytic_*`, `geometry`, `moment_adapters`) | 0 sorry/axiom/native_decide; binder discipline as A5 §1 documented | clean (grep-level) |

## 4. The constant story — RESOLVED (upgrades A5's "recorded, not resolved")

A5 flagged a "README↔Lean constant mismatch". The clone resolves it:

- `CombinedPaperVerification.lean:19 def B_new : ℝ := (1507 − 2 * Real.sqrt 921) / 1653` —
  numerically **0.8749570697991688** = the README's `0.874957069799` **exactly** (README:2;
  12-digit rounding of the Lean surd). **No README↔Lean mismatch.**
- The **paper's** decimal (per A5's pdftotext: 0.874957019420098946) differs from the Lean
  surd at the 10th place (…019… vs …069…, Δ ≈ 5·10⁻¹⁰) — a paper-side rounding/revision
  delta, not a repo inconsistency; the repo's surd is the operative formal value.
- `def B_r := 34999/40000` (:16) = 0.874975 — the deliberately weakened round rational the
  public entry uses (RHZeroFreeExtension.lean:16–33), and
  `boundary_order : B_new < B_r ∧ B_r < (7/8:ℝ)` (:44) proves the ordering. Supporting
  constants: `b_r = 1/8`, `ell_r = 1/6 + 1/10000` (:17–18), `b_new`, `ell_new` surds
  (:20–21); `rational_boundary : B_r = 11/12 − ell_r/4` (:37), `algebraic_boundary :
  B_new = 11/12 − ell_new/4` (:41).

So the formal content is a **two-endpoint theorem** (exact surd B_new ≈ 0.8749570700 and
rational B_r = 0.874975, both < 7/8), stronger than A5's "the repo formalizes
0.874975-only" reading.

## 5. closure_manifest trust note — and the build blocker

- `upstream/closure_manifest.json` pins **2,925 modules**, every path under
  `vendor/OAI/…`, each with `sha256` + `git_blob` (+ `indexed_blob_match`, `imports`),
  foundation commit `adc7f1241b42e322a6451854ab7e4b4c146bf78a` — **the same openai/math
  revision DZDF adapted** (`DedekindZetaZeroFree/formalization.yaml:77–80`; cross-corpus
  anchor). `verify.py:34–40` re-hashes every module and aborts on mismatch.
- **The clone ships no `vendor/` directory** (`ls vendor` → absent). The lakefile's
  `lean_lib OAI where srcDir := "vendor"` (lakefile.lean:17–19) and every verify.py hash
  check therefore target files that must be **materialized manually** from a checkout of
  openai/math @ `adc7f124` — no fetch script exists in-repo (verify.py checks, never
  fetches). Consequence: **the repo as cloned is unbuildable and unverifiable without a
  vendor-population step**; H's registration should record this as the replay prerequisite.
- Dependencies (lakefile.lean:5–15): `rellich-kondrachov @ 70f85d4c`,
  **`PrimeNumberTheoremAnd @ c39a7511`** (a third distinct PNT+ pin in the ecosystem —
  vs Axiom's fork and upstream master), `PrimeCert @ 0803c2f6`, `leancert @ 7f91b6eb`,
  mathlib @ `d13f23b7` (v4.34.1-era). `post_update` hook (:21–40) applies two
  lean4341-compat patches (`upstream/*.patch`) to rellich-kondrachov and PNT+ with
  reverse-check idempotence. **`PrimeCert`/`leancert` have zero imports from Liu's own
  220 files** (grep) — they are transitive requirements of the pinned PNT+ era, i.e. the
  same LeanCert machinery the Axiom fork cut (cf. `survey/axiommath-pntplus.md` §0).

## 6. Verdict

**CONSUME at statement level only (or better: not at all) — confirmed at full-tree scale.**
Zero sorry/native_decide/axiom across all 220 own files, 22/22 expected theorems present,
triad-clean by construction with inline `#print axioms` + a --trust=0 replay harness — but:
toolchain v4.34.1 with a vendored-openai closure (2,925 modules, same `adc7f124` rev DZDF
adapted) that is absent from the clone (manual population required before any replay), and
headline content sits in the hot 7/8-crossing constant cluster we must cite, not claim
(`liu1-as-donor.md` §5's DO-NOT-CONSUME-as-dependency stands; statement-level citation
register: formal ζ/Dirichlet/Hecke-ℚ(√−3) exponents = B_new ≈ 0.8749570700 (surd, exact) /
B_r = 0.874975 (rational), vs openai-tree 7/8 and DZDF 31/32-all-K).

## Sources consulted

- Clone: `git log -1` (7d10420, 2026-10-08), `lean-toolchain` (v4.34.1), file census
  (find, 220 own files), full-tree greps (§1), `verify.py` (all 134 lines),
  `upstream/closure_manifest.json` (module census + example record), `lakefile.lean` (all),
  `README.md:2`, `RHZeroFreeExtension.lean` (:1–39), `CombinedPaperVerification.lean`
  (:16–157), EXPECTED-22 declaration sweep, `B_new`/`B_r` numerics (python, §4), leancert/
  PrimeCert import grep. Open follow-up for H (from A5 §1): the repo's 1 open GitHub issue
  was not inspected this session.
- Project: `research/novelty/liu1-as-donor.md` (all), `survey/axiommath-pntplus.md` §0
  (LeanCert cut), `survey/axiommath.md` §3 (DZDF's openai/math adc7f124 adaptation),
  `qa/cycle2-qa-plan.md` (hygiene conventions).
