# An Interface Theorem for Zero-Proportion Engines: the Analytic-Input Card, λ-Families, and Multiplicity Merging

*kind: TECHNICAL-RECORD (conditional interface + the multiplicity-merging lemmas) ·
date: 2026-11-21 · supersedes: none · artifacts: `research/pilots/20/M1.lean`
(26 named theorems + 2 anonymous examples, 582 lines), `research/pilots/20/logs/`,
companion note `research/pilots/20-seam-analysis.md` (the common-zero seam analysis,
incl. its Theorem 5 and the `SharedMass`/`CommonZeroControl` definitions)*

**Status: TECHNICAL-RECORD.** Every theorem below is kernel-verified on mathlib
`ff2494ea`, Lean v4.36.0-rc2, with axiom prints {propext, Classical.choice,
Quot.sound}. Each theorem is PROVED-CONDITIONAL on the named hypothesis binders in
its row; no binder is an unproved conjecture, and the Theorem 4 binders are
configuration data discharged at every instantiation. The application-level analysis
(distinct/simple zero transport, the hCZ hypothesis) is **not** claimed here; it is
Theorem 5's subject in the companion note.

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 `instantiate_family_A/B/C` | PROVED-CONDITIONAL | htf : `TracesFamily Traces z`, hstep : `EngineStep Traces z`; hCard : `Card20 z ν μ ℓ` is carried in the statement but the proof does not use it | `pilots/20/logs/axcheck-cycle2.log:56–58` |
| Thm 2 `family_to_two_thirds` / `_half` / `_three_quarters` | PROVED-CONDITIONAL | hfam : the configuration's λ-family, e.g. `∀ λ ∈ (1/2, 1), EpsLower z (H λ)` (respectively the 2F(λ)−1 and F(λ) families) | `pilots/20/logs/axcheck-cycle2.log:48–50` |
| Thm 3 `assemble_eps` / `family_merge` / `two_thirds_of_components` | PROVED-CONDITIONAL | hz, hw : `EpsLower z c`, `EpsLower w c` (same c); hfamz, hfamw : component λ-families — no common-zero hypothesis | `pilots/20/logs/m1-cycle2-green.log:57` (`assemble_eps`); `axcheck-cycle2.log:51` (`family_merge`); `axcheck-cycle2.log:52` (`two_thirds_of_components`) |
| Thm 4 (i) `merged_mult_of_common` | PROVED-CONDITIONAL | hz : `z.mult ρ = 1`, hw : `w.mult ρ = 1` (ρ a simple zero of both configurations; discharged at every instantiation) | `pilots/20/logs/axcheck-cycle2.log:63` |
| Thm 4 (ii) `sharedMass_eq_zero_of_disjoint` | PROVED-CONDITIONAL | hdisj : strip-disjointness — `∀ ρ, z.mult ρ ≠ 0 ∧ 0 < Re ρ < 1 → w.mult ρ = 0` | `pilots/20/logs/axcheck-cycle2.log:62` |
| Thm 5 (hCZ at η > 1/6) | PAPER-ONLY | none | none — companion note |

---

## Abstract

Do the analytic inputs of the zeta23 zero-density engine (anthropics_formal-math's
formalization of Alpöge–Furman-type zero-density theorems) restate as a reusable
interface? Neither the card nor the step transports as stated. We restate the engine
at the level of a zero configuration z and prove the instantiation layer in Lean
(mathlib `ff2494ea`, Lean v4.36.0-rc2). Theorem 1: a traces family and engine step
for z yield, for every λ ∈ (1/2, 1), ε-form bounds `EpsLower z (H λ)`,
`EpsLower z (2F(λ) − 1)`, `EpsLower z (F λ)`, where H(λ) = 2 − 1/λ − λ/3 and
F(λ) = λ/(1 + λ²/3); the transcribed analytic-input card is a carried anchor the
proof does not use. Theorems 2–4: the λ → 1 upgrades to 2/3, 1/2, 3/4; two component
ε-bounds merge into z + w with no common-zero hypothesis (binary, iterated); and the
atom lemmas for a simple common zero and for strip-disjoint configurations. All four
are PROVED-CONDITIONAL on the named binders; axioms {propext, Classical.choice,
Quot.sound}. The interface is deliberately hollow — the analytic content is exactly
its hypotheses — and no corpus consumer imports it: articles 42 and 75 carry their
own assembly lemmas. Nearest prior work: the zeta23 engine itself; Alpöge–Furman,
arXiv:2608.13637.

