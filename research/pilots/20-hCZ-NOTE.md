# hCZ provability assessment — the common-zero seam of pilot 20

Lane R5 (ant-bridge), 2026-11-09. Companion: `research/pilots/20-blueprint.md`
§3 (hCZ design), `research/pilots/20/M1.lean` §6 (`CommonZeroControl`,
`SharedMass`, `merged_mult_of_common`, `family_merge`), dossier 20 § Pilot
outcome. This note is the NT cluster's open-problems centerpiece for the
final report. Conventions: window (T, 2T], counts with multiplicity unless
subscripted; N_ζ, N_χ the component dyadic counts, N = N^{ζ_K} = N_ζ + N_χ
(pointwise, proved in 42-M1/20-M1); "shared" = zero of BOTH ζ and L(χ_D).
Tags: [VERIFIED] (in-corpus, cited), [CLASSICAL] (standard literature,
citation precision recorded for future literature check (novelty lane retired 2026-11-09)), [HYPOTHESIS].

## 0. The statement under assessment

`CommonZeroControl zζ zχ` (M1.lean): ∀ η > 0, ∃ T₀, ∀ T ≥ T₀,
`SharedMass(T) ≤ η · N(T)`, where `SharedMass(T) = Σ_{ρ on-line, window}
min (m_ζ ρ, m_χ ρ)`. Two graded weakenings used below:
- **hCZ-distinct**: #{ρ shared, on-line, window} = o(N) (mass ≥ distinct
  count); strictly weaker.
- **S₁ = o(N)**: #{ρ shared on-line with m_ζ = m_χ = 1} = o(N)
  (simple-simple shared); weaker still.

## (a) Candidate discharge routes

