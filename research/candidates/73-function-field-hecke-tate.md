# Candidate dossier 73 — function-field-hecke-tate

Lane A9 (dossier-writer), Cycle 2, 2026-11-13; pre-registered same day as a 26-line
skeleton, **filled to TEMPLATE standard now (task A9-7)** from lane A2's bridge zone
**FF-EZ3** (`research/bridges/function-field.md` §4 — A2's own #1 by discovery ceiling).
Inputs folded: round-4 §6.2 (the FF query-(b) informal-status verdict, EXECUTED — not
guessed), `research/survey/axiommath-cft-vendor.md` (A1-4, LANDED — read this session),
the 71 dictionary (the t ↔ s transfer this dossier reuses). Tags: [VERIFIED] = read in
source by A2/A1 with locator; [HYPOTHESIS] = proposed/reasoned, flagged.

**Honesty header (read first).** **CONDITIONAL-CORE, Stacks-blocked, highest ceiling in the
FF zone (A2's ranking) — and formalization-first, not math-discovery.** Round-4 §6.2's
executed verdict: the Tate dictionary (Hecke/grössencharakter L-functions over global
function fields are rational; entire for nontrivial characters, with functional equation)
is **KNOWN-INFORMAL-ONLY** — Tate's 1950 thesis, Weil *Basic Number Theory* ch. VII, Rosen
GTM 210 ch. 8–9 (incl. the grössencharakter case). What is claimed here: the **statement
class** — the first formal Tate-thesis-type statements anywhere (no corpus and no formal
literature has any of it: verified below, incl. the CFT-vendor extension), stated in the
DZDF `heckeCorollary` shape so it typechecks against the number-side donor, with **every
Weil-side input a hypothesis binder** (the hQRH precedent) so the Tier-C layer is provable
on our pin today. The RH-form payoff (window **exactly 1/2**) is the anti-CT contrast at
the Hecke level. The falsity trap is checked and scoped: it kills multiplicity
*proportions*, not existence/rationality/nonvanishing statements (reasoned explicitly in
§ Novelty). The "first formal Tate-type statement anywhere" phrasing is **[pending A5
PART-2 dossier-level confirmation]** where it gates.

---

## Name

function-field-hecke-tate

## One-line pitch

Transplant DZDF's ray-class-character statement shape to function fields — Hecke
characters χ of K = 𝔽_q(C) with modulus an effective divisor — and state, binder-postured
against the Stacks wall, the Tate dictionary for their L-series (rational in T = q^{−s},
entire off the trivial factors) plus the quasi-RH **with window exactly 1/2** (every
nontrivial zero of L(s,χ) on Re s = 1/2, the function-field analogue of
`heckeL_ne_zero`'s 31/32): classical mathematics (Tate 1950 / Weil / Rosen), zero formal
presence anywhere, and the substrate every future function-field L-function statement
would stand on.

## Precise mathematical statement

**Objects.** k = 𝔽_q; C/k smooth projective geometrically irreducible; K := 𝔽_q(C) its
function field. **The FF Hecke class [HYPOTHESIS-grade def, to be built]:** for an
effective divisor m on C, `FFRayClassCharacter K m` — DZDF's `RayClassCharacter`
structure (`Arithmetic/RayClasses/Character.lean:12` — locator fixed per A2's prework §b; the Challenge-file copy sits at `DedekindZetaChallenge.lean:14`) transplanted onto mathlib's
function-field substrate (`Mathlib/NumberTheory/FunctionField.lean` — currently only the
field/ring definitions, [VERIFIED] A2): a completely multiplicative `χ` on the nonzero
fractional ideals (finitely-supported divisors) of K, with `χ ⊤ = 1`, vanishing exactly
off the coprime-to-m cone, and trivial on principals α ≡ 1 mod m — the archimedean
"totally positive" clause of DZDF's `map_span'` is **vacuous** over 𝔽_q(C) (no order),
which is exactly the transplant delta. The **Hecke series**, for ℜs > 1:
`L(s,χ) := ∏_{v ∤ supp m} (1 − χ(v)·N(v)^{−s})⁻¹` (v over closed points; N(v) = q^{deg v});
equivalently its T-form `L(T,χ) := ∏_{v∤m} (1 − χ(v)·T^{deg v})⁻¹` with T = q^{−s}.
Weil-side inputs (all **binders** at Tier C): `hTate` — the dictionary clause identifying
L(T,χ) with the L-function `LAdicSheaf.rationalLFunction` of the lisse ℓ-adic Kummer
sheaf ℒ_χ on U = C ∖ supp(m) (Euler product over closed points,
`LFunctionRationalSheaf.lean:87` docstring [VERIFIED] A2); `hRat` — the rationality
identity `∃ P₀ P₁ : ℂ[T], series L(T,χ) · P₀(T) = P₁(T)` (the shape of
`exists_rationalLFunction_mul_eq_polynomial`, `LAdicTraceFormulaFinal.lean:51` [VERIFIED]
A2); `hPur` — the purity/eigenvalue clause: off the trivial factors (the ε-quasi-character
factor and, for principal χ, the ζ_C-type pole factors), `L(T,χ) = ε(χ)·∏_j (1 − α_j T)`
with `‖α_j‖ = √q` for every j (purity of H¹ of the Kummer sheaf, Weil II for curves).

**(P) Primary — the FF Hecke-L statement class, in the DZDF `heckeCorollary` shape
(`Challenge/DedekindZetaChallenge.lean:34`, `HeckeCorollary.lean:12` — continuation +
Euler-series + nonvanishing clauses), all Weil inputs binders:**

  (i) *Rationality/continuation:* under `hRat`, there is `f : ℂ → ℂ`, meromorphic on ℂ,
  with `f s = L(s,χ)` for ℜs > 1 and q^{-1}-periodic in the T-variable — equivalently the
  T-form identity localizes L(T,χ) ∈ ℂ(T); when χ is nontrivial, f is entire off the
  trivial factors. (Provable at Tier C: rationality + dossier 71's t ↔ s transfer
  (`Complex.exp`-substitution, `PowerSeries.eval` ↔ polynomial ↔ `Function.Meromorphic`)
  = meromorphic continuation with the pole/period bookkeeping.)
  (ii) *RH-form (the payoff, window exactly 1/2):* under `hPur` (+ (i)): every zero of f
  off the trivial locus satisfies **Re s = 1/2**; equivalently the DZDF-shaped clause
  `∀ s, 1/2 < s.re → (trivial-pole exclusions) → f s ≠ 0` — the function-field analogue
  of `heckeL_ne_zero`'s `31/32 < s.re` with the window sharp at 1/2 (all inverse-root
  moduli √q ⟹ |T| = q^{−ℜs} zeros only where q^{−ℜs} = q^{−1/2}).
  (iii) *Dictionary clause:* under `hTate`, (i)–(ii) are statements about
  `L(U, ℒ_χ)` — recorded as the Tier-A target, not proved below Tier A.

**(C1) The 𝔽_q(T) probe instance (the bridge's cheap statement-only probe; HONESTY
CORRECTION 2026-11-13 per A2's FF-sequencing memo + 73-prework).** K = 𝔽_q(T), m =
(polynomial modulus), χ a finite-order character of (𝔽_q[T]/m)ˆ-type. **`hRat` for this
class is elementary and dischargeable** (χ periodic mod m ⇒ residue-class decomposition of
`Σ_{f monic} χ(f) T^{deg f}`; finitely many classes; A2 prices it ≈ 0.3–0.6k LoC of
bookkeeping); **`hPur` is NOT** — "all inverse roots ‖α‖ = √q for Dirichlet L over
𝔽_q[T]" IS the Riemann Hypothesis for the Kummer covers of ℙ¹ (Weil's theorem, deep).
At Tier C, `hPur` stays a binder even for the probe. **(C1) therefore lands as (P)(i)
UNCONDITIONALLY + (P)(ii) CONDITIONAL on `hPur`** — not "(P) outright" as first drafted.
No sheaves, no Stacks either way (Rosen GTM 210 ch. 8 territory for the hRat side).

**(C2) The anti-CT packaging (window-comparison corollary).** (P)(ii) beside the
number-side columns in one theorem: FF Hecke L window **1/2** (binder-purity) vs ζ_K /
finite-order Hecke L **31/32** (DZDF, in-corpus) vs ζ/Dirichlet **B_new = 0.8749570**
(Liu-1, external repo) — extends 71's (C) step-function comparison and 70's §5.3 per-class
table to the Hecke row.

**(C3) [Scope note, trap-checked — NOT claimed]** any simple-zero *proportion* for FF
Hecke L (the Lamzouri-for-FF-family objective) inherits the maximal-curve trap (§ Novelty):
family-averaged shapes only; nothing in this dossier claims a proportion.

## Novelty check

Corpus side (rg; A2's bridge FF-EZ3 [VERIFIED] sweeps + the A1-4 vendor extension, read
this session):

- **Formal absence, total:** no corpus defines a Hecke character of a function field —
  mathlib `FunctionField.lean` has only field/ring definitions; tauceti's Hecke records
  are number-field; DZDF's ray classes live over `[NumberField K]`; ZZV2/PNT+/openai are
  number-side. **Extension (A1-4, `survey/axiommath-cft-vendor.md` §(d), LANDED):** the
  vendored class-field-theory tree inside DZDF (1,658 files) is **number-field-only by
  construction** — word-boundary sweep (`\bTate\b|FunctionField|GlobalField\b`): every
  `Tate` hit is Lubin–Tate, zero function-field/global-field/geometric declarations
  (product formula, ideles, ray classes all over `[NumberField K]`). A2's empty-zone
  finding extends to the largest CFT tree within reach: **nothing to transplant from, and
  nothing competing.** Even layer (i) alone — "the Euler product of a function-field
  ray-class character is rational" — would be the first formal Tate-thesis-type statement
  anywhere.
- **Literature (round-4 §6.2, EXECUTED — the FF query-(b) verdict; not guessed):**
  **KNOWN-INFORMAL-ONLY** — Tate's 1950 thesis (function-field case included); Weil,
  *Basic Number Theory*, ch. VII (Tate's method over A/𝔽_q); Rosen, *Number Theory in
  Function Fields*, GTM 210, ch. 8–9 (L-functions over 𝔽_q[T], grössencharakter/Hecke
  case included); arXiv `abs:"Hecke L" AND abs:"function field" AND abs:rational` → no
  post-2000 claim of the dictionary as new (textbook territory). **Consequence: this
  dossier is formalization-first — the mathematics is 75 years old.** The "first formal
  Tate-type statement anywhere" claim is **RESOLVED by A5's PART-2 P2-13 (2026-11-13):
  SUPPORTED in the function-field/rationality-dictionary scope** — arXiv 8+2 entries all
  irrelevant, AFP none, GitHub exactly 2 repos both audited (DawidLipin dissertation
  stub; WenrongZou PhD project — Nuccio/Brasca, ANR FALSE, CI), both number-field-only
  with proved-status unconfirmed — **with the mandatory softening: the "anywhere"
  phrasing is scoped to function-field territory and carries the WenrongZou clock**;
  hexagonmath PASS-conditional (P2-1/P2-12).
- **Suzuki 2610.41115 engagement:** Suzuki's spectral theory (Hilbert spaces from the Weil
  quadratic form, self-adjoint extensions, eigenvalues → zero ordinates of ζ_C) is a
  *method-neighbor for the ζ_C object* — it has no Hecke-L content, no rationality
  dictionary, no L-function-of-sheaf statements, and is informal; our play is
  transfer-of-statement + formal, and the Hecke class sits outside his current scope.
  Month-scale clock anyway (third parties entering FF zeta methods; round-4 §1 note).
  Boyang Hu's three-part function-field Langlands series: different layer (bridge's
  closest-hit note). **[P2-13 must-cites, added 2026-11-13: WenrongZou (PhD project;
  Nuccio/Brasca, ANR FALSE, CI) — the nearest formal neighbor, number-field-only,
  proved-status unconfirmed — and DawidLipin (dissertation stub); the "anywhere" phrasing
  carries the WenrongZou clock.]**
- **The falsity trap, checked explicitly (does it apply here?):** the maximal-curve trap
  (round-4 §6.3, pinned: the Hermitian curve over 𝔽_{q²} has all 2g Frobenius eigenvalues
  equal to −q, Z_C(t) = (1+qt)^{2g}/((1−t)(1−qt)), simple-zero proportion 0) kills
  **multiplicity-proportion statements** — statistics of zero multisets, whose per-curve
  uniform versions are false. It does **not** touch this dossier's statements:
  rationality/entirety/continuation are deterministic identities per curve, and the
  RH-form (ii) is a *nonvanishing* statement — Weil RH itself is per-curve uniform and
  true; eigenvalue coincidences make zeros multiple, never absent or spurious. Where the
  trap re-enters: C3's excluded proportion extensions (Hecke-L eigenvalue coincidences
  are equally unprevented per curve). Scope fence stated, not crossed.
- Nearest misses (summary): Tate 1950 / Weil BNT / Rosen GTM 210 (the entire informal
  content); Suzuki 2610.41115 (method-neighbor, ζ_C only); DZDF `heckeL_ne_zero` (the
  statement shape and the number-side column; number fields only); dossier 71 (the
  t ↔ s dictionary and the ζ_C instance this builds on — χ = trivial reduces (P) to
  71's (P)(i)/(ii)); dossier 70 §5.3 (the window table C2 extends); the Kummer-sheaf
  literature (Tag 03UX-adjacent, informal).

## Bridge analysis

- Corpora bridged: **Weil (the only source of L(X,ℱ) and — behind StacksFrontier —
  purity; the rationality theorem `exists_rationalLFunction_mul_eq_polynomial` lives
  here) × DZDF (the `RayClassCharacter` structure and the `heckeCorollary` statement
  shape to transplant and mirror — plus the vendored CFT tree whose number-field-only
  verdict defines the transplant's empty starting point) × mathlib (function fields,
  divisors, power series, and dossier 71's t ↔ s transfer) × tauceti (the only existing
  ℓ-adic-adjacent arithmetic in the ecosystem — genus-1 zeta/Frobenius layer, the
  concrete instance layer).** Four-way and irreducible (A2's own call, adopted).
- Why essential: Weil cannot state the Hecke class (no characters, no Euler series over
  divisors); DZDF/mathlib/tauceti have no sheaf-theoretic L-functions and no FF Hecke
  class; mathlib alone has no zeta of any variety; the transplants (the FF Hecke def with
  the vacuous-positivity delta; the Euler-series ↔ T-form dictionary; the
  continuation-from-rationality step) exist nowhere.
- Empty-zone fit: `research/bridges/function-field.md` §4 **FF-EZ3** (A2's zone ranking:
  #1 by ceiling, hardest feasibility); cross-refs FF-EZ1 (71 — the shared t ↔ s
  dictionary; χ = trivial is 71's case) and FF-EZ5 (the comparison packaging C2
  extends). Round-4 §1/§6.2 record the zone's informal status.

## Proof-strategy sketch

1. (S–M, Tier C) **The FF Hecke class def:** transplant `RayClassCharacter`
   (`Character.lean:12–18`) field-by-field onto mathlib's function-field/divisor
   substrate; discharge the archimedean clause (vacuous over 𝔽_q(C)) — the named
   transplant delta.
2. (S, Tier C) **Euler-series ↔ T-form dictionary:** `N(v) = q^{deg v}` bookkeeping;
   `L(s,χ)` at T = q^{−s} (`Complex.exp`-substitution, branch fixed as in 71).
3. (S–M, Tier C) **Continuation from rationality:** under `hRat`, compose 71's proved
   transfer pattern (rational ∘ q^{−s} ⟹ meromorphic, poles/periods transported) —
   reuse, not reproof; the trivial-factor bookkeeping (ε-factor; ζ_C-type poles for
   principal χ) per the T-factorization.
4. (M, Tier C) **(ii) from `hPur`:** the eigenvalue clause ⟹ zero-location: |T| =
   q^{−ℜs} and roots at |α_j|^{−1} = q^{−1/2} ⟹ Re s = 1/2 (the modulus arithmetic of
   71's (P)(ii), one more factor level).
5. (M) **(C1) the 𝔽_q(T) probe, post-correction:** Dirichlet characters of 𝔽_q[T]
   (mathlib polynomial + `ZMod`-type quotient layers), the Euler product over prime
   polynomials, and the **`hRat` discharge only** (elementary periodicity bookkeeping —
   A2's 0.3–0.6k LoC estimate); `hPur` stays a binder (it is the RH for Kummer covers
   of ℙ¹ — Weil's theorem, out of Tier C's reach); land **(P)(i) unconditionally and
   (P)(ii) conditionally** for the probe class.
6. (Tier A, blocked) **The dictionary itself:** construct ℒ_χ (Kummer), invoke the trace
  formula + purity — **not in any corpus** (`LAdicSheaf.constantSystem` is the only
  sheaf developed [VERIFIED] A2); this is the Stacks-gated ceiling.

**Hardest step:** 6 (blocked by definition); of the provable content, step 5's hRat
layer is the priced item.

## Feasibility

Preliminary, R9's F0–F6 shape. **A7's G6a (partial StacksFrontier pricing) [pending] —
the zone's gating unknown; the CFT-vendor survey (A1-4, LANDED) settles the adjacent
question negatively.**

- F0: Tier C = the class def + (P)(i)/(ii) under binders + (C1) probe + (C2) packaging;
  Tier A = the dictionary (6).
- F1 mathlib entry points: `NumberField/FunctionField.lean` (field/ring defs),
  divisor/ideal infrastructure for Dedekind domains in function-field form,
  `Polynomial`/`MvPolynomial` over 𝔽_q, `PowerSeries.eval`, `Complex.exp`, the 71
  transfer lemmas (once 71's pilot lands them), `Function.Meromorphic`.
- F2 donor lemmas: Weil (statement layer only, **behind the Stacks wall**: every route to
  the zeta/sheaf definitions goes through `StacksFrontier.*` — `Weil/Definitions.lean:4–6,30`,
  `DeligneWeilConjecture.lean:3–7`; Stacks un-cloned, ~63k modules, no olean cache, pinned
  rev `012108f6` unverified vs v4.36 — bridge §5 [VERIFIED]): at Tier C quote
  `exists_rationalLFunction_mul_eq_polynomial` (`LAdicTraceFormulaFinal.lean:51`) and the
  purity clause as the binders `hRat`/`hPur`/`hTate` (verbatim-transcription posture, the
  hQRH/EnclOK precedent — the 71-prework Tier-C pattern); DZDF: `RayClassCharacter`
  (`Arithmetic/RayClasses/Character.lean:12`) as the transplant source,
  `heckeL_ne_zero` (`HeckeCorollary.lean:12`) as the mirrored statement shape and the C2
  comparison column; tauceti: the genus-1 Frobenius/zeta layer (`Frobenius/Zeta.lean`,
  `HasseBound.lean:44`) as the concrete-instance anchor; dossier 71's pilot layer (the
  t ↔ s transfer) once landed. **CFT-vendor relevance (A1-4, read this session): none
  borrowable — the vendor is number-field-only (every `Tate` = Lubin–Tate; zero
  function-field content) — and its verdict extends this dossier's empty-zone finding;
  its only role in 73's economics is the G1 build-cost context should DZDF imports ever
  enter (they do not, at Tier C). Per A1-4's §(d) verdict, the vendor offers this zone
  **nothing borrowable and nothing competing** — the Stacks-wall binder posture is the
  only route.**
- F3 missing glue: (a) the FF Hecke class def + vacuous-positivity delta — new, S–M;
  (b) Euler-series ↔ T-form — new, S; (c) continuation-from-rationality — shared with 71
  (S, reuse); (d) the `hRat` periodicity layer for (C1) — new, **M** (the priced provable item; `hPur` stays a binder per the A2 correction);
  (e) [Tier A, blocked] Kummer sheaves + purity — not in any corpus, Stacks-gated.
- F4 Effort: **Tier C: S–M** (< ~1k LoC over the 71 pattern; the class def and the
  bookkeeping); **(C1) probe: M**; **Tier A: L / blocked** (G6a pricing pending; bridge
  §5 calls a partial Stacks build "probably infeasible near-term").
- F5 Risks: (i) the Stacks wall — permanent at Tier A unless G6a surprises; (ii) the
  "first formal Tate-type" claim waits on A5 PART-2 (§6.2 is a pre-check-level verdict);
  (iii) the transplanted class must be *proved* to specialize to the classical objects at
  the (C1) probe level (a mis-transplanted def would strand the binders — the probe is
  the faithfulness check); (iv) coefficient field bookkeeping (ℂ-values vs ℚ(χ)) and the
  ε/trivial-factor bookkeeping are finicky; (v) proportion extensions remain trapped
  (C3) — do not let a future revision smuggle one in.
- F6: kernel-only, math-proof1 standard; Modal probe infra; zero import gates at Tier C
  (mathlib + binders only, the 71-prework pattern).

## Significance

The substrate layer for the entire function-field L-function side: the first formal
Tate-thesis-type statements anywhere would put Hecke L over 𝔽_q(C) — rationality, entire
continuation, and the sharp-1/2 nonvanishing window — into Lean, in the exact statement
shape the number-side donor uses, so every future FF L statement (density questions,
functoriality-shaped questions, the FF column of any comparison theorem) has an object
layer to stand on. The C2 packaging completes the three-corpus window table (1/2 vs 31/32
vs B_new). The mathematics is classical; the value is first-formal + the shape discipline
(binders that a future Stacks-priced build discharges wholesale) — the highest ceiling and
the lowest probability in the FF zone, honestly priced.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (A9, non-binding):** Novelty **3** (formal-new everywhere incl. the
vendor extension, math-classical per §6.2 — a formalization-first 3, not a discovery 4;
the "first formal Tate-type anywhere" claim is the upside — P2-13-SUPPORTED in the
function-field scope, with the WenrongZou nearest-neighbor must-cite and clock),
Significance **4** (the FF L-function substrate layer; the sharp-window contrast; A2's
#1-by-ceiling zone), Effort **2–3 for the Tier-C pilot** (S–M, zero import gates) /
**5 for Tier A** (Stacks-blocked) — pilot the Tier-C layer + the (C1) probe as the entry
(rank ≈ 3 × 4 ÷ 2.5 ≈ 4.8 at Tier C); Tier A stays a priced ceiling, not a slot.
Honest category: **CONDITIONAL-CORE, Stacks-blocked, formalization-first — the
highest-ceiling item of the 70–75 series, with the least claimable today.**
