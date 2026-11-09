# Critical-Line Zero Proportions for Quadratic Dedekind Zeta Functions by Certified Assembly

*cross-math-fronttier research article 42 · 2026-11-09 · dossier
`research/candidates/42-zeta-k-two-thirds-product-assembly.md` · Lean pilot
`research/pilots/42/` (M1, M2a, M3, M2b) · blueprint `research/pilots/42-blueprint.md`*

**Status: PROVED, certificate-conditional** — kernel-verified (mathlib `ff2494ea`, Lean
`v4.36.0-rc2`; the three landed theorems have exactly `[propext, Classical.choice,
Quot.sound]`; no `sorry`, no `native_decide`, no external CAS inside Lean). The theorems are
stated with explicit hypothesis binders for donor results proved in other Lean developments
(§5). This is the project's #1 Phase-4 pick (`research/TRIAGE.md` §Top-3).

---

## Abstract

For a quadratic field K with fundamental discriminant D, the Dedekind zeta function factors
as ζ_K(s) = ζ(s)·L(s, χ_D). We show that zero-proportion theorems for ζ_K follow from
proportion theorems for the two factors by an exact counting algebra, and we formalize the
whole passage. With N_K(T) the number of nontrivial zeros of ζ_K with 0 < Im ρ ≤ T counted with
multiplicity, we obtain: (i) at least 2/3 of them, with multiplicity, lie on the critical line
(liminf N_K^on/N_K ≥ 2/3); (ii) the *distinct* on-line zeros together with the common
on-line zeros of ζ and L(χ_D) account for at least 5/6 of N_K; (iii) if the common zeros are
negligible (a hypothesis we isolate as hCZ), at least 5/6 of the zeros of ζ_K are distinct
and on the line. The ζ-side input is consumed from K. Knausgård's clean Lean layer (constants
0.67354 and 0.83900) through a certificate binder; the L(χ_D)-side input is zeta23's
Theorem E. These are the first formal zero-density statements for a number-field zeta
function, and form (ii) improves the literature's 45%-distinct statement for Dedekind zetas
(de Laat–Rolen–Tripp–Wagner 2019) to the 5/6 class modulo an explicit defect.

## 1. Introduction

The anthropics `zeta23` corpus proves Alpöge–Furman-type statements for ζ and for primitive
Dirichlet L-functions: liminf of the on-line proportion ≥ 2/3, and ≥ 5/6 for distinct zeros
(Theorem E for L). Knausgård (arXiv:2609.33043, arXiv:2610.08965, repo `kristianmk/839`)
improved the ζ constants to 0.67354 (simple, on-line) and 0.83900 (distinct), formally, with
headline theorems that use `native_decide` over a clean `*_of_local` layer whose only
non-standard input is a `LocalInequality` certificate checked externally.

No corpus contains any zero-counting statement for a Dedekind zeta function of a number
field ≠ ℚ. tauceti, however, provides the continuation `dedekindZetaC K` and the identity
ζ_K = ζ·L(χ_D) on Re s > 1 for quadratic K. The bridge (tauceti-contributions C1(ii)) is
therefore: multiplicities add under products, so proportions assemble.

**Honesty.** As mathematics, (i) is corollarical: it follows formally from the factor
theorems plus Euler's factorization, with no new analytic idea. Its content is (a) the exact
counting algebra, including the defect C_D of (ii) — a quantity no corpus or paper studies —
and (b) the first end-to-end formal statement, assembled across three independent Lean
developments under a charter-compliant consumption discipline.

## 2. Setting

For a function f meromorphic on ℂ write mult_f(ρ) = ord_ρ f (as a natural number), and for a
finite-window multiplicity function z define

  N_z(T) = Σ_{0 < Im ρ ≤ T, 0 < Re ρ < 1} z(ρ),  N_z^on(T) = Σ_{… , Re ρ = 1/2} z(ρ),
  N_z^{d,on}(T) = #{ρ on the line in the window with z(ρ) > 0}.

**ε-forms.** `EpsLowerCum z c` means: ∀ ε > 0, eventually (c − ε)·N_z(T) ≤ N_z^on(T);
`EpsLowerDistinctCum z c` likewise with N_z^{d,on}. These are the liminf statements in
division-free form. For two multiplicity functions z, w let C_D(T) = #{ρ on the line in the
window with z(ρ) > 0 and w(ρ) > 0} (common on-line zeros).