### Route A — component simplicity/distinctness proportions + union bookkeeping
[VERIFIED inputs: zeta23 Theorems B/C and E-analogues, `Challenge.lean:131–229`;
Knausgård relaxed-window (R8's mapping) improves constants, not the shape.]

Decompose SharedMass into shared-simple and shared-multiple parts:

    SharedMass(T) = S₁(T) + Σ_{ρ shared on-line} (min(m_ζ, m_χ) − 1)

and bound the second term by each component's multiplicity excess
(min(m_ζ,m_χ) − 1 ≤ (m_ζ − 1) pointwise):

    Σ (min − 1) ≤ Σ_all (m_ζ − 1) = N_ζ − N_d(ζ) ≤ (1/6 + ε)·N_ζ

by Theorem C ≥ 5/6-distinct [VERIFIED, `five_sixths_distinct`,
`Challenge.lean`], and likewise for χ. Hence, explicitly:

    **SharedMass(T) ≤ S₁(T) + (1/6 + ε)·(N_ζ + N_χ) = S₁(T) + (1/6 + ε)·N.**

So hCZ(η) for every η > 1/6 follows with NO further input; and hCZ(η) for
arbitrarily small η is *equivalent* (given Theorem C for both components) to
**S₁ = o(N)**. The union-bound bookkeeping therefore reduces hCZ exactly to
the simple-simple shared count — and S₁ is *invisible to every per-function
statistic*: a common simple zero is simple in ζ's count and simple in χ's
count; no proportion statement about ζ alone or χ alone constrains it. (The
natural next hope — run distinctness for the MERGED function — is circular:
N_d(ζ_K) = N_d(ζ) + N_d(χ) − #shared-distinct, so a 5/6-distinct theorem for
ζ_K is *equivalent to* hCZ-distinct + component distinctness; it is the
output we want, not an input.) **Route A verdict: reduces hCZ to S₁ = o(N);
cannot go further.**

### Route B — classical zero-density overlap (N(σ, T) bounds)
[CLASSICAL — Huxley/Ingham-type N(σ,T) ≪ T^{A(1−σ)} log^C T; exact citations
recorded for future literature check.]

Shared zeros with Re ρ ≥ σ are bounded by the min of the two densities:
#shared{Re ≥ σ} ≪ T^{A(1−σ)}. With A = 12/5 (Huxley [CLASSICAL]), this is
o(T) — hence o(N) — whenever (12/5)(1−σ) < 1, i.e. **σ > 7/12**. Ingham's
A = 3/(2−σ) gives the same threshold family. Conclusion: shared mass in the
right part of the strip (Re > 7/12 + δ, any δ > 0) is provably o(N).
But the bulk of zeros — and of SharedMass as we defined it (the on-line
window Re = 1/2) — sits exactly where density theorems are vacuous
(N(1/2, T) ≍ N(T): full density). **Route B verdict: discharges the
off-line-right part of any strip-version of hCZ; says nothing about the
on-line SharedMass.**

### Route C — the common-zero literature (Li 2012; Garunkštis–Kalpokas)
[Queries recorded for future literature check; novelty lane retired 2026-11-09 — not verifiable in-corpus; the task brief names these
as the common-zero results. Recorded queries: "Li common zeros zeta Dirichlet
L-functions 2012"; "Garunkštis Kalpokas common zeros"; MathSciNet/zbMATH
scans; also Gonek's heuristic work on common zeros, and Bombieri–Hejhal
multiplicity heuristics for the independent-zeros model.]

What each would need to give, by trichotomy:
1. **Finiteness of common nontrivial zeros of ζ and L(χ_D)** (for each fixed
   χ_D) ⇒ SharedMass = O(1) ⇒ hCZ trivially. Status [HYPOTHESIS]: no such
   theorem is known to us for the full (ζ, χ) pair family; finiteness for
   one fixed pair would already suffice for that field's instance.
2. **Density-zero shared ordinates** ⇒ hCZ directly.
3. **Results for special classes** (e.g. common zeros at special points,
   or for finitely many test functions) ⇒ insufficient unless they cover
   exactly the (ζ, χ_D) on-line windows.
My [HYPOTHESIS] on what these papers actually give: structural/conditional
statements about common zeros of L-functions under GRH-type hypotheses, not
unconditional density-zero — but this MUST be verified before the report
claims either way.

### Route D — heuristics (why everyone believes hCZ)
Under GRH, the on-line zero ordinates of ζ and of L(χ_D) behave like two
"independent" point processes of intensity ~ c·log T. Exact coincidence of
two continuously-distributed points has heuristic probability zero, so the
expected number of common zeros is **zero** — the folk position is that
SharedMass is eventually 0, far stronger than hCZ. No formal consequence of
GRH, of simplicity conjectures, or of any GUE-type statistic is known to
imply even hCZ-distinct. Epistemic grade: **folklore/conjecture-grade**
(standard independent-zeros heuristic, cf. Gonek's conjectures [CLASSICAL,
citation queued]).

## (b) Verdict

**hCZ is NOT provable today** from any combination of in-corpus and
classical results:

- Route A (proved reduction): hCZ ⟺ S₁ = o(N) modulo Theorem C — and S₁ is
  untouched by every available proportion theorem (they are per-function;
  S₁ is a cross-function coincidence count).
- Route B proves only the Re > 7/12 + δ slice.
- Route C is unverified and, on my best reading, not of the required
  unconditional strength; queries recorded for future literature check as a
  possible (but unlikely) upgrade.
- Meta-obstruction: hCZ-distinct for (ζ, χ_D) implies "multiple zeros of
  ζ_K are density-zero" (shared ⇒ multiple for the product, by
  `merged_mult_of_common` [VERIFIED, M1.lean]); before zeta23, the
  density-zero-multiplicity statement was open even for ζ itself, and
  zeta23's method does not lift through a factorization — that is precisely
  the seam this note documents.

**Weakest sufficient statement**: S₁ = o(N) (simple-simple on-line shared
count density-zero). Epistemic status: conjecture-grade folklore — implied
by the independent-zeros heuristic (which predicts S₁ = 0 eventually),
strictly weaker than "ζ and L(χ_D) share no nontrivial zeros", incomparable
with GRH and with all-simplicity. An intermediate, possibly-tractable
target for M3: hCZ at level η = 1/6 + ε is available TODAY (Route A's
inequality) — worth noting: a C_D-controlled engine upgrade only needs the
gap between 1/6 and the target η.

