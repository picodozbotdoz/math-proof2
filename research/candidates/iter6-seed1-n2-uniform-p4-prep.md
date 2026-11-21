# Iter-6 seed 1 (N2-completion/P3-d) — discovery-PREP + GO/NO-GO (the P4 uniform card)

Lane R8 (worktree agent-05, re-tasked from R6), 2026-11-21. Unit: iter6-seed-census
seed 1 — the strongest Tier-1 discovery lead — as discovery-PREP (statements, probe,
fire plan, discovery-grade case). NO fires executed (the one Modal run below is a
statement-elaboration PROBE, allowed by the unit).

## 0. COURSE CORRECTION FIRST (the census seed-1 row is STALE — read before any action)

The census (`novelty/iter6-seed-census.md`, written at iter-6 open 2026-11-20) prices
seed 1 as "2 parked confirm runs + the P3-d fire + N3 axcheck" with blockers
"P2-b confirm → P2-c confirm → P3-d unblocked". **All of that was EXECUTED and GREEN
on 2026-11-20 by R6 (units 9–11, the salvo)** — see `pilots/75/N2-P1-record.md` head
table + units 10–11 blocks: P2-b GREEN 17/17 (run 31), P2-c GREEN 11/11
(n2-p2c-run8), P3-d GREEN (n2-p3v2-run3), P3-e GREEN first shot (n2-p3e-run1 =
`zetaL_two_thirds_landed_of_DZDF`), the ℚ endpoint GREEN (n2-p3v2-run4 =
`zetaL_two_thirds_landed_ℚ`), P2-d GREEN 6/6 (n2-p2d-run2), N3 full-coverage axchecks
fired (358 + 48 records, 0 sorryAx). The article side also already executed:
article-75 v3 landed 2026-11-20 as REVISE-IN-PLACE per D3 (R2 splice-time PASS
74ef9e67), now at v4 (2026-11-21, the DLRT-rescope revision; kind
DISCOVERY-CONDITIONAL; B′/B″ = PROVED-CONDITIONAL triad rows). **Nothing in the
census's price column remains to run.** The round-2 novelty re-confirmation
(`novelty/r9-novelty-verification-iter6-round2.md`, 2026-11-21) sits ON TOP of this
landed state — the absence claims apply equally to the P4 shapes below.

What the landed state does NOT yet contain — the one genuinely-new statement this
seed still owns — is the **UNIFORM composition** (the census target's own words:
"every abelian L/ℚ"; the prior-art pack's landing shape): B′ keeps the per-family
component proportion `hEχcum` and the ζ-column `hζ` as premises at an abstract fK,
and B″ is only the degenerate no-family tower. The composed-with-every-input-grounded
form was never drafted. That gap is this prep's payload: **the P4 card pair**, now
drafted + probed.

## 1. The statement set (Lean-side, hypothesis-binder pattern; per-file substrate + leverage)

**Landed inputs (all triad-verified, cited for the fire plan):**

| statement | file:line | sha256-16 (verified run) | role in P4 |
|---|---|---|---|
| `ZetaLRatTwoThirdsOfDZDF` (B′ card) + `zetaL_two_thirds_landed_of_DZDF` | `N2-P3.lean:206` / `N2-P3e.lean:62` | f9bd28c5 / 6f6beb20 (n2-p3e-run1) | the composed assembly P4 applies at fK := ζ |
| `componentEpsCum_of_thmE` / `epsLowerCum_of_thmE` | `N2-P2d.lean:166/:134` | 4f978b44 (n2-p2d-run2) | the hEχcum absorption (per-primitive pair → ComponentEpsCum) |
| `epsLowerCum_zeta_of_V2d4` + `V2d4_endpoint` | `N2-P3V2.lean` | 2613cfd2 (n2-p3v2-run3/4) | the hζ discharge (V2 substrate: `ZetaZeros.simple_proportion_d4` import, on-pin triad) |
| `zetaL_two_thirds_landed_ℚ` (B″) | `N2-P3V2.lean:298` | idem | P4-b's degenerate n-vacuous instance |
| `zetaL_rat_two_thirds_landed` (P0 engine) | `N2-P0.lean` | n2-p0-run4 | inside B′ |

**NEW (this unit): `pilots/75/N2-P4.lean` @ 2210fe6e01f1e095 — statements-only rung,
zero sorry, plain substrate (import Mathlib + N2P2c/N2P3/N2P2d/N2P3e; the
`#check` pins cover the full consumed chain):**

1. **`ZetaLUniformOfThmEQ` (P4-a)** — B′ specialized to the K = ℚ tower with
   `fK := riemannZeta` (the fK↔ζ count-identification premises degenerate to `rfl`
   at the specialization) and the `hEχcum` premise ABSORBED into the two
   per-primitive ∀-candidate-family binders `hUnbF`/`hEF`, written EXACTLY at
   `componentEpsCum_of_thmE`'s @-form consumption shape (conductor NeZero via
   `DirichletCharacter.conductor_ne_zero`; `windowFinite_LFunction` via
   `primitiveCharacter_ne_one`). `hζ` stays a premise (mirrors B′). V2-substrate
   leverage: none needed at this rung (plain).