## 3. Main results

Let f_K, f_ζ, f_χ be the zeta functions of K, ℚ and L(·, χ_D), with the structural facts
listed in §5 (analytic off s = 1, simple pole at 1, not locally identically zero,
factorization on a half-plane).

**Theorem 1 (counting algebra).** If f_K = f_ζ·f_χ as meromorphic functions then
mult_{f_K} = mult_{f_ζ} + mult_{f_χ} on ℂ \ {1}; consequently N_K = N_ζ + N_χ and
N_K^on = N_ζ^on + N_χ^on (window additivity), and

  N_K^{d,on}(T) + C_D(T) = N_ζ^{d,on}(T) + N_χ^{d,on}(T)   (inclusion–exclusion).

**Theorem 2 (assembly).** If `EpsLowerCum z c` and `EpsLowerCum w c` then
`EpsLowerCum (z + w) c`. If the distinct forms hold with constant c for z and w, then for
every ε > 0, eventually (c − ε)·N_{z+w} ≤ N_{z+w}^{d,on} + C_D.

**Theorem 3 (ζ_K, with multiplicity).** liminf_{T→∞} N_K^on(T)/N_K(T) ≥ 2/3.

**Theorem 4 (ζ_K, distinct with defect).** For every ε > 0, eventually

  (5/6 − ε)·N_K(T) ≤ N_K^{d,on}(T) + C_D(T).

**Theorem 5 (ζ_K, distinct, hCZ-conditional).** If C_D(T) = o(N_K(T)), then at least 5/6 of
the zeros of ζ_K (with multiplicity in the denominator) are distinct and on the line.

The ζ-side constants 0.67354 ≥ 2/3 and 0.83900 ≥ 5/6 are absorbed by monotonicity
(`EpsLowerCum_mono`), so Theorems 3–5 are stated with the round constants shared by the
L(χ_D)-side inputs.

## 4. Proofs

**Theorem 1.** On ℂ \ {1} both sides are analytic and not identically zero near any point,
so orders add: ord(fg) = ord f + ord g (mathlib `analyticOrderNatAt_mul`). The global
identity f_K = f_ζ f_χ is obtained from the half-plane identity by multiplying by (s − 1) to
remove the common pole and applying the identity principle on the connected domain.
Window counts are finite sums of multiplicities over finite supports; additivity of the
summand gives additivity of the sums, and supp(z + w) = supp z ∪ supp w gives
inclusion–exclusion for the distinct counts. ∎

**Theorem 2.** Choose T₀ = max of the two thresholds and add the two inequalities; the
denominator N_{z+w} = N_z + N_w is additive. For the distinct form,
N_z^{d,on} + N_w^{d,on} = N_{z+w}^{d,on} + C_D by Theorem 1. ∎

**Theorems 3–5.** Instantiate Theorem 2 with z = mult_{f_ζ} (Knausgård's 0.67354, resp.
0.83900, absorbed down to 2/3, resp. 5/6) and w = mult_{f_χ} (zeta23 Theorem E, cumulative
form), then transport along Theorem 1. For Theorem 5, apply Theorem 4 with ε/2 and hCZ with
ε/2. A distinct-count numerator is dominated by the with-multiplicity numerator, so every
numerator convention used by the donors is covered a fortiori. ∎

**Why hCZ is the obstruction.** A common zero of ζ and L(χ_D) is a zero of ζ_K of
multiplicity ≥ 2. The certificate method controls multiplicity through a convex penalty, so
a merged multiplicity-2 atom degrades it; no per-function statistic of ζ or of L(χ_D) can
bound C_D. hCZ implies S₁ = o(N) (simple–simple shared zeros negligible), and conversely
hCZ follows from S₁ = o(N) *together with* density-zero multiple zeros for ζ and for
L(χ_D) — the latter open even for ζ alone. Unconditionally only C_D ≤ S₁ + (1/6 + ε)N is
available. hCZ is conjecture-grade today (`research/pilots/20-hCZ-NOTE.md`, with the
erratum appended there in the resume session).

## 5. Formal verification

