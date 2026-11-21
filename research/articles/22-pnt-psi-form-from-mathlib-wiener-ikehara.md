# The Prime Number Theorem in ψ-Form, Assembled from Mathlib's Own Wiener–Ikehara Theorem

*kind: TECHNICAL-RECORD (formalization/assembly record, honestly labeled — relabel row 22
of `qa/iter4-review/r2-discovery-strength.md` §7.1: "formalization, honestly labeled —
the template", proposed in that file's "Part B — restructuring package (orchestrator
queue, 2026-11-16)" and carried out as this v2 at the iteration-4 close, 2026-11-17:
the README row updated to the same kind and the v2 checked against the template gate in
row 22 of `qa/iter4-review/a9-corpus-compliance.md`) · date: 2026-11-09 (v2 2026-11-17:
template upgrade + closure-note relocation to dossier [the project's per-topic candidate
record] 22; v3 2026-11-21: M1 re-scoped per external review — theorems untouched) ·
supersedes: the v1 text of
this same file (in place; change log below) · artifacts: `research/pilots/22/Tier1.lean`
(290 lines, 4 theorems), `research/pilots/22/M1.lean` (68 lines, M1's first home),
`research/pilots/22/logs/axcheck-final.log`,
`research/pilots/22/logs/axcheck-c2-final.log`; dossier
`research/candidates/22-quasi-rh-pnt-effective.md`; blueprint
`research/pilots/22-blueprint.md`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| M1 `exists_tendsto_riemannZeta_sub_inv` | PROVED-UNCONDITIONAL | none | `pilots/22/logs/axcheck-final.log:496` — `[propext, Classical.choice, Quot.sound]` (M1-file print `:450`); stage `axcheck-c2-final.log:3` (2 axiom lines, 0 sorryAx) |
| M2 `exists_logDerivExtension` | PROVED-UNCONDITIONAL | none | `axcheck-final.log:497` — triad [the axiom list `propext, Classical.choice, Quot.sound`, as printed in M1's row]; stage `axcheck-c2-final.log:5` (8 axiom lines, 0 sorryAx) |
| M3 `exists_range_sum_vonMangoldt_le` | PROVED-UNCONDITIONAL | none | `axcheck-final.log:498` — triad; stage `:5` |
| M4 (PNT, ψ-form) `tendsto_psi_div_atTop` | PROVED-UNCONDITIONAL | none | `axcheck-final.log:499` — triad; stage `:5` |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; no `sorry`, no `native_decide`, no
external CAS; kernel verification only.

Change log (2026-11-17, lane A3 — v2 in place, theorems untouched): (1) front matter
and per-theorem status rows in the closed vocabulary replace the v1 house status line;
(2) the v1 §4 prior-work prose becomes the §4 nearest-miss table; (3) the v1 §3
verification prose (run trail, fix-cycle counts, wall-time figures) is replaced by the
§6 formal-record table only — infrastructure narration removed per the template (the
effort data point lives in dossier 22); (4) the v1 append-only "Cycle-2 closure note"
(T2b closed by upstream) is RELOCATED to dossier 22, its already-declared destination —
the article now carries one integrated line in §7 instead of an addendum; (5) the §5
open-directions list is folded into §7 with the upstream-statement probe status added.
No mathematical content changed: M1–M4 and all proofs are v1-verbatim.

Revision (2026-11-21, external-referee disposition): the novelty framing is corrected —
mathlib's `tendsto_riemannZeta_sub_one_div` (`ZetaAsymp.lean:343`, same pin) is cited as
proving M1's limit more sharply, so the supplied-link count drops from three to two and
M1 is presented as a corollary; the §4 table gains the corresponding nearest-miss row;
the PNTAnd row discloses that mathlib's `WienerIkehara.lean` is adapted from that
project; §6 is table-only with the stage/probe notes moved to the status table and §8;
the shipping-surface count is corrected to 290 lines. No theorem statement or proof
changed; all log citations unchanged and re-verified.

## Abstract

mathlib at `ff2494ea` has a Wiener–Ikehara theorem
(`Mathlib/NumberTheory/LSeries/WienerIkehara.lean`), the identity L(Λ, s) = −ζ'(s)/ζ(s)
on Re s > 1, non-vanishing of ζ on Re s ≥ 1, and Chebyshev's bounds — but no Prime
Number Theorem and no consumer of its Wiener–Ikehara theorem. Two missing links,
supplied here, give **Theorem M4**: ψ(x)/x → 1 as x → ∞, where ψ(x) = Σ_{n ≤ x} Λ(n)
is Chebyshev's function (M4 below; PROVED-UNCONDITIONAL). The links are **M2**, a
continuous extension of −ζ'/ζ − 1/(s − 1) to Re s ≥ 1, and **M3**, the bound
Σ_{n<N} Λ(n) ≤ (log 4 + 4)·N — both PROVED-UNCONDITIONAL. The third pilot theorem,
M1 (existence of ζ's Laurent constant term at s = 1), is not one: mathlib here already
proves the sharper limit, with the Euler–Mascheroni constant
(`tendsto_riemannZeta_sub_one_div`, `ZetaAsymp.lean:343`), and M4's proof does not use
it. This is a formalization result, not new mathematics: ψ(x) ~ x is the classical
Prime Number Theorem. The contribution, scoped to the surveyed corpora: the first
consumer of mathlib's own Wiener–Ikehara theorem, at 290 lines. Nearest prior work:
Eberl–Paulson's Isabelle proof and the Lean PrimeNumberTheoremAnd project, whose
Wiener–Ikehara file mathlib's is adapted from; we claim priority over neither.

## 1. Introduction

mathlib at `ff2494ea` has all the hard analytic ingredients of the Prime Number Theorem
but never assembles them: the Wiener–Ikehara theorem is proved with no consumer, and
the L-series/von-Mangoldt/zero-free pieces sit unconnected in separate files. This
article records the assembly. **Honesty.** ψ(x) ~ x is the classical Prime Number
Theorem (Hadamard, de la Vallée Poussin 1896); the Wiener–Ikehara route is classical
(Ikehara 1931). Nothing here is new mathematics; the record's value is the
first-consumer fact and the small surface needed to connect mathlib's own pieces. The
work was deliberately stopped at M4: upstream efforts were converging when this
assembly was produced, and no priority is claimed over them (§4).

## 2. Setting

Let Λ be the von Mangoldt function and ψ(x) = Σ_{n ≤ x} Λ(n) (mathlib `Chebyshev.psi`).
All work is in `research/pilots/22/Tier1.lean` (with M1's first home `M1.lean`),
importing only Mathlib on `ff2494ea`, Lean v4.36.0-rc2.

## 3. Main results

**M1.** ∃ c ∈ ℂ, ζ(s) − 1/(s − 1) → c as s → 1, s ≠ 1. Not a missing link: mathlib at
`ff2494ea` already proves this limit with the sharper constant c = γ
(`tendsto_riemannZeta_sub_one_div`, `Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:343`);
the pilot's independent re-proof (`Tier1.lean:40`, first home `M1.lean`) is kept because
its construction — the analytic extension of (s − 1)·ζ(s) across s = 1 — is reused
inside M2's proof.

**M2.** ∃ G : ℂ → ℂ continuous on {Re s ≥ 1} with G(s) = −ζ'(s)/ζ(s) − 1/(s − 1) for
Re s > 1.

**M3.** ∃ C, ∀ N ∈ ℕ, Σ_{i<N} Λ(i) ≤ C·N (with C = log 4 + 4).

**M4 (PNT, ψ-form).** ψ(x)/x → 1 as x → ∞.

## 4. Novelty and nearest misses

The claim, scoped: mathlib at `ff2494ea` contains no Prime Number Theorem and its
Wiener–Ikehara theorem has no consumer; this record is the first consumer, in the
surveyed corpora (mathlib @ `ff2494ea`; the project's Cycle-2 survey of sibling
corpora). No priority is claimed over any row below.

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| Hadamard; de la Vallée Poussin (1896) — classical | the Prime Number Theorem | the mathematics itself; this record only assembles it inside mathlib |
| S. Ikehara, J. Math. Phys. 10 (1931); N. Wiener, Ann. of Math. 33 (1932) | the Tauberian theorem carrying the route | the method's origin; mathlib's own `WienerIkehara.lean` is its formal descendant, previously unconsumed |
| M. Eberl–L. C. Paulson, Isabelle/HOL (PsL: `Prime_Number_Theorem`) | a full formal PNT in another proof assistant | different library; mathlib's Wiener–Ikehara stays unconsumed there, and this record's point is specifically what mathlib already contains |
| `AlexKontorovich/PrimeNumberTheoremAnd` (Lean, upstream; StrongPNT @ `938912bb`) and the IEANTN effort | PNT and stronger effective forms in Lean, outside mathlib | independent Lean routes, not consumers of mathlib's Wiener–Ikehara — but mathlib's own `WienerIkehara.lean` is adapted from this project (its header credits The PrimeNumberTheoremAnd contributors, `WienerIkehara.lean:2`, and says so, `:52`), so the first-consumer claim concerns mathlib's copy, not the method's origin; the AxiomMath fork surveyed in this project amputates StrongPNT (closure record: `research/candidates/22-quasi-rh-pnt-effective.md`) |
| mathlib `tendsto_riemannZeta_sub_one_div` (`Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:343`, @ `ff2494ea`) | ζ(s) − 1/(s−1) → γ as s → 1, s ≠ 1 — M1's limit, with the sharper constant | M1 itself is a corollary of this lemma; M1 is not used in the M4 proof, which consumes only M2 and M3 |
| mathlib PRs #41394, #44062, #43238 (Mertens/weak-PNT line, open at survey time) | incremental PNT-adjacent content in mathlib itself | not yet a PNT at `ff2494ea`; this record's M4 fills the gap at this revision without waiting for them |

## 5. Proofs

**M1.** F(s) = (s − 1)ζ(s) is differentiable on a punctured neighbourhood of 1 and tends
to the residue 1 (mathlib `riemannZeta_residue_one`, `RiemannZeta.lean:242`), so it
extends analytically across s = 1 by the removable-singularity theorem; the constant
term is F'(1). mathlib proves a sharper version at the pin:
`tendsto_riemannZeta_sub_one_div` (`ZetaAsymp.lean:343`) evaluates the same limit to γ
by this route and implies M1 directly; the pilot's re-proof exists to supply the
construction M2 uses.

**M2.** Let h be the analytic extension of F with h(1) = 1. On Re s ≥ 1, s ≠ 1, ζ(s) ≠ 0
(mathlib `riemannZeta_ne_zero_of_one_le_re`), so h has no zeros on the closed half-plane
and −ζ'/ζ − 1/(s − 1) = −h'(s)/h(s), which is continuous on Re s ≥ 1, including s = 1.

**M3.** ψ(N) ≤ (log 4 + 4)·N from `Chebyshev.psi_le_const_mul_self` (`Chebyshev.lean:485`),
transported to range-sums by `psi_eq_sum_Icc` (`Chebyshev.lean:93`).

**M4.** `WienerIkehara.tendsto_sum_range_div` (`WienerIkehara.lean:693`) applies to a
nonnegative arithmetic function f whose L-series equals A/(s − 1) + G(s) on Re s > 1
with G continuous on Re s ≥ 1 and whose partial sums are O(N); with f = Λ, A = 1,
`LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (`Dirichlet.lean:439`), M2 and M3 it
gives (1/N)Σ_{n<N} Λ(n) → 1, and the passage to real x is a floor argument. ∎

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| M1 | `CrossMath.Pilot22.exists_tendsto_riemannZeta_sub_inv` | `pilots/22/Tier1.lean:40` (first home `pilots/22/M1.lean:28`) | `[propext, Classical.choice, Quot.sound]` | `pilots/22/logs/axcheck-final.log:496` (M1-file print `:450`; stage `axcheck-c2-final.log:3`) |
| M2 | `CrossMath.Pilot22.exists_logDerivExtension` | `pilots/22/Tier1.lean:77` | `[propext, Classical.choice, Quot.sound]` | `pilots/22/logs/axcheck-final.log:497` |
| M3 | `CrossMath.Pilot22.exists_range_sum_vonMangoldt_le` | `pilots/22/Tier1.lean:192` | `[propext, Classical.choice, Quot.sound]` | `pilots/22/logs/axcheck-final.log:498` |
| M4 | `CrossMath.Pilot22.tendsto_psi_div_atTop` | `pilots/22/Tier1.lean:221` | `[propext, Classical.choice, Quot.sound]` | `pilots/22/logs/axcheck-final.log:499` |

## 7. Limitations and open problems

1. **No new mathematics.** M4 is the classical PNT; the record's content is the
   assembly and the first-consumer fact (§4). Of the four pilot theorems, M1 re-proves
   mathlib content (a corollary of `tendsto_riemannZeta_sub_one_div`, §3); only M2 and
   M3 are missing links, and only M2–M4 enter the PNT assembly.
2. **The quasi-RH effective form** (|ψ(x) − x| ≤ C·x^{7/8+ε}, conditional on openai's
   quasi-RH band and a Perron formula): elaborates as a statement only; not attempted
   as a proof here.
3. **The classical-strength effective form** (|ψ(x) − x| ≤ C·x·exp(−c√(log x))):
   closed by upstream — `AlexKontorovich/PrimeNumberTheoremAnd` @ `938912bb` proves
   `StrongPNT` (upstream `StrongPNT.lean:2900–2905`, inline axiom check triad at
   `:2906–2908`). Neither the theorem nor the claim is ours; the full closure record,
   including the AxiomMath fork's amputation of StrongPNT, is in the closure section
   of `research/candidates/22-quasi-rh-pnt-effective.md`.
4. **The upstream StrongPNT statement class on our pin**: a hypothesis-binder port of
   the upstream statement elaborates on mathlib `ff2494ea` with zero errors
   (statement-only check with two declared stubs [probe-convention: a Lean file that
   typechecks a statement without proving it];
   `feasibility/probe/logs-g/run37-g9-fix.log:30`) — statement-elaboration evidence,
   not a result of this project.
5. **Immediate corollaries not formalized here**: M5 θ(x)/x → 1 from M4 and
   `isBigO_psi_sub_theta_sqrt` (`Chebyshev.lean:639`); M6 π(x)·log x / x → 1 via
   `primeCounting_eq_theta_div_log_add_integral` (`:668`) and
   `integral_theta_div_log_sq_isBigO` (`:791`). Both are one-step records if wanted;
   neither is claimed.

## 8. Prior work and references

**Literature.** J. Hadamard (1896); Ch. de la Vallée Poussin (1896). S. Ikehara,
J. Math. Phys. 10 (1931). N. Wiener, Ann. of Math. 33 (1932). M. Eberl–L. C. Paulson,
a formal PNT in Isabelle/HOL.

**Formal corpora (surveyed).** mathlib `Mathlib/NumberTheory/LSeries/{WienerIkehara,
Dirichlet,Nonvanishing,RiemannZeta}.lean`, `Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean`,
`Mathlib/NumberTheory/Chebyshev.lean`
(@ `ff2494ea`); the upstream `AlexKontorovich/PrimeNumberTheoremAnd` repository
(`StrongPNT.lean:2900–2908` @ `938912bb`); its AxiomMath fork (StrongPNT amputated);
the IEANTN effort; mathlib PRs #41394, #44062, #43238.

**Project artifacts.** `research/candidates/22-quasi-rh-pnt-effective.md`
(incl. the relocated closure record and the empirical effort data point);
blueprint `research/pilots/22-blueprint.md`; Lean `research/pilots/22/{M1,Tier1}.lean`;
logs `research/pilots/22/logs/` (the stage extract `axcheck-c2-final.log` covers both
pilot files: `AxPilot22_M1` and `AxPilot22_Tier1`, each 0 sorryAx); the statement probe
`research/pilots/22/ProbeP1_PNT.lean` (carries no theorems; never cited as a result);
the upstream-statement probe
`research/feasibility/probe/ProbeG9_StrongPNT.lean` +
`research/feasibility/probe/logs-g/run37-g9-fix.log`.
