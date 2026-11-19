# Round-6 — N2-P3 prior-art pack: the `zetaL_two_thirds_landed_ℚ` landing (R9, wave 4)

Lane R9 (novelty/prior-art), 2026-11-19. Unit: the nearest-miss table (≥ 2 rows, the
novelty-table bar) for the Iteration-5 Lead-1 remaining landing — **N2-d /
`zetaL_two_thirds_landed_ℚ`** (the record's `zetaL_rat_two_thirds_landed`,
`pilots/75/N2-P1-record.md:121–124`; composed landing shape at dossier
`candidates/75-N2-rayclass-dirichlet-consumer.md:547`): *for every abelian L/ℚ, ≥ (2/3 − ε)
of ζ_L's window zeros (cumulative (0,T], with multiplicity) lie on the critical line —
conditional only on the DZDF `abelianFactorization` statement-binder + classical structural
hypotheses, with every proportion input a kernel-verified theorem (ζ-column: V2
`simple_proportion_d4` import; Dirichlet components: zeta23 ThmE port through the ℚ
ray-class ↔ Dirichlet dictionary).* Corpus pass with the AGENTS decl-index caveat honored
(TSV first, then direct-source `rg` in the read-only siblings before any negative claim);
external pass = the formal-Hecke-L Landau-free-region transfer cluster + the Dirichlet
proportion literature, exact ids. This pack sits ON TOP of the A7 pre-shipping sweep
(`qa/iter4-review/a7-n2-preshipping-sweep.md`, folded in the dossier §Novelty item 4) — it
re-certifies the corpus rows at source 2026-11-19 and adds the October–November 2026
external cluster.

**Verdict line: NOVEL-AS-STATED (composed, uniform-over-abelian-L/ℚ, all inputs
kernel-verified) — re-confirmed; no corpus row and no external row states a ζ_L proportion
of any kind. The two A7-MANDATORY rows stand unchanged; the external Hecke zero-free cluster
(2610.12234 / 2610.15291 / 2610.26835 / 2611.00924) is location-axis only and does not
touch the proportion claim. Dictionary billing: formalization-novel only (A7/Milne note
carried verbatim).**

---

## 1. Corpus side (decl-index pass + direct-source, 2026-11-19)

**decl-index-v2.tsv pass (caveat block honored: a TSV hit is never evidence of provability
or of content; used only to surface candidates, every row below re-checked at source):**
`hecke` hits = 18,740 openai-math / 2,113 tauceti / 535 axiommath-dzzf / 22 mathlib —
inspection shows general Hecke-theory noise (Euler products, adelic machinery). `two_thirds`
hits: 12, ALL analysis-shaped (`rpow_two_thirds_cube`, `holder_two_thirds`,
`eulerMascheroniConstant_lt_two_thirds`, Bessel `schlafliKernel_neg_two_thirds_integrable`)
— **zero L-function-proportion rows in the index**. `proportion` hits: 302, all
probability/measure content. The TSV surfaces nothing proportion-shaped; negatives below
are direct-source.

| corpus | direct-source check (this session) | verdict |
|---|---|---|
| axiommath/ZetaZerosV2 | `Zeta/Proportion.lean:46,61` `eventually_simple_proportion`/`eventually_distinct_proportion` + `NumericProportions.lean` — **ζ-only**; every "Dirichlet" hit in the tree (`Landau/Perron.lean:8,62`, `LogDerivEstimates.lean:10`, `Formula.lean:280–315`) is the Dirichlet SERIES (Perron kernel), not characters/L-functions | no Dirichlet/Hecke proportion; ζ-column donor only |
| axiommath/DedekindZetaZeroFree | Hecke L layer = zero-free only: `HeckeCorollary.lean:12–17` `heckeL_ne_zero` (continuation + `f s ≠ 0` for Re s > 31/32, RayClassCharacter χ, general K), `idealHeckeL` Euler products; **no counting/critical-line decl anywhere** (all "count" hits = FractionalIdeal/lattice bookkeeping) | factorization + zero-free donor; no proportions |
| tauceti | `NumberTheory/LFunctions/Hecke/{Basic,Primitive,Orthogonality}.lean`: `eulerCorrection` entire & zero-free on Re s > 0 (`Basic.lean:21–22,97–118`), induced/changeLevel identity — no proportions; tree-wide `proportion/critical-line` hits are topology/probability noise (`LowDimTopology/`, `Probability/`) | group-level dictionary (`ratDirichletEquiv`) + Hecke structure; no counting |
| openai-math | `OAI/NumberTheory/DirichletL/` = the 7/8 architecture: `Nonvanishing.lean:23,31` `SevenEighths.dirichlet_nonzero`/`zeta_nonzero` — LOCATION only; no on-line/counting content; `two_thirds` hits in `NumberTheory/` = `TotientAsymptotic` noise | no proportions |
| mathlib (encore ff2494ea) | no `RayClass` anywhere; `LSeries/HardyZ.lean` = ζ critical-line machinery (Z-function, sign changes) with **no proportion statements**, nothing for Dirichlet/Hecke L | receiving side of the dictionary only |
| zeta23 (anthropics) | `Zeta23/ThmE/Final.lean:93–108`: `thmE_A₀` (primitive χ mod q > 1: (2/3−ε)·N_χ(T,2T) ≤ N0starL), `thmE_B₀` (1/2 simple-and-on-line), `thmE_C₀` (3/4 distinct) — DYADIC window, primitive-χ, single L; ζ-only cumulative forms (`Solution.lean:56–77`) | **the Dirichlet-column donor = nearest formal row (row 1 below)** |