## 1. Introduction

Zero-density proportion theorems are proved function by function. For a number field
K the Dedekind zeta factors into Artin L-functions; for K quadratic, ζ_K = ζ·L(·, χ_D).
Two routes to ζ_K proportions exist:

- **assembly** (articles 42 and 75): add the factor theorems using additivity of
  multiplicities;
- **engine** (this article): run the density engine directly on the zero configuration
  of ζ_K, which needs ζ_K-versions of the analytic inputs.

The contribution is the interface — the engine restated for an arbitrary zero
configuration (Theorem 1), its constants obtained from the λ-families (Theorem 2) —
and the merging and atom lemmas, with every hypothesis named and nothing hidden
(Theorems 3–4). No proportional statement for any particular L-function is claimed
here, and no article of this corpus depends on this interface: articles 42 and 75
prove their assemblies from their own copies of the counting lemmas (§4). What the
interface cannot transport — distinct- and simple-numerator bounds past common zeros —
is the subject of the companion note, and is not claimed here.

## 2. Setting and notation

A *zero configuration* is a multiplicity function m : ℂ → ℕ with finite support in
every window {0 < Re ρ < 1, T₁ < Im ρ ≤ T₂} (`ZeroMult`, `M1.lean:130`). The *strip
window* is {ρ : 0 < Re ρ < 1, T₁ < Im ρ ≤ T₂} (`M1.lean:34`) and the *line window* is
{ρ : Re ρ = 1/2, T₁ < Im ρ ≤ T₂} (`M1.lean:38`); a zero is *on-line* when it lies in
the line window. Write N(T), N^on(T) for the dyadic-window (T, 2T] counts with
multiplicity (`M1.lean:156/:160`), and `EpsLower z c` for: ∀ ε > 0, eventually
(c − ε)·N(T) ≤ N^on(T) (`M1.lean:182`). The engine's λ-family constants are

  H(λ) = 2 − 1/λ − λ/3,  F(λ) = λ/(1 + λ²/3),  λ ∈ (1/2, 1)  (`M1.lean:206/:210`),

with H(1) = 2/3 and F(1) = 3/4 (the three zeta23 engine theorems correspond to H,
2F − 1, F). The transcribed card `Card20 z ν μ ℓ` (`M1.lean:383`) bundles the engine's
five analytic-input fields — explicit formula, Riemann–von Mangoldt,
Chebyshev–Mertens, Hilbert majorant, gamma facts — transcribed from zeta23's
`PaperInputs` (`Zeta23/Hypotheses.lean:147`). `EngineStep` (`M1.lean:419`) is the
engine step at configuration level (the three λ-family bounds from the traces
hypothesis); `TracesFamily` (`M1.lean:427`) is the traces hypothesis itself.

## 3. Main results

**Theorem 1 (instantiation; `instantiate_family_A/B/C`, `M1.lean:437/:442/:447`).**
Hypotheses: htf : `TracesFamily Traces z` and hstep : `EngineStep Traces z`, with
hCard : `Card20 z ν μ ℓ` carried in the statement. Conclusion: for every λ ∈ (1/2, 1),
`EpsLower z (H λ)`, `EpsLower z (2F(λ) − 1)` and `EpsLower z (F λ)`. The proof is the
engine step applied at each λ (`hstep.hStepA λ hλ (htf.atLambda λ hλ)`); the card
binder enters no proof branch — it is a carried anchor, kept so that a future
discharge of `Card20` ⇒ `TracesFamily` slots in unchanged (the elaboration log flags
hCard as unreferenced three times, by design). What is proved is: traces family +
engine step ⇒ λ-families.

**Theorem 2 (λ → 1 upgrades; `family_to_two_thirds`/`_half`/`_three_quarters`,
`M1.lean:247/:284/:266`).** Hypothesis, one per variant: the configuration's
λ-family, e.g. hfam : `EpsLower z (H λ)` for all λ ∈ (1/2, 1). Conclusions:
`EpsLower z (2/3)` from the H-family, `EpsLower z (1/2)` from the 2F − 1 family,
`EpsLower z (3/4)` from the F-family.

