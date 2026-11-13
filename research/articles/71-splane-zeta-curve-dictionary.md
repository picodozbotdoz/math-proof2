# The s-Plane Zeta of a Curve: Formal Dictionary, Exact Window, Hasse–Weil Transport

*cross-math-fronttier research article 71 (Cycle 2) · DRAFT 2026-11-14 · dossier
`research/candidates/71-function-field-splane-dictionary.md` · prework/pilot
`research/pilots/71-prework.md`, `research/pilots/71/` (P0, P1, P2 in flight) · bridge
`research/bridges/function-field.md` §4 FF-EZ1*

**Status: DRAFT — substrate GREEN, landing theorems pending.** The P0 statement probe and
the P1 dictionary layer are kernel-clean on mathlib `ff2494ea`, Lean `v4.36.0-rc2`
(7/7 lemmas, axiom triad; §5). The P2 landing theorems (W1/W2/HW) are in flight;
their verdict slots are marked [VERDICT:71-P2] in §5 and must not be cited as proved
until filled by the orchestrator's relay. Classical mathematics throughout (Weil 1948);
the claim is first-formal dictionary value, not new mathematics.

---

## Abstract

For a smooth projective geometrically irreducible curve C/𝔽_q, the zeta function Z_C(t)
is a rational function with an exact functional-equation-and-RH package (Weil 1948). Every
formal corpus, however, stops at the t-plane: no formal system we know of carries an
s-plane object ζ_C(s) := Z_C(q^{−s}). We build that dictionary: (i) ζ_C(s) as a meromorphic
ℂ → ℂ function obtained by the substitution t = q^{−s} = exp(−s log q), with poles exactly
where the t-plane poles sit; (ii) the zero-location theorem with **window exactly 1/2** —
every nontrivial zero of ζ_C lies on Re s = 1/2, every curve, every q, every genus,
unconditionally relative to hypothesis binders quoting Weil's RH (the function-field
analogue of the number-side quasi-RH statements at 31/32, but sharp); (iii) the uniform
Hasse–Weil point-count transport |A_m − q^m − 1| ≤ 2g·q^{m/2} for every m ≥ 1; and (iv) the
anti-Cureton–Thorner comparison corollary: one theorem conjoining the FF step-function
zero density (all zeros on the line, unconditionally per curve) with the number-side
statement "ζ_K ≠ 0 for Re s > 31/32, every number field K" — the sharpest possible
side-by-side of the two worlds inside one formal statement. The mathematics is classical;
the contribution is the dictionary every other function-field zone consumes.

## 1. Introduction

