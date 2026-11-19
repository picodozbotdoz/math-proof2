# Round-6 — dossier-77 / physlib WickAlgebra novelty re-grade (R9, unit 2)

Lane R9 (novelty/prior-art; A8-lineage adjacent), 2026-11-19. Unit: re-grade dossier-77's
CAR-occupation-dictionary content after the physlib novelty event (master 2026-11-17→18
landing `Physlib/QFT/PerturbationTheory/` — `CrAnFieldOp`/`FieldOpFreeAlgebra`/
`WickAlgebra`; recorded at `pilots/77/T1-record.md:45–56` + dossier §T1/T2 EXECUTION
UPDATE), quantifying the C+ cap movement on the four FB-5/77 charter conditions (battery
§4, `candidates/77-car-occupation-dictionary-laughlin.md` "Conditions on the charter"
(i)–(iv)). Feeds R7's in-flight unit (watchlist row 6, `qa/iter4-review/
a9-iter5-article-watchlist.md:47`: "re-run T1's differentiation against the physlib Wick
layer before chartering" — **this file is that re-run**); R7's files not touched. Sources:
dossier-77 + T1-record (main @ e3d984b = 6f25933 for these files, diff-verified empty),
plus a fresh physlib API read at the CURRENT tick (below).

**Verdict line: T1-core (the dictionary), T2, and T3's surviving Frobenius rung KEEP their
grades — the Wick event touches none of them; T1's CAR-relations-transport SUB-rung drops
to formalization-parity in BOTH corpora; the C+ cap itself does NOT move (it was already
binding) — what moves is the billable share under it, which narrows to the dictionary
alone; the physlib clock is STILL LIVE (new tick 2026-11-19T11:23:12Z) and the 11-19
differentiation re-run HOLDS (zero Clifford/quadratic-form content in the wing).**

---

## 0. Event verification + fresh tick (R9, at source)

- Event wing verified via gh API at the 2026-11-18 state (per T1-record) and re-read at
  the CURRENT master tick `pushed_at = 2026-11-19T11:23:12Z` (the clock moved again —
  condition (iii) stays live): `Physlib/QFT/PerturbationTheory/{CreateAnnihilate,
  FeynmanDiagrams, FieldOpFreeAlgebra, FieldSpecification, FieldStatistics, Koszul,
  WickAlgebra, WickContraction}` — the 54-file Tooby-Smith wing as recorded.
- Equal-statistics content confirmed at source: `WickAlgebra/Basic.lean`
  `ι_superCommuteF_of_create_create`, `ι_superCommuteF_of_annihilate_annihilate`,
  `ι_superCommuteF_zero_of_fermionic` (+ `SuperCommute.lean` ideal machinery) — the CAR
  half in supercommutator-quotient form, general field specification.
- Differentiators re-checked on the 11-19 tick, all still ABSENT in the wing:
  **Clifford / quadratic-form content = 0 hits** (Basic/SuperCommute/Grading);
  `WickAlgebra/Grading.lean` is the boson/fermion STATISTIC grading (ℤ₂), not a
  particle-number/occupation block theory — no T2 content; no {a,a†} operator equation
  (supercommutators stay central by construction = contractions); no finite Fock-matrix
  model, no number/occupation-operator sector statements, no trace identities.

## 1. Per-claim table (claim | pre-event grade | post-event grade | nearest-miss | billing consequence)

| claim | pre-physlib grade (battery 2026-11-17, CHARTER-GO) | post-event grade (2026-11-18 event + R9 11-19 re-check) | nearest-miss | billing consequence |
|---|---|---|---|---|
| **T1-core: the dictionary** — hyperbolic-Clifford `o i = ι(e' i)*ι(e i)` ↔ OAI `creator Q i * annihilator Q i` ↔ tauceti `carOccupationElement` via `CliffordAlgebra.map isoQ` | CLEAN — new in both corpora; the C+ headline | **UNCHANGED (CLEAN)** — wing has no Clifford/quadratic content, no finite matrix model, no occupation layer (11-19 re-check) | physlib Wick equal-statistics lemmas (the ambient CAR-half layer, zero bridge content); OAI's four in-tree CAR theorems (donor side, no identification) | remains the ONLY billable T1 content; wording: "the identification/dictionary", never "first CAR formalization" |
| **T1-sub: CAR-relations transport** (idempotent/commuting occupation algebra reproved from Clifford relations) | formal-new vs physlib (no CAR relations on master through 2026-11-17); donor-owned vs OAI (`FermionOperators.lean:94/:102/:156/:190`) | **FORMALIZATION-PARITY in both corpora** — the Wick layer owns the equal-statistics half at general field specification | `ι_superCommuteF_of_create_create/_annihilate_annihilate/_zero_of_fermionic` (physlib); OAI's four theorems | excluded from any headline (parity content never bills above C+ — charter §8.3's own rule); scope as port/parity work in the T1-completion re-charter |
| **T2: graded↔blocks general lemma + Laughlin instances** (`isParityBlock_iff_sum_parityProj` etc., DELIVERED 7/8 triad-clean) | NEW in both corpora | **UNCHANGED (NEW)** — wing grading is statistic-grading, no card/parity block content | none in wing; mathlib SetLike/DirectSum = substrate only | unchanged; the delivered-theorem set is the article's second pillar |
| **T3-surviving: H² Frobenius sector-trace identity** | NEW-narrow (post the 2026-11-16 narrowing) | **UNCHANGED (NEW-narrow)** — no sector/trace content in the wing | physlib `LadderSystem/OccupationBasis.lean` (bosonic — killed the spectrum rung, not this); OAI Gram decomposition (donor) | unchanged |
| **T3-spectrum rung** | RETIRED 2026-11-16 (physlib bosonic occupation-basis theorem) | **STAYS RETIRED** (wing adds nothing) | `LadderSystem.finrank_vacuumSpan_eq_choose` | none (cite-and-adapt at most) |
| **Casimir sub-rung** | DEAD-AS-IMPORT (file-private layer) — dropped from scope at battery | **UNAFFECTED** — no Casimir content on physlib; nothing gained, nothing lost | — | stays out of scope (battery condition (ii)) |
| **Seed-13 (S13) premise** | "no `CrAnFieldOp` path exists at all" (the S13 differentiation gap) | **GAP CLOSED** — `physlib-surface.md` §2/§6 wing data stale; S13's differentiation gates must re-run against the wing before any charter (charter §8.3 already routes this) | the wing itself | S13 pre-charter item, not dossier-77's bill |