Consequence for pilot 20's plan: M2 (discharge programme) proceeds with hCZ
as a named hypothesis of the engine instantiation — the conditional core
(M1) already separates it cleanly — and ζ_K proportions do NOT become
unconditional beyond the with-multiplicity 2/3 (below) via hCZ.

## (c) Why family_merge still delivers 2/3 today — and what it cannot

`family_merge`/`two_thirds_of_components` [VERIFIED, M1.lean] lift the
*additive* proportion statements through the factorization with no shared
control, because with-multiplicity counts add pointwise
(`count_add`, `countOn_add`). The additive family is exactly the
**a-fortiori** forms: on-line-with-multiplicity vs total. With zeta23's
`thmA₀_N0` (`Zeta23/Final.lean:356`: (2/3 − ε)N ≤ N0, ζ) and the Dirichlet
analogue (one line from `thmE_A` + `N0star ≤ N0` in `trivial_chain`,
`Zeta23/Statement.lean:157`), pilot 42's assembly yields unconditionally:
**N0^{ζ_K}(T,2T) ≥ (2/3 − ε)·N^{ζ_K}(T,2T)** — existence is settled by V1.
But every *distinct*- or *simple*-numerator statement degrades by shared
points: N_d(ζ_K) = N_d(ζ) + N_d(χ) − #shared-distinct;
N0simple(ζ_K) loses every shared simple zero (it is merged-multiple, by
`merged_mult_of_common`). So the engine+hCZ route is not about existence of
a 2/3 statement — it is the only route to the A-distinct shape, the B-shape
(simple), the C-shape (5/6-distinct), and the Montgomery–Taylor window
constants for ζ_K, all of which are currently out of reach of BOTH routes
and wait on S₁ = o(N) or a direct engine discharge.

## Summary table

| route | gives | misses |
|---|---|---|
| A: proportions + bookkeeping (proved reduction) | SharedMass ≤ S₁ + (1/6+ε)N | S₁ = o(N) itself |
| B: N(σ,T) density | shared mass with Re > 7/12+δ is o(N) | the on-line window entirely |
| C: Li-2012 / Garunkštis–Kalpokas | [recorded for future literature check; lane retired] | verification + likely strength |
| D: independent-zeros heuristic | S₁ = 0 eventually (folklore) | any unconditional proof |
| **verdict** | **hCZ not provable today; weakest form S₁ = o(N), conjecture-grade** | |

## Erratum (2026-11-09 resume session, append-only) — Route A is a necessity reduction, not an equivalence

Route A's bound `SharedMass(T) ≤ S₁(T) + (1/6 + ε)·N` is correct, but the sentence
"hCZ(η) for arbitrarily small η is *equivalent* (given Theorem C) to S₁ = o(N)" — and the
verdict line "weakest sufficient statement: S₁ = o(N)" — overstate it. The bound controls the
shared-multiple part `Σ_shared (min(m_ζ, m_χ) − 1)` only at level (1/6 + ε)·N, never o(N).
Correct statements:
- **Necessity:** hCZ ⇒ S₁ = o(N) (since S₁ ≤ SharedMass); likewise hCZ-distinct ⇒ S₁ = o(N).
- **Sufficiency:** S₁ = o(N) **and** density-zero multiple zeros for ζ and for L(χ_D) (i.e.
  Σ(m − 1) = o(N) for each factor) ⇒ hCZ. The second input is open even for ζ alone
  (it follows from RH + Montgomery's pair-correlation conjecture, not from any proved
  proportion theorem).
- **Unconditional today:** hCZ(η) for every η > 1/6 (Route A, unchanged).
The verdict "hCZ not provable today; conjecture-grade" stands; "weakest form S₁ = o(N)" should
read "necessary weak form S₁ = o(N); sufficient with density-zero multiplicity of both factors".
Consumers corrected in the same session: `research/articles/20-*.md`, `research/articles/42-*.md`,
`research/REPORT.md` §1.
