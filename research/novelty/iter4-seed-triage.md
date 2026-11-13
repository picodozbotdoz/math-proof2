# ITER-4 SEED TRIAGE — novelty PRE-CHECK (lane A5, 2026-11-14)

**Scope discipline:** this is a PRE-CHECK on A1's `feasibility/ITERATION4-SCAN.md` §2
(12 seeds), NOT a round-4/round-5-grade novelty sweep. Verdicts lean on the existing
sweep record (rounds 1–4, VERDICTS main + Cycle-2) + one fresh arXiv spot-check
(seed 1); no per-seed query battery was run. Labels: **NEW-LEAN** (no known
mathematical antecedent found for the statement shape; formalization- and/or
glue-grade novelty plausible) · **POSSIBLY-KNOWN** (material risk the statement or a
close variant exists informally — round-level sweep REQUIRED before chartering) ·
**LIKELY-DEAD** (known or taken; do not charter as discovery) · **DONOR/INFRA**
(not a novelty claim — infrastructure or donor-consumption seed; excluded from
novelty counts). A1 may still be mid-selection — these verdicts are independent.

| # | Seed (A1 §2) | Known-result risk (informal lit) | Corpus-collision risk | Verdict | One-line reason |
|---|---|---|---|---|---|
| 1 | **AreaLaw2D 3D continuation** (Statements3D + docs/3D/Targets.md; our 2D-gap→entropy machinery ports) | **LOW-MED** (spot-check 2026-11-14: arXiv `area law + gapped + 3D` = no theorem for gapped ground states in 3D/general d — best hits are 2D-only, assume-the-law (1411.6614), or special states (1901.01260)); **PRE-CHARTER GATE RUN 2026-11-14: PASS — evidence below the table** | LOW (statements FIXED in-corpus by the repo itself; nothing else carries 3D area-law statements) | **NEW-LEAN** (conditional/glue grade) | No informal 3D-from-global-gap theorem found; the repo's own fixed statements + Kuwahara-discipline framing make this the cleanest NEW-LEAN of the set — but the general 2D gapped law is still open informally, so keep every statement binder-conditional (AAG 2103.02492 = frustration-free 2D only) |
| 2 | **ZZV2 λ-family parameterization** (expose Λ-family at the challenge layer à la zeta23 thmA/B/C_lam) | **HIGH for the math, LOW for the artifact** — Lamzouri's proportions ARE λ-parametric informally (the λ-dependence is the paper's content); so the statement family is KNOWN-INFORMAL | NONE (V2 challenge layer frozen at λ=1 in-corpus; no other corpus exposes the family) | **NEW-LEAN** (formalization-first; label like 73's "math is 25 years old") | Pure formal-parameterization glue on a BUILT donor (G2) — the novelty is the Lean λ-layer, not the theorem; must-cite Lamzouri as the entire informal content |
| 3 | **22-T2a on upstream StrongPNT** (ψ = x + O(x^{7/8+ε}) from a quasi-RH binder; upstream PNT+ donor proved) | **MED** — conditional PNT-with-exponent from zero-free strips is classical machinery (row-22 verdict: "formalization-first"); the specific 7/8-band formal statement exists nowhere | **MED — mathlib PR clock** (#43238-family may land PNT; standing note since main run) | **NEW-LEAN** (formal, dated) | Statement-port≈0 donor now EXISTS proved upstream; the formal conditional error term is unclaimed — but the mathlib-PR clock can devalue it, charter fast or binder-shape it |
| 4 | **FF-EZ2 surviving statement** (the one exclusion/family-quantified proportion that survives the supersingular trap) | **LOW** per the r4 §1 record (FF-2/FF-5/FF-6 all clean; Suzuki 2610.41115 = method neighbor only); A1's "family version literature-occupied" = Katz–Sarnak LIMITS, not the proportion statements themselves | LOW (no FF proportion statements anywhere in-corpus; dossier 71 in flight on our side) | **NEW-LEAN** (re-verify at dossier level) | The r4 §1 pre-check already cleared the shapes; the trap analysis is done; gate on 71-P2/73-C landing per A1's own note |
| 5 | **FF-EZ4 genus-1 identification** (tauceti zetaFunction = Weil zetaSeries at an elliptic curve; HasseBound as g=1 case) | **TOTAL for the math** (Hasse 1936; the identification is a 90-year-old dictionary) — but nobody claims it as discovery | LOW (both halves in-corpus on our toolchain; G6b measured the instance path) | **NEW-LEAN** (glue-grade, formalization-first) | Classical dictionary, zero formal presence; value = the t↔s/s↔Frobenius dictionary node every other FF seed consumes — 71's pattern, not a discovery |
| 6 | **FF-EZ5 family counting** (RvM-style N(T) analog over families; fixed-curve version degenerate) | **DECISIVE — occupied**: Faifman–Rudnick 0803.3534 (= Compositio Math. 146 (2010) 81–101) proves exactly the family zero-counting statistics: hyperelliptic family over FIXED 𝔽_q, g→∞, interval counts N_I with mean 2g·\|I\|, variance ∼ const·log(2g\|I\|), CLT, and shrinking intervals whenever 2g\|I\|→∞; Katz–Sarnak covers the equidistribution half for general families (abstract pulled 2026-11-14) | LOW | **LIKELY-DEAD** (standalone; **check run 2026-11-14 — differentiation analysis below the table**) | The literal "family counting analog" IS Faifman–Rudnick's theorem; the only survivors are (i) uniform every-curve lower bounds — but those are FF-EZ2/row-4's proportion territory AND are refuted in any family containing (near-)maximal members (all 2g angles pile at θ=π, zeroing N_I elsewhere — the §6.3/P2-11 trap mechanism; which families admit maximal hyperelliptic members = the dossier-level check), and (ii) CLT/variance for OTHER families = new-math monodromy work, not glue — FOLD INTO ROW 4; do not charter standalone |
| 7 | **Kontorovich/quasi-rh 11/12 as binder donor** | n/a (external artifact, README-claimed, no ζ_K — r4 §8.3) | n/a (v4.34.1 external pin = statement-level only, DO-NOT-CONSUME class) | **DONOR/INFRA** | Sharpest ζ/Dirichlet binder constant available statement-level; feeds 50-M2-class pilots, no novelty claim attached |
| 8 | **de Bruijn–Newman Λ ≤ 9/32 (DrMurphyIsIn)** | n/a (theorem TAKEN by third party, kernel-checked — main-run round-1 §12 gap closed) | n/a | **DONOR/INFRA** (with a DEAD edge) | Donation-surface/context only; any "first formal Λ" claim is dead on arrival — a next-cycle Λ candidate must START from this artifact and add new content |
| 9 | **Shared LP-duality layer (02-core + 74-T3)** | **TOTAL for the math** (LP weak duality is classical); formal layer UNCLAIMED (r5 §5.2(b): mathlib `Cone/Basic.lean` lists LP duality as an explicit TODO; Yamashita = algorithmic HSD variant only) | LOW (Knausgård `law_lp.py` is Python — the de-risking note stands) | **NEW-LEAN** (infrastructure theorem, two-consumer) | One Lean layer unlocks dossier 02 core + 74-T3 across cycles; carry 74's **u ≠ 1** conditioning (P2-10 rpow note) into the layer's design |
| 10 | **50-M2-R3 Liu-1 statement-binder (34999/40000)** | n/a (pilot route, not a statement) | n/a | **DONOR/INFRA** | Route R3 already G7-CLEAN; NOTE the §9 tracker refinement — the tracker replayed Liu at the EXACT algebraic (1507−2√921)/1653 on its own vendored tree, so the sharper constant exists statement-level but on a DO-NOT-CONSUME pin; R3 as specced (34999/40000) remains the cheapest |
| 11 | **tauceti within-corpus empty zones** (5 pairs: type-II codes↔theta; orbit zeta↔Lefschetz; CAR/Fock↔QFT; free prob↔RMT eigenvalue flow; Vaught↔Morley–Vaught) | **HIGH per-pair on the DICTIONARIES** (codes↔theta = Nebe–Rains–Sloane-grade textbook; orbit-count↔Lefschetz = classical; free-prob↔Dyson flow = Voiculescu/Biane–Speicher line; Morley–Vaught = classical model theory) — the un-mined value is the in-corpus GLUE, not the correspondence | **RAISED (CAR pair, check run 2026-11-14 — analysis below the table)**: physlib (HEPLean's successor, pushed 2026-11-13T16:16Z) now carries `FieldStatistics/ExchangeSign.lean` = the statistics-universal ε=±1 exchange-sign calculus (both statistics; symmetric, involutive, COCYCLE) + sign-aware `WickContraction/` (`Sign/`, `Involutions.lean`) — 52's "bosonic instance only" collision note is STALE; mathlib (our pin) rg-clean of FieldStatistic/WickContraction | **POSSIBLY-KNOWN** (bundle) — **CAR-half INHERITANCE BROKEN: downgraded from NEW-LEAN edge; the "statistics-universal sign-calculus" framing is LIKELY-DEAD as future novelty (physlib's exchangeSign took the exchange-sign layer; our own article 52 took the occupation-pair layer)**; surviving CAR-pair content = fermionic dual-family theorem (N1b) + CAR weight dictionary (N3) + the tauceti↔physlib bridge itself | Each pair needs its own dossier-level sweep before chartering; charter them as formalization-first dictionary nodes (71/73 pattern), never as new correspondences; the CAR pair must differentiate from BOTH article 52 (ours, proved) and physlib's Wick stack — see also the row-52 staleness note added to VERDICTS §5.1 (2026-11-14) |
| 12 | **Weil-as-binder for FF window clauses** (G3 CLEAN; consume Weil RH by binder, no Stacks build) | n/a (machinery) | n/a | **DONOR/INFRA** | The enabling pattern for seeds 4/5/6 window transports — ranked with them, not separately |

**Seed-1 pre-charter gate — RUN 2026-11-14, verdict PASS** (rg over the local corpora;
evidence lines):

- `openai-math/preprints/A-two-dimensional-area-law-from-a-global-spectral-gap-
  September-24-2026` (the OAI265 tex tree): **0 hits** for three-dimensional /
  dimension three / 3D / cylinder — the paper has no 3D corollary at all.
- PEPS companion (`Polynomial-PEPS-approximation…September-24-2026`): "cylinder"
  appears ONLY as Hilbert-space patch terminology (patch-cylinder projections,
  `03-patches.tex:21/:113/:562`), not spatial 3D; no three-dimensional content.
- Corpus-wide preprint tex sweep (files matching "area law" AND 3D-words): only
  unrelated LQG/FK-planar-map papers (area = LQG area measure, not entanglement).
- `openai-math/lean/` (incl. `OAI/`, `ComparatorChallenges/`): area-law mentions in
  exactly 2 files (`OAI/MathematicalPhysics/PEPSFilters/Basic.lean`,
  `PEPSMove/GridStates.lean`), **neither 3D**; no 3D ComparatorChallenge exists.
- Substrate premise CONFIRMED on the AreaLaw2D side: `OpenAI/Statements3D.lean` =
  frozen `def : Prop` targets, nothing proved (header: "Every declaration here is a
  definition; nothing is proved... statements are frozen"); `OpenAI/Cylinder3D.lean`
  = the B.1 cylinder-over-planar-domain corollary PROVED (reduction
  `cylinderAreaLawOfPlanar3D` + law `cylinderAreaLaw3D`, 0 sorry).
- **Charter-shaping caveat from the substrate itself** (`docs/3D/Targets.md` §A):
  the north-star `AreaLaw3D` is explicitly "not a target" — the 2D proof does not
  reach it; four named obstructions needing NEW mathematics (C.1 scanner exponents
  §9, C.2 first subvolume exponent §3.3, C.3 amplification radius §10, C.4 point
  contacts §11; "Any document or commit that claims progress on `AreaLaw3D` should
  say which of the four it resolves"). The charterable NEW-LEAN surface is the
  PARTIAL-target ladder B.2–B.5 (B.2 slab domains — repo sketches the
  fibre-over-ℤ² route; B.3 positive replacement; B.4 amplification; B.5 assembly),
  with B.1 already done in-repo. A slot-2 proposal should name its B-rung, and any
  `AreaLaw3D`-adjacent claim must cite which obstruction it resolves.

**Seed-6 differentiation check — RUN 2026-11-14, verdict LIKELY-DEAD (standalone):**

F–R's exact statement set (abstract, arXiv API): family = hyperelliptic curves over a
fixed 𝔽_q, g→∞; quantity = N_I(C) = # zeros with angle in I ⊂ the angle circle;
results = equidistribution (mean 2g|I|), Var(N_I) ∼ const·log(2g|I|), CLT, all
surviving shrinking intervals with 2g|I|→∞. Against A1's bridge row ("the counting
analog lives over families"): the AVERAGE-case family counting analog is therefore
DONE informally (2010, published Compositio). What F–R does NOT give:

1. **Uniform/every-curve bounds** (zeta23-style lower bounds valid for EVERY family
   member, not on-average) — but this is row 4 / FF-EZ2's proportion territory, and
   it is REFUTED in any family containing (near-)maximal members: a maximal curve
   has ALL 2g Frobenius angles at θ = π (the r4 §6.3/P2-11 mechanism), so N_I → 0
   for I away from π while 2g|I| → ∞ — an every-curve statement needs
   family-specific exclusion hypotheses exactly like FF-EZ2's design rule. Which
   families contain maximal hyperelliptic members (vdG–vdV Zbl 0729.11066 lineage)
   = the dossier-level check, NOT resolved here.
2. **CLT/variance for other families** (non-hyperelliptic, varying q, plane curves)
   = genuinely new mathematics (new monodromy computations), the OPPOSITE of
   glue-grade — out of scope for this program's pilot model.
3. **Explicit/effective versions** of the F–R variance constant = refinement-grade.

Folding conclusion: charter the surviving content under FF-EZ2 (row 4) as its
counting-half; the standalone seed is dead.

**Seed-11 CAR-half inheritance check — RUN 2026-11-14, inheritance BROKEN (partial):**

The triage's original line "CAR/occupation-universal half inherits dossier 52's r5
verdict (NEW-CLAIM-SUPPORTED narrow)" relied on r5 §5.1's collision note "bosonic
instance anticipated by PhysLean; the universal statement and the fermionic side
carry the novelty". That note is **STALE as of 2026-11-13**:

- physlib = HEPLean's successor home (`leanprover-community/physlib`, 834 stars,
  pushed 2026-11-13T16:16:11Z — active daily). `Physlib/QFT/PerturbationTheory/
  FieldStatistics/ExchangeSign.lean` (author Joseph Tobey-Smith, read verbatim
  2026-11-14) defines `exchangeSign : FieldStatistic →* FieldStatistic →* ℂ` with
  `𝓿(a,b) = -1` iff both fermionic — i.e. **the statistics-universal ε=±1
  exchange-sign calculus for BOTH statistics**, with `exchangeSign_symm`,
  `exchangeSign_mul_self`, **`exchangeSign_cocycle`**, and `ofList`-cons
  multiplicativity (list/permutation layer). This takes 52-N1's
  "universal-calculus" core at the operator-exchange layer.
- `WickContraction/` (18 files) carries a dedicated `Sign/` subdirectory +
  `Involutions.lean` — sign-aware, fermionic-inclusive contraction machinery
  (consistent with Tooby-Smith's normal-ordered Wick paper having covered both
  statistics; **file-level read of `Sign/` now DONE 2026-11-14 — see the closure
  block below**).
- Scope checks: mathlib on OUR pin (ff2494ea) has NO FieldStatistic/exchangeSign/
  WickContraction (rg clean) — the collision is external, not in-corpus; tauceti's
  CAR side is REAL and rich (`Algebra/Lie/GeneralLinear/Fock.lean`: `glCliffordHom`,
  `carLieModule`; `CAR/Casimir.lean`: `representation_glCasimir_car_apply`; frozen
  #n ≠ 0 faithfulness hypothesis + only-gl n noted as empty zones in survey).

Net for the CAR pair: **the exchange-sign layer of the "statistics-universal" framing
is LIKELY-DEAD as future novelty (physlib's exchangeSign + sign-aware Wick stack)** —
but PRECISION (corrected after reading physlib's file): physlib's object is a sign
cocycle on the statistics TYPE, NOT an occupation-pair axiomatization (no
creation/annihilation relations, no vacuum, no dual-family), so article/dossier 52's
occupation-pair layer and dual-family theorem remain ours-and-unclaimed-by-others; any
NEW CAR-pair charter must differentiate from BOTH (our 52 + physlib's Wick stack).
Still clean per this scan: 52-N1b (fermionic dual-family), 52-N3 (CAR weight
dictionary), and the tauceti↔physlib bridge statement itself (cross-corpus glue,
71/73-pattern). VERDICTS §5.1 now carries a dated staleness note (row 52's clock).

**Seed-11 CAR check — Sign/ file-level read CLOSED 2026-11-14 (the owed item):**

What the sign-aware Wick layer actually proves, at file level (all read verbatim
2026-11-14; full map in `novelty/physlib-surface.md`):

- `WickContraction/Sign/Basic.lean` (Tooby-Smith, 2025): `signFinset c i1 i2` (the
  filtered in-between index set) and **`sign (φs : List 𝓕.FieldOp) (φsΛ :
  WickContraction φs.length) : ℂ := ∏ (a : φsΛ.1), 𝓢(statistic of the pair's second
  field, statistic of the filtered in-between set)`** — the exchange-sign product
  counting fermion-fermion exchanges needed to bring contracted pairs together
  (docstring examples: {0,2},{1,3} on four fermions ⟹ −1). Only two lemmas in
  Basic (`sign_empty`, `sign_congr`); the inductive algebra lives in `Sign/
  {InsertNone (11.8 KB), InsertSome (38.9 KB), Join (21.5 KB)}` — sign behavior
  under contraction insertion/join, the engine behind the both-statistics Wick
  theorems of Tooby-Smith 2505.07939.
- **The occupation-pair boundary is CONFIRMED at file level, both sides:**
  `CreateAnnihilate.lean` = a two-element tag type + a total/transitive
  `normalOrder` relation — NO exchange relations; `FieldSpecification/
  CrAnFieldOp.lean` = the sigma type `Σ (s : 𝓕.FieldOp), 𝓕.fieldOpToCrAnType s`
  with statistics/forgetful maps (`crAnStatistics`, `crAnFieldOpToFieldOp`) —
  "no algebra structure is imposed", zero (anti)commutator theorems. The ONLY
  ε = ±1 algebra in physlib is the `exchangeSign` cocycle on the statistics TYPE
  plus its contraction-sign lift. Article 52's occupation-pair axioms
  (c_ic_j = ε c_jc_i; a_ic_i = 1 + ε c_ia_i; vacuum; dual-family) therefore have
  NO physlib counterpart — the precision-corrected boundary stands as written
  above, now evidence-closed.

## Reading for the charter (counts + gates)


- **Novelty-bearing seeds: 6** — NEW-LEAN: 1 (3D continuation — gate PASSED), 2
  (λ-family, formal-first), 3 (22-T2a, dated by the mathlib clock), 4 (FF-EZ2
  survivor — now also carries seed 6's surviving counting-half), 5 (EZ4 g=1
  dictionary), 9 (LP-duality layer). POSSIBLY-KNOWN: 11 (per-pair dictionary
  sweeps; CAR pair scoped to N1b/N3/bridge only). LIKELY-DEAD: 6 (standalone —
  Faifman–Rudnick; fold into row 4). DONOR/INFRA: 7, 8, 10, 12.
- **Highest-value single gate:** seed 1 — the only seed whose target statements are
  (i) absent from the informal literature (spot-check clean), (ii) already FIXED
  in-corpus at statement level, and (iii) fed by a proved machinery port path
  (G4/G5). **Pre-charter gate RUN and PASSED 2026-11-14** (evidence block above) —
  slot-2 proposal is cleared, aimed at the B.2–B.5 partial-target ladder (NOT the
  C.1–C.4-obstructed north star).
- **Fastest de-risk:** seed 9 (the LP layer) — unclaimed formally, two named
  consumers, classical math; effort S–M; do it FIRST regardless of which
  discovery-grade seeds win slots (it is the 74/02 dependency either way).
- **Deepest novelty risk:** ~~seeds 6 and 11~~ — RESOLVED 2026-11-14: seed 6 is
  LIKELY-DEAD standalone (Faifman–Rudnick occupation; fold into 4); seed 11's CAR
  occupation-calculus core is LIKELY-DEAD (physlib ExchangeSign), leaving N1b/N3/
  bridge — seed 11 still must not reach a charter without per-pair round-level
  batteries.
- **Standing clocks that date every verdict here:** tracker leaderboard (~daily,
  Dirichlet class — r4 §9.5 recipe); mathlib PNT PRs (seed 3); Suzuki/WenrongZou
  (FF + Tate neighborhoods, seeds 4/5/6); Kuwahara program (seed 1's Rényi-α
  discipline); **physlib = leanprover-community/physlib (seed 11's CAR pair —
  FIRED once already on 2026-11-13: ExchangeSign took the universal-calculus core;
  the Sign/ read is now CLOSED — re-check `FieldStatistics/` +
  `WickContraction/Sign/` + `WickAlgebra/` before any CAR charter; the standing
  surface map is `novelty/physlib-surface.md`)**.
- **Pre-check honesty:** verdicts marked NEW-LEAN here are STARTING positions with
  the round-1..4 evidence base behind them, not finished novelty verdicts; every
  charter must run its dossier-level battery (round-4 PART-2 pattern) before any
  N-score or "first X" phrasing is written.
