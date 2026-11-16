# R5 — Iteration-4 backlog consolidation (merged inventory, ranked queue, slot decisions)

Lane R5 of the iteration-4 review/relaunch, 2026-11-16. Branch `dev/iteration4` (read-only
for this lane; H owns git). Inputs merged: the pre-assembled seed inventory
(`feasibility/ITERATION4-SCAN.md`, `ITERATION4-SEED-DOSSIERS.md`,
`ITERATION4-CHARTER-DRAFT.md`, `ITERATION4-CHARTER-SPLICE.md`), A5's triage
(`novelty/iter4-seed-triage.md`), the physlib surface (`novelty/physlib-surface.md`), the
LP bridge + all three execution preworks (`feasibility/lp-duality-bridge.md`,
`pilots/lp-layer-prework.md`, `pilots/al-3d-prework.md`, `pilots/zzv2-lambda-prework.md`),
the carried-item specs (`pilots/73-prework.md`, `75-prework.md` + `75/Pb-design.md`,
`72-M1/L3-spec.md`, `50-M2-31-32-spec.md`, `pilots/10/next-tranche-spec.md`,
`11-blueprint.md` §4, `candidates/74-surprisal-moment-hierarchy-ceilings.md`), the
Cycle-2 close record (`feasibility/VERIFICATION-LEDGER.md` §9/§9.F, `STATUS.md` close
block, `qa/debts-register.md`), and `TRIAGE.md` §1b cold-inventory rows. Donor-side claims
about AreaLaw2D were re-read at source this session (`axiommath/AreaLaw2D/docs/3D/Targets.md`,
`OpenAI/Statements3D.lean`, `AreaLaw/S04_Quasilocal/Positive.lean` — sibling, read-only);
the mathlib LP-duality TODO was re-verified on the encore checkout
(`Mathlib/Analysis/Convex/Cone/Basic.lean:33–37`). Post-close state corrections applied
throughout: **G7b PASS and 50-M2 R1 GREEN-FINAL** (donor-pin, `pilots/50/R1.lean`, 178
LoC, ζ strip [1/8, 7/8] unconditional — `VERIFICATION-LEDGER.md` §9.F sign-off,
`axiommath-donor-probes.md:31`); 71-P2/73-C/72-C-neg/10-L2/11-M2 all FINAL-GREEN; 75
P-a+C1 FINAL; 72-M1 partial FINAL-for-tranche (`VERIFICATION-LEDGER.md` §9 table).

**Ranking bar (per the relaunch brief, binding):** novelty × significance ÷ effort under a
STRICTER discovery bar — the user's feedback is that Cycle-2 discoveries read weak. Two
consequences applied throughout: (i) formalization-first and glue-grade items are ranked by
their ARTIFACT + COMPLETION value, never as headline discoveries, and every such item
carries its honesty label (Lamzouri owns seed-2's math; the donor owns B-rung statements;
AFP/Coq own the LP theorem class); (ii) completions of already-GREEN towers
(75-Pb, 72-M1-L3, 10-tranche) are ranked on completion-per-effort, because a finished
strong discovery beats three new weak ones.

---

## §1 Merged inventory

### 1a. The 13 seeds (`feasibility/ITERATION4-SCAN.md` §2, :69–163; A5 verdicts `novelty/iter4-seed-triage.md` :14–27)