## 2. C+ cap movement quantified (the four FB-5/77 charter conditions, battery §4)

- **(i) billing at C+ — NO CAP MOVEMENT; billable share NARROWED (the quantification).**
  The cap was already C+ (substrate-bridge + identity layer; never a discovery headline)
  and stays C+ — the event does not force a downgrade because the headline (the
  dictionary) survives. What moves is the content mass under the cap: pre-event T1
  billable = {dictionary + CAR-relations transport}; post-event = **{dictionary alone}**
  (the transport sub-rung is parity content, which per the charter's own §8.3 rule "never
  bills above C+" and now cannot even carry substrate-bridge credit). Collapse trigger
  named for the watch: a future physlib tick landing the {a,a†} mixed relation as an
  operator equation TOGETHER WITH any Clifford/quadratic-form layer would drop T1-core
  itself to parity — at that point the pilot's article case reduces to T2 + T3-Frobenius
  and the orchestrator should re-rule the billing.
- **(ii) Casimir sub-rung OUT — UNAFFECTED** (no physlib Casimir content; the privacy
  exclusion stands on its own).
- **(iii) physlib clock rides the pilot (start AND end) — FIRED PARTIALLY, exactly as
  designed, and STILL LIVE**: ticked 2026-11-17T09:42:38Z → 2026-11-18T08:24:23Z →
  13:00:37Z (the event), and AGAIN 2026-11-19T11:23:12Z (this session's read). The
  condition's design is validated — it caught the event mid-week. The T1-completion
  re-charter MUST carry the clock and re-run the differentiation at start AND end; the
  2026-11-19 re-run is this file §0 (holding: dictionary differentiators all still
  absent).
- **(iv) effort per §Feasibility minus the dropped rung — UNCHANGED**: the Wick layer is
  comparator-only (separate corpus, not importable into the pilot's tauceti×OAI×mathlib
  substrate); the T1-completion work list remains the 7-residual census (`T1-record.md`
  §Residual census), untouched by the event.

## 3. Feeds (consumption notes)

1. R7 watchlist row 6 (`a9-iter5-article-watchlist.md:47`): the "re-run T1's
   differentiation against the physlib Wick layer before chartering" precondition is
   discharged by §0 (holding, 2026-11-19 tick); the dictionary article still fires ONLY
   if T1 lands; the C+ TECHNICAL-RECORD tier stands.
2. The FB-5/77 re-charter (A7's T1-completion + T2 as ONE unit, residual census = work
   list): consume the §1 table's wording constraints (never "first CAR formalization";
   the parity sub-rung scoped as port work) and the §2 collapse trigger.
3. physlib-surface refresh (owner's file, report-only): §2/§6 wing data stale since
   2026-11-18; the wing census (11-19) is in §0 here for the owner's fold.

— lane R9 (worktree agent-09), 2026-11-19. Sources: dossier-77 + `pilots/77/T1-record.md`
(main, diff-verified stable e3d984b→6f25933); physlib via gh API at pushed_at
2026-11-19T11:23:12Z. No commits (hold for H's follow-up batch).