The Cycle-2 corpus survey found the function-field side of the L-function world formally
empty above the t-plane: mathlib has no zeta of any variety over 𝔽_q; the AxiomMath `Weil`
repo has rationality and the eigenvalue-modulus clause but states them as identities among
power series and polynomials, never pulled through the substitution t = q^{−s}; tauceti has
genus 1 only; DZDF/ZZV2/PNT+ are number-field only. Meanwhile the number side just gained
formal quasi-RH statements at 31/32 (DZDF's Cureton–Thorner) and 7/8-grade constants
(openai's in-corpus challenge tree) — windows far from the line. The function-field
analogue is not merely closer to the line: it is the line, exactly, and per curve. The
dictionary that makes the two sides typecheck against each other is this article's object.

**Honesty.** Everything here is classical (Weil 1948; Hasse for genus 1; Silverman V.2.4 as
the textbook form). The claim is formalization-first: the s-plane object, its exact-pole
dictionary, the point-count transport, and the paired comparison are stated nowhere in any
formal corpus (dossier 71 §Novelty; A5 round-4 §1 + PART-2 row 71: "primary (P):
formalization-first (dictionary value)", tier WARM). Per-curve *uniform proportion*
statements are deliberately absent — they are FALSE (maximal curves give a single zero of
multiplicity 2g; round-4 §6.3 pinned the falsity trap at mechanism level via the Hermitian
curve y^q + y = x^{q+1} over 𝔽_{q²}), and the dossier's design rule bans them.

## 2. Setting and statement layer

Fix k = 𝔽_q and C/k smooth projective geometrically irreducible of genus g. The donors
enter as a **hypothesis-binder bundle** (`WeilData`, prework §2.2) on a mathlib-only
statement layer — the hQRH/EnclOK consumption pattern; direct `import Weil.*` is blocked by
the Stacks wall (every route to the definitions crosses `StacksFrontier.*`, ~63k modules,
un-cloned; bridge §5). The binders quote, verbatim-transcribed:

- the zeta-fraction form `Weil.exists_zetaSeries_mul_prod_even_eq_prod_odd`
  (`WeilRiemannHypothesisForm.lean:206`): Z_X · ∏_{j even} P_j = ∏_{j odd} P_j in ℚ⟦t⟧,
  with P_j ∈ ℤ[t], P_j(0) = 1;
- the modulus clause at :212–213: ∀ z ≠ 0, aeval z⁻¹ (P j) = 0 → ‖z‖ = q^{j/2};
- the point-count clause of the LeanEval bundle
  `LeanEval.AlgebraicGeometry.WeilConjectures.weil_conjectures` (`WeilConjectures.lean:185`).

The s-plane object is defined by the branch-fixed substitution T = q^{−s} := exp(−s·log q)
with `Real.log q > 0`; all moduli are handled through `Real.exp`, zero `rpow` (prework §4).

## 3. Main results (the P2 target theorems)

**W1 (optimal window).** For every C/𝔽_q: there is f : ℂ → ℂ, meromorphic, with f s =
ζ_C(s) for ℜs > 1 (the s-substituted zeta), such that every zero of f off the pole locus
satisfies **Re s = 1/2** — equivalently the DZDF-shaped clause `∀ s, 1/2 < s.re → (s ≠ 1) →
f s ≠ 0` (mirroring `dedekindZeta_ne_zero`'s `Main.lean:9` shape so the comparison theorem
typechecks against the number-side donor). The `s ≠ 1` pole exclusion is the one place a
kernel computation (`exp_eq_exp` + imaginary parts) is genuinely needed (prework R2).

**W2 (exact zero location = perfect zero-density).** The zero set of f off the trivial
locus is exactly the union of vertical lines Re s = 1/2 spaced by the period 2πi/log q —
the zero-density function is a step function at σ = 1/2, per curve, unconditional on the
binders.

**HW (Hasse–Weil transport, ∀E-form).** For every m ≥ 1: |A_m − q^m − 1| ≤ 2g·q^{m/2},
uniform in m — the point-count clause plus the modulus clause plus the triangle
inequality, stated over arbitrary `[Field E] [Fintype E]` finite extensions (prework §2.5).

**C (anti-CT comparison corollary, optional P2c).** One theorem conjoining W1's window
clause with the number-side DZDF challenge statement (ζ_K ≠ 0 for Re s > 31/32, every K;
elaborable on our pin per `axiommath-bump/logs/run1.log`), closing 31/32 → 1/2 = RH on the
number side.

**Warm-up (W, FF-EZ2-cheap, milestone-0).** Base-change simplicity: for a generic curve
(no degenerate eigenvalue pair), every Z_{C_m} has all 2g zeros simple — the simple-zero
proportion is 1 along the whole constant-field tower; unconditionally, the simple
proportion of Z_{C_m} is ≥ that of Z_C, with density bounds computable from the Frobenius
charpoly (`FieldOfConstantsFrobenius.lean:163` for the eigenvalue transfer). Exclusion-
shaped, trap-respecting.

## 4. Proofs (sketch; the pilot's actual work)

The t ↔ s transfer is the core: from P_j ∈ ℤ[t] with P_j(0) = 1, ζ_C(s) is a finite
ℚ-linear combination of q^{−js}-type exponentials — `Complex.exp` never vanishes, so poles
come exactly from the (1−q^{−s}) and (1−q^{1−s}) factors of the degree-1 part, at
s ∈ {0, 1} (period-2πi/log q arithmetic for the full pole locus of higher-dimensional X:
{0,…,d}). Zero location: a zero of P_1 at z ≠ 0 gives zeros of ζ_C at every s with
q^{−s} = z; the modulus clause forces |z| = √q, hence Re s = 1/2, and all solutions of
q^{−s} = z lie on that vertical line — periodicity comes free. HW is the power-sum
identity (point-count clause at [E:F] = m) plus Σ|α_i|^m = 2g·q^{m/2}. The dictionary
lemmas (D1–D3 of prework §2.4: the multiset/polynomial-eval layer, the prod-zero transfer
`prod_eq_zero_iff` route, the card-counting layer) are the P1 deliverables, all landed
GREEN (§5).

## 5. Formal verification

**Landed (evidence, logs with provenance headers under `research/pilots/71/logs/`):**

- **P0 (statement probe)**: OK — the binder bundle and all target statements elaborate on
  the pin; 4 justified probe-convention stubs (probe header, "not a proof artifact") —
  runs `run1.log`–`run4.log`, lane A2, 2026-11-13.
- **P1 (dictionary layer)**: **GREEN, 7/7 lemmas kernel-clean, axiom triad** — the D1–D3
  dictionary deliverables (prework §2.4), logs `run3.log`/`run4.log`.

**Pending (slots — not citable until the orchestrator fills them):**

- P2 landing theorems W1 → W2 → HW (plus optional P2c packaging): [VERDICT:71-P2].
  In-flight state at draft time: `p2-run1.log` = FAIL rc=1, errors=6, sorry=0 —
  iteration ongoing (lane A2, relaunch); header "proof artifact: no sorry".
- Final LoC / theorem count / full axcheck: [VERDICT:71-P2].

The pilot consumes ZERO Weil/Stacks imports (binder posture; prework §3's tier ladder:
Tier C binder → Tier B imported statements → Tier A proofs, only the first is the pilot).

## 6. Relation to prior work

- **Weil 1948** (rationality + RH for curves), **Hasse** (genus 1), **F. K. Schmidt 1931**
  (rationality; round-4 §6.1): the entire mathematical content — textbook-standard
  (Rosen GTM 210 ch. 5; Stichtenoth Thm 5.1.1 [edition-number caveat per round-4 §6.1]).
- **Suzuki arXiv:2610.41115** (2026-10-30): Hilbert-space methods for FF zetas — a
  method-neighbor (informal, no proportions, no s-plane dictionary); month-scale clock on
  the zone.
- **DZDF `dedekindZeta_ne_zero`** (`Main.lean:9`): the statement shape W1 mirrors and the
  number-side column of the comparison; 31/32 vs 1/2.
- **tauceti genus-1 layer** (`Frobenius/Zeta.lean`, `HasseBound.lean:44`): the g = 1
  instance of HW in a different presentation.
- Formal absence total: mathlib/tauceti/DZDF/ZZV2/PNT+ sweeps (dossier 71 §Novelty) — no
  s-plane FF zeta anywhere; nearest formal neighbors in the Tate direction are
  number-field-only (dossier 73's WenrongZou/DawidLipin audit).
- Falsity-trap citations (round-4 P2-11, zbMATH-pinned at paper granularity): van der
  Geer–van der Vlugt, *Artin-Schreier curves and codes* (Zbl 0729.11066, 1991);
  Cossidente–Hirschfeld–Korchmáros–Torres, *On plane maximal curves* (Zbl 0958.11048,
  2000); Hirschfeld–Korchmáros, *Caps on Hermitian varieties and maximal curves*
  (Zbl 1043.51007, 2003); Giulietti–Hirschfeld–Korchmáros–Torres, *Curves covered by the
  Hermitian curve* (Zbl 1218.11064, 2006). Book-level: HKT, *Algebraic Curves over a
  Finite Field* (PUP 2008, Zbl 1200.11042) — **cite at Part-3 level only ("Part 3
  (chs. XIV–XVIII, pp. 393–626)"); bare chapter numbers are NOT citable** (A5's P2-11
  PARTIAL-PIN resolution, 2026-11-14: Zieve-vs-Google-Books numbering ambiguity).

## 7. Limitations and open problems

- The RH input is a binder: discharging it needs Weil's proof (Tier A), gated behind the
  Stacks wall (G6a pricing pending; "probably infeasible near-term" per bridge §5).
- Family-quantified proportion statements (FF-EZ2-family, the [S] objective of the
  dossier) are NOT in this pilot — flagged L-effort with the Bui–Florea pair-correlation
  input as an explicit informal binder.
- Periodicity/functional-equation packaging (P2c) is optional and sequenced after W1+W2+HW.

## References

- A. Weil, *Sur les courbes algébriques et les variétés qui s'en déduisent* (1948);
  M. Rosen, *Number Theory in Function Fields*, GTM 210, ch. 5. H. Stichtenoth,
  *Algebraic Function Fields and Codes*, Thm 5.1.1. J. Suzuki, arXiv:2610.41115.
  axiommath `Weil` (`WeilRiemannHypothesisForm.lean:206,212–213`,
  `WeilConjectures.lean:185`), `DedekindZetaZeroFree/Main.lean:9`. tauceti
  `Frobenius/Zeta.lean:201,244`, `HasseBound.lean:44`. Dossier 71; pilots 71-prework §2–§5;
  `research/novelty/round-4.md` §1, §6.1, §6.3.