| # | Seed | One line | Needs | Effort | Dependency (decide/build first) |
|---|---|---|---|---|---|
| S1 | AL-3D continuation (B.2–B.5 ladder) | First statement-level 3D area-law substrate in any corpus; our 2D machinery ports (`SCAN.md:71–75`) | Charter rung decision (§3a below); mathlib-only restatement (G4 pattern) | M (staged ladder ≈1.0–1.6k LoC, `pilots/al-3d-prework.md` §5) | AL-P0 serves any rung; nothing upstream |
| S2 | ZZV2 λ-family | λ-parameterized proportion layer over the BUILT V2 donor (`SCAN.md:76–81`) | P0 probe pins whether Landau/kernel-sum layer is η-generic (`zzv2-lambda-prework.md` §2 P0(b)) | S–M route (a); L route (b) (avoided) | 42-M4b stack GREEN (satisfied) |
| S3 | 22-T2a on upstream StrongPNT | Conditional PNT error-term from quasi-RH binder; donor statement now EXISTS proved upstream (`SCAN.md:82–86`) | Task-slot charter; mathlib-PR clock (#43238-family) | S | none (statement-port≈0) |
| S4 | FF-EZ2 survivor (+S6 folded) | The exclusion/family-quantified FF proportion that survives the supersingular trap, now also carrying multiplicity-aware/uniform/s-plane-strip counts (`iter4-seed-triage.md` :21 fold) | Round-level battery + vdG–vdV theorem-number pin (debt g) | S–M after battery | 71-P2/73-C GREEN — **satisfied** (unblocked) |
| S5 | FF-EZ4 genus-1 identification | tauceti `zetaFunction` = Weil `zetaSeries` at an elliptic curve; HasseBound as g=1 dictionary node (`SCAN.md:93–97`) | tauceti direct dep (same pin); G6b verdict in hand | S | consumed BY FF seeds; no standalone slot |
| S6 | FF-EZ5 family counting | **LIKELY-DEAD standalone** — Faifman–Rudnick 0803.3534 owns family zero-counting (`iter4-seed-triage.md` :59–82) | — | — | folded into S4; see DROP |
| S7 | Kontorovich quasi-rh 11/12 binder | Sharpest ζ/Dirichlet statement-level constant (external, v4.34.1) (`SCAN.md:107–110`) | donor/infra only | — | feeds future 50-class pilots |
| S8 | de Bruijn–Newman Λ ≤ 9/32 | Third-party kernel-checked; closes the old "Λ absent" gap (`SCAN.md:111–113`) | nothing — context + the Λ-absence ban (debt l) | — | any Λ idea must START from this artifact |
| S9 | Shared LP-duality layer | mathlib/Lean-native weak duality + two in-repo consumers (02-core, 74-T3) (`SCAN.md:114–123`) | charter slot-1; AFP trio + Coq must-cites; `lp-duality-bridge.md` written | S layer + M consumer 1 | nothing — "do it FIRST" (`iter4-seed-triage.md` :228–230) |
| S10 | 50-M2-R3 Liu-1 binder | 34999/40000 statement-binder, G7-CLEAN (`SCAN.md:124–128`) | — (R1 landed; R3 = fallback only) | — | superseded by R1 GREEN |
| S11 | tauceti within-corpus zones (5 pairs) | POSSIBLY-KNOWN bundle; CAR sign-calculus half dead (physlib ExchangeSign) (`iter4-seed-triage.md` :84–120) | per-pair round-level batteries before any charter | M per pair | watch list |
| S12 | Weil-as-binder for FF windows | G3 CLEAN; consume Weil RH by binder, no Stacks (`SCAN.md:141–145`) | donor/infra; consumed by S4/S5 | — | ranked with S4/S5 |
| S13 | physlib occupation-pair bridge | Instantiate article-52 occupation axioms on physlib `CrAnFieldOp` — relation-layer donation FROM us (`SCAN.md:146–163`, `physlib-surface.md` §4(i)) | G-probe (statement elaboration on our pin; v4.35.0 gap); differentiate from 52 AND physlib `WickContraction/Sign/` | S probe / M pilot | physlib §5 probe list; watch list |

### 1b. Carried obligations (Cycle-2 close, `STATUS.md` "Iteration-4 handoff" block + carried rows)

| Item | One line | Needs | Effort | Dependency |
|---|---|---|---|---|
| 73-Q4 `hRat` discharge | (C1) for 𝔽_q(T): rationality by residue-class periodicity → first unconditional formal Tate-type probe (`pilots/73-prework.md` §2.4 :132–139, §5 Q4 :180–182) | **A2's gate recommendation owed** (charter-draft :93); Rosen ch.-number spot-check due at Q4 (SCAN §1c :48) | M (0.3–0.6k LoC, isolated M-risk) | none (73-C GREEN) |
| 75 continuation: P-b 5/6 strip-distinct arm | `zetaL_assembly_distinct_defect_landed` + `_of_negligible` + C1 5/6 arm via E1–E6 Bonferroni engine (`pilots/75/Pb-design.md` §0–§1) | nothing — design priced to the lemma, runner `crossmath-pilot-75` warm (`Pb-design.md` §2) | S–M (+0.25–0.35k LoC on 1,557 carried; 3–5 expected runs, `Pb-design.md` §3) | none (Pa GREEN) |
| 75 N2/N3 | N2 unconditional-at-ℚ instantiation (`zetaL_two_thirds_landed_ℚ`); N3 axcheck (`pilots/75-prework.md` §c :109–117) | (d1) Dirichlet↔RayClassCharacter dictionary + (d2) Euler-immunity — shared with 50-M2-R2, stage ONCE (`75-prework.md` §d :120–136) | N2 M (0.4–0.8k); N3 S | P-b first (same lane); (d1)/(d2) staging decision |
| 72-M1 L3 + interface theorem | `interface_areaLaw_uniformAreaLaw`: producer `OpenAI.AreaLaw` ⇒ consumer `UniformAreaLaw`, via L3a–L3d (`pilots/72-M1/L3-spec.md` §2–§6) | nothing hard — spec'd with verified mathlib anchors (L3-spec §1); Tier-B upgrade optional, gated G5a | M (360–700 LoC, L3-spec §7) | none (T1/T2 frozen GREEN) |
| 10 assembly tranche D1–D6 | wd↔cw walk + counter-`padM'` + `exists_tm_padded_space` — the machine-layer endpoint of the dossier-10 ETH-refutation arc (`pilots/10/next-tranche-spec.md` §0–§1) | charter scope/split decision (D4 landable without D5/D6, `10-blueprint.md` :188–189) | M (1.0–1.6k LoC) | none (M1/L1/L2 GREEN) |
| 50-M2 R2 31/32 ζ_K strip | ζ_K strip for EVERY number field via DZDF — unique coverage, but the library build FAILS on our pin (G1b: 62 err/11 modules) | binder fallback executable today (<250 LoC, `50-M2-31-32-spec.md` §3); unconditional blocked terminally | S binder / L-blocked unconditional | value decision post-R1 (see §3c) |
| G5a Physlib pair | AreaLaw2D vendored-build staging; BLOCKED-INFRA deferred to iter-4; real blocker = Physlib `a50684a1` not `ff2494ea`-compatible (17 err/1 module, `axiommath-donor-probes.md` :25, :251) | feasibility DECISION (fix-forward vs mathlib-only routes), not a build commitment | decision S / fix M | only feeds optional Tier-B upgrades — non-critical |
| Dossier 74 surprisal-moment ceilings | T1 moment–window floor+ceiling, T2 monotonicity, T4 C.3 method-barrier corollary — all [HYPOTHESIS]; the Kuwahara α<1 gate already landed (72 C-neg GREEN, dossier 74 :263–275) | LP layer for T3 only; T1/T2/T4 unblocked now | S core (0.6–1k LoC, dossier 74 :229–231); T3 +M on LP layer | LP-P1 for T3; 72's α>1 Rényi re-check due at pilot (SCAN §1c :49) |
| 11 word-RAM half + M3 | Theorem B(i) word-RAM realization (Light model) + M3 CH20∘VW13 instantiation 300–600 LoC (`11-blueprint.md` §4 :205–220; STATUS :696) | none hard; bench order | M3 S–M; B(i) M | none |
| Cold inventory 41/12/31/60/40/30 | Never-piloted main-run rows (`SCAN.md` §1b :27–38; `TRIAGE.md` :73–90): 41 q-deformed-eight-square (7.0, R8-cleared), 12 parametric-savings (6.0, feeder 51), 31 budgeted-split (4.0), 60 border-rank (3.0, attribution unverified), 40 zeta-k-prime-deriv (2.25, T2 contested), 30 hall-parseval Theorems A/A′ | per-row; 12's monotonicity-via-termPrime check flagged at pilot (SCAN :33) | 41 S–M; 12 S–M; 31/30 M; 60/40 S–M verify-first | bench — no live gates |

### 1c. ITER-4 debts (`qa/debts-register.md`) and owe-closure flags (`SCAN.md` §1c)

| Debt | One line | Discharge |
|---|---|---|
| f — HKT theorem-number partial pin (`debts-register.md:15`) | book pinned (Zbl 1200.11042), chapter/theorem unpinnable open-web | cite Part-3/four-pinned-papers only until physical check |
| g — vdG–vdV exact theorem number (`:16`) | open at theorem granularity | pin when a pilot consumes the falsity-trap citation — **due at FF-EZ2 dossier time** (maximal-family check, `iter4-seed-triage.md` :74–75) |
| h — tracker catalogue-lag caveat (`:17`) | deployed catalogue normalizes statuses; fresh push may lag | citation convention: `as_of` + commit date together (§9.5 protocol) |
| l — Λ-gap taken externally (`:21`) | Λ ≤ 9/32 kernel-checked by DrMurphyIsIn; "Λ absent everywhere" is false | iteration-4 charter/scan must not resurrect Λ-absence claims (SCAN carries it via seed 8; charter text must too) |
| Flags | Rosen ch.-number spot-check (due at 73-Q4); 72's α>1 Rényi re-check (due at 74 pilot); DLRT erratum propagation verify; tracker/Liu-2/mathlib-PNT/physlib standing clocks (`SCAN.md` §1c :44–67) | novelty battery, standing |

---

## §2 Prioritized queue (strict bar; first milestone = first kernel-checkable statement; Modal cost class per AGENTS.md)

**Modal cost classes** (AGENTS.md §Modal usage guidelines, mandatory): every run starts at
`cpu=2.0, memory=4096` with telemetry, `LEAN_NUM_THREADS=2`; overruns trigger
investigation, not upgrades; long builds go into cached image layers (`Image.run_function`
chunks, `g7_layers.py` precedent). Classes used below: **[WARM]** = warm single-file
elaboration, minutes-scale, default 2cpu/4GB (probe/pilot apps share cached image layers);
**[HEAVY-IMPORT]** = same defaults but entropy-core/G4-class imports (RSS includes mapped
mathlib olean pages ≈5–6 GB — inherent, not a breach; AGENTS §5 measured facts);
**[LAYERS]** = donor-tree build ≈15–20 min, cached image layers, 2cpu/4GB base (the M4b2
recipe re-run at SPEC; longer wall-time accepted, no up-spec without per-run user approval).

**[ORDER UPDATE 2026-11-16, §7 — supersedes the 1↔2 ordering in the table below.]** R2's
discovery-strength audit (`qa/iter4-review/r2-discovery-strength.md`) establishes 75 as
the ONLY Cycle-2 new-statement-class item; under the strength bar the launch order flips
to **75 P-b first (discovery-first), LP+02-core second** — both still week-1, in parallel
lanes. Full argument and the LP billing change in §7; execution specs for both in §8–§9.

| Rank | Item | First milestone (kernel-checkable) | Cost class | Why here (strict bar) |
|---|---|---|---|---|
| **1** | **LP layer + 02-core consumer** (slot 1) | `lp_weak_duality` (bridge §3 signature, `lp-duality-bridge.md:79–86` = `lp-layer-prework.md:71–79`) proved kernel-clean in `pilots/lp/L1.lean`, triad-only axcheck | [WARM] 1–3 runs | Fastest de-risk in the inventory ("do it FIRST", `iter4-seed-triage.md:228–230`); complete deliverable (layer + consumer dictionary), unblocks 74-T3 for free; Lean-ecosystem-scoped claim with five mandatory nearest-miss cites (AFP trio + Coq + Yamashita) |
| **2** | **75 P-b 5/6 strip-distinct arm** (carried) | E1 `addFinOver_cons` + E2 `commonStripCum_add_le` + E3 `commonStripCum_addFin_le` GREEN over carried Pa.lean (`Pb-design.md` §1) | [WARM] 3–5 runs | Best completion-per-effort in the backlog (§3c); finishes the QR-D cluster's headline tower at the designed endpoint |
| **3** | **AL-3D B.2 staged** (slot 2; decision §3a) | AL-P0: the frozen 3D statement layer (32 defs, `Statements3D.lean` cluster) + the 3 new defs (`IsColumnClosed3D`/`SlabAreaLawColumnCuts3D`/`PlanarAreaLawVar`, `al-3d-prework.md` §2.3–2.4) elaborating mathlib-only, 0 errors | [HEAVY-IMPORT] 1–2 warm runs/milestone | Highest seed score (≈7.0, `ITERATION4-SEED-DOSSIERS.md:27–30`); A5-clean (row 1); but conditional/glue grade — substrate + statement-layer value, never a headline |
| **4** | **ZZV2 λ-family route (a)** (slot 3) | P0 probe in the built V2 tree: `#check`/`#print axioms` of `simpleOnLineCount_lower`/`distinctZeroCount_lower` + PIN the Landau η-genericity question (P0(b)) (`zzv2-lambda-prework.md` §2) | [LAYERS] M4b2 recipe, ≈15–20 min/run | Formalization-first (Lamzouri must-cite, label like 73's); zero-gate, stack-reusable by 42/75; ranked below the completions because the artifact is glue-capped (N≈2–3 ceiling) |
| **5** | **72-M1 L3 + interface** (carried) | L3a `hermPart_isHermitian`/`opNorm_hermPart_le`/`hamiltonian_hermPart` GREEN in `P72M1T3.lean` (`L3-spec.md` §2) | [WARM] ≤8 runs ≈2.5 min each | Completes the family-265 in-corpus first-contact bridge (producer↔consumer interface theorem); spec'd to the lemma with verified anchors |
| 6 | 73-Q4 `hRat` discharge | A2's gate recommendation FIRST (decision, no Modal); then Q4's `hRat` existential produced explicitly by residue-class decomposition (`73-prework.md` §2.4 C1) | [WARM] after decision | Opens the Tate-dictionary's unconditional depth; M-risk isolated at Q4 by design |
| 7 | 74 T1+T2+T4 core pilot | T1(a) Cantelli floor `√((1-ε)/ε · Var(K)) ≤ W_ε(p)` in finite Finset dress (dossier 74 :81–92, sketch :188–192) | [WARM] | Highest NEW-statement density per LoC (T4 converts C.3 from open question to method-data theorem); T3 waits on LP-P1 |
| 8 | 10 assembly tranche D1–D4 | D1 counter-padding machine + the `exists_tm_padded_space` endpoint at D4 (scope split per `next-tranche-spec.md` §0–§1) | [WARM] | Completes the dossier-10 machine-layer headline; the tranche itself is declared plumbing — completion value, not novelty |
| 9 | FF-EZ4 genus-1 + 22-T2a (task-slot pair) | FF-EZ4: the identification statement `tauceti zetaFunction (E) = Weil zetaSeries (E)` elaborated on-pin with the tauceti instance path (G6b) | [WARM] | S-effort dictionary node every FF seed consumes; 22-T2a rides the same lane as a small binder task |
| 10 | 75 N2 (after P-b) | (d1)+(d2) staged once in a shared file; then `zetaL_two_thirds_landed_ℚ` (`75-prework.md` §c N2) | [WARM] | Partially-unconditional landing of dossier 75's C2 — the strongest ζ_L posture available without new donors |
| 11 | 11 M3 (CH20∘VW13) | the composed `Red`-lift statement matching `theorem_21a_compose`'s N^{3/2+o(1)} term (`11-blueprint.md` §4 M3) | [WARM] | Bench; completes Theorem B's composed instance; B(i) word-RAM half stays M-class behind it |
| 12 | 41 q-deformed-eight-square (cold bench top) | re-scoped (H) sign-rule/parallelogram-defect statement probe | [WARM] | Top cold score (7.0, `TRIAGE.md:85`); activate only when a pilot lane drains |
| 13 | FF-EZ2 survivor (after battery) | the surviving exclusion/family-quantified proportion statement, battery-clean + vdG–vdV pinned (debt g) | [WARM] | Unblocked by 71-P2/73-C GREEN; month-clock (Suzuki/WenrongZou neighbors) |
| 14 | physlib occupation-pair bridge probe | G-probe: article-52 occupation axioms instantiated on `CrAnFieldOp` statements elaborating on our pin (`physlib-surface.md` §4(i), §5) | [WARM] probe | Sharpest physlib opening; differentiation gates (52 + Wick stack) before any pilot |
| 15 | 12 parametric-savings (cold bench) | ε(ω_b) monotonicity statement with the termPrime check run at pilot (SCAN :33) | [WARM] | Second cold score; feeder-51 fold resolved as rescope |

Watch (not ranked): tauceti zone pairs (S11 survivors: N1b/N3/bridge only), S13 full pilot,
Weil-window transports (S12), G5a decision (feasibility lane), 50-M2 R2 binder (fold into
75-N2's (d1) staging if executed at all).

---

## §3 The three decisions, argued

### (a) AL-3D slot: **B.2 staged (A2's ladder) — confirmed; B.3 re-priced as the iteration-5 rung**

Direct-source facts (re-read this session, sibling read-only):

- **B.2** (`docs/3D/Targets.md` §B.2 :45–55): verdict "Plausible with bounded new work,
  most of it restating; the risk is volume, not mathematics" (:55); the new work is "every
  Lean statement on `ℤ × ℤ` restated for a site type with a projection to `ℤ²`" (:53) —
  donor-scale for B.2-FULL; one named uncertainty (§11 whole-column caveat, :139).
- **B.3** (`Targets.md` §B.3 :59–65): verdict "Provable with bounded new work; it is the
  most routine of the targets and the foundation of B.4" (:65); on the DONOR's tree the
  reuse is genuine (LR on any finite graph, Gevrey filter, sqrt step; only counting
  constants change, :61–63).
- **The catch, measured this session**: on OUR pin the donor tree is un-importable (G5a
  Physlib boundary), so B.3's "routine" is a TRANSCRIPTION of the donor's §4 chain:
  `AreaLaw/S02_Preliminaries.lean` (959 LoC) + `AreaLaw/S04_Quasilocal/` (2,980 LoC, 11
  files, incl. `Positive.lean:338–341` = the 2D `PositiveReplacement` proof) +
  `AreaLawForMathlib/Analysis/Fourier/Gevrey{Bump,BumpFourier}.lean` (950) +
  `Analysis/ODE/LiebRobinson.lean` (594) + `Analysis/CStarAlgebra/SqrtHolder.lean` (114)
  + the Physlib-vendored region core re-derivation (~0.7k, the 72-M1 T1 precedent) ≈
  **6.3k LoC of other people's proofs at v4.36** — L-grade here despite M-grade there.
- **Clock asymmetry**: the donor's graph-level machinery already exists in-repo, so the
  donor/contestants can land B.3 in-tree with a one-file delta — the sharpest
  challenge-repo decay risk on the board (SEED-DOSSIERS risk (i), :105–107). B.2-staged's
  artifact (`SlabAreaLawColumnCuts3D`) is a NEW name nobody else has stated — no external
  clock on the exact claim.
- **Effort**: B.2-staged ≈1.0–1.6k LoC (AL-P0 0.45k / AL-P1 0.15–0.35k / AL-P2 0.4–0.8k,
  `al-3d-prework.md` §5) vs B.3 ≈6.3k — a ~4:1 ratio for the slot's purpose.

**Decision: B.2 staged** (AL-P0 → AL-P1 → AL-P2 = `SlabAreaLawColumnCuts3D` under the
`PlanarAreaLawVar` binder; HARD STOP before full `SlabAreaLaw3D`), with two riders:
(i) the slot is justified as **substrate + statement-layer value** — AL-P0 feeds ANY
B-rung including a future B.3 — and the rung-stone is sold as conditional glue (binder
honestly not-known-discharged; AAG 2103.02492 = frustration-free 2D only; uniform case
rests on unrefereed [OAI265] — `al-3d-prework.md` §2.4 honesty ledger), never as an
AreaLaw3D-adjacent headline; every claim names its fence (C.1–C.4 rule, Targets.md §A :23).
(ii) **B.3 becomes the designated next rung** (iteration-5 candidate) with this file's
6.3k-LoC pricing on record — if the challenge repo lands it first, our transcription
collapses to a citation and the slot budget rolls to B.4-consumers.

### (b) LP-duality first consumer: **02-core (the zeta/zero-density side) — 74-T3 stays the optional second**

- **Prework asymmetry**: the 02-core consumer clause is statement-complete
  (`lp-layer-prework.md` §2.3 :141–150, `bw2_ceiling_of_dual`, ~30–60 LoC of plumbing on
  the layer) with its proof shape written; 74-T3 exists only at bridge-schematic level
  ("statement-port in LP-P0; execute only if chartered", `lp-layer-prework.md` §2.4).
- **Claim-surface cleanliness**: 74-T3 is double-fenced — it stays [HYPOTHESIS] until the
  LP representation is proved (vertex enumeration, N ≤ 8), and it carries the `u ≠ 1`
  `Real.rpow` side condition in-statement (`lp-duality-bridge.md` §1 row 2, §6.4). Under
  the stricter discovery bar, a fenced `≤`-half is a weak first consumer. 02's clause is
  the WHOLE of its re-scoped core item 1 — a complete deliverable (pointwise, no `sSup`
  machinery).
- **Cluster multiplication**: the zeta/zero-density cluster is where the layer compounds —
  02's k=1 rows are `EnclOK`-enclosure binders (zeta23 pattern), and the 42-M4b/75
  assembly stack is live and warm; a Lean-native ceiling dictionary there is reusable by
  the QR-D program immediately. The AL cluster gets its LP payoff (74-T3) anyway once the
  layer exists — the `≤` lemma is consumer-agnostic.
- **74 is not orphaned**: its discovery core (T1+T2+T4, no LP needed) enters the queue at
  rank 7 on its own strength; T3 executes as the layer's SECOND consumer only if the
  charter names it (per the prework's own gate).

**Decision: first consumer = 02-core** (`bw2_ceiling_of_dual`); 74-T3 optional second
behind the charter gate; 74's T1-core pilots independently.

### (c) Best completion-per-effort among carried items: **75 P-b**, then 72-M1 L3

- **75 P-b**: the only carried item that is (i) designed to the lemma (E1–E6 with
  mathlib anchors pre-verified, `Pb-design.md` §1–§2), (ii) priced (+0.25–0.35k LoC,
  3–5 runs, guards + sanctioned fallback §4), (iii) the designed ENDPOINT of an
  already-GREEN tower whose claim — n-fold abelian-assembly ζ_L proportions with the 5/6
  distinct-strip arm — survives every standing clock (per-class split intact; tracker is
  Dirichlet-only; Liu-2 touches half-planes not proportions, `75-prework.md` §e risk v).
  It converts Cycle-2's "entry GREEN" into the complete dossier-75 statement set. This is
  the strongest FINISHED discovery available this iteration.
- **72-M1 L3 + interface** is the runner-up (spec'd, verified anchors, M effort): it
  closes the "two halves of family 265 each formalize one face" gap with a single
  interface theorem — high significance, but 360–700 LoC of new proofs vs P-b's priced
  0.25–0.35k of transported algebra.
- 73-Q4 is the best GATE value (opens unconditional Tate depth) but carries the isolated
  M-risk the prework itself flags (Q4's Finset counting, `73-prework.md` §5); 10-tranche
  is completion of an arc whose novelty was already banked (declared plumbing,
  `next-tranche-spec.md` framing); 50-M2 R2 adds only conditional ζ_K coverage now that
  R1 landed unconditional ζ/Dirichlet at 7/8 — its binder form is worth executing ONLY as
  the (d1)-glue co-staging with 75-N2, not as a pilot of its own.

---

## §4 DROP list (explicitly not this iteration)

1. **FF-EZ5 standalone** — LIKELY-DEAD (Faifman–Rudnick 0803.3534 owns family
   zero-counting; `iter4-seed-triage.md` :59–82). Survivors folded into FF-EZ2 (queue #13).
2. **Seed-11 CAR "statistics-universal sign-calculus" framing** — DEAD as future novelty
   (physlib `ExchangeSign` cocycle + sign-aware Wick stack, 2026-11-13,
   `iter4-seed-triage.md` :84–120); only N1b/N3/bridge survive, behind batteries.
3. **50-M2 R2 full-import route** (G1 DZDF build) — terminally blocked (G1b: vendored CFT
   62 err/11 modules); binder fallback only, folded into 75-N2's (d1) staging decision.
4. **G6a Stacks direct import** — CONFIRMED NEGATIVE (59,222-job closure, 7,493 drift
   errors; ledger §9 :261–262). Weil stays binder-only (S12).
5. **AreaLaw3D north-star attempts; full `SlabAreaLaw3D` (arbitrary cuts); B.4/B.5 rungs;
   `PlanarAreaLawVar` discharge** — banned by the prework's hard stop-gates
   (`al-3d-prework.md` §5) and the donor's own §A fence (Targets.md :23).
6. **02 Theorems A/B/C; 74-T3 `=` direction / vertex enumeration / N > 8** — out of
   slot-1 scope by the bridge's consumer map (`lp-duality-bridge.md` §4).
7. **Λ candidates not starting from the DrMurphyIsIn artifact** — banned (debt l,
   `debts-register.md:21`); "Λ absent everywhere" is false as of 2026-11-13.
8. **QuasiRiemannTracker as donor** — DO-NOT-CONSUME; clock + citation protocol only
   (charter-draft (a); debt h).
9. **Cold-inventory rows 60 / 40 / 51 / 31 / 30-A/A′** — benched this iteration: 60's ≤21
   attribution unverified (its own precondition, `SCAN.md:35`); 40 T2 contested
   (Šleževičienė/Broughan) at score 2.25; 51 folds into 12; 31's shared glue already
   amortized by landed 32; 30's remaining A/A′ is M-effort with the falsify-half banked.
   Revisit only if a lane drains with 41 and 12 already assigned. (41 and 12 stay ON the
   bench as ranks 12/15.)
10. **Seeds 7/8/10/12 as pilots** — donor/infra notes only (A5's DONOR/INFRA class); no
    novelty claim attached, no slot.

---

## §5 First-week lane assignment (9 research lanes; queue-loaded bottom-up per RESUME-BRIEF-C2 §Protocol; H commits on reports)

| Lane | Assignment (2–3 item queue, bottom-up) | Owned surface |
|---|---|---|
| **L1 (LP pilot)** | (1) LP-P0 probe → (2) LP-P1 layer GREEN → (3) LP-P2 02-core consumer; per `lp-layer-prework.md` §5 guards; add `L1→AxL1` sibling-import case to make_axcheck at TARGETS time (prework §4 note) | `pilots/lp/*`, app `crossmath-pilot-lp` |
| **L2 (AL-3D pilot)** | (1) AL-P0 statement port → (2) AL-P1 fibre geometry → (3) AL-P2 rung-stone; stop-gates per `al-3d-prework.md` §5; B-rung label B.2-staged on every artifact | `pilots/al3d/*`, app `crossmath-pilot-al3d` |
| **L3 (ZZV2-λ pilot)** | (1) P0 probe on V2 tree (pin P0(b)) → (2) P1 λ-abstract statement layer GREEN → (3) P2 glue route IF P0(b) favorable, else stop-and-report per `zzv2-lambda-prework.md` §5 | `pilots/zzv2-lam/*`, app `crossmath-pilot-zzv2-lam` (M4b2 recipe, [LAYERS] class) |
| **L4 (75 completion)** | (1) P-b E1–E6 → Pb-1/Pb-2/Pb-3 GREEN + in-file axcheck → (2) stage (d1)+(d2) shared file → (3) N2 if week allows; N3 axcheck on each landing | `pilots/75/*` (Pb.lean, shared-ℚ staging) |
| **L5 (72-M1 completion)** | (1) L3a+L3b → (2) L3c+L3d → (3) interface theorem + full axcheck incl. `AxPilot72_M1_T3`; Tier-C only (Tier-B stays G5a-gated) | `pilots/72-M1/*` (P72M1T3.lean) |
| **L6 (novelty battery)** | (1) dossier-hardening batteries for the three chartered seeds ([NOVELTY-CHECK-NEEDED] marks: mathlib-PR/Cone clock for LP; Lamzouri λ-window + constant shapes; third-party formal activity on AreaLaw2D 3D) → (2) debts f/g/h/l discharge lines + Rosen spot-check (73-Q4 due) + α>1 Rényi re-check (74 due) → (3) standing clocks (tracker static-asset curl, Liu-2, physlib `pushed_at`, WenrongZou) | `novelty/round-5*`, VERDICTS, CLAIMS-REGISTER |
| **L7 (feasibility upkeep)** | (1) generalize make_axcheck sibling-import rewrite (map every staged-name → rewrite ALL sibling TARGETS imports; the `P11T3`/`L1→AxL1` lessons made systemic) → (2) ledger §9 rows + TARGETS for every new pilot landing → (3) G5a Physlib-pair DECISION memo (fix-forward 17 errors vs mathlib-only routes — decision only, coordinate with R8's donor-unblock plan) | `feasibility/probe/*`, VERIFICATION-LEDGER, ITERATION4-* upkeep |
| **L8 (FF continuation + task-slots)** | (1) 73-Q4 gate recommendation (A2's owed call) → (2) Q4 execution if gated open → (3) FF-EZ4 identification probe or 22-T2a binder task as drain-filler | `pilots/73/*`, `bridges/function-field.md` |
| **L9 (dossiers/records)** | (1) dossier 74 hardening to full Phase-3 form (T1+T2+T4 scored core; T3 rides LP) → (2) pilot-outcome records for L4/L5 landings (A9 pattern) → (3) queue-maintenance: TRIAGE-C2-ROWS → iter4 backlog rows sync against this file | `candidates/74*`, `REPORT-INPUTS*`, dossier records |

Benched (explicitly unassigned first week): 10-tranche (activates week 2 on lane-drain or
charter scope decision), 11 M3/word-RAM, 41/12 cold bench, FF-EZ2 (waits on L6 battery +
debt g), physlib bridge probe (waits on L6 differentiation + L7 G-probe slot), 74-T1 pilot
executes under L9's hardened dossier via the first draining pilot lane.

**Protocol riders for every lane** (carried from C2, `ITERATION4-CHARTER-DRAFT.md` §c
:78–83): one writer per file; logs persisted with provenance headers (log-rescue lesson);
artifact-cache transients retried 1–2× before "blocked"; Modal defaults 2cpu/4GB with
telemetry and `LEAN_NUM_THREADS=2` on every runner (down-specced-SPEC pattern from the
2026-11-14 incident record; no up-spec without per-run user approval); probe-convention
stubs only in header-marked probe files; donor statements only as binders / verbatim
marked probe copies / built on-pin libraries.

---

## §6 Sources

Repo (read this session): everything in the header paragraph, plus
`research/qa/debts-register.md` (:15–:21 f/g/h/l), `research/TRIAGE.md` (:73–90 cold rows),
`research/pilots/10-blueprint.md` (:186–189 tranche; §L2 run log), `research/pilots/11-blueprint.md`
(:205–220 M2/M3; STATUS :696 word-RAM note), `research/STATUS.md` (close block: final pilot
outcomes table, iteration-4 handoff list), `research/feasibility/VERIFICATION-LEDGER.md`
(§9 :220–322; §9.F :325–344), `research/feasibility/axiommath-donor-probes.md` (:25 G5a,
:31 G7b, :251, :407), `research/candidates/74-surprisal-moment-hierarchy-ceilings.md`
(:81–119 T1–T4; :229–231 feasibility; :263–275 pilot outcome), `research/pilots/73-prework.md`,
`75-prework.md`, `75/Pb-design.md`, `72-M1/L3-spec.md`, `50-M2-31-32-spec.md`,
`pilots/10/next-tranche-spec.md`, `pilots/lp-layer-prework.md`, `pilots/al-3d-prework.md`,
`pilots/zzv2-lambda-prework.md`, `novelty/iter4-seed-triage.md`, `novelty/physlib-surface.md`,
`feasibility/lp-duality-bridge.md`, `feasibility/ITERATION4-{SCAN,SEED-DOSSIERS,CHARTER-DRAFT,CHARTER-SPLICE}.md`,
`research/ORCHESTRATION-ITER4.md` (lane tracker). Donor/mathlib (read-only, direct-source):
`axiommath/AreaLaw2D/docs/3D/Targets.md` (:23 §A fence, :45–55 B.2, :59–65 B.3, :69–91
B.4/B.5, :103–127 C.1–C.4, :139 uncertainties), `OpenAI/Statements3D.lean` (:175
SlabAreaLaw3D, :212 PositiveReplacement3D), `AreaLaw/S04_Quasilocal/Positive.lean`
(:338–341 the 2D PositiveReplacement proof), closure sizes by `wc -l` (S02 959;
S04_Quasilocal/ 2,980; Gevrey pair 950; LiebRobinson 594; SqrtHolder 114;
AreaLaw+AreaLawForMathlib total 94,813), `encore-mathlib/repo/mathlib4/Mathlib/Analysis/Convex/Cone/Basic.lean`
(:33–37 TODO, re-verified on-pin this session).

— end R5 §1–§6 (2026-11-16 first pass). §§7–10 below are the 2026-11-16 integration pass
(R2 + R8 inputs + Phase-B execution specs), same lane, same file.

---

## §7 RECONCILE — R2's strength bar and R8's unblock plan folded in (2026-11-16)

### 7a. R2 (`qa/iter4-review/r2-discovery-strength.md`): the 1↔2 reorder, argued

R2's verdicts that bite this queue: **75 is the only Cycle-2 item whose statement class is
new** (R2 §1 ranking line 1: "(i)-lite: new statement class + (iv) assembly glue … the
n+1-factor statement class and the binder schema" — the ζ_L/ζ_K on-line proportion family,
direct-source-verified absent from every corpus and the informal literature, R2 §5 queries
1–2), and it **passes the four-point strength bar only as a conditional** (S4(b): the
schema is the discovery; title/abstract carry the conditionality — R2 §4). 42-M4 is a
donor-swap (iii), 50-M2 a binder discharge of the donor's own printed Cor. 1.2 (iii), 71/73
formalization-first (ii), 11-B(ii)/72-M1 interface glue (iv), 72 a fence around Kuwahara's
refutation (v)+(iv) — and, decisive for this queue: **the LP layer + 02-core consumer does
NOT pass S1 even unclaimed** — R2's S1 says explicitly "corollary-level lemmas do not pass
S1 even when unclaimed," and `bw2_ceiling_of_dual` is a dressed application of weak
duality; the layer itself is class (iv) infrastructure, which R2's §4 demotions keep as
first-class *engineering* deliverables that "stop being 'discoveries' with articles."

**Does this reorder rank 1 vs rank 2? Yes — as LAUNCH ORDER and billing, not as execution
priority.** The two axes:

- **Infrastructure-first (keep LP at #1)** would say: A5's "do it FIRST regardless of which
  discovery-grade seeds win slots" (`iter4-seed-triage.md` :228–230) still holds — the
  layer is the 74/02 dependency either way, it is the cheapest item on the board, and the
  mathlib-Cone clock (TODO verified on-pin, `Cone/Basic.lean:33–37`) argues "charter fast."
  All true — and all of it survives a 1–3 day delay: the TODO has sat for years, R8's
  external read found no Lean LP-duality motion (the AFP line is Isabelle; the arXiv sweep
  has no Lean preprint 2024–26), and the LP lane's P0 probe is zero-risk parallel work.
- **Discovery-first (75-Pb to #1)** is what the cycle's failure mode demands: R2 §3 names
  the single most likely trigger of the bad feedback as headlining infrastructure/ecosystem
  items — "the Cycle-2 'discovery headline' was an ecosystem upgrade … headlining a
  donor-swap as the cycle's discovery" (R2 §3.3). Opening Iteration 4 with the LP layer as
  slot-1-billed would repeat that mistake in the very first commit. 75-Pb is the designed
  endpoint of the one statement class that survived the audit, is priced to the lemma
  (3–5 runs, +0.25–0.35k LoC over a GREEN carry), and its completion value is
  time-dependent on the iteration actually finishing it (the QR-D cluster industrializes;
  every landed arm dates the claim).

**Recommendation (launch order): 75 P-b launches day-1 as the iteration's top-billed
milestone; the LP lane starts its P0 probe the same day in parallel (a different lane, a
3-minute run) with LP-P1 GREEN targeted day 2–3.** The reorder is about which milestone
the charter headline names and which GREEN the first H-commit celebrates — 75-Pb
(discovery completion, conditional-titled per S4(b)); the LP layer is chartered the same
week as the iteration's named **engineering deliverable** (dossier + pilot record billing,
no article), which is exactly R2's §4 demotion class. Execution-wise nothing else in the
top-5 moves: AL-3D stays 3 (formalization-grade, already honesty-labeled), ZZV2-λ stays 4
(formalization-first, Lamzouri-labeled), 72-M1-L3 stays 5. One further billing correction
from R2 absorbed into the queue: rank 8 (10-tranche) is certified-progress engineering
toward an OPEN conjunction ("the only discovery-grade object (the conjunction) is not
proved," R2 §1 row 10-layers) — the tranche never receives discovery billing; and rank 6
(73-Q4) is precisely R2's upgrade path for the demoted 73 ("demote to dossier/pilot record
until Q4 (hRat discharge) lands," R2 §4.3) — consistent as queued.

### 7b. R8 (`feasibility/iter4-donor-unblock-plan.md`): verdicts folded, queue unchanged in substance

R8's four route verdicts confirm and strengthen this queue's DROP list with new
measurements (all cited from R8's file): (a) **DZDF direct build DROP upgraded from
"blocked" to "dead-as-specced"** — the shim can address ≤4 of 62 first-wave errors (R8
§1a), the narrow `Main` target still drags all 1,658 vendor modules (≈6.3k-module closure,
≈12–16 h at 2 CPU even zero-error, R8 §1b), and pilot-50's hQRH discharge is DONE via R1 —
no iteration-4 consumer exists (R8 §1c); the binder tier (G1a) is the only live form.
(b) **Physlib/G5a direct route DROP for iter-4** — AL-3D needs zero Physlib by its own
gates (R8 §2a); the 17 errors sit in ONE module (`QuantumInfo/ForMathlib/Matrix.lean`,
R8 §2b) and the refresh route is newly VIABLE (physlib master still carries that module —
external read 2026-11-16, R8 §2b record correction), but firing it needs a consumer: none
exists → G10 specced and SHELVED (R8 §2c; folded at §10 below). (c) PNT+ stays DEFERRED
(T1/T2/T3 unfired 2026-11-16; upstream toolchain still v4.35.0) with the cheap G9
statement-binder preflight attached to the 22-T2a slot. (d) Weil/Stacks DEAD stands; the
statement tier already executed into pilot 71. R8 §6's dependency table independently
confirms my queue's unblocked set (AL-3D mathlib-only; 75-Pb binder-tier by design;
ZZV2-λ on the built V2 donor; 73-Q4/FF-EZ4 via tauceti direct dep).

**Runner-wrapper debt folded into lane L7:** R8 §5a gap 1 — two stale shell wrappers still
default to the blocked xyz path (`pilots/32/run_pilot.sh:15–16` and
`feasibility/probe/run_probe.sh:15–16`, `MODAL_USER=xyz` + `sudo -n -u xyz`); every
iteration-4 reuse must pass `MODAL_USER=doz` or patch the default. L7's queue item (1)
absorbs this (one-line patches, file-ownership check before editing since `pilots/32/*`
may belong to a pilot lane). Also carried: new apps keep `run_commands` TEXTUALLY
IDENTICAL for layer-cache sharing (R8 §5b), and clone sources are the post-2026-11-13 doz
runners (73/75 patterns) — never the two stale wrappers.

---

## §8 EXECUTION SPEC A — 75-Pb: the 5/6 strip-distinct arm (Phase-B technical brief)

Status: [CHARTER-PENDING → Phase-B ready]. Authoritative design = `pilots/75/Pb-design.md`
(A4, 2026-11-14); this brief fixes names, provenance, run plan, and acceptance. Billing per
§7a: discovery-completion of the 75 statement class, **conditional-titled (S4(b))**.
**[OWNERSHIP RESOLVED 2026-11-16, orchestrator: the executing lane is the A3-pattern lane
(M4a-mirror competence) from day-1, as the iteration's top-billed discovery milestone;
`Pb-design.md`'s A4 ownership and R9 §6e's "strictly after AL-P0/P1" sequencing are
SUPERSEDED — the AL lane owns AL-3D B.2 only. Run plan below unchanged (app, files,
guards all lane-independent).]**

### 8a. Target statements (verbatim from `Pb-design.md` §0; names final)

Deliverable levels, all in namespace `CrossMath.Pilot75` over the carried Pa.lean layer
(`pilots/75/Pa.lean`, 1,557 LoC, GREEN run6-final):

**Pb-1 (defect form — the n-fold Bonferroni lift):**

```lean
theorem zetaL_assembly_distinct_defect_landed {fK fL : ℂ → ℂ} {F : ι → ℂ → ℂ}
    {c₀ cStar : ℝ} {c : ι → ℝ}
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinF : ∀ i, WindowFinite (multOf (F i)))
    (hcK : cStar ≤ c₀) (hcF : ∀ i, cStar ≤ c i)
    (hAKd : EpsLowerDistinctStripCum ⟨multOf fK, hfinK⟩ c₀)
    (hAFd : ∀ i, EpsLowerDistinctStripCum ⟨multOf (F i), hfinF i⟩ (c i)) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (cStar - ε) * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ)
        ≤ ((⟨multOf fL, hfinL⟩ : ZeroMult).distinctCountCum T : ℝ)
          + ((commonStripCum ⟨multOf fK, hfinK⟩
              (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T : ℝ)
            + ∑ p ∈ (Finset.univ ×ˢ Finset.univ).offDiag,
                (commonStripCum ⟨multOf (F p.1), hfinF p.1⟩
                  ⟨multOf (F p.2), hfinF p.2⟩ T : ℝ))
```

**Pb-2 (`_of_negligible` full form):** under `hCZStripFam` stated in the SUMMED form
(`∀ ε > 0, ∃ T₀, ∀ T ≥ T₀, (commonStripCum zK (addFin zF) T : ℝ) + ∑ p ∈ offDiag,
commonStripCum … ≤ ε * (countCum zL T : ℝ)`) conclude
`EpsLowerDistinctStripCum ⟨multOf fL, hfinL⟩ cStar` (δ/2-split exactly as M4a's
`zetaL_distinct_five_sixths_strip_landed_of_negligible`, `nlinarith` on the nonneg
count-cast; per-pair⇒summed discharge-equivalence recorded as a file-header remark, not a
lemma).

**Pb-3 (C1, 5/6 arm):** `zetaL_distinct_five_sixths_strip_conditional` and
`…_of_negligible` — Pb-1/Pb-2 instantiated at `c₀ = c i = 5/6`, ζ_K slot via the carried
`K839OfLocalStrip` + `five_sixths_le_839` (`EpsLowerDistinctStripCum_mono`), family
components at 5/6 binders — mirroring `zetaL_two_thirds_conditional` (P-a) and M4a's two
distinct landings one degree up the tower.

**Defect convention (decided, `Pb-design.md` §0):** ORDERED-pair `Finset.offDiag` sum
(each unordered pair counted twice) — no linear order needed on `ι`; the cons-induction's
defect growth `+ 2·∑ C` matches it with slack; factor 2 harmless at the negligibility
stage. Exact-`Σ_{i<j}` variant derivable later, flagged not planned.

### 8b. Binder/hypothesis provenance table (per statement, donor-cited)

| Binder | Provenance (statement-quoted / carried / open-core) |
|---|---|
| `hK/hF/hntopK/hntopF` (analyticity + finite order off {1}) | structural set, ours — `75-prework.md` §(b)5; the `hntop*` pattern is M4a-carried; `hF` entire encodes DZDF `abelianFactorization`'s nonprincipality conclusion |
| `hAbFac` | statement-quoted mirror of DZDF `abelianFactorization` (`DedekindZetaZeroFree/Arithmetic/AbelianRayCharacterFactorization.lean:62`) / `dedekindAbelianQuotient` (`LFunctions/Dedekind/EntireAbelianQuotient.lean:13`) — CFT-vendor authority `survey/axiommath-cft-vendor.md` §(d); never imported (G1 dead, §7b) |
| `hfinK/hfinL/hfinF` (`WindowFinite`) | ours per A3 §(f) — window-finiteness obligations carried explicitly (`75-prework.md` §(b)5) |
| `hAKd/hAFd` (`EpsLowerDistinctStripCum` at c₀/c i) | the named OPEN CORE — Hecke-L strip-distinct proportions nobody has (`75-prework.md` §(b)2); vocabulary = M4a strip-distinct layer (`pilots/42/M4a.lean:832–856`, carried in Pa.lean) |
| ζ_K slot in Pb-3 | `K839OfLocalStrip` + `five_sixths_le_839` — M4a-carried (Knausgård 0.839 distinct constant, binder-fed into M4a; `Pb-design.md` §0 Pb-3) |
| `hCZStripFam` | binder BY DESIGN — `20-hCZ-NOTE.md`'s not-provable-today verdict (`75-prework.md` §(b)6) |
| `ZeroMult`/`multOf`/`addFin`/`countCum`/`distinctCountCum`/`commonStripCum`/`EpsLowerDistinctStripCum(_mono)`/`distinctCountCum_add`/`supp_add_eq`/`multOf_of_abelFac`/`countCumOf_add_of_abFac`/sup′ pattern | carried whole from Pa.lean = M4a lineage GREEN (`pilots/75/Pa.lean`; anchor `M4a.lean:856` for the 2-factor defect engine) |

No donor imports anywhere (EnclOK binder posture; acceptance criterion 3 below).

### 8c. Lemma decomposition (engine, dependency order — `Pb-design.md` §1, LoC from it)

- **E1 sub-family aggregator** `ZeroMult.addFinOver (s : Finset ι)` +
  `addFinOver_cons` (pointwise `Finset.sum_cons` + `Nat.add_comm`; friction F1: ZeroMult
  ext — fallback private `ZeroMult.eq_of_mult` ~8 LoC). ≈30 LoC.
- **E2 binary sub-additivity** `commonStripCum_add_le` (`supp_add_eq` +
  `Set.union_inter_distrib_right` + toFinset transport + `Finset.card_union_le`
  `Mathlib/Finset/Card.lean:590`). ≈30 LoC.
- **E3 union-intersection bound** (priced sub-item) `commonStripCum_addFin_le` —
  cons-induction via E1+E2; fallback supp-subset route + `Finset.card_biUnion_le`
  (`Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:1008`). ≈25 LoC.
- **E4 two-level Bonferroni** (the invariant) `bonferroni_addFinOver` — cons-induction,
  step = 2-factor `distinctCountCum_add` (M4a:856) along E1's identity; friction F2:
  `Finset.cons`-vs-`insert` in `×ˢ`/`offDiag` rewriting (+10–15 LoC buffer). ≈70 LoC.
- **E5 n-ary distinct identification** `distinctCountCum_of_abelFac` — set identity from
  `multOf_of_abelFac` (P-a) + toFinset-inj transport as M4a `:946`. ≈40 LoC.
- **E6 ε-wiring (Pb-1)** — mirrors `assemble_eps_defect_strip_cum`'s algebra (max-T₀ sup′
  pattern, `push_cast`, `Finset.mul_sum`, `linarith`) + E4+E5. ≈50 LoC.
- Pb-2/Pb-3 wrappers ≈60 LoC; prints/headers ≈20. **Total new content ≈ +0.25–0.35k LoC
  on the 1,557-LoC carry.**

### 8d. Run plan

- **File**: `research/pilots/75/Pb.lean` — ONE self-contained file = Pa.lean carried
  verbatim + §8c (pilot-01 duplication convention; Pa.lean stays frozen as the GREEN entry
  record). Logs `research/pilots/75/logs/pb-run<N>.log`, provenance headers (date, LoC,
  command, verdict, run URL).
- **Runner/app**: the EXISTING `crossmath-pilot-75` (`pilots/75/run_pilot.py`, SPEC
  2cpu/4GB + `@telemetered` + `LEAN_NUM_THREADS=2` — R8 §5a audit row; staged and warm,
  `Pb-design.md` §2). Clone source discipline: this is a post-2026-11-13 doz runner — do
  NOT clone from the two stale wrappers (§7b).
- **Modal cost class**: [WARM] pilot-milestone — single mathlib-only file, minutes per run
  at SPEC (R8 §5b table row "Pilot milestone (71/73/75-class)"); no donor build, no
  layers, no detach.
- **Run-count guard**: expected 3–5 runs to GREEN. HARD STOPS (`Pb-design.md` §3):
  (i) 0.45k LoC of new content without GREEN ⇒ stop; (ii) 6 consecutive runs without
  clear error-descent ⇒ stop; (iii) F1 or F2 consuming > 3 runs each ⇒ invoke the §8e
  fallback or park.
- **Fix-round discipline** (72-M1 L3-spec §7 style): no fix round without a written
  error-class hypothesis; descent measured in distinct error classes, not raw counts.

### 8e. Guarded fallback (spec-sanctioned)

If E4's offDiag machinery (F2) resists past its sub-guard: replace the pairwise defect by
the **iterated 2-factor defect** (`75-prework.md` §(e) risk (ii)'s conservative fallback):
fix `e : Fin n ≃ ι` (`Fintype.equivFin ι`), tail aggregates, defect =
`∑ k, commonStripCum (add zK (tail (k+1))) (e k) T`; order-dependent, weaker statement,
same proof shape (E2 only; E3/offDiag drop out); +≈0.1k LoC; HONESTY NOTE in the file
header (enumeration-dependence; `_of_negligible` form is enumeration-robust either way).

### 8f. Acceptance criteria

1. `Pb.lean` GREEN on Modal: rc=0, errors=0, sorry=0.
2. In-file `#print axioms` over EVERY new declaration (E1–E6 + Pb-1/2/3 + privates):
   triad-only `[propext, Classical.choice, Quot.sound]`, 0 sorryAx — full-coverage
   convention (71/73; `pilots/10/axcheck_full.py` pattern if the file count grows).
3. Zero donor imports; `hAbFac`/`hCZStripFam` remain external binders (never discharged
   in-file).
4. No U+2032 primes in identifiers (M4a run-1 finding; `…Strip` naming convention).
5. Logs persisted with provenance headers; report relay A9 (dossier-75 P-b + C1-5/6-arm
   fill) → A1 (ledger row) → H (commit). Article billing: conditional title per S4(b);
   nearest-miss cites = DLRT arXiv:1908.04876 (Thm 1.1/Cor 1.3(i), scope-flipped) +
   Bansal–Maji arXiv:2507.18121 + our article 42 (R2 §1 row 75).

---

## §9 EXECUTION SPEC B — LP layer + 02-core consumer (Phase-B technical brief)

Status: [CHARTER-PENDING → Phase-B ready]. Authoritative design =
`feasibility/lp-duality-bridge.md` (A1) + `pilots/lp-layer-prework.md` (A2); this brief
fixes M0, guards, and the citation obligations. Billing per §7a: the iteration's named
ENGINEERING deliverable (dossier + pilot record; no discovery article — R2 S1 excludes
corollary-level; the layer is class (iv)).

### 9a. M0 — the exact first kernel-checkable statements (mathlib `ff2494ea`)

**M0.1 (the layer, asymmetric standard form — VERBATIM `lp-duality-bridge.md:79–86` =
`lp-layer-prework.md:71–79`):**

```lean
theorem lp_weak_duality {m n : Type*} [Fintype m] [Fintype n] {R : Type*}
    [LinearOrderedRing R] (A : m → n → R) (b : m → R) (c : n → R)
    (x : n → R) (y : m → R)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)            -- primal feasible (x FREE)
    (hy : ∀ i, 0 ≤ y i)                            -- dual multipliers nonneg
    (hATy : ∀ j, ∑ i, y i * A i j = c j) :         -- dual equality feasibility
    ∑ j, c j * x j ≤ ∑ i, b i * y i
```

**M0.2 (symmetric-form corollary, reserve rider — `lp-layer-prework.md:90–97`):**
`lp_weak_duality_symm` — same shape plus `(hx : ∀ j, 0 ≤ x j)` with the weakened
`(hATy : ∀ j, c j ≤ ∑ i, y i * A i j)`; proved by applying M0.1 at
`c' := fun j => ∑ i, y i * A i j` then `Finset.sum_le_sum` of
`mul_le_mul_of_nonneg_right` pointwise.

Acceptance of M0: both GREEN in `pilots/lp/L1.lean`, 0 errors / 0 sorry, inline
`#print axioms` triad-only (expected `[propext, Classical.choice, Quot.sound]` or
subsets — pure `Finset` algebra).

**mathlib anchors (all [VERIFIED] on the encore checkout @ ff2494ea,
`lp-layer-prework.md` §3):** `Finset.sum_congr`; `Finset.mul_sum`/`Finset.sum_comm`
(to_additive twins of `prod_mul_sum`/`prod_comm`,
`Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean` — cite the twins' files, the
additive names grep-miss); `mul_le_mul_of_nonneg_left`
(`Mathlib/Algebra/Order/GroupWithZero/Defs.lean:225`; gcongr-registered);
`Finset.sum_le_sum` (twin of `Finset.prod_le_prod`,
`Mathlib/Algebra/Order/BigOperators/Group/Finset.lean` ~:121–126); `mul_assoc`/`mul_comm`.
Import set for LP-P0 to verify: `Mathlib.Algebra.Order.BigOperators.Group.Finset`,
`Mathlib.Algebra.BigOperators.Group.Finset.Basic`, `Mathlib.Data.Fintype.Basic`. The
absence premise re-verified on-pin this session: the TODO block at
`Mathlib/Analysis/Convex/Cone/Basic.lean:33–37` ("Define primal and dual cone programs and
prove weak duality" / "Define linear programs and prove LP duality as a special case of
cone duality"). NO convexity/separation files are in the proof's import closure — if a
proof attempt reaches for them, that is a design error (stop gate iv).

**Proof shape (M0.1, termwise — `lp-layer-prework.md` §3):** row-substitute `hATy`,
swap sums (`Finset.mul_sum` + `Finset.sum_comm` + `mul_assoc`), per-row
`mul_le_mul_of_nonneg_left (hAx i) (hy i)` under `Finset.sum_le_sum`, `mul_comm` the RHS.
~15 Lean lines + interfaces.

### 9b. The 02-core consumer statement form (LP-P2; `lp-layer-prework.md` §2.3)

Structures `BWDatum G` (`s s₂ : G → ℝ`, `p₁ : ℝ`), `BWCert G` (`c₀ : ℝ`, `r₁ r₂ : G → ℝ`),
`BWCert.valid` (`c₀ + ∑ g, δ.s g * r₁ g + ∑ g, δ.s₂ g * r₂ g ≤ δ.p₁` — dossier-02
§Precise verbatim shape), then:

```lean
theorem bw2_ceiling_of_dual {G D : Type*} [Fintype G] [Fintype D]
    (dat : D → BWDatum G) (μ : G → ℝ) (y : D → ℝ)
    (hy : ∀ δ, 0 ≤ y δ) (hsum : ∑ δ, y δ = 1)
    (hbary₁ : ∀ g, ∑ δ, y δ * (dat δ).s g = μ g)
    (hbary₂ : ∀ g, ∑ δ, y δ * (dat δ).s₂ g = μ g)
    (cert : BWCert G) (hvalid : ∀ δ, cert.valid (dat δ)) :
    cert.c₀ + ∑ g, μ g * cert.r₁ g + ∑ g, μ g * cert.r₂ g ≤ ∑ δ, y δ * (dat δ).p₁
```

Proof = `lp_weak_duality` at index types `m := D`, `n := Unit ⊕ G ⊕ G`, objective
`c (tt) = 1`, `c (inl/inr g) = μ g`; `hAx := hvalid` definitional; `hATy` unfolds to
`hsum/hbary₁/hbary₂`; ~30–60 LoC of `Sum`-index plumbing (`Finset.sum_sum_elim`-family;
`Mathlib.Data.Sum.Basic` + `Mathlib.Data.Fintype.Sum` joins the import set). Pointwise by
design — the `B_k`-`sSup` packaging is an optional 1-corollary extension behind a stop
gate. The 74-T3 second consumer stays statement-port-only in LP-P0 (shape + `u ≠ 1` side
condition carried IN the statement), executed only if chartered.

### 9c. Milestones, guards, stop conditions (the P0→P1→P2 discipline)

- **LP-P0 (probe; ≤0.15k LoC; 1 warm run):** `P0.lean`, probe-convention header, sorry
  stubs — M0.1/M0.2 signatures + the full §9b consumer cluster + the 74-T3 shape.
  Doubles as substrate preflight (`to_additive` twin names, `Sum`-index sum glue).
- **LP-P1 (the layer; ≤0.25k LoC; 1–3 runs):** `L1.lean` — M0.1 + M0.2 proved
  kernel-clean, inline full-coverage axcheck. **GO/NO-GO:** anything beyond §9a's
  inventory (convexity/separation files, `Matrix` machinery, guard breach) ⇒ STOP,
  diagnose-note, report — contradicts the bridge's S-grade.
- **LP-P2 (consumer; ≤0.7k LoC; 3–5 runs):** `L2.lean` — `bw2_ceiling_of_dual` GREEN +
  inline full-coverage axcheck. **`L2` imports `L1`** (sibling-import; flag the
  `L1 → AxL1` make_axcheck rewrite to lane L7 — the generalized sibling-TARGETS rewrite
  of L7 queue item (1) subsumes it).
- **Stop gates (hard, `lp-layer-prework.md` §5):** (i) `sSup`-packaging required for
  GREEN — never; (ii) 74-T3 `=`/vertex enumeration/N > 8 — never; (iii) 02 Theorems
  A/B/C — separate dossier work; (iv) Farkas/strong-duality/separation machinery — a
  design error if reached.
- **Overrun rule:** any guard breach without GREEN ⇒ stop, diagnose note in the log dir,
  report. Fix-round discipline as §8d.

### 9d. Run plan

Files `research/pilots/lp/{P0,L1,L2}.lean`; new app **`crossmath-pilot-lp`** cloned from
`pilots/75/run_pilot.py` (the cleanest 25-line setup, R8 §5b) — doz default, SPEC
2cpu/4GB + telemetry + `LEAN_NUM_THREADS=2`, `run_commands` kept TEXTUALLY IDENTICAL to
the shared recipe (elan v4.2.4 URL — NOT the dead `leanprover-community/elan`;
toolchain v4.36.0-rc2; mathlib `ff2494ea` + `lake exe cache get`) so the layer cache is
shared across all apps. Modal cost class: [WARM] statement-probe/pilot-milestone,
minutes per run at SPEC; no builds, no detach. Logs `research/pilots/lp/logs/` with
provenance headers; artifact-cache transients retried 1–2× (§7b protocol).

### 9e. AFP/Coq nearest-miss citation obligations (carried into the dossier verbatim)

Mandatory must-cites in every artifact citing the layer (A5's re-wording block,
`iter4-seed-triage.md` §seed-9 evidence; `lp-duality-bridge.md` §2): AFP `LP_Duality`
(Thiemann 2022, weak AND strong via Farkas, maintained through Isabelle2026); AFP
`Linear_Programming` (Parsert–Kaliszyk 2019 + arXiv:2403.19639); AFP `Farkas`
(Bottesch–Haslbeck–Thiemann 2019); Coq arXiv:1706.10269 (Allamigeon–Katz 2017); Yamashita
2026-06 (algorithmic HSD variant) + the mathlib TODO `Analysis/Convex/Cone/Basic.lean:37`.
**Never-phrase list:** "first formal LP (weak/strong) duality", "LP duality
unformalized", any "first" unqualified by Lean/mathlib-native. Claim shape (the ONLY
permitted framing): "the first mathlib/Lean-native duality layer and the first application
of formal LP weak duality to zero-proportion/entropic certificate programs (02's ceiling
programs; 74-T3's surprisal LPs)." Residual clock: mathlib-PR activity on the Cone TODO —
date the artifact against it at write-up (R7's external check owns the standing sweep).
Dossier 02's own kill stays binding: never "first barrier theory" (Knausgård §7.6 owns
all-windows; `law_lp.py` = Python motivation-only precedent).

---

## §10 G10 fold-in (the physlib shelf-probe, one paragraph)

R8's record correction (external read 2026-11-16: physlib master STILL carries
`QuantumInfo/ForMathlib/Matrix.lean`; repo pushed 2026-11-16T09:37Z) makes G10 — the
refreshed AreaLaw2D+Physlib staged build, `run_gprobe.sh g5a` turnkey with `lake update`
refreshing Physlib past `a50684a1`, pass = `lake build OpenAI.Statements` 0 errors +
`ProbeG5a_AreaLaw_Physlib.lean` elaborating in-tree, fallback = pin `a50684a1` + patch
the 17 single-module errors — a VIABLE shelf item rather than a dead end
(`iter4-donor-unblock-plan.md` §2b–2c). Its queue position: **shelf/watch, attached to
two ranked consumers and fire-gated on either chartering** — rank 5 (72-M1 Tier-B
upgrade, currently optional-Tier-C) and rank 3's honesty ledger (the `PlanarAreaLawVar`
uniform-case discharge via a donor `area_law` build, `al-3d-prework.md` §2.4(ii)); it
displaces NOTHING in ranks 6–15 because R8's own trigger test (a chartered consumer of
the donor's PROVED theorems) is unfired — AL-3D is mathlib-only by its own gates and
72-M1's Tier-C binder discharge is a one-line swap on upgrade. For seed-13 (rank 14), G10
matters as PROTOCOL, not product: the refresh-and-patch machinery for staging a modern
physlib rev (v4.35-toolchain) against our `ff2494ea` pin is exactly what a seed-13
statement-elaboration G-probe reuses, and the surviving `QuantumInfo/ForMathlib` wing
retires physlib-surface §2's "no entropy/density matrices" line (flagged to A5 by R8) —
the occupation-pair bridge's differentiation battery must now also sweep that wing.
Cost class: G10-class seeded build ≈18,274 jobs → cached-image-layer campaign
(`g7_layers.py` recipe), ≈6–12 h at SPEC 2cpu/4GB with `--detach` + memory watch; chunk
memory >4 GB needs a FRESH user approval with telemetry (the 8 GB G7b approval is spent).
Also standing: the mathlib artifact-cache health check before any clean-route attempt
(one cheap probe-mode run doubles as the ping).

—

## §11 EXECUTION SPEC C — AL-3D, B.2 staged: `SlabAreaLawColumnCuts3D` (Phase-B technical brief)

Status: [CHARTER-PENDING → Phase-B ready]. Authoritative design = `pilots/al-3d-prework.md`
(A2; execution owner at charter = A4 per R9 §7). **Rung decision: B.2 STAGED — decided**
(§3a + R8's 6.3k-LoC B.3 pricing; R9 §6c concurs and moves the formal branch point to the
post-AL-P1 GO/NO-GO, adopted here). Billing: formalization-grade substrate + conditional
rung-stone; never an AreaLaw3D-adjacent headline.

### 11a. M0 — the statement skeleton (AL-P0; B-rung NAMED, fences cited)

**M0.1 (the frozen target, transcribed VERBATIM — `OpenAI/Statements3D.lean:164–182` via
`al-3d-prework.md` §2.1; frozen per Targets.md §D rule 1; we do NOT prove this in the
pilot — it is the north fence the rung-stone sits beside):**

```lean
def SlabAreaLaw3D (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ) : Prop :=
  ∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ × ℤ), IsSlabDomain3D h Λ →
    ∀ Φ : (X : Finset (ℤ × ℤ × ℤ)) → Matrix (Reg (Qudits3D q) X) (Reg (Qudits3D q) X) 𝕜,
      IsAdmissible3D Λ R J Φ →
    ∀ (Ω : Reg (Qudits3D q) Λ → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) (E₀ : ℝ),
      hamiltonian3D Λ Φ *ᵥ Ω = (E₀ : 𝕜) • Ω → HasGlobalGap (hamiltonian3D Λ Φ) Ω E₀ Δ →
    ∀ (A : Finset (ℤ × ℤ × ℤ)) (hA : A ⊆ Λ),
      (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary3D Λ A).card
```

**M0.2 (the pilot's actual target — NEW name beside the frozen one, Targets.md §D rules
2–3; `al-3d-prework.md` §2.3):**

```lean
def IsColumnClosed3D (Λ A : Finset (ℤ × ℤ × ℤ)) : Prop :=
  ∀ x ∈ A, ∀ y ∈ Λ, (y.1, y.2.1) = (x.1, x.2.1) → y ∈ A

def SlabAreaLawColumnCuts3D (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ) : Prop :=
  PlanarAreaLawVar 𝕜 q R J Δ h →
    ∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ × ℤ), IsSlabDomain3D h Λ → … -- skeleton as §2.3
      ∀ (A : Finset (ℤ × ℤ × ℤ)) (hA : A ⊆ Λ) (_ : IsColumnClosed3D Λ A),
        (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary3D Λ A).card
```

with the honest binder `PlanarAreaLawVar` (variable-height planar area law; NOT discharged
in this pilot — uniform case = donor `area_law` shape, unrefereed [OAI265]; the padding
route was checked on paper and FAILS at the boundary count, recorded `al-3d-prework.md`
§2.4 so nobody re-derives it).

**Encoding cluster transcribed in AL-P0 (all mathlib-only; locators from
`al-3d-prework.md` §2.1):** `cubicLattice3D` :64, `domainEDist3D` :75, `edgeBoundary3D`
:98, `Qudits3D` :121, `supports3D` :125, `hamiltonian3D` :133, `IsAdmissible3D` :140, +
`IsSlabDomain3D` :166 — template = `feasibility/probe/ProbeG4_AreaLaw.lean` (the G4 green
statement port). **Obstruction fences (cited in every artifact's header):** the north star
`AreaLaw3D` is "not a target" (`docs/3D/Targets.md` §A :23 — "any document or commit that
claims progress on `AreaLaw3D` should say which of the four it resolves"); the four are
C.1 scanner exponents :103, C.2 first subvolume exponent :111, C.3 amplification radius
:117, C.4 point contacts :123. B.1 is donor-owned (`OpenAI.cylinderAreaLaw3D`
`Cylinder3D.lean:574`, `cylinderAreaLawOfPlanar3D` :526) — cite, never re-prove.

### 11b. Decomposition (P0 → P1 → P2; `al-3d-prework.md` §2.5/§5)

- **AL-P0** (S–M; ≤0.45k LoC; 1–2 runs): M0.1/M0.2 + `PlanarAreaLawVar` skeleton, probe-
  convention stubs; doubles as 3D-lattice-API preflight.
- **AL-P1** (S; ≤0.4k): the fibre-geometry core, mathlib-only — P1-a projection
  contraction (Λ-walks project to π(Λ)-walks; `SimpleGraph.induce`/`Walk` image);
  P1-b boundary lift (`|∂_{π(Λ)} π(A)| ≤ |∂_Λ A|` for column-closed A, injective lift);
  P1-c row/fibre count (`|(π ⁻¹' S) ∩ Λ| ≤ h·|S|`); P1-d slab basics. **GO/NO-GO:** if
  P1-b needs fibre-generic restatement of donor lemmas ⇒ STOP — that is B.2-FULL
  territory; diagnose, report, and flip the rung branch to B.3 (AL-P0/P1 carry over
  unchanged — B.3 replaces counting constants only, `al-3d-prework.md` :77–78).
- **AL-P2** (M; ≤0.9k): `SlabAreaLawColumnCuts3D` under the binder, per-column
  `finFunctionFinEquiv` regrouping (`Mathlib/Algebra/BigOperators/Fin.lean:577`,
  verified on-pin), generalized Cylinder3D architecture (pattern-only, never imported).

### 11c. Run plan + app

**Fresh app `crossmath-pilot-al3d`** (clone `pilots/73/run_pilot.{sh,py}` per
`al-3d-prework.md` §4) — chosen over reusing `crossmath-probe` because multi-milestone
pilots get per-pilot stage dirs and the `rel.startswith("P0")` probe-convention check;
**no cold start either way**: run_commands stay TEXTUALLY IDENTICAL to the shared recipe
(elan v4.2.4 URL, v4.36.0-rc2, mathlib `ff2494ea` + `lake exe cache get`), so the new
app's first image build is a layer-cache hit (R8 §5b). Stage `/tmp/crossmath-al3d-stage`,
world-readable per the staging pattern. Files `pilots/al3d/{P0.lean, A1.lean, A2.lean}`
(A2 imports A1 — flag the sibling-import axcheck rewrite to L7/A1's generalization);
logs `pilots/al3d/logs/` with provenance headers. **Cost class: [WARM] C1/C2 with
HEAVY-IMPORT elaboration** — the G4-style entropy core makes imports heavy; expect
minutes-scale runs (G4 precedent), RSS reads ≈5–6 GB by mmapped-olean residency (inherent;
AGENTS §5). Modal-only, `MODAL_USER=doz`; artifact-cache transients retried 1–2×.

### 11d. Guards + hard stops (`al-3d-prework.md` §5, verbatim discipline)

(i) NEVER `AreaLaw3D` or progress-adjacent phrasing without naming a C-item; (ii) NO full
`SlabAreaLaw3D` (arbitrary cuts — separately-chartered donor-scale); (iii) no B.3/B.4/B.5
content in this pilot; (iv) donor imports banned (G5a boundary); (v) no `PlanarAreaLawVar`
discharge. Overrun rule: guard breach without GREEN ⇒ stop, diagnose-note in the log dir,
report. Fix rounds need a written error-class hypothesis; descent = distinct error
classes. Inline full-coverage `#print axioms` per proof artifact (71/73 convention).

---

## §12 EXECUTION SPEC D — ZZV2 λ-family route (a), with the FF-EZ2 swap branch pre-written

Status: [CHARTER-PENDING; **branch-parameterized on R9 open-decision 1 (slot-3
keep-vs-swap), resolved at this reconciliation — my input: KEEP** (§2 rank 4 vs 13; R9
§6a's own K recommendation; R8's dependency table row "Seed 3 ZZV2-λ: V2 is a BUILT
consumable donor")]. Posture either way: formalization-first TECHNICAL RECORD (R2 S2/S4 +
R9 §3c two-strike; never an article; Lamzouri must-cited as the entire informal content).

### 12a. Route (a) spec (`pilots/zzv2-lambda-prework.md`, A3-owned)

**Statement ladder (L0–L4, prework §1):** L0 `LamParams` (λ-range PINNED by P0 from the
transfer layer's own binders — never guessed); L1 `kernelLam`/`C0Lam`-shape defs at the
donor's vocabulary (`Zeta/Transfer.lean:126` `simpleOnLineCount_lower`, `:151`
`distinctZeroCount_lower` — λ-generic endpoints); L2 the four family statements
`thm_simple_lam`/`_distinct`/`_average`/`_simple_or_critical` at the donor's challenge
shapes (`Challenge/Basic.lean:209–243` modulo constants), zeta23 `thmA/B/C_lam` precedent;
L3 glue at λ=1 (`C0Lam 1 = simpleProportion`) + `ContinuousOn` + family margin
(`∃ δ, ∀ lam ∈ ball 1 δ, 2/3 < C0Lam lam` from the donor margin ≈0.0058); L4 λ=1
regression bit-for-bit.

**Milestones (prework §2, §5):** **P0** (≤2 runs, statement facts only) — elaborate inside
the built V2 tree (M4b2 recipe): `#check`/`#print axioms` of the λ-generic surface; PIN
(a) the exact hypotheses/range of the transfer endpoints, (b) **whether the
Landau/pair-correlation side is η-generic or MT-frozen — the load-bearing question**, (c)
the functional's definition site. **P1** (≤300 LoC): `ZZLam.lean` binder-shaped — L0+L1
defs + L2 statements with the kernel-sum side as ONE explicit binder `hKS_lam`; GREEN on
donor+mathlib statements alone; L4 regression at binder level. **P2** (≤400 LoC): L3 glue
+ continuity + margin; binder discharge for λ near 1 IF P0(b) favorable. **P3** audit
(full-coverage axcheck incl. donor names; consumer-side `#print axioms` of
`ZetaZeros.simple_proportion_d4/distinct_proportion_d5`).

**Run plan + app:** `crossmath-pilot-zzv2-lam` = verbatim copy of the M4b2 recipe
(`pilots/42/run_m4b2.py`: tarball ZetaZerosV2 + PrimeNumberTheoremAnd minus .git/.lake;
PNT+ lakefile path-redirect; `lake update` → mathlib `ff2494ea`; `lake exe cache get`;
`lake build ZetaZeros`; consumer `lake env lean`). elan mirror: the working
`leanprover/elan` v4.2.4 URL (prework §3). **Cost class: [LAYERS]/C3 — at SPEC
2cpu/4GB expect ≈1–2 h per run (R8 §5b V2-class row; single SPEC function, 3-h timeout);
the prework's "15–20 min" figure predates the SPEC down-spec — plan wall-time
accordingly.** Budget: P0 ≤2 runs; STOP rule — if P0(b) finds the Landau layer
MT-frozen, stop after P1 GREEN + diagnose-note (the η-port is a charter decision, not
scope creep).

### 12b. Branch [SLOT3 = KEEP] (default) — what changes: nothing

The spec executes as written; the slot runs as stack infrastructure feeding the 42-M4/75
assembly line; output ships as a technical record indexed outside the article set.

### 12c. Branch [SLOT3 = SWAP to FF-EZ2] — what changes (one paragraph)

A3's deliverable becomes `pilots/ff-ez2/` plus a **P0 spec doc FIRST** (the
spec-before-run rule — no prework file exists; ≈ one lane-day): milestone 1 = the
survivor statement (the exclusion/family-quantified FF proportion that clears the
supersingular trap, carrying seed-6's folded counting-half) elaborated on-pin as a C1
probe (tauceti/mathlib-only, Weil-as-binder per S12) — **AFTER** A5's dossier-level
battery clears row 4's "re-verify at dossier level" mark AND debt g (vdG–vdV theorem
number) is pinned (the maximal-family falsity-trap citation is a dossier-level check,
`iter4-seed-triage.md` :74–75); guards must be SET by the spec doc before any proof run;
every claim dated against the month-clock (Suzuki 2610.41115 method-neighbor;
WenrongZou/TateThesis softening 73's scope). The ZZV2 spec returns to the shelf intact
(P0's pinned facts stay true; nothing is wasted). Cost class drops to C1 for the probe,
C2 for the pilot.

---

## §13 EXECUTION SPEC E — 73-Q4 `hRat` discharge (small spec + the article-or-dossier fork)

Status: [GATED on A2's owed recommendation — **this spec's input: GO**]. The gate
decision itself is a memo, no Modal; execution is a separate charter line (R9 §7 A2 item
2). Effort M (0.3–0.6k LoC, `pilots/73-prework.md` §5 Q4) — the isolated M-risk of the
73 chain, all in Finset counting, not mathematics.

**Step 0 (no Modal): the recommendation.** GO — (i) elementary: residue-class
periodicity on k[X] (Rosen GTM 210 ch. 8 territory minus the FE, which is out of scope);
(ii) it is R2's named upgrade path for demoted 73 ("demote to dossier/pilot record until
Q4 (hRat discharge) lands", `r2-discovery-strength.md` §4.3); (iii) it opens the
Tate-dictionary's unconditional depth at zero donor cost (73-C GREEN, warm runner).
Companion flag: the **Rosen ch.-number spot-check is DUE at Q4** (SCAN §1c :48).

**M0 — the statement skeleton (the hRat existential produced explicitly;
`73-prework.md` §2.4 C1):**

```lean
/-- (C1) rationality by periodicity: every 𝔽_q[T] ray-class character's Hecke series
is a rational function — the hRat witness, `(numerator of degree < deg m) / (1 − qT)`-shape. -/
theorem heckeSeriesT_rational_of_periodicity (χ : FFRayClassCharacter k m) :
    ∃ P₀ P₁ : Polynomial ℂ, P₀.eval 0 ≠ 0 ∧
      heckeSeriesT χ * (P₀ : PowerSeries ℂ) = P₁
```

**Decomposition:** Q4-a residue-class partition (group monic f by class r ∈ k[X]/(m);
for deg f ≥ deg m each class contributes q^{n−deg m} degree-n monics uniformly — the
fiddly Finset algebra); Q4-b geometric-series assembly (the `1 − qT` denominator +
numerator of degree < deg m); Q4-c feed the witness to C.lean's GREEN
`hecke_continuation` ⇒ **(P)(i) unconditional for the probe class** (`hPur` STAYS a
binder — Weil RH for Kummer covers, the §2.4 honesty correction); Q4-d regression +
full-coverage axcheck. File `pilots/73/Q4.lean` (self-contained carry of C.lean's vocab;
C.lean stays frozen GREEN). **Run plan:** existing warm `crossmath-pilot-73`; [WARM] C2,
minutes per run; expected 3–5 runs; guard ≤0.6k LoC; overrun rule per §8d discipline.

**The article-or-dossier fork (RESOLVED: cap-N = 1 FINAL):** Q4-GREEN upgrades 73's record
from "dossier/pilot record" to a **formalization-first technical record with one
strengthened claim** — "(P)(i) unconditional for 𝔽_q(T): the first formal Tate-type
statement with discharged rationality (FF scope)". Under the FINAL two-strike rule
(**N = 1**: at most ONE knowledge-level / formalization-first / donor-discharge article
per cycle; KPI ≥ half of shipped articles discovery-grade — orchestrator 2026-11-16,
adopting R2's stricter reading per R9 §6b and this file's §15), an article route would
consume the cycle's entire non-discovery quota — **the dossier upgrade note STANDS as the
recommended outcome** (73's pilot-outcome block records Q4; the scoped dictionary claim
stands; the single N-slot, if spent at all, belongs to a stronger candidate). Q4-FAIL/stall
⇒ the R2 demotion stands unchanged. Either way `hPur` discharge is never attempted
(73-prework R1).

---

## §14 FIRST-48h MODAL RUN QUEUE (all STAGED-NO-RUN; orchestrator approves at charter typeset)

Every run at SPEC `cpu=2.0, memory=4096` + `@telemetered` + `LEAN_NUM_THREADS=2`
(R8 §5a audit: all standing apps compliant; the two stale wrappers at
`pilots/32/run_pilot.sh:15–16` and `feasibility/probe/run_probe.sh:15–16` are NOT used by
any queue entry). Cost classes per R9 §7 (C1 warm probe minutes / C2 pilot warm ≈3–15 min
/ C3 donor-tree) crossed with R8 §5b's SPEC-adjusted durations.

**[RESOLUTIONS APPLIED 2026-11-16, orchestrator]** (i) 75-Pb executes day-1 on the
**A3-pattern lane** (top-billed discovery milestone; R9 §6e sequencing superseded — no
dependency on AL-P0/P1 anywhere in this queue); (ii) **two-strike cap N = 1 FINAL** (+
KPI ≥ half discovery-grade) — affects billing only, no run below changes.
**[hEχ FOLD-IN EXECUTED 2026-11-16 on the coordinator's signal** — R2's mini-spec
confirmed at `r2-discovery-strength.md:535–553`; run 8 + judgments in §14.1 below.]

| # | Run | App | Class | Duration @SPEC | Dependency | Approval |
|---|---|---|---|---|---|---|
| 1 | **LP-P0** statement probe (`P0.lean`: M0.1/M0.2 signatures + §9b consumer cluster + 74-T3 shape) | `crossmath-pilot-lp` (NEW; shared layers) | C1 | 3–5 min | none — **doubles as the artifact-cache health ping** (R8 §5b) | STAGED-NO-RUN |
| 2 | **75-Pb run 1** (Pb.lean v1 = Pa.lean carry + E1–E3) — the day-1 top-billed milestone, **A3-pattern lane** | `crossmath-pilot-75` (**WARM**, Cycle-2 run6-final) | C2 | ≈3–5 min (single ≈1.8k-LoC mathlib-only file) | none | STAGED-NO-RUN |
| 3 | **AL-P0** statement probe (M0 skeletons, G4 template) | `crossmath-pilot-al3d` (NEW; shared layers) | C1/C2 heavy-import | ≈5–15 min (entropy-core imports) | charter typeset (slot 2) | STAGED-NO-RUN |
| 4 | **LP-P1** layer proof (`L1.lean`: `lp_weak_duality` + `_symm`, inline axcheck) | `crossmath-pilot-lp` | C2 | ≈3–5 min | run 1 pins substrate spellings | STAGED-NO-RUN (day 2) |
| 5 | **75-Pb runs 2–5** (E4 Bonferroni descent; expected 2–4 further runs to GREEN) | `crossmath-pilot-75` | C2 | 3–5 min each | run-2 verdict + error-class hypotheses | STAGED-NO-RUN |
| 6 | **72-M1 L3a** first elaboration (`P72M1T3.lean`: hermPart block) | `crossmath-probe` (72-M1 runner reuses it — `pilots/72-M1/pilot72m1_probe.py:27`; **WARM**) | C2 | ≈3–5 min | none hard (carried list) | STAGED-NO-RUN |
| 7 | **AL-P1** fibre core (`A1.lean`: P1-a…P1-d + GO/NO-GO read) | `crossmath-pilot-al3d` | C2 | ≈5–10 min | AL-P0 GREEN | STAGED-NO-RUN |
| 8 | **hEχ donor-pin build + Theorem-E audit** (zeta23's pruned `Zeta23.ThmE.Final` closure; 50-M2-pattern runner; transitive `#print axioms` of the Theorem-E chain + consumer elaboration; statements port back as discharged 2/3 binders) | `crossmath-pilot-zeta23E` (STAGED at `pilots/zeta23e/`) | **C3 [LAYERS]** | hour-class @SPEC (v4.33.0-rc2 toolchain at function start + donor mathlib `51e6992e` olean fetch + closure build — the per-run cold cost; base image layers SHARED with the family per the diff-check) | charter line + run-1 ping healthy | STAGED-NO-RUN — day-2/3 position |
| 9 | **ZZV2-λ P0** probe (V2 tree, M4b2 recipe; pins P0(a)/(b)/(c)) | `crossmath-pilot-zzv2-lam` (STAGED at `pilots/zzv2-lam/`) | **C3 [LAYERS]** | **≈1–2 h** (8.2k-job in-run build; 3-h timeout; R8 §5b) | slot-3 KEEP at typeset (§12) + service ping (run 1) healthy | STAGED-NO-RUN — LAST (longest cold-class item; parallelizable with run 8 — different lanes, different pins) |
| 10 | **G9** StrongPNT binder probe (`ProbeG9_StrongPNT.lean`, g-mode) | `crossmath-gprobe` (**WARM**) | C1 | 3–4 min | CONDITIONAL: 22-T2a chartered (R9 §6f: A8, statement-only, T1 NOT fired) | STAGED-NO-RUN |
| 11 | **LP-P2** consumer (`L2.lean`: `bw2_ceiling_of_dual` + inline axcheck) | `crossmath-pilot-lp` | C2 | ≈5–10 min | LP-P1 GREEN | STAGED-NO-RUN (day 2) |
| 12 | **32-crossing discharge** (R2 §12.2: the six missing lemma forms 1–6 for `pilots/32/M2.lean` — `gammaOf_tendsto_ten_right`/`gmax_pos_near_ten`/`gmax_neg_far`/`crossDiff_continuous`/`crossing_exists` (IVT)/`frontier_unconditional`; S–M ≈300–600 LoC) | `crossmath-pilot-32` (**WARM**, existing) — **CAVEAT: `pilots/32/run_pilot.sh:15–16` is one of R8's two flagged STALE xyz-default wrappers — run with `MODAL_USER=doz` override or after L7's one-line patch** | C2 [WARM] | minutes per run | riskless filler — any lane drain; on GREEN, article-32 §5's "not formalized" paragraph discharges (the v2 status rewrite is R1's small post-GO edit) | STAGED-NO-RUN — conditional filler (R2 §12.2 "Iter-4 YES") |

**Warm-cache ordering note.** Already warm from Cycle 2: `crossmath-pilot-75` (run6-final),
`crossmath-probe` (72-M1/11-revival/probe family), `crossmath-gprobe` + the axcheck
machinery. The v4.36-pin NEW apps (`-lp`, `-al3d`, `-zzv2-lam`) avoid cold starts BY
CONSTRUCTION — image `run_commands` stay textually identical to the shared recipe, so
each first-run image build is a layer-cache hit (R8 §5b); do not "helpfully" reword their
fetch lines. TWO genuinely cold-class items in the window: ZZV2-P0's in-run donor build
(V2+PNT+ compiled inside the container, not image-cached) and hEχ's v4.33-pin app (a
different toolchain base — its image layers cannot be shared with the v4.36 family at
all, though the tree is small). Both queued at the tail (runs 8–9) after the service
ping, single SPEC functions with 3-h timeouts, and parallelizable — different lanes,
different pins, no substrate contention; if the orchestrator prefers image-layer caching
for either (g7_layers pattern), that is a launch-day option, not a default. Cycle-level
Step-B axcheck batches stay at close-out, not first-48h; each pilot's inline
full-coverage `#print axioms` covers the interim evidence rule.

**Staged runner apps (launch-prep item 1, executed 2026-11-16 — all STAGED-NO-RUN,
H commits with the kit):** four new apps staged as file clones per the specs, each
header marked STAGED-NO-RUN with its §14 run pointer, doz-CLI default (no xyz branch —
the post-2026-11-13 canonical pattern), SPEC 2cpu/4GB + `@telemetered` +
`LEAN_NUM_THREADS=2` verified present in every clone, and the layer-sharing diff-check
recorded in-file:
`research/pilots/lp/{run_pilot.py,run_pilot.sh}` (app `crossmath-pilot-lp`; 75-clone
with the 73-style probe-convention RESTORED — LP-P0 is a probe file; image block
byte-identical to 75/73, verified by diff); `research/pilots/al3d/{run_pilot.py,run_pilot.sh}`
(app `crossmath-pilot-al3d`; 73-clone per al-3d-prework §4; image block byte-identical
to 73, verified); `research/pilots/zzv2-lam/{run_zzv2.py,run_zzv2.sh}` (app
`crossmath-pilot-zzv2-lam`; M4b2-recipe clone verbatim — tarball/PNT+-redirect/build/
consumer-elaboration unchanged; image block byte-identical to run_m4b2.py, verified);
`research/pilots/zeta23e/{run_zeta23e.py,run_zeta23e.sh}` (app
`crossmath-pilot-zeta23E`; 50-M2-pattern clone with donor constants re-pointed at
zeta23 — `DONOR_ROOT=anthropics_formal-math/zeta23`, `TARGET=Zeta23.ThmE.Final`
(the PROVED Theorem-E chain: `thmE_A/B/C` + `paperInputsChi_L`, sorry-free — the
sorry'd `Challenge.lean` comparator statements are never the build target),
`DONOR_TOOLCHAIN=v4.33.0-rc2` (zeta23/lean-toolchain), donor mathlib `51e6992e`
(zeta23/lake-manifest.json), lakefile.toml + no-patches handling; base image block
byte-identical to run_r1.py, verified — the family layer cache is shared, the donor
substrate is the per-run cold cost). All eight files syntax-checked
(`python -m py_compile` / `bash -n`). **R8 pre-GO touch-ups applied 2026-11-16:**
divergence d2 — `run_zzv2.py`'s consumer verdict gained the P0 prefix-exemption (the
71/73/LP/al3d family pattern; as cloned from run_m4b2 it was sorry-strict and would
false-FAIL a healthy ZZV2-P0 statement probe; exemption chosen over the G11
#check-only alternative so any P0-prefixed probe file is safe — noted in-file);
cosmetic d1 — `al3d/run_pilot.sh`'s header now cites §14 runs 3/7 (AL-P0/AL-P1)
instead of the LP runs. Image blocks re-diffed identical after both fixes.

### §14.1 hEχ fold-in judgments (executed on signal, 2026-11-16)

**(a) Position (my judgment, as charged):** run 8, day-2/3 — after every minutes-class
warm run that establishes the front (runs 1–7) and beside ZZV2-P0 at the cold tail. It
does NOT displace LP-P0's ping (run 1) or 75-Pb run-1 (run 2) — those stay the window's
first two runs verbatim; hEχ occupies otherwise-idle donor-pin capacity on its own lane
and pin.

**(b) Displacement judgment across §14: NONE — confirmed.** (i) No run 1–7 or 11 loses
its slot, lane, app, or dependency — hEχ adds an 11th row; (ii) no substrate contention:
hEχ's v4.33 pin shares nothing with the v4.36 app family (separate image lineage, no
olean-cache overlap), so it cannot slow the warm lane; (iii) no approval escalation: the
build is small (R2: "zeta23's own (small, v4.33) tree") and stays inside SPEC
2cpu/4GB — the AGENTS guideline-3 investigation duty attaches only if telemetry shows
otherwise at run 1; (iv) no charter displacement: R2's completion-priority list ranks
75/42-hEχ FIRST among Iter-4 completions (`r2-discovery-strength.md:554`), so adding it
moves the cycle TOWARD the strength bar, not away; the only soft pressure is
agent-attention on the A3-pattern lane (hEχ glue + P-b + N2) — mitigated by hEχ's
wall-clock-dominant profile (build + audit) interleaving cleanly with P-b fix rounds.

**(c) Companion-vs-successor billing for 75-Pb: COMPANION — the coordinator's prior is
correct, argued from the statements.** The two artifacts discharge DIFFERENT binder
tiers of the same assembly tower. 75-Pb (Pb-1/2/3) lands the **distinct-strip tier**:
its load-bearing inputs are the per-component DISTINCT-STRIP proportion binders
(`hAKd`/`hAFd : EpsLowerDistinctStripCum … at 5/6` + `hCZStripFam`) — zeta23's Theorem E
supplies nothing there: it is a **with-multiplicity 2/3 on-line proportion**
(`EpsLowerCum`-class), has no distinct-count form, and no 5/6-class constant (the 5/6
tier rides the 839/Knausgård side, which stays a binder). hEχ discharges the
**with-multiplicity 2/3 tier**: it kills the χ-column binders of P-a/N2
(`zetaL_two_thirds_landed_ℚ` becomes genuinely unconditional at ℚ). Multiplicity-2/3
cannot subsume the distinct-strip claim — common zeros can absorb the counted mass,
which is exactly what `commonStripCum` tracks (and why DLRT's nearest-miss work lives in
the distinct-zero world) — so the successor scenario ("hEχ's every-abelian-L route
subsumes the strip-distinct value") is mathematically closed off. Net billing: ONE 75
statement-class article, two honestly-labeled tiers — the 2/3 tier unconditional at ℚ
(hEχ's discharge = the strongest S4(a) move available to the cycle: a previously-open
binder discharged IN the article), the 5/6 distinct tier conditional (P-b's completion) —
plus R2's (a)-payoff row (quadratic ζ_K 2/3 with zero analytic binders) as the same
article's corollary tier. Successor would require a decision to drop the distinct tier;
nothing contemplates that.

---

## §15 DEPENDENCY LEDGER — specs owned by this lane vs pending decisions

Pending-decision inventory (R9 §5/§6, this reconciliation; **two entries RESOLVED by the
orchestrator 2026-11-16**): **75-Pb lane placement — RESOLVED: the A3-pattern lane
(M4a-mirror competence) from day-1, top-billed; R9 §6e's A4-sequencing SUPERSEDED; the AL
lane owns AL-3D B.2 only**; **two-strike cap N — RESOLVED FINAL: N = 1** (at most ONE
knowledge-level/formalization-first/donor-discharge article per cycle; KPI ≥ half of
shipped articles discovery-grade — the stricter R2 reading, per R9 §6b and §15's earlier
recommendation; §13's fork updated accordingly). Still pending: **slot-3 keep-vs-swap**
(resolution venue: charter typeset; input = §7a + §12 — recommend KEEP); **B.2/B.3**
(DECIDED B.2 — §3a + R8 pricing; R9 §6c refinement: formal branch point = post-AL-P1
GO/NO-GO — treat as decided unless overturned at typeset); **gate typeset location**
(R9 §6d hybrid: normative paragraph into `RESEARCH.md` §Iteration 4 at splice +
A9-owned template — affects enforcement of every billing line, no execution); **22-T2a
ownership** (R9 §6f: A8, statement-only, T1 not fired). **hEχ fold-in — EXECUTED 2026-11-16 on the
coordinator's signal** (R2's mini-spec, `r2-discovery-strength.md:535–553`): §14 run 8 +
§14.1 judgments; REPORT-INPUTS-ITER4 row updated to the folded state.

| Spec (this file) | Item | Pending decision | Parameterization |
|---|---|---|---|
| §8 | 75-Pb execution | **RESOLVED: A3-pattern lane, day-1, top-billed** (R9 §6e superseded) | **decision-proof** (no open branch; billing fixed by S4(b)) |
| §9 | LP layer + 02-core | 74-T3 second-consumer gate (charter names it or not) | **decision-proof** through LP-P2; the 74-T3 rider is branch-parameterized; article billing moot (engineering-deliverable class regardless of N) |
| §11 | AL-3D B.2 staged | B.2/B.3 — decided; overturnable only at typeset | **decision-proof** through AL-P1; branch-parameterized ONLY at the AL-P2 target statement (post-GO/NO-GO) |
| §12 | ZZV2-λ route (a) | slot-3 keep-vs-swap (recommend KEEP) | **branch-parameterized** (both branches pre-written §12b/§12c; swap costs ≈1 lane-day of P0 spec + A5 battery + debt g) |
| §13 | 73-Q4 | A2's gate memo (this spec: GO) + article-or-dossier fork (N + orchestrator; recommended: dossier note) | execution **decision-proof given GO**; outcome-record fork is branch-parameterized on N |
| §10 | G10 physlib shelf-probe | consumer chartering (72-M1 Tier-B / PlanarAreaLawVar discharge) | shelf — fire-gated, no queue dependency |
| §14 | run queue | charter typeset (the approval column); slot-3 for run 9; 22-T2a for run 10 | ordering decision-proof; runs 9–10 conditional (run 8 hEχ folded, charter line only) |
| (hEχ) | 75/42 χ-column discharge at the zeta23 donor pin (R2 mini-spec :535–553) | **FOLDED 2026-11-16 on signal**: §14 run 8 (day-2/3, `crossmath-pilot-zeta23E`, C3-[LAYERS] hour-class @SPEC, v4.33 pin — own image lineage) + §14.1 judgments (displacement NONE; 75-Pb billing = COMPANION — two binder tiers of one article) | **decision-proof given the charter line** (billing resolved; only the charter-typeset approval remains, as for every §14 row) |

Cross-consistency note (updated 2026-11-16 after the orchestrator resolutions): R9 §7's
lane briefs are the typeset-ready assignments EXCEPT where superseded — exactly one
suppression now stands (R9 §6e/§7-A4's P-b sequencing → P-b on the A3-pattern lane
day-1); this file's §5 L-lanes were the pre-R9 proposal and are historical. Remaining
typeset picks: the slot-3 line (KEEP recommended) and the gate paragraph's location
(R9 §6d hybrid). Cap-N = 1 is final and already reflected in §13.

—

## §16 STAGED SNIPPET FOR H — the `STATUS.md` "§ Iteration 4 — opened 2026-11-16" block

Extract-and-splice at the launch commit (H owns `STATUS.md`; this lane does not edit it).
Orchestrator-approved content = this snippet + R9's splice v2 (`r9-iteration-plan-draft.md`
§1). Everything below is paste-ready text.

```markdown
## Iteration 4 (opened 2026-11-16) — raising the discovery bar

Chartered in direct response to the Cycle-2 external feedback (too few discovery-grade
results; the nine-lane review R1–R9 under `qa/iter4-review/` is the diagnosis). The
discovery bar is RAISED for every slot and article: R2's four-point strength bar
(`qa/iter4-review/r2-discovery-strength.md` §4) + the iteration-4 article gate
(`r9-iteration-plan-draft.md` §3, typeset into `RESEARCH.md` §Iteration 4 per the §6d
hybrid): verification-status table, nearest-miss block, limitations — and the two-strike
cap at **N = 1 (FINAL)**: at most ONE knowledge-level / formalization-first /
donor-discharge article per cycle; KPI ≥ half of shipped articles discovery-grade.

**Launch order (orchestrator, 2026-11-16):** day-1 top-billed discovery milestone =
**75-Pb, the 5/6 strip-distinct arm** (A3-pattern lane; design `pilots/75/Pb-design.md`,
spec `qa/iter4-review/r5-iteration4-backlog.md` §8; conditional S4(b) title). Same week:
the **LP-duality layer + 02-core consumer** (engineering-deliverable billing; spec §9),
**AL-3D B.2 staged** (rung named; C.1–C.4 fences; spec §11), slot-3 **ZZV2-λ route (a)**
(technical-record posture; spec §12), **72-M1 L3a** in the first 48h (spec ref
`pilots/72-M1/L3-spec.md`). Carried: 73-Q4 (gate memo owed; spec §13), 22-T2a/G9,
74-T3 (gated), 10-tranche D1–D6, 75-N2/N3, G10 on the shelf. Full ranked queue + DROP
list: `qa/iter4-review/r5-iteration4-backlog.md` §2/§4.

**First-48h Modal run queue:** `qa/iter4-review/r5-iteration4-backlog.md` §14 — twelve
STAGED-NO-RUN rows (LP-P0 doubles as the artifact-cache ping; 75-Pb run 1 second; the
two cold-class hour items — the **hEχ zeta23 donor-pin build** at run 8 and ZZV2-P0 at
run 9 — queued at the tail, parallelizable on separate lanes/pins; run 12 = the
32-crossing riskless filler on the existing warm app), all at SPEC 2 CPU / 4 GB +
telemetry + `LEAN_NUM_THREADS=2` per the AGENTS.md mandatory Modal guidelines;
approvals at charter typeset. The four new runner apps are STAGED on disk
(`pilots/{lp,al3d,zzv2-lam,zeta23e}/`, diff-checked; r5 §14 tail note). The hEχ
discharge and 75-Pb are COMPANIONS — two binder tiers of the one 75 statement-class
article (judgments: r5 §14.1). Slot ledger + evidence-slot formats + OPEN markers:
`qa/REPORT-INPUTS-ITER4.md` (modeled on `REPORT-INPUTS-C2.md`).

Branch `dev/iteration4` (cut from the Cycle-2 close commit; H commits). Protocols carry
over from Cycle 2 unchanged (queue-loaded lanes, one writer per file, log provenance
headers, concurrency probe at batch close).
```

— end staged snippet (R5; H splices at the launch commit; content jointly approved with
R9's splice v2).

**Files written by this lane:** `research/qa/iter4-review/r5-iteration4-backlog.md`
(§1–§6 first pass; §7–§10 R2/R8 integration; §11–§15 Phase-B specs + run queue +
dependency ledger; §16 staged STATUS snippet; resolutions of 2026-11-16 applied to
§8/§13/§14/§15) and `research/qa/REPORT-INPUTS-ITER4.md` (slot-ledger skeleton, all rows
OPEN). Nothing else; siblings read-only; no Modal runs.
