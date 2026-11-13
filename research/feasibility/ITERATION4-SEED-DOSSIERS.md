# ITERATION4-SEED-DOSSIERS — pre-dossiers for the top iteration-4 seeds (lane A1, 2026-11-14)

Phase-3-lite assembly from `feasibility/ITERATION4-SCAN.md` §2, deepened with donor-file
reads this session. **Pre-dossiers, not dossier-final**: every seed carries
**[NOVELTY-CHECK-NEEDED]** marks where the next cycle's novelty lane must do real work —
novelty is NOT pre-verified here. A5's quick triage over the scan's §2 seeds
(`novelty/iter4-seed-triage.md`) **LANDED 2026-11-14 and is folded in below**: all three
selections NEW-LEAN (grade notes per seed); no escalation was triggered.

## 0 Selection (rule: novelty × significance ÷ effort, from the scan's own data)

**A5 triage FOLDED (2026-11-14, `novelty/iter4-seed-triage.md` landed):** all three
selected seeds **NEW-LEAN — no escalation triggered** (no POSSIBLY-KNOWN/LIKELY-DEAD on a
selection). One-line adjusts: seed 1 = "cleanest NEW-LEAN of the set" (conditional/glue
grade; pre-charter check = rg the OAI family-265 companion preprints for 3D corollaries);
seed 9 = NEW-LEAN **Lean-ecosystem scope only** (AFP check RUN 2026-11-14:
**AFP-HAS-LP_DUALITY** — Isabelle `Farkas`/`Linear_Programming`/`LP_Duality` + Coq
1706.10269 own the theorem class, all mandatory nearest-miss citations; "do it FIRST
regardless of slots"; mathlib `Cone/Basic.lean:37` TODO verified on-pin);
seed 2 = NEW-LEAN **formalization-first** (Lamzouri's proportions ARE λ-parametric
informally — the math is known-informal, the Lean λ-layer is the artifact; must-cite
Lamzouri as the entire informal content; label like dossier 73's "math is 25 years old").
Triage's POSSIBLY-KNOWN verdicts (seed 6 FF-EZ5 Faifman–Rudnick; seed 11 tauceti pairs)
are on NON-selected seeds — noted in §0's watch list.

Selected:
1. **AL-3D partial-target layer** — ≈3.25 N × 3.75 S ÷ 1.75 E ≈ **7.0**: the only seed
   where the donor has ALREADY fixed the statements AND attached an engineering-grade
   provability analysis (`docs/3D/Targets.md` verdicts); G4/G5 prove the 2D layer
   elaborates mathlib-only. [A5: NEW-LEAN, cleanest of the set]
2. **Shared LP-duality layer (02-core + 74-T3)** — nominal ≈5.25 but **effectively
   doubled**: one layer discharges the cores of two dossiers across two cycles, both
   sides novelty-clean after round-4 (02 HOT re-scope; 74 P2-6..P2-10 CLEAN).
   [A5: NEW-LEAN **Lean-ecosystem scope only** — AFP trio + Coq own the theorem class
   (mandatory nearest-miss citations); do-it-FIRST; slot value = mathlib-native layer +
   two in-repo consumers]
3. **ZZV2 λ-family parameterization** — ≈6.25 nominal, glue-capped, but zero-gate
   (V2 = BUILT donor per G2) and stack-reusable by 42-M4/75-assembly; picked over FF-EZ4
   (same nominal score) because FF-EZ4's value decays if 71-P2 lands the FF dictionary,
   while this seed is independent of every in-flight pilot. [A5: NEW-LEAN
   formalization-first — known-informal math; grade note folded into the dossier below]

Not selected, one line each: **FF-EZ4 genus-1** — pure glue, consumed by 71-P2's landing;
**FF-EZ2 survivor** — month-clock + family version literature-occupied; **22-T2a** — small
well-scoped task, not a seed; **Weil-as-binder** — consumed BY in-flight 71-P2 rather than
standalone; **Kontorovich 11/12 & de-Bruijn–Newman Λ** — donation-surface notes; **tauceti
within-corpus zones** — need their own bridge round before dossier-grade assembly.

---

## Seed 1 — AL-3D: the AreaLaw2D partial-target layer (B.2–B.5) on our pin

**[A5-triage-pending → FOLDED: NEW-LEAN (conditional/glue grade), "cleanest of the set" —
fresh arXiv spot-check found no 3D-from-global-gap theorem (best hits 2D-only / assume-the-
law 1411.6614 / special states 1901.01260; AAG 2103.02492 = frustration-free 2D only ⇒
keep every statement binder-conditional). Residual NOVELTY-CHECK-NEEDED: rg the OAI
family-265 companion preprints (`openai-math/preprints/…September-24-2026/`) for any 3D
corollary — in-corpus, one rg away; third-party formal activity on AreaLaw2D's 3D layer]**

**Statement sketch.** Three-stage pilot: (a) port the 3D statement layer (32 `def … : Prop`
in `OpenAI/Statements3D.lean`) to mathlib-only on our pin — G4 precedent says the 2D layer
re-derives mathlib-only, Physlib not needed at statement level; (b) prove the named
B-rung — **B.2 (`SlabAreaLaw3D`) staged by A2's `pilots/al-3d-prework.md`; B.3
(`PositiveReplacement3D`, "the most routine of the targets and the foundation of B.4" —
Targets.md :65) the alternative — decided at launch; AL-P0 serves either rung
identically** — and `Amplification3D` (B.4, :77), consuming the 2D layer as binders;
(c) state-and-prove the conditional assembly `AreaLawAssembly3D` + hypothesis
`TwoFamilyDecomposition3D` (B.5, :89) — the interface-freezing theorem whose hypotheses
are honestly not-known-consistent (β > 1, C.3/C.4). NEVER target `AreaLaw3D` itself
(Targets.md §A: "not a target", four named blockers C.1–C.4). Cylinder B.1 is already
proved in-donor (`OpenAI.cylinderAreaLaw3D`, `OpenAI.cylinderAreaLawOfPlanar3D` in
`OpenAI/Cylinder3D.lean`) — do not re-prove; cite as competitor-owned.
**[A5 charter-shaping caveat, folded 2026-11-14: the charterable surface is the B.2–B.5
ladder — any pilot slot must NAME its B-rung, and any AreaLaw3D-adjacent claim must
explicitly cite which obstruction (C.1–C.4) it resolves.]**

**Why-new pre-check (five corpora).** Statements exist in-corpus as UNPROVED challenge
defs — our claim shape is the proofs (formal-new) + any new conditional assembly, not new
statements. mathlib: no lattice-graph area-law layer at all (AreaLaw2D's Region core is
donor-vendored, G5a import map). openai-math: 2D family-265 interface only
(`OAI/.../EntropyMoments.lean`, `OpenAI/Statements.lean`); no 3D content (its Statements
are `ℤ²`). anthropics / tauceti: nothing adjacent (surveys). axiommath: only AreaLaw2D
itself — and it proves exactly B.1. The donor's own Targets.md (:29–:92) is the only
provability analysis we know of; the source paper [OAI265] is 2D-only.

**Donor map (exact).** `axiommath/AreaLaw2D/OpenAI/Statements3D.lean`: `AreaLaw3D` :153,
`SlabAreaLaw3D` :175, `CylinderAreaLaw3D` :187, `CylinderAreaLawOfPlanar3D` :201,
`PositiveReplacement3D` :212, `Amplification3D` :250, `CollarBound3D` :334 (C.1-frozen),
`InitialBoxEstimate3D` :377, `TwoFamilyDecomposition3D` :402, `AreaLawAssembly3D` :426,
plus the 3D geometry defs (`edgeBoundary3D` :98, `IsTemplatePiece3D` :292, `IsTemplate3D`
:302, …). `OpenAI/Cylinder3D.lean` (proved B.1 pair). `docs/3D/Targets.md` (verdicts B.2
:55 "plausible, risk is volume not mathematics", B.3 :65, B.4 :77, B.5 :89; blockers
C.1 :103 scanner exponents, C.2 :111 first subvolume exponent, C.3 :117 amplification
radius > template, C.4 :123 point contacts). 2D black box: `area_law`
(`OpenAI/AreaLaw.lean`). Site-type-polymorphic trio already 3D-ready: `two_family_cancellation`
(`OpenAI/TwoFamily.lean`), `ConditionalContinuity`, `MarginalTails`.

**Feasibility.** Stage (a) S-class statement port (empirical anchor: pilot 10-L1, 529
LoC / 25 thms GREEN, statement+first-proof scale). Stages (b)–(c) M-class per the donor's
own "bounded new work" verdicts — restating-heavy (its words: volume, not mathematics);
no donor build needed (G4 CLEAN; AreaLaw2D statement-level = mathlib-only re-derivation
on our pin). One warm-spot risk: G5a showed the donor's *vendored* build needs Physlib —
avoided entirely by the mathlib-only restatement route.

**Risks / decay.** (i) Active challenge repo — the donor or a contestant may land B.2–B.5
first (the challenge structure invites it); date all claims. (ii) Restating-heavy =
effort, not risk. (iii) C-fences must be honored in every phrasing (no AreaLaw3D
progress claims without naming which C-item is resolved). (iv) Upside: Targets.md B.1's
"question for a physicist" (slab constant bounded as h → ∞?) is a genuinely open,
formalizable-conditional mini-question. **[TRIAGE-DECISION]** rises if 72-M1/C-neg land
green (AL stack warm); falls behind FF if 71-P2/73-C land first.

---

## Seed 2 — The shared LP-duality layer (02-core + 74-T3)

**[Phase-2 mini-bridge WRITTEN 2026-11-14: `feasibility/lp-duality-bridge.md` — exact
consumer statement forms, the verified `Cone/Basic.lean:31–37` TODO absence evidence, the
asymmetric-form layer signature (both consumers have sign-free primal variables), the
consumer-mapping table (the layer discharges exactly the two `≤`-direction clauses), and
the AFP risk flag.]**

**[A5-triage-pending → FOLDED, then AFP check RESOLVED 2026-11-14: NEW-LEAN —
**Lean-ecosystem scope only** (infrastructure theorem, two-consumer). A5 verdict
AFP-HAS-LP_DUALITY: "LP duality (weak AND strong) is formalized in Isabelle/AFP
(`Farkas`, Bottesch–Haslbeck–Thiemann 2019; `Linear_Programming`, Parsert–Kaliszyk 2019
+ arXiv:2403.19639; `LP_Duality`, Thiemann 2022 — maintained through Isabelle2026) and
in Coq (Allamigeon–Katz 1706.10269, 2017); it is absent from mathlib (explicit TODO,
`Analysis/Convex/Cone/Basic.lean:37`, verified on our pin) and from the Lean ecosystem
(Yamashita 2026-06 is an algorithmic HSD variant; no Lean preprint 2024–26). Ours: the
first **mathlib/Lean-native** duality layer and the first **application** of formal LP
weak duality to zero-proportion/entropic certificate programs (02's ceiling programs;
74-T3's surprisal LPs)." Never-phrase list: "first formal LP duality", "unformalized",
any "first" unqualified by Lean/mathlib-native. Residual check: mathlib PRs in flight
only]**

**Statement sketch.** Layer: `lp_weak_duality` — for `A : Matrix`, vectors `b c`, any
primal-feasible `x` (`0 ≤ x`, `A * x ≤ b`) and dual-feasible `y` (`0 ≤ y`, `Aᵀ * y ≥ c`),
`c ⬝ x ≤ b ⬝ y` (ordered-field level; no Farkas/strong duality needed for either
consumer). Consumer 1 (02-core, TRIAGE re-scope): the pair-mass B₂ ceiling LP — state the
k-data-ceiling primal/dual pair and prove the dictionary via weak duality (never claim
"first barrier theory"; Knausgård §7.6 owns all-windows). Consumer 2 (74-T3): the
moment-hierarchy ceiling for `moment p u := ∑ i, (p i)^(1-u)` stated at **u ≠ 1** (the
`Real.rpow` zero-eigenvalue glue note, P2-10: `moment p 1 = card ι` ≠ filtered sum),
bridging `logMoment`/`entropy` (donor `logMoment_derivative : HasDerivAt (logMoment p)
(entropy p) 0`) to MarginalTails' MGF window.

**Why-new pre-check (five corpora).** mathlib: NO LP duality — verified this session by
tree-grep of the encore checkout (`Mathlib/` has no LinearProgramming/Simplex-optimizer;
`Analysis/Convex/` carries separation/Krein-Milman/Birkhoff/Stone only; all `*Simplex*`
files are algebraic-topology/affine). openai-math: moment/entropy objects exist
(`EntropyMoments.lean:93–95`) with NO ceiling/duality theory (P2-6..P2-8: moments only
quantify). AreaLaw2D: `MarginalTails` bounds the MGF (`OpenAI/Statements.lean:460–490`)
but no LP layer. anthropics / tauceti: nothing (surveys). Knausgård: `law_lp.py` =
Python, never a formalization (TRIAGE row 02 note). Round-4 P2-9: no AHS citer proves
class-side lower bounds. **Outside Lean the theorem class is OWNED — Isabelle (AFP trio,
maintained through Isabelle2026) and Coq (2017); the claim is mathlib/Lean-native layer
+ first application to certificate programs, nothing broader** (five must-cites per the
header). The layer's mathematical depth is trivia — the novelty lives in the consumers'
dictionaries.

**Donor map (exact).** openai-math `OAI/MathematicalPhysics/PEPSSubvolume/EntropyMoments.lean`:
`moment` :93, `entropy` :94, `logMoment` :95, `logMoment_derivative` :128 (namespace
`PolynomialPEPS.Subvolume.MGFScalar`). AreaLaw2D `OpenAI/Statements.lean:460–490`
(`MarginalTails` — first clause bounds exactly `log (∑_{0<p j} p j · e^{−u log p j})` =
`logMoment p u`). zeta23/Knausgård ceilings: `novelty/knausgaard-as-donor.md` (`law_lp.py`,
`Ceilings/` — informal precedent only). Specs: `candidates/02-*` (re-scoped core),
`candidates/74-*` §T3.

**Feasibility.** `lp_weak_duality` itself S-class (~100–200 LoC: termwise dot-product
inequality — empirically pilot-22-M1 class, 68 LoC). Consumer 1 M-class (02 row: M core);
consumer 2 M-class riding the same layer (74 row: T3's M rides the shared LP layer).
Sequencing note: the layer first, consumers in parallel after.

**Risks / decay.** (i) LP weak duality alone is math-trivial — N comes ONLY from the
consumers; if the next cycle wants a headline, this seed must bundle a consumer.
(ii) AFP/mathlib-PR prior art on the layer itself (novelty lane must sweep). (iii) 74-T3
stays [HYPOTHESIS] until the LP representation of k-data ceilings is proved
equivalence-grade, not just a bound direction. **[TRIAGE-DECISION]** rises sharply if
72-M1 Tier-C lands (C.3 is the named consumer, AL stack warm); falls if A5's triage
marks the layer POSSIBLY-KNOWN/LIKELY-DEAD.

---

## Seed 3 — ZZV2 λ-family parameterization (proportion constants beyond λ = 1)

**[A5-triage-pending → FOLDED: NEW-LEAN formalization-first — Lamzouri's proportions ARE
λ-parametric informally (the λ-dependence is the paper's content), so the math is
KNOWN-INFORMAL and the Lean λ-layer is the artifact; must-cite Lamzouri as the entire
informal content; residual NOVELTY-CHECK: confirm the paper's exact λ-window and constant
shapes at dossier time]**

**Statement sketch.** Two routes to the same object: `thm_simple_lam : ∀ lam ∈ <proved
window>, ∃ T₀, ∀ T ≥ T₀, C₀(lam) − ε < (simpleOnLineCount T : ℝ) / (zeroCount T : ℝ)`.
Route (a) glue/continuity (S–M): bridge the λ-ABSTRACT propositional layer
(`prop_simple_real_lower {lam : ℝ}` — exists at `Challenge/Basic.lean:146`; siblings
:155, :169, :182) to a qualitative λ-family by continuity of the kernel functional in
λ, anchored at the λ = 1 numeric instantiation (the zeta23 `thmA/B/C_lam` pattern).
Route (b) numeric (L): verify the Montgomery–Taylor kernel-pair conditions for a
λ-family by interval arithmetic with certificate binders (EnclOK precedent) — explicit
C₀(λ), C₁(λ), C₂(λ) closed forms.

**Why-new pre-check (five corpora).** The donor's challenge layer BAKES the λ = 1
constants inline — `thm_simple` (`Challenge/Basic.lean:209–216`) states `3/2 −
(1/√2)·cot(1/√2)` literally; the numeric layer is `ZetaZeros/Numeric/MontgomeryTaylor.lean`
(λ = 1; survey/axiommath.md §2(c): "no λ-family statement is exposed at the challenge
layer"). The λ-abstract props exist but are never instantiated at λ ≠ 1. zeta23
(anthropics) HAS the family pattern for the PAIR-CORRELATION side (`thmA/B/C_lam`) — the
PROPORTION side is unclaimed. DZDF / Weil / tauceti / mathlib: nothing (surveys). Honest
cap: this is parameterization glue over proved machinery — N ceiling ≈ 2–3.

**Donor map (exact).** `axiommath/ZetaZerosV2/Challenge/Basic.lean`:
`prop_simple_real_lower` :146, `prop_distinct_lower` :155, `prop_simple_plus_real_lower`
:169, `prop_simple_or_real_lower` :182 (λ-abstract); `thm_simple` :209, `thm_distinct`
:217, `thm_average` :229, `thm_simple_or_critical` :238, `thm_*_numeric` :256–268 (λ = 1
frozen; challenge placeholders — the PROVED versions are the G2-audited 13 triad-clean
theorems in `ZetaZeros/`). `ZetaZeros/Numeric/MontgomeryTaylor.lean` (λ = 1 numerics).
Consumption class: BUILT donor (G2: full build 8,262 jobs ≈ 15 min warm; 13/13 triad) —
importable as lake dep or binder source on our pin.

**Feasibility.** Route (a) S–M: the prop→thm bridge is analysis-moderate (continuity in
λ of the test-kernel functional `testKernel (eta ^ 2)` / `fourierC` :80/:110); no donor
build, no numerics. Route (b) L: enclosure machinery we have only ever CONSUMED
(zeta23's EnclOK) — building it is a cycle-class effort of its own. Empirical anchor:
pilot 42-M4a (1,194 LoC / 52 thms GREEN) is the assembly-on-V2 benchmark.

**Risks / decay.** (i) Glue-capped novelty — never a headline; value = reusability of
the layer by the 42-M4/75 assembly stack. (ii) A5-fold confirmed: Lamzouri's paper IS
λ-parametric informally, so route (a) is transcription-grade formalization-first BY
DESIGN — the claim shape is the Lean λ-layer artifact, never the math; must-cite Lamzouri
for the entire informal content. (iii) Route (b) duplicates certificate infrastructure
better donated than built. **[TRIAGE-DECISION]** strengthens automatically if
42-M4b-upgrade lands (same V2 stack); multiplies with 75 wave-4 (assembly reuse);
independent of all other in-flight pilots.

---

— end pre-dossiers (A1). Next-cycle inputs only: the novelty lane owns verification
([NOVELTY-CHECK-NEEDED] marks), the orchestrator owns chartering; A5's
`novelty/iter4-seed-triage.md` verdicts should be folded into §0 before TRIAGE.