**Theorem 3 (merging with multiplicity; no common-zero hypothesis; `assemble_eps`
`M1.lean:188`, `family_merge` :525, `two_thirds_of_components` :534).** Hypotheses:
(i) hz : `EpsLower z c` and hw : `EpsLower w c` with the same c — a binary merge;
longer sums by iterating; (ii) hfamz, hfamw : the components' λ-families.
Conclusions: `EpsLower (z + w) c`; the λ-family version for z + w; and
`two_thirds_of_components`, the with-multiplicity 2/3 statement for z + w from
component families alone. Via a factorization L = L₁L₂ (orders add;
`count_add_of_factorization`, `M1.lean:402`), the with-multiplicity 2/3 statement
for L follows from those of the factors.

**Theorem 4 (atom lemmas).** (i) `merged_mult_of_common` (`M1.lean:513`) —
hypotheses hz : z.mult ρ = 1 and hw : w.mult ρ = 1, configuration data on ρ
discharged at every instantiation — concludes (z + w)(ρ) = 2: a simple common zero of
the factors is a double zero of the product. (ii) `sharedMass_eq_zero_of_disjoint`
(`M1.lean:490`) — hypothesis hdisj : every zero of z in the open strip
0 < Re ρ < 1 is a non-zero of w (strip-disjointness) — concludes that the shared
mass (the minimum of the two multiplicities, summed over the strip window;
`SharedMass`, `M1.lean:475`) is zero at every height T.