| item | Lean |
|---|---|
| files | `research/pilots/42/M1.lean` (337 LoC: windows, `multOf`, `ZeroMult`, additivity, ε-forms, `assemble_eps`), `M2a.lean` (612: germ congruence, `funEq_of_factorization`, χ-side `≠ ⊤` discharge, `zetaK_two_thirds_wired`), `M3.lean` (453: distinct counts, `commonOnLine`, inclusion–exclusion, `zetaK_five_sixths_defect`), `M2b.lean` (1,150: cumulative layer, transcribed donor endpoints, landed theorems; self-contained superset) |
| landed theorems | `CrossMath.Pilot42.zetaK_two_thirds_landed` (Thm 3), `zetaK_distinct_five_sixths_landed` (Thm 4), `zetaK_distinct_five_sixths_landed_of_negligible` (Thm 5) |
| axioms | exactly `[propext, Classical.choice, Quot.sound]` (`research/pilots/42/logs/m2b_run6.log`; final sweep `logs/axcheck-final.log`) |

**Binders (the complete list).** `hCert` (Knausgård's `LocalInequality`, an opaque Prop) and
the transcriptions `hK673 : K673OfLayers cert …` / `hK839 : K839OfLocal cert …` of his clean
endpoints `simple_critical_zeros_673_of_layers` and `distinct_zeros_839_of_local`;
`hEχ` / `hEχd` (zeta23 Theorem E, cumulative); the tauceti ported statements (continuation
and analyticity `hK`, `hK1`, `hζ`, `hχ`, `hP1`, the factorization `hfac`, window finiteness
`hfin*`); `hntopχ` (discharged in M2a for the χ side; carried uniformly here) and `hntopζ`
(ζ not locally identically zero — mathlib v4.36 lacks the infinite-ball family lemma; the
path via `IsCompact.inter_riemannZetaZeros_finite` is recorded). Removing a binder by
proving it yields the unconditional statement; nothing else is assumed. Knausgård's
`native_decide` headline theorems are never consumed; his C++/Python certificate checkers
and checksums are cited as external audit artifacts only (the same posture as zeta23's own
`EnclOK`, `PairCeiling/NumericCert.lean:72`).

## 6. Relation to prior work

- **Alpöge–Furman** (arXiv:2608.13637) and the zeta23 corpus: the method and the factor
  theorems for ζ and primitive L(χ).
- **Knausgård** (arXiv:2609.33043, arXiv:2610.08965, `kristianmk/839`): improved ζ
  constants; the constant race is lost to him, and we claim none.
- **de Laat–Rolen–Tripp–Wagner** (arXiv:1908.04876): > 45% distinct zeros for Dedekind zetas
  (SDP method). Theorem 4 places quadratic ζ_K in the 5/6 class modulo C_D; Theorem 3 is the
  first with-multiplicity on-line proportion for ζ_K.
- **Majdoddin** (arXiv:2610.17420, `Majdoddin/formal-math`): a second, independent
  build-out on the anthropics tree; the certificate-binder consumption template used here
  applies to it.

## 7. Limitations and open problems

- Discharging the tauceti binders requires tauceti as a Lake dependency (same toolchain); the
  Knausgård and zeta23 binders require porting v4.33 developments (statement port measured at
  ≈ 0 cost; proofs not ported).
- hCZ is the honest frontier: any unconditional distinct-count statement beyond Theorem 4
  needs control of common zeros of ζ and L(χ_D).
- Extending beyond quadratic fields needs the Artin factorization ζ_K = Π L(ρ) and Theorem E
  for each factor (dossier 20 pursues the engine route instead).

## References

- anthropics_formal-math `zeta23` (`ChallengeDeps.lean` :46–55, `Final.lean`, `Statement.lean`,
  `PairCeiling/NumericCert.lean:72`). K. Knausgård, arXiv:2609.33043, arXiv:2610.08965,
  `github.com/kristianmk/839`. L. Alpöge, A. Furman, arXiv:2608.13637. D. de Laat, L. Rolen,
  Z. Tripp, I. Wagner, arXiv:1908.04876. tauceti `TauCeti/NumberTheory/LFunctions/DedekindZeta/`.
  R. Majdoddin, arXiv:2610.17420.