2. **`ZetaLUniformQ` (P4-b)** — P4-a with `hζ` REMOVED (the V2-side fire target:
   discharged from `ZetaZeros.simple_proportion_d4` via
   `epsLowerCum_zeta_of_V2d4 hntopζ hfinζ V2d4_endpoint`) and the ζ-side nontop
   binder strengthened to B″'s ∀ρ FOREVER form. Binder ledger at the fire target:
   the DZDF trio (`hnp`/`hdic`/`hfac` — G1-permanent donor statement-binders, never
   imports), the structural set (`hKζ`/`hL`/`hntopζ`/`hntopL`/`hfinζ`/`hfinL`), and
   the per-primitive pair (`hUnbF` = classical zero-infinitude `CountsUnbounded`;
   `hEF` = the zeta23 donor endpoint `ThmEDyadic`, PROVED at the donor pin v4.33,
   audited triad zeta23e-p0-run1). Every proportion input is a kernel-verified
   theorem at its own pin (V2 d4 on-pin ff2494ea; ThmE donor-pin). The degenerate
   n-vacuous instance recovers B″.

**Novelty claim (both cards):** NOVEL-AS-STATED per
`novelty/round6-n2-p3-priorart.md` (verdict line: "no corpus row and no external row
states a ζ_L proportion of any kind") — the P4 cards ARE that pack's landing
statement, now actually drafted (the pack described the composed-uniform shape;
B′/B″ landed as its two-substrate split; P4 is the uniform union). Re-confirmed at
the 2026-11-21 index state by round-2 §seed 1 (semantic + BM25 + exact-id sweeps;
the XiPrime caveat: `Challenge/XiPrime.lean:79` is sorry — proved copies in
`Solution/` — binds any "zeta23 has no proved ξ′ proportion" phrasing).

**Nearest-miss skeleton (starting rows = round-6's 8-row table, re-verified by
round-2; ≥2 mandatory rows marked ★):**

| # | source | what it has | delta vs P4 |
|---|---|---|---|
| ★1 | arXiv:2608.13637 Thm B (AF cluster) | unconditional on-line proportion, FIXED primitive χ, O_q non-uniform constants | fixed-χ/non-uniform/no-assembly vs every-abelian-L/ℚ uniform composed card; neither implies the other |
| ★2 | zeta23 ThmE `thmE_A₀` (donor, `Zeta23/ThmE/Final.lean:93`) | dyadic (T,2T] distinct-numerator 2/3 for primitive χ — P4's INPUT via `hEF` | the donor endpoint is one binder of P4, not a competitor; P4 converts dyadic→cumulative, primitive→imprimitive, and assembles ζ_L |
| 3 | DLRT arXiv:1908.04876 Thm 1.1/Cor 1.3(i) | GRH-conditional distinct proportions, FIXED abelian K (deg ≤ 4) | conditional/non-uniform/distinct-only vs unconditional-in-the-composed-sense/Uniform/with-multiplicity |
| 4 | Lamzouri 2609.02882 / V2 `simple_proportion_d4` | ζ-side ≥ 0.6725 distinct-class, formalized on-pin | ζ-column only (P4's `hζ` input), never an assembled ζ_L |
| 5–8 | Liu 2610.12234 / Liu 2610.26835 / Xu–Sang 2610.15291 / Chang–Wang 2611.00924; Bansal–Maji 2507.18121 | the Oct–Nov QR-D zero-free cluster + on-line infinitude | location-axis only; no proportion statement for Hecke L or ζ_L anywhere |

Billing guardrails carried verbatim from the pack: the ℚ ray-class↔Dirichlet
dictionary is formalization-novel ONLY; 2/3 is not a frontier constant; cite ★1–★2
+ 3–4 mandatorily.

## 2. Statement probe (executed; probes ≠ fires)

`pilots/75/logs/n2-p4-run1.log` @ 01c04928d7d3c0fe — **GREEN 8/8 files OK, 0 errors,
0 sorry (both quote forms), telemetry OVER=0** (wall 88 s, cpu 0.96/2.0, mem
1362 MB). Runner = NEW `run_n2p4.{sh,py}` (app `crossmath-pilot-75-p4`, image
byte-shared with the 75 family) with the BINDING al3d one-liners applied: anchored
error regex (`error` + `error(lean.*)` forms), backtick-form sorry filter, and the
error-CONTEXT display path using the same regex as the count (closing the al3d
run-9 display blind spot). Guard `/tmp/n2p4-prefire-sha.txt`: every chain file at
its verified sha; N2-P4 @ 2210fe6e. One local staging slip pre-run (ORDER vs the
.camel renames; local FileNotFoundError, zero remote compute) — fixed in-log.
N2-P4's only output = 4 unused-variable linter warnings (`hN` in the ∀-family
binders — deliberate: the shape must match the fire-time consumption signature).
Statement elaboration never certifies provability.

## 3. Fire plan (GO/NO-GO; NO fire without an explicit orchestrator grant)

- **Run-1 target:** the V2-side proof fire — new `N2-P4V2.lean` staged at the V2
  workspace root (the run_n2p3v2 recipe: ZetaZerosV2 + PNT+ tarballs, PNT+ redirect,
  `lake build ZetaZeros`, consumer elaboration) proving
  `zetaL_two_thirds_uniform_of_thmE : ZetaLUniformOfThmEQ …` (one application of B′
  at fK := ζ with `fun _ => rfl` count identifications + `componentEpsCum_of_thmE`
  for hEχcum) and `zetaL_two_thirds_uniform_ℚ : ZetaLUniformQ …` (the former +
  `epsLowerCum_zeta_of_V2d4 hntopζ hfinζ V2d4_endpoint`), plus `#print axioms` for
  both (expect triad-only) and the d4 donor re-print. The plain-side companion
  (`uniform_of_thmE` alone) can ride the same run as a second staged consumer.
- **Price:** ~90–130 LoC (the proof bodies are 5–10 lines each; the bulk is the
  header ledger). Runs: 1 V2-side fire (~8–10 min wall, the build-phase OVER-cpu =
  the authorized m4b2/G2 donor-tree class, telemetry in-log) + expect 1–2 fix rounds
  if any (risk classes below); plain re-probes ~90 s each.
- **Risk classes (from the family's friction ledger):** module-staging names (the
  hyphen→camel trap — already bit once this unit, now guarded); @-form binder
  instantiation order in the `hUnbF`/`hEF` lambdas (the N2-P2d nested-instance
  class); `rfl` vs `Rfl`/defeq depth on the specialized count identifications (low —
  both sides are the literal same term); V2 build flakiness (one retry precedent vs
  the artifact-cache outage). ZERO mathematical risk: every input is GREEN and the
  composition is the same application chain P3-e already executed once at abstract
  fK.
- **GO/NO-GO: GO, conditional** — conditions: (i) the orchestrator grants the fire
  (this unit's grant was PREP-only); (ii) the fire file lands at the N2-P4 card shas
  unchanged (2210fe6e + the chain shas above); (iii) on GREEN the card names enter
  article-75 by REVISE-IN-PLACE (v5) — no new ship without R2's S1–S4 (the D3
  posture); (iv) on NOT-GREEN: honest-park with the residual class named, per D7 —
  no completion-grant chase.

## 4. The discovery-grade case (the S1 bar R2 will gate; both sides stated)

**For (NEW territory):** the P4-b statement is the first formal — and per the
round-6/round-2 sweeps, first stated anywhere in the surveyed corpora or the
Oct–Nov 2026 literature — *uniform, composed* on-line zero-proportion statement for
ζ_L over every abelian L/ℚ: multiplicity-counted, cumulative (0,T], 2/3 − ε,
conditional only on the G1-permanent DZDF statement-binder trio + classical
structural hypotheses + the two named per-primitive binders, with every proportion
input kernel-verified at its own pin. Article 75's landed rows stop short of it:
Thm A/B are the open-schema engine at abstract component hypotheses; B′ carries
hEχcum/hζ as premises at an abstract fK; B″ is the degenerate tower. P4-b is the
card the census and the prior-art pack describe as the seed's headline ("every
abelian L/ℚ"). As a STATEMENT class it is exactly the pre-certified NOVEL-AS-STATED
shape (round-6 verdict line; round-2 absence re-confirmation at the 2026-11-21
index state).

**Against (what R2 must weigh):** zero new mathematics — the proof is a pure
application chain over GREEN pieces (B′ + P2-d + the V2 discharge + rfl), the same
class P3-e/P2-d were banked as (engineering). The statement-level delta vs the
landed B′ row is real but incremental: two premises absorbed (one via a GREEN
theorem, one via the V2 import) + one specialization. Under the iteration-4
template's kind vocabulary the honest kind is the article's existing
DISCOVERY-CONDITIONAL class with the row upgraded in place; a NEW ship would need
the S1 statement-novelty bar to outweigh the no-new-math fact, and the two-strike
quota rule (knowledge-level/donor-discharge class) does not apply to a
revise-in-place. **R8's recommendation: land P4 GREEN as article-75 v5
revise-in-place (the B′/B″ rows gain the uniform composed form as their strongest
corollary row); do NOT spend a new-ship slot on it.** The discovery-KPI reading:
seed 1's contribution to the ≥half bar was already realized through the v3/v4
revision chain (41H3's landing has the bar at 9/17); P4 strengthens the evidence
base, it is not a new discovery article.

## 5. What H must land (worktree-side outputs of this unit)

1. `research/pilots/75/N2-P4.lean` @ 2210fe6e01f1e095 (NEW, statement rung);
2. `research/pilots/75/run_n2p4.py` + `run_n2p4.sh` (NEW runner pair, al3d
   one-liners applied);
3. `research/pilots/75/logs/n2-p4-run1.log` @ 01c04928d7d3c0fe (probe, GREEN);
4. this record (`research/candidates/iter6-seed1-n2-uniform-p4-prep.md`);
5. the census correction note (novelty funnel = R9's): seed 1's blockers/price column
   is STALE (executed GREEN 2026-11-20; the remaining item is the P4 fire above,
   grant-gated) — R8 files it here rather than editing `novelty/` (one-writer rule).

— lane R8 (worktree agent-05), 2026-11-21. No commits (H commits). No fires (the one
Modal run is a statement probe within the unit's allowance).