Corpus-collision conclusion (all six corpora direct-source 2026-11-19): **no ζ_L
(assembled Dedekind-zeta-of-abelian-extension) proportion statement exists in any corpus;
no Hecke/Dirichlet on-line proportion beyond zeta23's dyadic primitive-χ ThmE.** Consistent
with the dossier §Novelty items 1–2 and the A7 sweep.

## 2. Nearest-miss table (≥ 2 rows delivered: 8; the two A7-MANDATORY rows marked ★)

| # | source | what it has | delta vs `zetaL_two_thirds_landed_ℚ` |
|---|---|---|---|
| ★1 | **arXiv:2608.13637 Theorem B** (the AF cluster paper; via A7 sweep, re-cited here) | unconditional on-line proportion for FIXED primitive Dirichlet χ, constants O_q non-uniform in conductor; the paper itself states the ζ_K assembly corollary "is not made anywhere in the text" | fixed-χ, non-uniform constants, no assembly, no ζ_L object; ours uniform over every abelian L/ℚ with conductor-uniform discharges; hypothesis-shape-to-hypothesis-shape comparison, neither implies the other |
| ★2 | **D'Souza zeta23 fork** (A7 sweep) | conductor-aspect simple-zeros family, ThmE-shaped endpoints; single-commit provenance + open-sorry hygiene caveats | watch-level prior art for the distinct/simple tiers only; no with-multiplicity 2/3 family, no assembly, no dictionary |
| 3 | **zeta23 `thmE_A₀`** (`Final.lean:93`, read at source this session) | the Dirichlet 2/3 donor itself: primitive-χ, dyadic (T,2T], distinct-numerator | the port's INPUT, not a competitor: N2 converts dyadic→cumulative, primitive→imprimitive (strip immunity), and composes with the ζ-column through the DZDF binder |
| 4 | **DLRT arXiv:1908.04876 Thm 1.1 / Cor 1.3(i)** | on-line proportions for FIXED abelian/quadratic K, GRH-conditional, o_K(1) as T→∞, distinct zeros | conditional, non-uniform, single K; no with-multiplicity, no unconditional proportion, no ℚ-dictionary |
| 5 | **Liu arXiv:2610.12234 v2** (Liu-1; abstract read 2026-11-19) | zero-free Re s > 0.874957… for finite-order Hecke L over ℚ(√−3), Thm 13.1 (Hecke) + the Dirichlet-including-ζ transfer; **"formalized by Lean [Liu26]"** (= the liubaiying101 sibling, our Liu-1) | LOCATION axis (zero-free half-plane), formalized — transfers nonvanishing, never proportions; also DO-NOT-CONSUME as build dep (AGENTS) |
| 6 | **Liu arXiv:2610.26835 v2** (abstract read 2026-11-19) | uniform zero-free Re s > B♭ = 0.874886647… for every finite-order Hecke L over EVERY number field (cyclotomic μ₁₂ route + class-field descent), citing Xu–Sang | same location axis, stronger uniformity; no counting/proportion content; the C3-clock paper |
| 7 | **Xu–Sang arXiv:2610.15291 + Chang–Wang arXiv:2611.00924** (ids pinned via arXiv API this session) | amplified-moment / exhaustion-aware-product-moment refinements of the 7/8 zero-free half-plane for Hecke AND Dirichlet L (Oct–Nov 2026 cluster) | the active QR-D race, all zero-free-region shaped; none states an on-line proportion or a ζ_L assembly |
| 8 | **Bansal–Maji arXiv:2507.18121; Lamzouri arXiv:2609.02882** | Hardy-type INFINITUDE of on-line zeros for any number field (B–M); ζ-side ≥ 83.62% distinct proportions (Lamzouri, the V2 donor source) | B–M: no proportion; Lamzouri: ζ-only, the ζ-column donor's source — neither assembles ζ_L |

**Formal-Hecke-L transfer cluster note (the task's external angle):** the October–November
2026 literature is dense with Hecke-L zero-free transfers (rows 5–7) and at least one
announces an in-progress Lean formalization building on Liu's Lean files and CTLean
(n-yamaguchi ClassFieldTheory) — surfaced in search snippets dated 2026-10-29, id not
pinned to an abs page this session, flagged rather than claimed. Even when those land they
are Landau-free-region content: **no proportion statement for Hecke L or ζ_L exists
externally in any sweep this session** — the two-thirds landing remains unstated.

## 3. Billing guardrails (carried, for the article's novelty table)

1. The ℚ ray-class ↔ Dirichlet dictionary is **classical textbook content** (Neukirch VII
   §6; Washington ch. 4 cyclotomic instance; Milne ANT/18.785 spells the ℚ case out — A7
   note) — formalization-novel ONLY, never mathematical novelty.
2. The landing's novelty rests on the COMPOSED statement (uniform abelian L/ℚ, cumulative,
   with-multiplicity, every proportion input kernel-verified, conditional only on the
   un-importable DZDF factorization binder + classical structural hypotheses) — cite rows
   ★1–★2 + 3–4 mandatorily; rows 5–7 as the location-axis adjacency.
3. Constants honesty: 2/3 is not a frontier constant (Lamzouri ζ-side ≥ 5/6-distinct-class
   results exist informally); the claim is the first FORMAL ζ_L proportion with discharged
   inputs, not a record.

— lane R9 (worktree agent-09), 2026-11-19. No commits (hold for K/H per protocol).