**Theorem 5 (not claimed here).** The hCZ statement (common-zero control at
η > 1/6 from the factors' 5/6-distinct theorems) is PAPER-ONLY; it lives in the
companion note, has no declaration in `M1.lean`, and is not an article claim.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| zeta23 engine (anthropics_formal-math): `thmA₀_N0` (`Zeta23/Final.lean:356`), `trivial_chain` (`Zeta23/Statement.lean:157`), five-field card `PaperInputs` (`Zeta23/Hypotheses.lean:147`) | the density engine and its two instantiations, for ζ and Dirichlet L | transcribed here as hypotheses (`Card20`, `TracesFamily`, `EngineStep`), never re-proved; this article owns only the configuration-level restatement (Theorems 1–2) and the merging and atom lemmas (Theorems 3–4) |
| L. Alpöge, A. Furman, arXiv:2608.13637 | the zero-density method the engine formalizes | mathematical backdrop; no configuration-level interface and no merging lemmas there |
| articles 42 (v2) and 75 (this corpus) | ζ_K / ζ_L zero-proportion theorems | independent of this interface: each carries its own copies of the counting lemmas — 42: `assemble_eps` (`research/pilots/42/M1.lean:220`) and defect variants (`research/pilots/42/M4a.lean:704/:1023`); 75: `assemble_eps` (`research/pilots/75/Pb.lean:253`) and the n-ary `assemble_eps_defect_strip_cum_fin` (`research/pilots/75/Pb.lean:2064`); neither imports `pilots/20/M1.lean` |

## 5. Proofs

**Theorem 1.** `instantiate_family_A` is literally
`fun lam hlam => hstep.hStepA lam hlam (htf.atLambda lam hlam)` (`M1.lean:440`); B
and C are the same at `hStepB`/`hStepC`. The card is carried so that its eventual
discharge slots in unchanged. ∎

**Theorem 2.** Take λ = 1 − δ, 0 < δ ≤ 1/2. The three explicit bounds
(`hfun_one_sub_le` `M1.lean:219`, `ffun_one_sub_le` :237) are
H(1 − δ) ≥ 2/3 − 5δ/3, 2F(1 − δ) − 1 ≥ 1/2 − 5δ/4 and F(1 − δ) ≥ 3/4 − 5δ/8. Choose
δ = min(3ε/10, 1/4), min(2ε/5, 1/4), min(4ε/5, 1/4) respectively, so the δ-term is
≤ ε/2; the family bound at λ with ε/2 gives the claim (`M1.lean:247–299`). ∎

**Theorem 3.** With-multiplicity counts are additive: `count_add`/`countOn_add`
(`M1.lean:163/:170`) distribute the finite sum over supp z ∪ supp w, giving
N_{z+w} = N_z + N_w and N^on_{z+w} = N^on_z + N^on_w; `assemble_eps` adds the two
ε-inequalities at the same ε and c (T₀ = max of the two thresholds). `family_merge`
applies this pointwise in λ; `two_thirds_of_components` composes with Theorem 2. The
factorization step is `count_add_of_factorization` (`M1.lean:402`). ∎

**Theorem 4.** (i) Immediate from (z + w)(ρ) = z(ρ) + w(ρ) (the sum is pointwise on
multiplicities). (ii) At a strip point where z.mult ρ ≠ 0, hdisj gives w.mult ρ = 0,
so min(z.mult ρ, w.mult ρ) = 0 and the shared-mass sum vanishes. ∎

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1 (A/B/C) | `instantiate_family_A` / `instantiate_family_B` / `instantiate_family_C` | `research/pilots/20/M1.lean:437/:442/:447` | {propext, Classical.choice, Quot.sound} | `research/pilots/20/logs/axcheck-cycle2.log:56–58` |
| Thm 2 | `family_to_two_thirds` / `family_to_half` / `family_to_three_quarters` | `research/pilots/20/M1.lean:247/:284/:266` | {propext, Classical.choice, Quot.sound} | `research/pilots/20/logs/axcheck-cycle2.log:48–50` |
| Thm 3 (binary merge) | `assemble_eps` | `research/pilots/20/M1.lean:188` | {propext, Classical.choice, Quot.sound} | `research/pilots/20/logs/m1-cycle2-green.log:57` |
| Thm 3 (family merge) | `family_merge` | `research/pilots/20/M1.lean:525` | {propext, Classical.choice, Quot.sound} | `research/pilots/20/logs/axcheck-cycle2.log:51` |
| Thm 3 (constants from components) | `two_thirds_of_components` | `research/pilots/20/M1.lean:534` | {propext, Classical.choice, Quot.sound} | `research/pilots/20/logs/axcheck-cycle2.log:52` |
| Thm 4 (i) | `merged_mult_of_common` | `research/pilots/20/M1.lean:513` | {propext, Classical.choice, Quot.sound} | `research/pilots/20/logs/axcheck-cycle2.log:63` |
| Thm 4 (ii) | `sharedMass_eq_zero_of_disjoint` | `research/pilots/20/M1.lean:490` | {propext, Classical.choice, Quot.sound} | `research/pilots/20/logs/axcheck-cycle2.log:62` |
| Thm 5 | — (companion note) | — | — | — |

- Substrate for every row: mathlib `ff2494ea`, Lean v4.36.0-rc2; the axiom column is
  the printed `#print axioms` output at the cited log line; each cited log carries a
  provenance header. The sweep extract `axcheck-c2-final.log:3` reports the file OK
  with 38 axiom-lines, 0 sorryAx; the axiom-audit extract `axcheck-cycle2.log:1`
  reports 36 (its comment-aware extractor stages 26 theorems).
- `M1.lean` is 582 lines: 26 named theorems + 2 anonymous examples (28 declarations);
  one raw `^theorem` line (`:524`) is docstring prose.

## 7. Limitations and open problems

1. The card for a *new* L-function (e.g. ζ_K itself) needs a Weil explicit formula and
   Riemann–von Mangoldt for the target — the engine route's true cost, unchanged by
   this restatement.
2. Distinct/simple/window constants do not pass the interface; the obstruction (hCZ)
   and what would unblock it are the companion note's subject — no claim is made here.
3. No consumer uses this interface: articles 42 and 75 prove their assemblies from
   their own copies of the counting lemmas (§4). The interface's residual value is the
   restatement of what the engine route needs at configuration level, and the carried
   discharge anchor of Theorem 1.

## 8. Prior work and references

Literature:

- L. Alpöge, A. Furman, arXiv:2608.13637 — the zero-density method the engine
  formalizes.

Project artifacts:

- `research/pilots/20/M1.lean`, `research/pilots/20/logs/`,
  `research/pilots/20-blueprint.md` — the elaboration record of Theorems 1–4.
- `research/pilots/20-seam-analysis.md` — companion note: the common-zero seam
  analysis, Theorem 5, and the classical common-zero literature (Li 2012;
  Garunkštis–Kalpokas; Gonek's heuristics; Ingham; Huxley).
- anthropics_formal-math `zeta23`: `Zeta23/Final.lean:356`, `Zeta23/Statement.lean:157`,
  `Zeta23/Hypotheses.lean:147` (cited in §4) — the engine's source formalization,
  transcribed and never re-proved.
- Independent consumers: `research/pilots/42/`, `research/pilots/75/` (locators in §4).

