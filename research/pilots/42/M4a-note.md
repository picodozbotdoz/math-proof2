# M4a landing note — dossier 42, milestone 4a (strip-distinct re-vocabulary), GREEN

Lane A3, 2026-11-13. **DRAFT M4c addendum text for `research/candidates/
42-zeta-k-two-thirds-product-assembly.md` §Pilot outcome** (append-only; to be committed by
the orchestrator — not folded into the dossier by this lane). Companion:
`research/pilots/42-M4-blueprint.md` (the executed spec), `research/novelty/
axiommath-as-donor.md` §(c) (the donor map; §(c).2 is the QA flag this milestone fixes).

## What landed

**M4a GREEN** — `research/pilots/42/M4a.lean` (1,194 LoC, self-contained, mathlib
v4.36.0-rc2 @ `ff2494ea`): the distinct-count RE-VOCABULARIZATION of the M2b cumulative
layer. Elaborated by `run_m4.sh` (Modal app `crossmath-pilot-42-m4`, doz CLI — the
axbump staging pattern): run 1 FAIL (4 mechanical errors: U+2032 `′` is not a Lean
identifier character — 3 sites; one paren imbalance in a `rw`), run 2 **OK, 0 errors /
0 sorry-warnings**; `#print axioms` on all three landing theorems =
`[propext, Classical.choice, Quot.sound]`. Full-coverage axcheck (pilot-10
`axcheck_full.py`, 54 theorems incl. dotted names and `@[simp]`): **every theorem
triad-only, zero `sorryAx`/`native_decide` anywhere**. Logs with provenance headers:
`research/pilots/42/logs/m4-run1.log`, `m4-run2.log`, `m4-axcheck-run1.log`
(Modal runs `ap-blUJ8EJllky3Un6MMb9oHp`, `ap-Q9X0EeYIKsgqZOrrxnr6vH`,
`ap-e4tdbg21SVC5BhYybAxuxD`).

## The correction being recorded (why M4a exists)

M2b transcribed Knausgård's `distinct_zeros_839_of_local` onto an ON-LINE distinct
numerator (`countDistinctOnCum` over `lineWindow`), docstring "his `Ndist 0 T` shape".
His `Ndist` (like zeta23's `ChallengeDeps.lean:59` and ZetaZerosV2's
`Definitions.lean:56` `distinctZeroCount`) is STRIP-WIDE distinct; on-line distinct ≤
strip distinct, so the M2b binder was strictly stronger than any donor proves — nothing
false was proved (it was only ever a hypothesis), but the binder was undischargeable by
Knausgård, by ZetaZerosV2, or by any known result. M4a replaces the family in place:
`ZeroMult.distinctCountCum` (strip), `commonStripCum`, `EpsLowerDistinctStripCum`,
`distinctCountCum_add`, `distinctCountCum_of_factorization`,
`EpsLowerDistinctStripCum_mono`, `assemble_eps_defect_strip_cum`, and
`K839OfLocalStrip` — the now-VERBATIM-faithful transcription of
`distinct_zeros_839_of_local` at 1645064/1960733 (modulo the count identifications
`Ncount 0 T ≡ countCum`, `Ndist 0 T ≡ distinctCountCum`). **M1/M2a/M3/M2b files are
frozen untouched** (GREEN historical record); the M3 dyadic distinct layer is carried
verbatim as heritage, superseded for the distinct family by the strip layer. Identifier
note for the record: the spec's `K839′OfLocal`/`hEχd′`/`hCZ′` spellings were renamed
`K839OfLocalStrip`/`hEχdStrip`/`hCZStrip` (U+2032 is not a Lean identifier character —
run-1 finding).

## Restated landing theorems (still certificate-conditional; M4b does the swap)

- `zetaK_two_thirds_landed` — carried unchanged (2/3-family untouched: the
  on-line-with-multiplicity numerator was already the faithful shape, N₀ˢ ≤ N₀ a
  fortiori). Binders: `hCert` + `hK673` + `hEχ` + M2a structural set + `hntopζ`.
- `zetaK_distinct_five_sixths_strip_landed` — M4a-restated: ∀ε>0 ∃T₀ ∀T≥T₀,
  (5/6 − ε)·countCum(ζ_K-zero-data) ≤ distinctCountCum + commonStripCum, conditional on
  `hCert` + `hK839 : K839OfLocalStrip cert …` + `hEχdStrip` (χ-side, strip numerator —
  also the faithful ThmE-C shape) + the structural set.
- `zetaK_distinct_five_sixths_strip_landed_of_negligible` — adds the strip common-zeros
  negligibility binder `hCZStrip`; the `20-hCZ-NOTE.md` analysis transfers verbatim from
  the on-line special case (a common strip zero of ζ and L(χ_D) is a multiple zero of
  ζ_K).

Post-M4a binder inventory of the distinct landings: `hCert`, `hK839` (faithful),
`hEχdStrip`, M2a structural set (`hζ hχ hK hK1 hP1 hfac hfinK/ζ/χ`), `hntopζ`, `hntopχ`;
negligible-form adds `hCZStrip`. Constants unchanged at 5/6 (and 2/3); Knausgård's
0.67354 / 0.83900 remain the stronger conditional constants — the constant-race caveat
is unchanged.

## Provenance chain the M4b swap will consume (A1 finding, to keep in the record)

When M4b discharges the ζ side from ZetaZerosV2, it consumes the fork's "unique glue"
transitively: V2's `simple_proportion_lower` / `distinct_proportion_lower`
(`ZetaZeros/Main.lean:47,88`) rest on `pairCorrelationFormula`
(`PairCorrelation/FromLandau.lean:52`) via the Landau log-derivative explicit formula
(`Landau/Formula.lean:170`), which imports `RiemannZetaHadamard`
(`Landau/Formula.lean:9` — the Hadamard product for ξ); `RiemannZetaConvexity` sits at
`Analytic/ZetaBounds.lean:12`. So the 42-M4 swap already inherits PNT+'s
Hadamard/Landau machinery through V2 — no extra wiring needed; recorded per A1's
glue-donor map (`research/novelty/pntplus-glue-as-donor.md`, on disk 2026-11-13).

## Footnotes for the χ-column (not M4-blockers; per A1)

- zeta23's `GammaFacts` is PROVED in-tree (port-cost only, not a binder) — the χ-side
  ThmE port would inherit it with the tree.
- ThmE's `GammaFactsChi κ q` has NO fork substitute (irreducible to the AxiomMath
  corpus) — irrelevant to M4's ζ-side, but the binding constraint if the χ-column
  (`hEχ`/`hEχdStrip` discharge) is ever formalized instead of ported.

## Next

M4b (V2 donor swap → unconditional ζ-side landing) per `42-M4-blueprint.md` §(c)/(e),
awaiting A7's G2/G4 verdicts on the V2 import route; the fallback-binder route
(`hV2d4`/`hV2d5` numeric endpoints, `norm_num` constants) is executable with today's
`run_m4.sh` infra unchanged. M4c remainder: V2-endpoint on-pin axcheck + commit of this
note's content into the dossier §Pilot outcome (orchestrator).
