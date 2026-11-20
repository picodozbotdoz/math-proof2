# REPORT-INPUTS-ITER5 — the iteration-5 REPORT input file (lane R2, mid-wave state, 2026-11-19)

Convention: the `REPORT-INPUTS-ITER4.md` §1/§2 lineage (slot ledger + carried/ledger
rows, status column ships OPEN; evidence-slot format: run log with provenance header +
in-file triad `#print axioms` + at close-out the Step-B stage). H-shepherded funnel:
lanes report content here; H applies surgically at the mid-wave or wave-close REPORT
update. **Basis: main `21c1849` as tasked, read through `22d688b` (batch F, a
superset — per-claim shas cited; the tracker
`research/ORCHESTRATION-ITER5.md` @ `22d688b` is the lane-state authority).**
Iteration 5 opened 2026-11-19 (`e309edd`, post-K `b2f2c18`); charter
`RESEARCH.md` §Iteration 5 (`:246–:443`); STATUS opened block (DECISION-1/3/4/6).

## §0 Launch state (fixed at open)

Pre-consolidated seeds (A6's `a6-iter5-charter-draft.md` §8 authoritative); staged
day-1 fires all landed GREEN in the opening commit `e309edd`: **M-arc GREEN r2**
(`pilots/10/M-arc-record.md`, `M-arc.lean` sha `7addcf00`), **41-P0 GREEN**
(`pilots/41/P0-record.md`), **η-pin-probe GREEN r2 COMPLETE** with the OVER-cpu
investigation delivered (`pilots/zzv2-lam/eta-pin-probe-record.md`; fired sha
`cadc838d220455a71`; billing Option A record-billed quota-free per DECISION-2),
**Liu B_new P0 GREEN r2** (R7's statement-port; statement-level citation ONLY per the
Liu-1 DO-NOT-CONSUME convention, `RESEARCH.md:143–:146`), **AL M0-rebuild GREEN r3**,
N2-P2 runs 22–23 to budget. Watchlist `a9-iter5-article-watchlist.md` pulled at open.

## §1 Slot ledger (one row per chartered/carried item; status column ships OPEN)

| Row | Item (lane; billing) | State at this delta (kernel-checkable) | Evidence slot (path + form) | Status |
|---|---|---|---|---|
| 41-core S–M | q-deformed eight-square discovery core (R4; **DISCOVERY, quota-free** — ruled at the gate, `cb87a67`) | **SHIPPED as article-41** (see §3): core GREEN at `35bd210` — `mainCor` (universal `(1−q)` defect identity) triad; antipodal stratification `{p′ = ¬p}` decide-certified; F1/F4 refutations; R9's enumeration convergent (two methods, one theorem; battery §LANDING) | `pilots/41/Core.lean` (committed sha `733b4a2d` / fired `921bc43c` per the article §6 stamps); `Core-record.md`; `novelty/round6-41-battery.md` FINAL `c24b62e520133724` | **FINAL-GREEN + SHIPPED** |
| 41-(H) | TL/Jones host bridge tranches (R4; wave-tail per DECISION-4, **PROMOTED mid-wave**, batch `4ef1bad`) | **tranche 1 GREEN** (`efcabc4`): `H1.lean` `283503ada` — transport banked + the traciality obstruction banked; the 41H article STUB landed (second-discovery-own-file bookkeeping) → **tranche 2 active** | `pilots/41/H1.lean` + H-record + `H-preflight.md`/`H-probe.lean` | **GREEN (t1); t2 active** |
| η-port | Landau η-port ladder (R5; record-billed Option A) | **rung-1 GATED-RED → confirmation + rung 2** (`efcabc4`): `eta-r1.lean` `5b04304a` parked-state + runs 1–2 + port plan `adde3717` landed; the record HELD (drifted past reported sha into confirmation content — rides the next report; run3 + r2-run1 logs in flight) | `pilots/zzv2-lam/eta-r1.lean`, `eta-port-plan.md`, `logs/eta-r1-*` | **GATED-RED → confirming** |
| 10-M-arc | `exists_tm_padded_space` machine-layer assembly (R3; plumbing/completion-value, never novelty — ruling in-record) | **FINAL-GREEN run 2** (`e309edd`): rc=0, 0 sorry; `hv` SUPPLIED-AS-BINDER per the orchestrator ruling (see rulings ledger); 4,327 LoC = header + L5 verbatim + Part M (51) | `pilots/10/M-arc-record.md`; `logs/marc-run1.log` (both runs, provenance) | **FINAL-GREEN** |
| Liu B_new | statement-port (R7; statement-level citation ONLY) | **P0 GREEN run 2** (`e309edd`) — the strip-upgrade statement binder elaborated on-pin; NO build-dependency consumption (DO-NOT-CONSUME standing) | R7's day-1 record (rides `e309edd`); convention `RESEARCH.md:143–:146` | **GREEN (P0)** |
| AL-rebuild | AL-3D canonical z-rank rebuild M-ladder (R8; engineering, M-ladder convention: sorryAx-parked decls ride A2) | **M0 GREEN r3** (`e309edd`) → **M1 CLOSED GREEN** (`4ef1bad`) → **M2-a CLOSED 4/4** (`42cac6c`+`22d688b`; A2 `9706196c` carries 2 sorryAx-parked M2-b decls, fixes-on-disk-unfired) → **M2-b 2 parked (honest D7)** + M2-c queued; grant pattern in play | `pilots/al3d/A2.lean` + M-records; R1's folds ENTRIES 8–9 (`7d5f2945`) | **M2-a CLOSED; M2-b honest-partial** |
| 75-N2 | unconditional-at-ℚ instantiation (R6; the iter-4 row-75 N2 tail + iter-5 lead-1 resume) | **P1 COMPLETE** (iter-4); **P2-a GREEN run 26** (`ff8b99e`: 15/15 triad; the paused-at-close resume note discharged); **P2-b parked 16/17** (`4ceed25`; parked `396d8710` worktree-side, main keeps verified `ce6719c8`; one-run resume on a fresh ruling); **P3-a GREEN** (`N2-P3.lean` `fda66526`); **P3-b/c GREEN** (`42cac6c`: `abFacQ_of_factorization` + `analyticOrderAt_lFunction_ne_top` triad; `f9bd28c5`); P3-complete-fire + V2-build detached pending | `pilots/75/N2-P1-record.md` + N2-P3 records + logs; R9's ship template rides P3 completion | **P2-a/P3-a/b/c GREEN; P2-b parked; P3-complete pending** |
| 74-P2 | surprisal sharp-constants + statement rung (R3; day-1-class) | **G2 GREEN run 11** (`35bd210`; `P2.lean` sha `49b808f3` preserved on main): `mgfBound_var_sharp` (window-free `Var ≤ 2σ²`, 4.5× over P1) + `t1c_sharp` (class constant 1024eθB) triad; **G3 PASS** (FIND-#1 n-atom family, elaboration-only); **P2-c NOT-GREEN-honest 5/5** (`21c1849`: 18 residuals/4 mechanical classes, fixes in hand) → **run-17 fire-once in flight** with the orchestrator-ADJUDICATED `BkClass-nonneg` repair; `P2.lean` `199f06ba` HELD fold-once | `pilots/74/P2-record.md`; `logs/p2-runs1-11.log` + runs-12–16 (batch-E) | **G2/G3 GREEN; P2-c pending run 17** |
| 72-M1 L3 | L3b–d + interface (R2; W2-4 residue) | **honest-partial FINAL this wave**: 13 runs over three grants (8+3+2), enforced descent, ZERO math defects; triad-clean at close: L3b (`toGrid_star_dotProduct_self`), L3c (`hasGlobalGap_of_fullSystemGap`), `edgeBoundary_le_boundaryCard` (both boundary directions w/ T2's), `submatrix_mulVec_ec`, `eig_toGrid`; the 4-region mechanical tail charters next wave (the hQ-tail is a one-word `Finset.mul_sum` fix — stop-note §FINAL-ROUND) **[PRINT-LEVEL CORRECTION 2026-11-20, R2: the triad-clean list above is re-based on R1's verification-integrity finding (re-verified by R2's bracket-tracking parse of all 16 logs) — print-verified clean = L3b `toGrid_star_dotProduct_self` (run 6+), `eig_toGrid` (run 5+), `edgeBoundary_le_boundaryCard` (run 9+); `submatrix_mulVec_ec` = print-gap/record-only; `hasGlobalGap_of_fullSystemGap`/`isAdmissible_ΦL`/`hamiltonian_gridDom_eq`/`interface_areaLaw_uniformAreaLaw` NEVER printed triad in any run (sorryAx throughout; interface's only triad prints = runs 2–3 early forms) — RE-DERIVATION class, residue understated by the 3-item list. See `logs/l3bd-stop-note.md` §PRINT-LEVEL RE-BASE + `L3-record.md`'s re-base amendment; R1's rows :2531+; H's h-wave4-log correction line.]** | `pilots/72-M1/P72M1T3.lean` v13 `dcda3133b1ffbd16`; `logs/l3bd-run{1..13}.log`; `logs/l3bd-stop-note.md` `4f6ec977aa87392c`; `L3-record.md` `0b3e129f41f13a37` | **HONEST-PARTIAL (final this wave); next-wave charter named** |
| 77 | CAR-occupation T1/T2 completion (R7; iter-4's 386th residual) | **BOTH GREEN** (`c74ac33`): T1 8/8 r11 + T2 8/8 r12 — the iter-4 filter-blind-spot tainted decl DISCHARGED via the `[Fintype k]` repair; dossier-77 amendments 1–3 applied | R7's records + runs (batch 3–4); R1's fold | **FINAL-GREEN (both)** |
| FB-2/FB-4 | the DECISION-1 contest (unchartered at mid-wave) | quota contest FB-2 (PNT-AP explicit-L) vs FB-4 (FF-PNT) vs unspent — no charter yet; FB-2's substrate note upgraded by the WeakPNT clock firing (see §2) | charter text `RESEARCH.md:404`; clocks addendum | **UNCHARTERED (contest standing)** |
| 12-P0 / 11-M3 | bench (drain-activation rule) | conversions DENIED at open per DECISION-6; 12-P0 may convert mid-wave on idle-lane + dry-queue | `RESEARCH.md:396–:398` | **BENCHED** |

## §2 Carried/ledger rows (fill at close-out)

| Row | Item | State at this delta |
|---|---|---|
| clocks | tracker/static-asset, Liu-2, WenrongZou, physlib pushed_at, AreaLaw2D challenge, mathlib PNT/LP PRs (+ Chang–Wang registry row added 2026-11-19) | **1 FIRED — the mathlib PNT clock** (`novelty/round6-clocks-iter5-s1.md`): weak PNT on master via PR #43238/Bors (WeakPNT.lean, one file beyond pin, carrying the PNT-AP forms incl. `Chebyshev.isEquivalent_psi_id`); consequences: (a) dossier-22 "Tier-1 strategically ceded" MATERIALIZED — any 22-v2/derivative article cites mathlib's WeakPNT as Tier-1 holder (amendment `round6-22-tier1-amendment.md`); (b) FB-2 NOT preempted (error-term class x^{7/8+δ} vs the weak forms); (c) **pin ruling: mathlib pin STAYS at ff2494ea** (a bump invalidates every warm cache + donor build; WeakPNT = external-math citation class). 6 SILENT incl. Liu-2 (no v3) and the LP/Cone TODO; Chang–Wang `2611.00924` added (QR-D zero-free axis only) |
| fold-once queue | R1's five pending folds, each at its closing state (`22d688b` tracker) | L3-final · M2-b-fire · P3-complete-fire · 41H-T2 · eta-confirm — all EVENT-STANDBY |
| debts f/h/l | HKT pin; tracker citation convention; Λ-absence ban | OPEN (carried from iter-4 §2); runner-fixes-wave2 re-adjudication at donor-tree touch |
| stale wrappers | `pilots/32/run_pilot.sh:15–16`, `feasibility/probe/run_probe.sh:15–16` | OPEN (carried) |
| cold bench | 12 (behind 41 — P0-first), 11-M3, physlib bridge probe | BENCHED (DECISION-6) |
| 74-T3 | surprisal LP second consumer | **OPEN-GATED (carried ruling standing** — `h-wave4-log.md:191`, `RESEARCH.md:214`; activates only on charter) |

## §3 Article-gate accounting (mid-wave; DECISION-1 frame)

**Shipped this cycle so far: article-41** — SPLICE `cb87a67`: kind **DISCOVERY,
quota-free**; ship gate COMPLETE (R7 draft-final `f068d9ae` + R9 battery FINAL
`c24b62e520133724` + **R2 S1–S4 4/4** — `qa/iter4-review/r2-41-s1s4-pass.md`, riding
the splice commit); in-commit flips per `a7-41-splice-package.md`: §4 refreshed from
the battery §LANDING incl. the **S3 honesty sentence ("elementary proof,
nonelementary statement")**, abstract 192 words, §6 committed-bytes stamps, §9 box-11
SATISFIED, README row-41 + corpus counts 6→7. **Quota N=1 UNSPENT at mid-wave**
(spend-only-if-executed; contest FB-2 vs FB-4 vs unspent). KPI to date: 100%
discovery-grade on the cycle's shipped set (1/1); stock 7/15 ≈ 47%.

## §4 REPORT.md §I5 running-section delta (PASTE-READY for H/orchestrator at the mid-wave or wave-close fold; supersedes nothing — §I5 opens here)

```markdown
### I5 Iteration 5 (opened 2026-11-19; mid-wave state at `22d688b`, 2026-11-19)

**I5.1 Charter.** Same raised bar (R2 S1–S4 + template; two-strike cap N=1 per cycle,
fresh per DECISION-3); pre-consolidated seeds; rulings DECISION-1/3/4/6 at open
(`RESEARCH.md:272–:282`). Day-1 staged fires all GREEN at `e309edd`: M-arc, 41-P0,
η-pin-probe (Option A, quota-free), Liu B_new P0 (statement-level only), AL M0-rebuild,
N2-P2 to budget.

**I5.2 Pilot outcomes (mid-wave).** GREEN ladders: 41-core (shipped, I5.3); 41-(H)
tranche-1 (`H1.lean` 283503ada: transport + traciality obstruction) with the (H)
PROMOTION ruled mid-wave per DECISION-4's clause; 77 both-GREEN (the iter-4 386th
residual discharged, `[Fintype k]` repair, `c74ac33`); AL M0→M1→M2-a CLOSED (M2-b
honest 2-parked); N2 P2-a (run 26) + P3-a/b/c; 74-P2 G2/G3 (sharp constants `Var ≤ 2σ²`
+ the class form, `49b808f3`); M-arc (`7addcf00`, hv-as-binder). Honest partials/stops:
72-M1 L3b–d (13 runs, three grants, zero math defects; four-region mechanical tail —
next-wave charter in `pilots/72-M1/logs/l3bd-stop-note.md`); P2-b parked 16/17 (one-run
resume on fresh ruling); P2-c run-17 fire-once in flight (BkClass-nonneg adjudicated);
η rung-1 GATED-RED → confirmation + rung 2.

**I5.3 Discovery ledger (mid-wave).** Article-41 SHIPPED (`cb87a67`) — DISCOVERY,
quota-free; the Graves–Cayley sign alternation as the q=1 fiber of an explicit
(1−q)-defect identity on the antipodal stratum, kernel-computed + decide-certified;
novelty table 8 rows incl. the EMPTY class row (battery §LANDING L1); S1–S4 4/4 with
the S3 honesty sentence in-text. Second-discovery bookkeeping: the 41-(H) TL/Jones
bridge rides its own file (tranche-1 banked). Quota UNSPENT (DECISION-1 frame).

**I5.4 Engineering-billed (never articles).** M-arc (plumbing/completion-value per the
D-charter separation); Liu B_new statement-port (citation-only); η-pin (Option A);
AL-rebuild M-ladder; N2 P2/P3 rungs; 74-P2 G2/G3; 77 completion; L3's
injection-compression ΦL architecture (banked clean through L3c + eig).

**I5.5 Rulings ledger (this wave to date).** DECISION-1/3/4/6 (open; `RESEARCH.md`
:272–:282); hv SUPPLIED-AS-BINDER (M-arc record, the two-true-forms precedent);
74-T3 stays OPEN-GATED (carried); README-date: counts line KEEPS "ratified
2026-11-18" (`h-wave4-log.md:302–:305`); **pin-stays**: mathlib at ff2494ea,
WeakPNT = external-math citation class (`round6-clocks-iter5-s1.md` addendum);
BkClass-nonneg repair adjudicated for 74 run 17 (`21c1849`); (H) promotion
(`4ef1bad`); the completion-grant pattern exercised (L3: 8+3+2 runs across three
orchestrator grants, each with recorded descent + zero-math-defect attestation —
the 77-T1/M1 precedent generalized).

**I5.6 Clock consequence (WeakPNT).** The mathlib PNT clock FIRED (PR #43238/Bors;
WeakPNT.lean + PNT-AP forms one file beyond pin): dossier-22 Tier-1 cession
MATERIALIZED (amendment drafted); FB-2 unpreempted (error-term class); pin STAYS
(warm-cache/ecosystem invalidation; citation-class consumption at FB-2 charter time).
```

— lane R2 (REPORT-inputs lineage), 2026-11-19. No commits (H-shepherded funnel; this
file is the orchestrator's fold input). Every claim carries its sha/path cite above.
