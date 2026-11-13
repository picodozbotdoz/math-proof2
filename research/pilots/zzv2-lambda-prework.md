# Pilot ZZV2-λ — execution prework: the ZetaZerosV2 λ-family parameterization

**[CHARTER-PENDING] — PROPOSAL. Not chartered, not run; no Modal calls made for this
file.** Lane A3, 2026-11-14 (holding task while 50-M2-R1 gates on G7b). Seed:
`feasibility/ITERATION4-SCAN.md` §2 seed 2 + `novelty/iter4-seed-triage.md` row 2
(A5's verdict NEW-LEAN, formalization-first) + `survey/axiommath.md` §2(c). Slot:
iteration-4 slot-3 (LP = A2 drafting; AL-3D assigned later; ZZV2-λ = this prework —
completes the pre-work for all three top seeds).

## 0. The gap, pinned (donor evidence, read this session in the local clone)

The donor's λ split is real and has a precise seam:

- **λ-ABSTRACT (machinery):** `IsAdmissible (lam : ℝ) (eta : ℝ → ℝ)`
  (`ZetaZeros/Definitions.lean:92`, support clause `∀ x, lam ≤ |x| → eta x = 0`);
  the whole Hilbert tree is λ-generic (`variable {lam : ℝ}` — `Hilbert/Basis.lean:27`
  etc.); the transfer endpoints are λ-generic:
  `simpleOnLineCount_lower {lam T : ℝ} {eta : ℝ → ℝ}` (`Zeta/Transfer.lean:126`:
  `simpleOnLineCount T ≥ 2 · zeroCount T − Re (unweightedKernelSum eta T)`) and
  `distinctZeroCount_lower {lam T : ℝ} {eta}` (`:151`: `≥ 3/2 · zeroCount T −
  Re (unweightedKernelSum eta T) / 2`).
- **λ = 1 FROZEN (terminal layer):** the extremal kernel is a fixed function —
  `extremalTest (x) = if |x| ≤ 1/2 then cos(√2 x)/(√2 sin(1/√2)) else 0`
  (`Zeta/Defs.lean:76`); the closed-form constants live inline —
  `montgomeryTaylorConst = 1/2 + (1/√2)·cot(1/√2)` (`:39`), `simpleProportion =
  3/2 − (1/√2)·cot(1/√2)` (`:45`), `distinctProportion = 5/4 − (1/(2√2))·cot(1/√2)`
  (`:50`; A1's scan cites the block `:39–49`); the
  challenge layer states all four theorems AT those constants — `thm_simple`,
  `thm_distinct`, `thm_average`, `thm_simple_or_critical`
  (`Challenge/Basic.lean:209–243`) — and `Main.lean`'s proved endpoints match.
- Survey corroboration (`survey/axiommath.md` §2(c)): "the α-expansion machinery is
  general; the parametrized layer is internal"; the Hilbert inequalities are stated
  per fixed admissible η; the A-parameter is generalized (`1 ≤ A < 2`) but the
  test-function optimization is resolved only at the MT kernel.

So: **nobody — in any corpus — exposes a λ-parameterized proportion/challenge layer**
(iter4 row 2: corpus-collision NONE), while the informal λ-dependence is the entire
content of Lamzouri's paper (KNOWN-INFORMAL). The Lean λ-layer is the deliverable.

## 1. Statement specs (Lean-adjacent; names provisional, `ZZLam` layer)

- **L0 (λ-bundle, the zeta23 model).** A parameter record after zeta23's fixed
  parameter bundle (`Zeta23/Defs.lean:184–196`: `lam : ℝ`, `lam_pos`, `lam_le_one`):
  `structure LamParams where lam : ℝ; hpos : 0 < lam; hrange : <P0-pinned range>` —
  the range comes from the transfer layer's actual admissibility hypotheses (P0 pins
  whether the donor runs at every admissible `(lam, eta)` or needs extra conditions;
  the MT kernel's support `[-1/2, 1/2]` is admissible for any `lam ≥ 1/2`, so the
  family domain is expected `(1/2, ∞)` or an interval around 1 — do NOT guess in the
  statement; take it from `simpleOnLineCount_lower`'s binders).
- **L1 (λ-parametric constants, donor vocabulary — no guessed closed forms).**
  `def kernelLam (lam : ℝ) : ℝ → ℝ := <P0-pinned scaled MT kernel>` and
  `def C0Lam (lam : ℝ) : ℝ := <the transfer functional evaluated at kernelLam lam>`
  (shape: `2 − Re(kernel-sum bound)/(zeroCount)`; likewise `C1Lam`, `C2Lam`). The
  closed forms at general λ are INFORMAL content — if a cot-substitution closed form
  is derivable, it is a P2 lemma, not a definition.
- **L2 (the λ-family challenge statements — the deliverable).** Four theorems at the
  donor's own challenge shapes (`Challenge/Basic.lean:209–243` verbatim modulo the
  constant), parameterized:
  `thm_simple_lam (P : LamParams) (ε : ℝ) (hε : 0 < ε) : ∃ T₀, ∀ T ≥ T₀,
  C0Lam P.lam − ε < simpleOnLineCount T / zeroCount T` — and the `_distinct`,
  `_average`, `_simple_or_critical` analogues. zeta23's `thmA/B/C_lam` families are
  the shape precedent (parameter bundle threading the challenge layer).
- **L3 (glue at λ = 1, route (a) continuity).** (i) **GLUE**:
  `C0Lam 1 = ZetaZeros.simpleProportion` (the scaled kernel at 1 IS the donor's
  `extremalTest` — identification lemma); (ii) **CONTINUITY**: `ContinuousOn C0Lam`
  on the family domain (parametric-integral continuity of the functional — mathlib
  `ContDiff`-integral family lemmas; the functional is an integral against the
  scaled kernel); (iii) **FAMILY MARGIN**: `∃ δ > 0, ∀ lam ∈ ball 1 δ, 2/3 < C0Lam
  lam` (from CONT + the donor's margin `C₀ − 2/3 ≈ 0.0058`; likewise `5/6 < C1Lam`
  at margin 0.0029) — so the λ-neighborhood family clears the 2/3- and 5/6-class
  landing constants of dossier 42's consumers.
- **L4 (regression).** λ = 1 re-derivation of the donor's four challenge/numeric
  endpoints from L2 + L3(i) — bit-for-bit constants (the anchor proof that the family
  extends, not replaces, the frozen layer).
- **Numerics caveat (recorded, not solved):** the donor's rational alternating-series
  route ((1/√2)² = 1/2 exactly — `Numeric/MontgomeryTaylor.lean` header) does NOT
  scale to general λ. Route (a) deliberately avoids per-λ numerics: continuity +
  the λ = 1 margin deliver the family constants. Sublattice remark for the record:
  λ with (1/(√2·λ))² ∈ ℚ (λ = 1/√(2q), q ∈ ℚ₊) admits the same series trick if a
  closed-form C(λ) is ever wanted exactly.

## 2. Milestone sequencing

- **P0 — probe on the V2 pin (1–2 Modal runs, statement-level only).** Elaborate a
  probe inside the built V2 tree (M4b2 recipe): `#check @` + `#print axioms` of the
  λ-generic surface (`simpleOnLineCount_lower`, `distinctZeroCount_lower`,
  `IsAdmissible`, the `unweightedKernelSum` bound layer); PIN: (a) the exact
  hypotheses/range of the transfer endpoints; (b) whether the Landau/pair-correlation
  side (`Landau/*`, `PairCorrelation/*`) is η-generic or MT-frozen — **the load-bearing
  P0 question**: route (a) needs the kernel-sum bound to run at scaled kernels, at
  least via a scaling-covariance lemma; (c) the functional's definition site for L1.
- **P1 — λ-abstract statement port (binder-shaped, GREEN on donor + mathlib only).**
  The `ZZLam` file: L0 + L1 defs + L2 statements with the kernel-sum side as ONE
  explicit binder (`hKS_lam : <the kernel-sum bound at kernelLam lam>` — the
  donor's own λ-generic transfer consumes it), so the file lands GREEN without any
  new analysis. Regression L4 at binder level.
- **P2 — glue route proof.** L3(i) glue + L3(ii) continuity + L3(iii) margin; then
  the binder discharge for `lam` near 1 IF P0(b) says the kernel-sum bound scales —
  else honestly stop at "family conditional on hKS_lam" and record.
- **P3 — audit + record.** Full-coverage axcheck incl. donor names; logs with
  provenance headers; dossier/STATUS routed through the orchestrator (A9).

## 3. Substrate notes

V2 is a BUILT donor (G2 green; my M4b2 precedent = the GREEN reference run for
full-tree donor consumption). Reuse the M4b2 recipe verbatim: new app
`crossmath-pilot-zzv2-lam` (copy `research/pilots/42/run_m4b2.py`; tarball =
ZetaZerosV2 + PrimeNumberTheoremAnd minus .git/.lake; PNT+ lakefile path-redirect;
`lake update` → mathlib `ff2494ea`; `lake exe cache get`; `lake build ZetaZeros`;
consumer `lake env lean` on staged files; error contexts incl. `error(<code>)` forms;
consumer-side `#print axioms` of donor names). **elan mirror: the image fetch line
MUST use `leanprover/elan` (v4.2.4), NOT the dead `leanprover-community/elan` URL**
(A1's landmine find 2026-11-14 — all current runners already carry the mirror; a
copied runner must keep it). Budget: ≈ 15–20 min per run (the V2+PNT+ build ≈ 8.2k
jobs with cached mathlib oleans; elaboration of ≤ 500 LoC consumer files on top).

## 4. Novelty posture (formalization-first — A5's triage, binding)

Per `novelty/iter4-seed-triage.md` row 2: the statement family is KNOWN-INFORMAL —
**Lamzouri's λ-dependence IS the paper's content; the novelty is the Lean λ-layer,
not the theorem.** Label like pilot 73's "the math is 25 years old". NEVER phrase as
new mathematics; MUST-CITE: Lamzouri (the donor README's source, "Lamzouri's new
proof that more than 2/3 … plus the three further proportions"; donor's own
Montgomery ICM-1974 citation for the MT constant) as the entire informal content.
Corpus-collision: NONE (V2 challenge layer frozen at λ = 1 in-corpus; no other corpus
exposes the family — survey §2(c)). Any article/dossier text routes through A5's
rewording discipline before it lands anywhere public.

## 5. Overrun guards

P0 ≤ 2 runs (statement facts only). P1 ≤ ~300 LoC, binder-shaped, GREEN on
donor+mathlib statements alone. P2 ≤ ~400 LoC (glue + continuity + margin); **if P0(b)
finds the Landau/kernel-sum layer MT-frozen, STOP after P1 GREEN + diagnose-note** —
the λ-family then needs a Landau η-port, which is a charter decision, not a scope
creep. No folding-in of: the C₂ closed-form derivation beyond regression, the
A-parameter (1 ≤ A < 2) generalization, or per-λ numeric endpoints (§1 caveat).
Total estimate M− if P0(b) is favorable, S if route (a) closes at the glue layer.

## 6. Status

PROPOSAL — [CHARTER-PENDING] at head, nothing executed, no files staged beyond this
prework. Trigger: the iteration-4 charter's slot-3 assignment. File ownership: this
prework = A3; the future pilot directory `research/pilots/zzv2-lam/` (runner + .lean
files + logs) per the standard lane conventions.
