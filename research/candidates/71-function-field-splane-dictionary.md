# Candidate dossier 71 — function-field-splane-dictionary

Lane A9 (dossier-writer), Cycle 2, 2026-11-13. Pre-registered as
`71-function-field-simple-zero-proportions.md` (skeleton) the same day; **filled and
RENAMED on A2's bridge landing** (`research/bridges/function-field.md` v1 — the bridge's own
zone ranking makes FF-EZ1 the primary, and "simple-zero-proportions" undersold it; slug
discipline kept, numbering unchanged). Realizes bridge §4 **FF-EZ1** (primary) with
**FF-EZ2-family** and **FF-EZ2-cheap** as secondaries and **FF-EZ5** as the corollary
packaging; **FF-EZ3 is pre-registered separately as dossier 73**. Written against A5's
round-4 pre-check (`research/novelty/round-4.md` §1, zone FF). Tags: [VERIFIED] = read in
source by A2 with locator; [HYPOTHESIS] = proposed/reasoned, flagged.

**Honesty header (read first).** Three standing design rules from A2+A5 shape every
statement below (binding):

1. **The falsity trap:** per-curve *uniform* proportion statements are FALSE —
   supersingular-type Jacobians have Frobenius eigenvalues equal up to sign, forcing zero
   multiplicities comparable to g (genus-1 instance [VERIFIED] in tauceti's
   `…/Frobenius/Supersingular.lean`; the every-genus quantitative citation is the
   Moret-Bailly / Ibukiyama–Katsura line, round-4:116–123 `[A9 verify]` — open). Every
   proportion-shaped statement here is family-quantified or exclusion-based.
2. **The method-neighbor clock:** Suzuki arXiv:2610.41115 (2026-10-30) brings
   Hilbert-space methods to FF zetas (informal, no proportions). Our play is
   transfer-of-statement + formal, not transfer-of-method; the zone carries a month-scale
   depreciation risk.
3. **The Stacks wall:** Weil's RH input (purity/`satisfiesWeilEstimate`) and the zeta
   definitions sit behind `StacksFrontier.*` imports (un-cloned, ~63k modules, no olean
   cache — bridge §5). Consumption is by **hypothesis binders on the mathlib-only
   statement layer** (the hQRH/`EnclOK` precedent), not imports.

