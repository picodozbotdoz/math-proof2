# Pilot 41-H3 — M-tranche pre-solve: the spin-host candidate identification (paper-level, no fires)

*Lane R4 (worktree agent-08), 2026-11-20, the unit approved on the S-GREEN report
("the paper-level spin-host candidate identification — no fires; the concrete
spin-host word/K candidate list at δ ∈ {−2, +2}, small-K systems pre-solved
mechanically"). Evidence base: this session's mechanical explorations (exact-integer
construction + validated controls; the §2-P1 session-verification pattern; scripts
ephemeral, every load-bearing number re-derivable from the formulas recorded here).
Novelty context: R9's §M-PRE (`round7-h3-battery.md` @ `5f0b57cc`) — cited, not
re-derived. Budget state: **S-cap residue explicit: 4 unused of the hard cap 5**
(`H3.lean` h3-s-run1 GREEN is the only fire; the M re-price +2–4 runs needs a FRESH
fire order).*

## 1. The candidate list: EMPTY in every scanned class (the unit's headline result)

All scans over the tauceti spin host at n = 4 (exact-integer construction per
`MarkovTrace.lean:153/:300` formulas: cup TF→−q, FT→1; cap TF→1, FT→−q⁻¹; parallel 0),
at BOTH closed fibers (q_spin = 1 ↔ δ = −2 ↔ table M₋; q_spin = −1 ↔ δ = +2 ↔ table
M₊ = eth's σ), functional = the FULL K class (any ℤ-linear functional on M₁₆ — the
70-dim block-diagonal reduction is exact, §2):

| class | systems tested | survivors |
|---|---|---|
| canonical-13 reduced words (ε, e₁, e₂, e₃, e₁e₂, e₂e₁, e₁e₃, e₂e₃, e₃e₂, e₁e₂e₃, e₁e₃e₂, e₂e₁e₃, e₃e₂e₁), ALL C(13,8) = 1287 subsets × all 40320 assignments | 103,219,200 | **0** |
| natural-monomial family (subset-monomial words), ALL order conventions (2×2×4 pair/triple orders) × ALL scalar variants (δ-factors {1,δ}⁷) × all 40320 assignments | 82,575,360 | **0** |
| random L ≤ 4 subset sweep (2500 independent-subsets × all 40320 assignments; the L≤4 image census has 37 images) | 13,870,080 | **0** |

**Controls (the negative is machinery-verified, not silent):** planted-solution
targets (random integer K, A·k) are detected at residual ~1e-14; random ±1 tables and
both M-tables are rejected at residual ~7.1 against the monomial subspace; the
scanner's rank/QR path is exercised by the plants.

**Verdict: the candidate list requested by the M-GO gate is EMPTY.** No dictionary
exists whose eight words are monomial (generator-product) words of length ≤ 3 at
either closed fiber, over ANY linear functional on the spin host — and the L ≤ 4
monomial tier shows the same signal (0/13.9M random-sampled, both fibers).

## 2. Structural findings (the paper-level content that outlives the scans)

- **S1 — the spin host at δ = ±2 is the FULL TL₄ story (faithfulness datum).** The
  word images span dimension **14 at both fibers** (24 distinct images at L ≤ 3 span
  13; 37 at L ≤ 4 span 14) — exactly the classical dim TL₄ (Catalan₄). Given the
  classical dimension fact (the §3-row-1 caveat: NOT corpus-formal), spinRep is
  INJECTIVE at these fibers. Moreover the hunt equivalence needs no injectivity:
  generator-word dictionaries push both ways through the algebra map (same words;
  any TL₄-functional φ ↦ K extending φ∘spinRep⁻¹ on the image). **So the spin-host
  negative IS a TL₄-generator-word negative at these fibers** — a sharper statement
  than the precharter's general no-injectivity caveat (which still governs other δ).
- **S2 — the ≤14-dim reachable-table bound (the structural root of every miss).**
  For ANY word family (any length, monomial or not), the products w_p·w_p′ all live
  in the 14-dim word algebra, so the realizable tables {T_K} form a linear space of
  dim = dim span{w_pw_p′} ≤ 14 inside the 64-dim table space — membership of the
  Walsh table m is a codimension-≥50 condition. Observed: the canonical subsets'
  table-space ranks cap at exactly 14 (max over all 1287), median 13. The hunt is
  the question whether SOME word family's 14-dim product span happens to contain m.
- **S3 — sector rank caps.** The host is weight-block-diagonal with sector dims
  (1,4,6,4,1): no single sector can realize m (Gram rank ≤ sector dim < 8 in every
  sector); a realization must SUM at least sectors 1+2+3 (4+6+4 = 14) in aligned
  fashion — the monomial scans show the natural alignments all fail.
