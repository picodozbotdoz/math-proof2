# Dossier-73 upgrade note — Q4 GREEN: the hRat discharge landed (2026-11-17)

Lane A2 (pilot-execution), per the GO memo `pilots/73/Q4-gate-memo.md` §2 item 2 and
the r5 backlog §13 outcome fork (cap-N = 1 FINAL — dossier upgrade note, no article).
Evidence: `pilots/73/logs/q4-run15-green.log` (Q4.lean rc=0, 0 errors, 0
sorry-warnings; all 22 theorems triad-only `[propext, Classical.choice, Quot.sound]`,
0 sorryAx; C.lean frozen-layer regression OK in every one of the 15 runs).
Verification table: `qa/iter4-review/r3-verification-tables.md` §10.7.

**The upgrade.** R2 had demoted the 73 record to "dossier/pilot record until Q4
(`hRat` discharge) lands" (`qa/iter4-review/r2-discovery-strength.md` §4 item 3).
Q4 lands it: `heckeSeriesT_rational_of_periodicity`
(`pilots/73/Q4.lean:511`) proves, unconditionally and mathlib-only, that every
𝔽_q[T] ray-class character of modulus `span M` (`M` monic, `1 ≤ deg M`) has Hecke
series rational of shape `P₁/(1 − qT)` — the hRat witness produced EXPLICITLY
(`P₀ = 1 − qT` with `P₀.eval 0 = 1 ≠ 0`, `P₁` the degree-≤-deg-`M` truncation) by
residue-class periodicity on k[X] (each class contributing its `q^{n−deg M}` monic
multiples uniformly, `sum_apply_span_eq_of_degree_le`). Its consumer
`hecke_continuation_unconditional` (`Q4.lean:548`) feeds that witness into C.lean's
GREEN `hecke_continuation`, so the meromorphic-continuation clause of **(P)(i) is
now UNCONDITIONAL for the 𝔽_q(T) probe class** — the first formal Tate-type
statement with discharged rationality, FF scope — converting the pilot's honest
posture from "(i) unconditional + (ii) conditional" to "(i) unconditional BY
CONSTRUCTION at the probe, (ii) conditional everywhere". The record accordingly
upgrades from "dossier/pilot record" to a **formalization-first technical record
with one strengthened claim**; under the FINAL two-strike rule the single N-slot,
if spent at all, belongs to a stronger candidate, so the outcome is this note, not
an article.

**What is NOT claimed (the fences hold).** `hPur` was never touched and never will
be at this tier: it stays a binder in every statement the pilot touches (C.lean's
`hecke_window`; prework §2.4's honesty correction — for 𝔽_q[T] characters it is the
RH for the Kummer covers y^ℓ ≃ f of ℙ¹, Weil II depth, not Gauss-sum-elementary),
so (P)(ii) remains conditional everywhere including the probe. No functional
equation, root numbers, or Gauss sums; no general curves; no sheaves; no
proportions (gate memo §3, verbatim discipline maintained). The modulus hypotheses
(`M.Monic`, `1 ≤ M.natDegree`) fence out the degenerate `span M = ⊤` (trivial
character) case explicitly rather than silently assuming it — recorded in the Q4.lean
header.

**Provenance pin.** The informal-mathematics citation backing the periodicity
argument remains Rosen, *Number Theory in Function Fields* (GTM 210), **chapter 8**,
carried as a PROVISIONAL pin per the gate memo §4 and the C2 record
(`REPORT-INPUTS-C2.md` :127–:130; the exact-chapter pin was already owed to A5's
dossier-level re-run). The Lean content is self-contained and the GO did not wait
on the lookup; per the HKT-precedent convention the one-lookup verification
(zbMATH/library) is due at THIS write-up and remains the single open item on this
note — flag carried forward to the dossier-73 record until A5/H confirms the
chapter number.

— end note (A2; Q4-GREEN 2026-11-17, `q4-run15-green.log`)