Categories: **primary (FF-EZ1) = GLUE/formalization-first with dictionary value** — the
mathematics is classical (Weil 1948, Hasse, Silverman V.2.4) but no corpus (and no formal
system we know of) has an s-plane function-field zeta, and every other FF zone consumes
this dictionary; **FF-EZ5 corollary = the cheapest window-comparison theorem** (pairs with
DZDF's 31/32 statement); **FF-EZ2-cheap = warm-up**; **FF-EZ2-family = DISCOVERY-grade
[HYPOTHESIS]**, effort L, honestly flagged.

---

## Name

function-field-splane-dictionary

## One-line pitch

Build the first formal s-plane zeta of a curve — ζ_C(s) := Z_C(q^{−s}) as a meromorphic
function with poles exactly at {0,…,d}, every nontrivial zero *exactly* on Re s = 1/2
(the function-field Cureton–Thorner statement with window exactly 1/2, every curve, every
q, every genus, unconditionally, by binder-postured Weil RH), and the uniform Hasse–Weil
point-count transport |A_m − q^m − 1| ≤ 2g·q^{m/2} — the dictionary every other
function-field zone consumes, plus the anti-CT window-comparison corollary and (flagged,
effort L) the Lamzouri-constant family proportions.

## Precise mathematical statement

**Objects ([VERIFIED] via bridge §0/§4).** Weil: the zeta-fraction form
`Weil.exists_zetaSeries_mul_prod_even_eq_prod_odd` (`WeilRiemannHypothesisForm.lean:206`:
Z_X · ∏_{j even} P_j = ∏_{j odd} P_j in ℚ⟦t⟧, P_j ∈ ℤ[t], P_j(0) = 1) with the Deligne
clause at :212–213 (`∀ z ≠ 0, aeval z⁻¹ (P j) = 0 → ‖z‖ = q^{j/2}`); the LeanEval bundle
`LeanEval.AlgebraicGeometry.WeilConjectures.weil_conjectures` (`WeilConjectures.lean:185`,
mathlib-only statement layer, last clause = the point-count formula at [E:F] = m);
`AlgebraicGeometry.zetaSeries` (`Definitions.lean:87`), `pointCountOfDegree` (:66),
`logDerivative_zetaSeries` (`ZetaSeries.lean:144`),
`coeff_logDerivative_multiset_prod_one_sub_C_mul_X` (`WeilConjectures.lean:85`).
ZZV2 multiset layer: `IsConjInvariant` (`Challenge/Basic.lean:114`), the Hilbert
inequalities (2.3)–(2.6) (`Challenge/Basic.lean:146,155,169,182`), constants C₀ =
0.6725007…, C₁ = 0.8362504…, C₂ = 0.8876200…. DZDF (the statement shape to mirror):
`dedekindZeta_ne_zero` (`DedekindZetaZeroFree/Main.lean:9`) — existential continuation +
half-plane nonvanishing clause. Base change:
`rationalFrobeniusCharpolyReverse_eq_comp_of_comp_specAlgebraMap_eq`
(`FieldOfConstantsFrobenius.lean:163` — eigenvalues of C_m are {α_i^m}).

**(P) Primary — the s-plane dictionary (FF-EZ1).** For k = 𝔽_q and X smooth proper
geometrically irreducible of dimension d over k, define ζ_X(s) := Z_X(q^{−s}) (the formal
substitution into the rational function of the zeta-fraction form) and prove:

  (i) *meromorphic continuation:* ζ_X extends to a meromorphic ℂ → ℂ function with poles
  exactly at s ∈ {0, 1, …, d} (from rationality of Z_X and P_j(0) = 1);
  (ii) *zero-location (the FF quasi-RH with window exactly 1/2):* every zero of ζ_X off
  {0,…,d} satisfies Re s = j/2 for the relevant j (the |z| = q^{j/2} clause through
  t = q^{−s}: |q^{−s}| = q^{−Re s}); **for a curve (d = 1): every nontrivial zero of ζ_C
  lies exactly on Re s = 1/2 — every curve, every q, every genus, unconditionally** —
  stated in the DZDF `Main.lean:9` shape (existential-meromorphic + agreement +
  window clause) so the comparison theorem (C below) typechecks against it;
  (iii) *Hasse–Weil point-count transport:* for every m ≥ 1,
  `|A_m − q^m − 1| ≤ 2g·q^{m/2}` with `A_m = #C(𝔽_{q^m})`, uniform in m (LeanEval
  point-count clause + triangle inequality);
  (iv) *[stretch]* the s-plane functional equation ζ_C(s) = ζ_C(1−s) (transfer
  `DeligneFunctionalEquation.lean:341`-type T-invariance through T = q^{−s}) and vertical
  periodicity: the nontrivial zero set is invariant under s ↦ s + 2πi/log q
  [trivial-from-Weil, nowhere stated].

**(C) Corollary — the anti-CT window comparison (FF-EZ5, the cheapest pairing).** In (P)'s
vocabulary, for every curve: N_C(σ) := #{zeros of ζ_C with Re > σ} = 0 for σ > 1/2 and =
full count for σ < 1/2 — the zero-density function is a **step function at σ = 1/2,
unconditionally, per curve** — paired in ONE theorem with the number-side conjunct: for
every number field K, N_K(σ) = 0 for σ > 31/32 (DZDF `dedekindZeta_ne_zero`, challenge
statement elaborable on our pin per `axiommath-bump/logs/run1.log`), and closing 31/32 →
1/2 is RH. Second contrast clause: the FF zero set is a finite union of arithmetic
progressions on the line (period 2π/log q, from (iv)).

**(W) Warm-up secondary — base-change simplicity (FF-EZ2-cheap; exclusion-shaped).** Fix
C/𝔽_q, eigenvalues {α_i}; call a pair degenerate if α_i/α_j is a root of unity, generic a
curve with no degenerate pair. (W1) If C is generic, every Z_{C_m} (m ≥ 1) has all 2g
zeros simple — the simple-zero proportion is 1 along the whole constant-field tower.
(W2) Unconditionally: simple proportion of Z_{C_m} = #{distinct α_i^m}/(2g) ≥
#{distinct α_i}/(2g), and the all-simple m have natural density ≥ 1 − Σ_{degenerate pairs}
1/ord(α_i/α_j), computable from the Frobenius charpoly.

**(S) Flagged secondary — Lamzouri-constant family proportions (FF-EZ2-family;
[HYPOTHESIS], effort L).** Over the hyperelliptic ensemble H_{2g+1}(𝔽_q) (fixed q,
g → ∞), with each Z_C's eigenvalue multiset transported to an `IsConjInvariant` multiset on
the angle circle: ZZV2's (2.3)–(2.6) apply per curve; given a Bui–Florea-grade pair
correlation input as a hypothesis binder (arXiv:1605.07092, informal), the (2.6)-shape
conclusion yields a family-average simple-or-on-line proportion ≥ (5+2√2−2A)/(3+2√2),
A < 2 — the first Lamzouri-constant-shaped multiplicity proportion for a function-field
family (C₀/C₁/C₂ constants). **[HYPOTHESIS]: the ensemble explicit formula and
second-moment bound exist in no corpus — an analytic build, not a transfer.**

## Novelty check

Corpus side (rg; bridge §4 [VERIFIED] sweeps + round-4 §1):

- **(P), formal absence:** mathlib has no zeta of any variety over 𝔽_q and no Hasse bound
  (`rg 'zetaFunction|zetaSeries' Mathlib/` → 0; `EllipticCurve/LFunction.lean:43–84` is the
  BSD/number-field Euler-factor object — different); tauceti has genus 1 only
  (`HasseBound.lean:44`, `Frobenius/Zeta.lean:201,244`) and no s-plane object; the Weil
  repo itself states no point-count inequality and no s-plane object (point counts appear
  in identities only, e.g. `ZetaSeries.lean:97 coeff_pointCountSeries`); ZZV2/DZDF/PNT+ are
  number-field only. **No formal system we know of has an s-plane FF zeta** (bridge:
  arXiv search for Lean Tate-thesis/function-field L-function formalization → nothing;
  hexagonmath.org swept per method item 14 — nothing; closest is Boyang Hu's function-field
  Langlands series, different layer).
- **(C), formal absence:** nothing in any corpus states a zero-density statement of any
  kind for FF zetas; the *pairing* with DZDF's 31/32 conjunct is a legitimate new formal
  statement (bridge FF-EZ5).
- **(W), formal absence:** the base-change multiplicity statement exists nowhere (bridge
  FF-EZ2 [VERIFIED]; `FieldOfConstantsFrobenius.lean:163` is charpoly-level, never pulled
  through to zero multiplicity).
- **(S), formal absence:** ZZV2's inequalities are multiset-level and uninstantiated on
  Frobenius data; no corpus states any FF proportion.
- **Literature (round-4 §1 rows FF-1–FF-7, mandatory; A5 PART-2 re-runs dossier-level):**
  (P)/(C) are **classical as mathematics** — Weil 1948 (rationality + RH for curves), Hasse
  (genus 1), Silverman V.2.4 (genus-1 textbook form) — the value is formal-first +
  dictionary; FF-1/FF-6 clean for the s-plane objects (nothing function-field at the
  zeta-object level beyond Suzuki's spectral-theory method paper). **Suzuki arXiv:2610.41115
  (2026-10-30)**: Hilbert spaces from the Weil quadratic form, eigenvalues → zero
  ordinates; NO proportions, no s-plane meromorphic dictionary — the method-neighbor
  (transfer-of-method, informal) vs our transfer-of-statement/formal; month-scale clock.
  Statistics-not-multiplicity neighbors: **Faifman–Rudnick 0803.3534** (CLT, zero counts in
  angle intervals, large genus), **Rudnick 0811.3649** (high-power Frobenius traces vs
  USp(2g) — the power-sums Σ α_i^m that (W)'s collision analysis consumes; never
  multiplicities — (W)'s nearest miss), **Bui–Florea 1605.07092** ((S)'s nearest miss:
  family simple-zero lower bounds over H_{2g+1}, non-Lamzouri constants, informal),
  **Katz–Sarnak 1999** (monodromy USp(2g); family limits, no per-curve statement),
  **DLRT 1908.04876** (number-side distinct-proportion analogue). **[A5 PART-2
  confirmation pending]**, including the hexagonmath.org sweep (method item 14).
- Nearest misses (summary): Suzuki 2610.41115 (method); Rudnick 0811.3649 ((W)'s data,
  different question); Bui–Florea 1605.07092 ((S)'s flank); tauceti genus-1 layer
  (`Frobenius/Zeta.lean`, `HasseBound.lean:44` — the g = 1 instance of (iii), different
  presentation); DZDF `Main.lean:9` (the statement shape (ii) mirrors; the number-side
  contrast conjunct); dossier 70 Part A (the number-side window the comparison pairs).

## Bridge analysis

- Corpora bridged: **Weil (the only source of rationality + the eigenvalue-modulus clause
  + base change) × mathlib (meromorphic-function/`PowerSeries`/`Complex.exp` substrate —
  the s-plane layer exists only here) × DZDF (the statement shape and the comparison
  conjunct)**; (S) adds **ZZV2** (multiset inequalities + constants, mathlib-only challenge
  layer, BUILDS on our pin per `axiommath-bump/logs/v2-run9.log`); (W) adds Weil's
  base-change theorem; tauceti via FF-EZ4 (not this dossier's scope).
- Why essential: Weil has the t-plane objects but no s-plane layer, no point-count
  inequality, no multiplicity statement; mathlib has the analysis substrate but no FF zeta
  at all; DZDF has the statement shape to mirror but is number-field-only; ZZV2 has
  multiset machinery instantiated nowhere beyond ζ. The t ↔ s dictionary (T = q^{−s}:
  `Complex.exp`/log-periodicity glue), the poles-from-rationality transfer, and the
  eigenvalue-multiplicity dictionary exist in no corpus.
- Empty-zone fit: realizes `research/bridges/function-field.md` §4 FF-EZ1 (primary; the
  bridge's zone ranking places it 3rd by ceiling but 1st by value-to-effort — "the
  dictionary every other zone consumes"), FF-EZ5 (corollary), FF-EZ2-cheap (warm-up),
  FF-EZ2-family (flagged secondary); FF-EZ3 pre-registered as dossier 73. Round-4 §1
  records the zone verdict (WARM).

## Proof-strategy sketch

1. (S–M, the dictionary core) *t ↔ s transfer:* from the zeta-fraction form
   (`WeilRiemannHypothesisForm.lean:206`) and `P_j ∈ ℤ[t]`, `P_j(0) = 1`: ζ_X(s) :=
   Z_X(q^{−s}) is a finite ℚ-linear combination of `q^{−js}`-type exponentials —
   meromorphic on ℂ with poles exactly at {0,…,d} (each pole from a `q^{js}` factor;
   `Complex.exp` never vanishes). Mathlib glue: `PowerSeries.eval` ↔ polynomial eval ↔
   `Function.Meromorphic` (the bridge names this "real but moderate analysis work").
2. (S) *(ii):* a zero of P_j at z ≠ 0 gives a zero of ζ_X at every s with q^{−s} = z,
   i.e. Re s = −log_q|z| = j/2 (the :212–213 clause); all solutions of q^{−s} = z lie on
   that vertical line, spaced 2πi/log q — giving (iv)'s periodicity for free. State in the
   DZDF shape (existential-meromorphic + window clause).
3. (S) *(iii):* the LeanEval point-count clause (`WeilConjectures.lean:185`, [E:F] = m)
   expresses A_m as the power-sum of eigenvalues; `|A_m − q^m − 1| ≤ Σ_{i≤2g} |α_i|^m =
   2g·q^{m/2}` by the modulus clause + triangle inequality.
4. (Routine) *(C):* (ii) restated as the step-function zero density + the DZDF challenge
   statement as the paired conjunct (elaborable on our pin — bump run 1).
5. (S) *(W):* the collision classification `α_i^m = α_j^m ↔ (α_i/α_j)^m = 1` (roots-of-unity
   API), the base-change theorem `FieldOfConstantsFrobenius.lean:163`, and density
   bookkeeping over finitely many arithmetic progressions.
6. (M/L, [HYPOTHESIS]) *(S):* the eigenvalue-multiset → `IsConjInvariant` dictionary
   (conjugation pairing from the FE), per-curve instantiation of (2.3)–(2.6), then the
   ensemble average under the Bui–Florea binder. **The analytic build is the cost center.**

**Hardest step:** 1 (the meromorphic transfer — moderate, named); 6 is the flagged L. All
Weil inputs enter as hypothesis binders over the mathlib-only statement layer (bridge §5's
consumption pattern 1).

## Feasibility

Preliminary, R9's F0–F6 shape; **A7's ProbeG3 (Weil statement layer) in flight**
(`research/feasibility/probe/ProbeG3_Weil.lean`, 2026-11-13; verdict not yet read here).

- F0: (P)(i)+(ii)+(iii) + (C) as the pilot; (iv) stretch; (W) warm-up; (S) flagged.
- F1 mathlib entry points: `Complex.exp` (nonvanishing, periodicity), `Function.Meromorphic`
  /`MeromorphicOn` API, `PowerSeries.eval` ↔ `Polynomial`, `Polynomial.roots`/multiplicity,
  `IsRootOfUnity`/`orderOf`, `Real.logb`/log-periodicity bookkeeping.
- F2 donor lemmas (all via hypothesis binders on the mathlib-only statement layer — bridge
  §5: direct `import Weil.*` is unavailable at any sane cost: every route to the definitions
  goes through `StacksFrontier.*` (`Weil/Definitions.lean:4–6,30`,
  `DeligneWeilConjecture.lean:3–7`), Stacks is un-cloned, ~63k modules, no olean cache, and
  the pinned Stacks rev `012108f6` is itself unverified against v4.36): the
  `weil_conjectures` bundle (`WeilConjectures.lean:185`), the zeta-fraction form + modulus
  clause (`WeilRiemannHypothesisForm.lean:206,212–213`), `logDerivative_zetaSeries`
  (`ZetaSeries.lean:144`), `coeff_logDerivative_multiset_prod_one_sub_C_mul_X`
  (`WeilConjectures.lean:85` — restatable on mathlib alone per the bridge),
  `FieldOfConstantsFrobenius.lean:163`; ZZV2 `Challenge/Basic.lean:98–189` (mathlib-only,
  importable-as-statements today; proofs behind PNT+ — built OK); DZDF challenge statement
  (elaborable, bump run 1); Bui–Florea 1605.07092 (informal binder, (S) only).
- F3 missing glue: (a) the t ↔ s meromorphic transfer — new, S–M (the dossier's core
  contribution); (b) poles-exactly-at-{0,…,d} — new, S; (c) point-count power-sum →
  triangle — new, S; (d) (W)'s collision/density layer — new, S; (e) (S)'s ensemble
  explicit formula — new, **L**; (f) [flagged] partial StacksFrontier build pricing —
  A7's, probably infeasible near-term (bridge §5).
- F4 Effort: **(P)+(C): S–M** (probe-grade per the bridge; the meromorphic transfer is the
  priced item); (W): S; (S): L.
- F5 Risks: (i) the Stacks wall — fully mitigated only at statement level; the binder
  discipline must be maintained end-to-end (hWeil binders quoting the LeanEval clause
  sites); (ii) the falsity trap — respected (no per-curve uniform proportion anywhere;
  (W) is exclusion-shaped, (S) family-averaged); (iii) `q^{−s}` multi-valuedness
  bookkeeping (fix the branch: `exp(−s·log q)` with `Real.log q > 0` — routine but
  pervasive); (iv) (S)'s clock (Suzuki; month-scale); (v) the `[A9 verify]` every-genus
  supersingular citation stays open — (W)'s framing does not lean on it quantitatively.
- F6: kernel-only, math-proof1 standard; Modal probe infra (`research/pilots/32/
  run_pilot.sh` pattern); no donor build needed (binder posture; ZZV2 challenge layer
  mathlib-only).

## Significance

The dictionary every other function-field zone consumes: the first s-plane zeta of a
variety over a finite field in any formal system, the function-field quasi-RH with window
exactly 1/2 (vs the number side's 31/32 — the sharpest possible contrast pair, stated as
one theorem in (C)), and the uniform Hasse–Weil transport. Classical mathematics, formal
first — the value is the dictionary plus the anti-CT packaging, at probe-grade cost. (W)
is the fence-respecting warm-up; (S) is the zone's discovery-grade objective, honestly
flagged L.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (A9, non-binding):** Primary (P)+(C): Novelty **2–3** (formal-new,
math-classical; the pairing theorem is the freshest clause), Significance **3–4** (the FF
bridge's load-bearing dictionary + the sharpest window comparison), Effort **1–2 (S–M)** —
rank ≈ 3–5; recommended pilot entry (binder-postured, no donor build). (W): N2 S2 E1 —
fold as milestone 0. (S): Novelty **4**, Significance **4**, Effort **4–5 (L)** — keep as
the flagged objective, not the pilot entry; revisit if A7 ever prices the ensemble layer.
Honest categories: **(P)/(C)/(W) = GLUE/formalization-first (dictionary + packaging);
(S) = DISCOVERY-grade [HYPOTHESIS], CONDITIONAL-CORE on an ensemble input no corpus has;
FF-EZ3 (dossier 73) = highest-ceiling, Stacks-blocked, pre-registered separately.**