- **S4 — the honest open tier: COMBINATION words.** The scans cover MONOMIAL words
  only. General TL₄ elements are ℤ-combinations of words (14-dim freedom each);
  the unknowns (8×14 + 70) exceed the 64 equations — dimension counting does NOT
  preclude existence (unlike the monomial tier). Random search cannot see it (a
  random word family's ≤14-dim table space containing the fixed m has probability
  ≈ 0); finding or excluding it needs a structured ansatz (S3's sector decomposition
  of m is the lead frame: decompose the Walsh table as a sum of rank-≤4, ≤6, ≤4
  Gram tables each realizable in its sector algebra) or a theoretical
  m-membership obstruction. This is next-wave material, priced below.

## 3. M-GO assessment (the gate this unit was to feed)

Per the precharter §7 gate: S GREEN ✓ + **paper-level candidate class identified =
RESOLVED EMPTY (this note)** + re-price. **Recommendation: DO NOT fire the M search
rung** — there is no candidate list to certify. Instead, per the precharter's
pre-negotiated descope rung 1: **bank the S-rung (Theorem C, the two-fiber d ≤ 7
closure — already GREEN) + this pre-solve as the raised-negative evidence**; the
dictionary question stays OPEN at the combination-word tier with the S1–S4 structure
as its map. If the orchestrator wants a Lean-visible M-rung despite the empty list,
the honest candidate is the S2 bound's finite face (a `table_space_rank_le`-shaped
lemma conditional on the word-algebra span) — priced M-class (+0.3–0.5k LoC / 2–4
runs) but its content is a linear-algebra formality given S2; the §3-row-1 dim-14
block keeps the sharp "≤ 14" constant out of reach without the classical-citation
route. Decision requested; no fires either way without a fresh order.

## 4. Protocol riders (binding, carried)

- **S-cap residue: 4 unused of 5** (h3-s-run1 = the only fire; `H3-record.md` §Runs).
  Any M/L fire = a FRESH fire order at the +2–4-run re-price.
- **Custody gap (R1's byte-verification, coordinator relay 2026-11-20):** 16 of
  H3.lean's 27 theorems are unprinted in the run-1 audit tail — when H3.lean is next
  edited (the M-rung or any amendment), extend the `#print axioms` tail to the 16
  helpers (all public, dotted-name/axcheck_full-style coverage) so the same fire
  closes the gap pre-sweep. No dedicated run.
- **§M-PRE citations for any article-facing text** (R9 @ `5f0b57cc`): M1
  SpinRealizability NEW-narrow vs tauceti's 44-decl inventory (spinRep :300,
  markovTrace :460, tracial :476, Spin/Positive :110/:117); M2 external rows
  NOT-COVERED; **M3 wording lock: host-scoped negatives only, never "no TL₄
  dictionary"** — note S1 above is the fiber-scoped sharpening that must ride any
  such wording (the negative transfers to TL₊₄ generator-word dictionaries AT δ =
  ±2, not to combination words); M4 hygiene: actual tauceti import = L-rung with
  tauceti-olean image + on-pin triad FIRST (statement-tier spinRep citations are
  claim-class until then — this note's construction is the independent-literals
  route, not an import).

## 5. What would change the recommendation

A combination-word ansatz that survives a mechanical pre-solve (the S3 sector frame:
exhibit a rank-(4,6,4)-decomposition of m aligned with the sector algebras, then
solve the small systems); or a theoretical obstruction to m-membership in ≤14-dim
product spans. Either lands as a fresh unit with its own pre-solve; the machinery
(exact-integer host construction, validated scanner, the gather-batch assignment
solver at ~35 ms/subset/40320-assignments) is rebuilt from the formulas recorded in
§1–S1 (scripts were ephemeral by design; every number here re-derived twice this
session).

## 6. RULING (orchestrator, 2026-11-20, on §3): BANK — no M fire, no S2-formality rung this wave

The pre-solve's empty candidate list + S1/S2 bank as the raised-negative evidence per
the precharter's descope rung 1. Reasons recorded verbatim in substance: (a) the
S2-formality's sharp constant (≤ 14) is blocked by the corpus-NONE dim theorem — a
weak-constant formality adds little verification grade for its runs; (b) the S2 sweep
is machinery-validated (~1e-14 controls), NOT integer-exact, so it rides any article
as **certificate-class computation evidence, not kernel theorem** (the 41H §N3
convention); (c) the wave-close is imminent and a third ship's editorial chain would
overload the close act. **The hunt's wave outcome: S-rung Theorem C GREEN (kernel) +
this pre-solve banked (raised-negative, structural) + the open combination tier named
(§S4).** The article decision (ship vs carry; quota rules n/a — discovery-class)
opens at Iteration 6 with the charter's editorial slots. The custody-gap rider stands
for the NEXT H3.lean edit whenever that comes (no dedicated run). Lane: STANDBY
post-landing.

— lane R4 (worktree agent-08), 2026-11-20. Sources: tauceti `MarkovTrace.lean`
(:88–:112 cup/cap, :153 spinGenerator, :300 spinRep), `Spin/Positive.lean` (header),
`Basic.lean:48–53`; the landed 41H/H2/H3 records; R9 §M-PRE @ `5f0b57cc` (cited).
No Modal runs fired this unit.
