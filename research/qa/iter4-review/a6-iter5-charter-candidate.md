# A6 — Iteration-5 charter CANDIDATE (consolidation + ranking + citations; orchestrator owns the typeset charter)

Lane A6 (worktree agent-07), 2026-11-18, wave 3. Written against the main tree @
`2f90dcc` (read-pull; the worktree sits at the frozen snapshot `53c1548` — every
citation below was re-verified on main before writing). Scope per the wave-3 tasking:
consolidate EVERY iter-5-tagged obligation in the tree into one draft-charter
structure — (a) ranked discovery-grade leads, (b) technical-debt rungs (summarized,
not duplicated), (c) per-lead source citation / why-new-math / first pilot + budget /
dependencies, (d) open questions — plus the bench coherence audit (§4) and the corpus
novelty scan (§5). This file is a CANDIDATE input: the orchestrator typesets the real
charter (RESEARCH.md §Iteration 5 + splice, per the Iteration-4 precedent).

Ground rules carried verbatim: discovery-first (a lead is valuable only if the
statement is new), kernel-only (no sorry / no native_decide / no external CAS),
siblings read-only, exact citations, one writer per file. Modal per AGENTS.md §Modal
usage guidelines: cpu=2.0 / memory=4096, telemetry every run, LEAN_NUM_THREADS=2,
taskset-not-`-j` on lake build phases (the P1-run1 finding,
`pilots/zzv2-lam/P1-record.md` run 1), doz CLI primary for warm-layer apps / xyz for
new apps (2026-11-17 route ruling, `RESUME-BRIEF-ITER4.md` §Substrate baseline).

A reading-note on the phrase "41 CHARTER / 12 DEFER" (it names PILOTS, not counts):
the bench rulings are **pilot 41 = CHARTER (the iteration-5 opener)** and **pilot 12 =
DEFER (behind 41)** — recorded at `research/INDEX.md:290`, `RESUME-BRIEF-ITER4.md:304`,
`qa/iter4-review/a2-g7-token-inventory.md:28`. The full bench (all rows) is audited in
§4 below.

---

## 0. Inputs consolidated (every iter-5-tagged obligation found in the tree)

Greps run: `iter-5|iteration-5|Iteration 5|ITER-5` over `research/` + `feasibility/`
(main @ `2f90dcc`), cross-checked against RESEARCH.md §Iteration 4, REPORT.md §I4,
REPORT-INPUTS-ITER4.md, both SESSION END blocks of RESUME-BRIEF-ITER4.md, the G7 token
inventory, and the five in-flight worktree charters (A3/A4/A5/A7/A8 — outcomes unknown
at write time; every lead below is stated branch-conditionally on their landing).

| # | Obligation (minted where) | Class |
|---|---|---|
| 1 | **Landau η-port** — ZZV2-λ P2, the recorded iteration-5 ask (`pilots/zzv2-lam/P1-record.md:75–90`; `REPORT.md:491`; `qa/REPORT-INPUTS-ITER4.md:51`) | discovery-grade shot inside a technical record |
| 2 | **41 q-deformed-eight-square = CHARTER, the iteration-5 OPENER** (orchestrator ruling; `INDEX.md:290`; `pilots/41/preflight.md:85`) | discovery-grade (cold-inventory top, 7.0) |
| 3 | **75-N2 M-arc continuation** — M2/M3 if A5 leaves open ends; then N3 axcheck + the unconditional-at-ℚ landing (`pilots/75/N2-P1-record.md` M2/M3 deferral rows + §P2/P3) | discovery-grade (the cycle's strongest lead class) |
| 4 | **10-D4 M-arc assembly w/ hv** (`pilots/10/D3-record.md:31–37`; ruling text `INDEX.md:301`; amendment `pilots/10/D1-record.md:42–45`) | engineering completion (never discovery billing) |
| 5 | **FB-5/77 CHARTER-GO, 4 binding conditions** (`candidates/77-…-laughlin.md:331–341`; `REPORT.md:516`) — T1-completion + T2 in flight (A7) | substrate bridge, C+ billing cap |
| 6 | **FB-2 PNT-AP explicit-L** — "iteration-5 unless chartered as an explicit L" (`RESEARCH.md:156`; `r2-discovery-strength.md:750` ITER-5-QUEUE behind the PNT+ T2 trigger; ignition rule `RESEARCH.md:150–153`) | formalization-of-recent (quota class) |
| 7 | **FB-4 FF-PNT** — ITER-5-QUEUE, formalization-first technical record, "must not consume a discovery slot" (`r2-discovery-strength.md:752`; seed `novelty/iter4-fresh-bridges.md` §3 FB-4) | quota class |
| 8 | **FB-1/76 T1a** — dual-value convergence rung, "T1a deferred iter-5, T2 behind 78, T1b parked" (`INDEX.md:232`) | S-class upgrade rung |
| 9 | **AL-3D B.3** — "the designated iteration-5 rung at the 6.3k-LoC transcription pricing" (`RESEARCH.md:109`; `00-DIGEST.md:167` re-price note) | engineering rung |
| 10 | **PNT+ watchlist DEFER** — T1/T2/T3 unfired; T2 fires only if FB-2 charters (`RESEARCH.md:150–160`) | watchlist / trigger |
| 11 | **12 parametric-savings = DEFER, iteration-5 behind 41** (P0-first mandatory; termPrime check at P0; `INDEX.md:290`; `pilots/12/preflight.md:94–106`) | cold-bench #2 (6.0) |
| 12 | **Unspent quota N=1** — 78 = NEGATIVE-kind, discovery-grade, no quota consumed (`RESUME-BRIEF-ITER4.md` "Rulings minted"; `REPORT.md` §I4.3 "Quota: N = 1 UNSPENT") | budget line (fresh per cycle; see Q2) |
| 13 | **G7 RETARGET-ITER-5 tokens — 5 sites** (`a2-g7-token-inventory.md:56–73`, §2 totals) | technical debt |
| 14 | In-flight units that roll if they miss close: FF-EZ2-P2 (A3), AL-P2-c/d/e (A4), 75-N2 packaging+M2+M3 (A5), 77 T1-completion+T2 (A7), 74-P1 completion (A8) — charters quoted at `RESUME-BRIEF-ITER4.md:314–327` | conditional |
| 15 | **72-M1 L3b–d + interface theorem** — "post-wave" pending row (`REPORT.md` §I4.2 72-M1 row) | engineering completion |
| 16 | **Liu B_new statement-level port** — the "named cheap iteration-4 item" that never fired (`RESEARCH.md:143–146`; `novelty/iter4-external-priorart.md:208–211` §3.1.1; S10 fallback row `r5-iteration4-backlog.md:50`) | cheap strip upgrade (engineering-plus) |

---

## 1. Ranked discovery-grade leads (§a + §c of the tasking)

Ranking rule (project charter, `RESEARCH.md:23` + §Iteration-4 quality gate): novelty ×
significance ÷ verification effort, discovery-first — an item ranks on what NEW
mathematics it can produce, not on completion value. Quota rule at charter time: at
most ONE knowledge-level / formalization-first / donor-discharge article per cycle; ≥
half of shipped articles discovery-grade (two-strike, FINAL; `r5-iteration4-backlog.md`
§15 resolved line).

### Lead 1 — 75-N2 completion and the unconditional-at-ℚ ζ_L landing (rank 1)

- **Source.** Dossier `candidates/75-N2-rayclass-dirichlet-consumer.md` (S1–S4
  provisional PASS, N2-d; landed `434208e`); P0 GREEN FINAL `7556153` (15/15 triad);
  P1 M1-core GREEN-triad run 7 incl. the c-trick `chi_span_residue`
  (`pilots/75/N2-P1-record.md` milestone table); M1-packaging checkpointed (v8 on disk,
  one closure run); M2 (P1-b L-series identification, ≈0.15–0.25k LoC) and M3 (P1-c/d
  principality transfer + identity-theorem extension + composed transfer, ≈0.15–0.25k)
  deferred — sizing in the record's §P2/P3 recommendation. Pre-shipping sweep 3× NOVEL
  (`3e5aaef`). A5's M2/M3 are in flight (worktree agent-06).
- **Why new math.** `zetaL_two_thirds_landed_ℚ` would be the first unconditional-at-ℚ
  instantiation of the 75 statement class (n-fold abelian-assembly ζ_L proportions) —
  the one Cycle-2 statement class that survived the R2 audit
  (`RESEARCH.md:96–99`), strengthened by the DZDF dictionary: the ray-class↔Dirichlet
  character transfer (`chi_span_residue`) is a genuine bridge theorem (DZDF's
  total-positivity semantics instantiated at ℚ), and M3's identity-theorem extension is
  new statement territory per the dossier's S1 row. This is the corpus's strongest
  S4(a)-class move: unconditional theorems at ℚ with the 5/6 conditional tier above.
- **First pilot + budget.** If A5 lands M2/M3 at close: iter-5 rung = N3 (axcheck, S per
  `r5-iteration4-backlog.md` §1b 75-N2/N3 row) + the composed-transfer consumer arc
  (the (d1)/(d2) staging shared with 50-M2-R2 folds here, §1b). If A5 leaves open ends:
  M1-packaging closure (one run) → M2 → M3 per the record's budgets (each ≈0.15–0.25k
  LoC, warm `crossmath-pilot-75`, runs 1–3 per milestone). Dependencies: none hard (Pa
  engine frozen GREEN; DZDF consumed statement-level only).
- **Dependency note.** The 50-M2-R2 binder fold ("fold into 75-N2's (d1) staging if
  executed at all", `r5-iteration4-backlog.md:119`) resolves WITH this lead — same
  staging file decision.

### Lead 2 — pilot 41, q-deformed-eight-square (rank 2; the ruled iteration-5 OPENER)

- **Source.** Orchestrator ruling: **41 = CHARTER, the iteration-5 opener** (wave-tail
  only if a lane drains idle) — `INDEX.md:290`; preflight `pilots/41/preflight.md`
  (recommendation §6 at :85); dossier `candidates/41-q-deformed-eight-square-…md`;
  triage row 7.0 = top cold score (`TRIAGE.md` row 41).
- **Why new math.** Sign-rule/parallelogram-defect deformation of eth's Graves sign
  rule (locked re-scope, `novelty/round-3.md:50–70`): (M) the four-term parallelogram
  identity with explicit ℤ[q]-defect `(1−q)·G_q`, (N) nondegeneracy over the 8⁴ =
  4096 quadruples (`decide`-able), (B) the q = 1 fiber recovers `Eight.signs`;
  **(H) the octonion–Temperley–Lieb/Jones host theorem is NEW** (no octonion–TL
  connection in any sweep — preflight §1). Benkart–Pérez-Izquierdo 1998 owns the
  q-composition object level, so the claim discipline is headline = defect deformation,
  never "first q-deformation".
- **First pilot + budget.** `pilots/41/P0.lean` per preflight §5 (warm `crossmath-probe`,
  1–2 runs): verbatim eth defs (`EightSquareStatement.lean:53`,
  `SecCrossing_Identity.lean:126–133`) + new `sigmaQ`/`G_q` in `Polynomial ℤ` + stubbed
  (M)/(N)/(B)/(P1)(P2). Core S–M ≈ 0.5–1k LoC, 3–5 runs; (H) a separate milestone
  (+1–3k LoC, tauceti direct dep — same toolchain, zero port friction; the Cycle-2
  donor-hygiene triad applies THEN at statement level on tauceti's pin, preflight §4).
  Pre-negotiated fallback: (H) no-match ⇒ ship (M)+(N)+Cayley–Dickson anchor. No live
  gates; the expensive precondition (R8 round-3 novelty clearance) is DONE.
- **Dependencies.** None. Self-contained; zero contention with other arcs.

### Lead 3 — the Landau η-port (ZZV2-λ P2) (rank 3)

- **Source.** HARD-STOP executed per r5 §12a STOP rule: `pilots/zzv2-lam/P1-record.md`
  §HARD-STOP (":75–90") — "the iteration-5 ask is exactly *prove `∃ c, KSAsymptotic
  lam c` (with `c` near the scaled functional) for λ-kernels at λ beyond the frozen
  witness's re-windowing*". Seam pinned by P0(b): `unweightedKernelSum_cutoffTest_tendsto`
  is proved only at frozen `cutoffTest ψ` kernels (no scaling-covariance lemma in-tree;
  `pilots/zzv2-lam/P0-record.md` pin table). Spec ladder L3 in
  `r5-iteration4-backlog.md` §12a (P2 ≤400 LoC as originally scoped — see caveat).
- **Why new math.** Two layers. (i) The **scaling-covariance lemma for the corrected
  test machinery** (`correctedTest`/`r_{ψ,T}`, `Zeta/Defs.lean:126`+) at λ-scaled base
  kernels — a new formal lemma layer with no in-tree or mathlib analogue; the informal
  λ-dependence is Lamzouri's (must-cite in full, Montgomery ICF 1974 +
  Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh 2024 per the P1 billing header). (ii)
  The consumer payoff: discharging `hKS_lam` at genuinely λ-scaled kernels unlocks
  λ ≠ frozen constants for the 42-M4/75 assembly line (family margin
  `∃ δ, ∀ lam ∈ ball 1 δ, 2/3 < C0Lam lam` per L3). Billing precedent: technical
  record (never an article) with an R2-style ruling needed on whether the covariance
  lemma itself clears the discovery bar (open question Q3).
- **First pilot + budget.** [LAYERS] class — elaborate inside the built ZetaZerosV2
  tree (M4b2 recipe; taskset-capped build; expect 1–2 h wall @SPEC per
  `r5-iteration4-backlog.md` §12a cost note). First rung: a P0-style pin probe
  enumerating exactly which `correctedTest` lemmas lack scaled-base variants (1 run),
  then the covariance ladder. Budget honestly L, not the prework's S–M: the P1 record
  prices P2 as "re-proving the corrected-test machinery for scaled base kernels".
  Suggest 6–10 runs over the cycle, staged as image layers (G7b pattern) if the build
  tail grows.
- **Dependencies.** P1 artifact + `KSAsymptotic` binder (GREEN, frozen); built V2 donor
  tree recipe (warm); nothing else.

### Lead 4 — FB-5/77 continuation (rank 4; once its 4 conditions clear + T1 lands)

- **Source.** CHARTER-GO verdict `candidates/77-car-occupation-dictionary-laughlin.md`
  §Battery (4) (:331–341); REPORT.md:516 pending row (T1 — A7). The 4 binding
  conditions: (i) billing at C+ (substrate-bridge + identity layer, lane-opening class,
  never a discovery headline); (ii) Casimir sub-rung OUT of scope (donor privacy);
  (iii) the physlib clock rides the pilot (re-check at start and end — T1's novelty is
  clock-exposed, `:324–329`); (iv) effort per §Feasibility minus the dropped rung.
- **Why new math (honestly capped).** The CAR dictionary (tauceti graded
  CAR/Occupation/Casimir stack ↔ OAI LaughlinFock matrix calculus) + the
  graded-algebra↔block-structure equivalence + the Frobenius sector-trace identity —
  new in BOTH corpora (T1/T2 clean on physlib master 2026-11-17; spin-sector SU₂/Schur
  theory is donor-owned, so the honest grade is C+). A7's derived T1 corrections
  (hyperbolic submodel rank 2(Q+1); number-operator intertwining —
  `RESUME-BRIEF-ITER4.md:291–294`) are already a statement-class contribution.
- **First pilot + budget.** Depends entirely on A7's in-flight unit (T1-completion ≤4
  runs + T2 ≤4). If T1 lands GREEN at close, iter-5 inherits T2 + the dictionary
  article at C+ billing; if not, T1-completion rolls as-is. Physlib clock check = one
  GitHub API fetch at pilot start/end (debt-h `as_of`+commit-date convention).
- **Dependencies.** physlib master clock (live risk, condition iii); OAI proved tree
  statement-binder class (G11-registered pattern); tauceti direct dep (same pin).

### Lead 5 — FB-2 PNT-AP explicit-L + the PNT+ T2 ignition (rank 5; trigger-gated)

- **Source.** `RESEARCH.md:150–160` (pre-registered ignition rule, NOT fired in
  iteration 4); `r2-discovery-strength.md:750` (split verdict: PNT-AP pilot =
  ITER-5-QUEUE behind the PNT+ T2 trigger); feasibility note
  `novelty/iter4-fresh-bridges.md` §3 FB-2 (R6's deciding rg: L-grade explicit-formula
  build; zero PNT-AP statements in the OAI tree; the DirichletL endgame stops at the
  two zero-free theorems); donor map `novelty/oai-siegelzeros-piexponent-as-donor.md`
  §(a) (binder forms `hLS`, consumers list).
- **Why it matters (and why it is NOT a discovery headline).** PNT-AP at
  x^{7/8+δ} = QRH paper2 Corollary 1.2 verbatim (FORMALIZATION-OF-RECENT — R2's S1
  fail). The real value: (a) the first explicit-formula-for-ψ(x;χ) build in the Lean
  ecosystem (engineering headline, Lean-ecosystem-scoped claim only, the LP-layer
  billing precedent); (b) it FIRES T2 ⇒ PNT+ upgrades DEFER → REGISTER-AND-PORT
  (upstream StrongPNT ψ-machinery imported at the donor pin rather than ported —
  OAI's lake-manifest already declares PrimeNumberTheoremAnd/StrongPNT + TauCeti as
  deps, `RESEARCH.md:157–160`); (c) the citation menu (PNT-AP, effective h(D), idoneal
  completeness) is cited, never re-proved.
- **First pilot + budget.** IF chartered as the explicit L: statement-first P0 (the
  PNT-AP shape over mathlib `NumberTheory/LSeries/PrimesInAP.lean` with the 7/8 binder
  — warm, 1–2 runs), then the L-graded explicit-formula engine (hour-class runs,
  staged layers). The 7/8 binder (G7b-audited tree) is the sharper route; SiegelZeros
  `hLS` is the fallback if the engine is only ever log-free
  (donor-map §(a) consumer note). Competes with FB-4 for the ONE quota slot (Q2).
- **Dependencies.** T2 ignition rule (pre-registered); G7b + G11 donor classes
  (both registered); the 42/75 assembly line benefits from any ψ-machinery landing.

### Lead 6 — the unspent N=1 quota slot (rank 6; a budget line, not a lead)

- **Source.** `RESUME-BRIEF-ITER4.md` SESSION END #2 "Rulings minted": quota N=1
  UNSPENT (78 is NEGATIVE-kind, discovery-grade, no quota consumed); `REPORT.md` §I4.3
  Quota line. The two-strike rule is per-cycle (`RESEARCH.md:89–92`) — iteration 5
  opens with a fresh cap N=1 and the ≥half-discovery-grade KPI; the unspent iter-4
  state is the health indicator that the corpus does NOT need the slot for corrections.
- **Candidate occupants** (only one, if any): FB-4 (FF-PNT technical record —
  `r2-discovery-strength.md:752`: "honest formalization-first technical record … must
  not consume a discovery slot" — i.e. it occupies the knowledge-level article slot
  WITHOUT being billed discovery) or FB-2's record. Default recommendation: spend it
  only if FB-4/FB-2 actually executes; otherwise leave unspent again.

### Leads 7–10 (the remaining minted payloads, ranked)

7. **FB-1/76 T1a** — dual-value convergence `lim_{ε→0⁺} Dε = V` on finite supports
   (`candidates/76-…-duality.md:63`; INDEX:232 deferral). S-class; tauceti
   entropic-duality no-gap attainment is the substrate; R7's battery marked T1a the
   surviving upgrade rung (T2 sequenced behind 78 — and 78 LANDED `b98f8bc`, so T2's
   gate is now clear). Discovery grade: marginal (nearest-miss CDPS 2017 owns primal
   convergence; the dual mirror + finite-support regime is the claim shape).
8. **Liu B_new statement-level port** (`RESEARCH.md:143–146`;
   `novelty/iter4-external-priorart.md:208–211`): the informal frontier (B♭ 0.8748866 /
   B_new 0.8749570) now beats the in-corpus 7/8 = 0.875 donor; a statement-binder port
   of Liu's B_new (external Lean, v4.34.1, Liu-1 convention: statement-level citation
   ONLY, DO-NOT-CONSUME as build dep per `novelty/liu1-as-donor.md` §5) upgrades the
   50-M2-class strip to a strictly wider zero-free region. Warm, 1–2 runs, <250 LoC
   binder artifact (`pilots/50-M2-31-32-spec.md` §3 precedent; G7 Liu-1 pattern —
   S10's fallback row `r5-…-backlog.md:50`). Engineering-plus billing (the constant is
   external), but it is the cheapest measurable strengthening of a landed headline.
9. **10-D4 M-arc assembly w/ hv** (`pilots/10/D3-record.md:31–37`;
   `pilots/10/next-tranche-spec.md:142–163` D4 spec): all inputs GREEN
   (`padM'_isPolyT` + `padM'_state_poly` + `padM'_runs` + `padded_time_absorb` +
   M1 `exists_tm_space` + the `PB.bound_le` ending); D4 must SUPPLY the
   value-poly binder `hv : ∃ k, ∀ x, e x ≤ (|x|+2)^k` or derive it Solver-side (the
   adjudicated two-true-forms amendment, `pilots/10/D1-record.md:42–45`). Budget: ~120
   LoC assembly + the hv decision; 1–3 warm runs (`crossmath-pilot-32`-class runner);
   declared plumbing, completion value only.
10. **AL-3D B.3** — the designated iteration-5 rung (`RESEARCH.md:109`), 6.3k-LoC
    transcription pricing, behind the AL-P2 c/d/e outcome (A4 in flight) and the
    challenge-repo clock (`00-DIGEST.md:167`). Engineering rung; C.1–C.4 fences and
    the `PlanarAreaLawVar` binder discipline carry verbatim.

---

## 2. Technical-debt rungs (§b of the tasking — summarized, not duplicated)

**(i) The 5 RETARGET-ITER-5 G7 sites** (`qa/iter4-review/a2-g7-token-inventory.md`
§1, totals §2 — 34 sites: 29 close / 5 retarget / 0 needs-ruling):

| site | obligation | carrier |
|---|---|---|
| `feasibility/ITERATION4-SEED-DOSSIERS.md:56` | seed-1 residual: rg the OAI family-265 companion preprints for a 3D corollary + third-party formal activity on AreaLaw2D's 3D layer | L6 novelty battery / `novelty/round-5*` (none exists yet as of 2026-11-17) |
| `feasibility/ITERATION4-CHARTER-DRAFT.md:58` | per-chartered-seed batteries: the **AL-3D + ZZV2 sub-items** (LP closed) — ZZV2's Lamzouri must-cite framing exists (`pilots/zzv2-lambda-prework.md:120–122`) but the formal battery does not | L6 / round-5 |
| `feasibility/lp-duality-bridge.md:68` | mathlib LP/PNT PRs in flight | standing clock (not a battery) |
| `pilots/10/next-tranche-spec.md:3` | 10-tranche D1–D6 [CHARTER-PENDING] header | resolves with the D4 charter line itself |
| `pilots/10-blueprint.md:187` | same proposal pointer | same |

**(ii) The bench (rows + rulings)** — full coherence audit in §4 below; summary: 41 =
CHARTER (opener), 12 = DEFER behind it; 11-M3, 60, 40, 31, 30-A/A′ stay benched
(`r5-iteration4-backlog.md` §1b :68, §2 ranks 11–15 :112–116, §4 item 9 :232–236);
FF-EZ2 and the physlib probe LEFT the bench this wave (both executed).

**(iii) Standing clocks** (`qa/REPORT-INPUTS-ITER4.md:69`): tracker static-asset curl
(as_of + commit date, debt h), Liu-2, WenrongZou, physlib pushed_at + wing sweep,
mathlib PNT/LP PRs, AreaLaw2D challenge repo; plus the QR-D race-cluster consumers
(Bhargava–Vemulapalli 2611.09031; Baldwin–Sivek 2611.06705; Cao–Gao–Huang–Nie
2610.37179; Frei–Sofos–Widmer 2610.18491; Walsh 2610.40439 —
`novelty/iter4-external-priorart.md` §3.1.2).

**(iv) Debts** (`qa/debts-register.md`): f (HKT theorem-number partial pin — physical
check only), h (tracker lag convention — standing), l (Λ ≤ 9/32 DrMurphyIsIn — the
Λ-absence ban carries verbatim into any iter-5 charter text, `r5-…-backlog.md` §1c debt-l
row). Debt g CLOSED (Fuhrmann + Tafazolian–Torres, FF-EZ2 battery 2026-11-17).

**(v) Post-wave engineering**: 72-M1 L3b–d + interface theorem (`REPORT.md` §I4.2);
runner-fixes-wave2.patch (H applies post-wave on signal,
`RESUME-BRIEF-ITER4.md:254`); G10 stays SHELF, fire-gated on a chartered consumer
(72-M1 Tier-B or a `PlanarAreaLawVar` discharge, `qa/REPORT-INPUTS-ITER4.md:60`);
the five in-flight units (§0 row 14) if they miss close.

---

## 3. Draft charter skeleton (the structure the orchestrator can typeset)

- **Charter classes.** DISCOVERY slots: N2 completion (+N3/article); 41 core ((M)+(N)+(B))
  with (H) as its second phase; η-port covariance layer (billing ruling needed);
  77-continuation at C+ (conditions binding); FB-1 T1a + T2 (78 landed — T2's gate
  cleared). ENGINEERING slots: D4 w/ hv; AL-3D B.3; 72-M1 L3b–d; Liu B_new port;
  FB-2 explicit-L (fires T2 ⇒ PNT+ REGISTER-AND-PORT) or FB-4 — at most ONE of them
  takes the knowledge-level article slot (quota N=1).
- **Suggested launch order (decision input, not a ruling):** day-1 = 41 P0 (the ruled
  opener) + N2 continuation on the warm 75 runner; same week = D4 (cheap, closes the
  10 arc) + Liu B_new port (cheapest landed-headline strengthening); week-2 = η-port
  P0-pin probe (the [LAYERS] line, one lane) + 77-continuation if T1 landed;
  wave-tail/drain = 11-M3, 12-P0 (the deferred bench #2, P0-first mandatory),
  FB-1-T1a, FB-4-or-FB-2 decision.
- **KPI line carried verbatim**: ≥ half of shipped articles discovery-grade; quota
  N=1 knowledge-level max; no `sorry`/`native_decide`/external CAS; donor statements
  only as hypothesis binders / verbatim marked probe copies / built on-pin libraries;
  logs with provenance headers; Modal at SPEC.

---

## 4. Bench coherence audit (tasking item 2 — report-only)

**Bench location + ownership.** The bench rows live in
`qa/iter4-review/r5-iteration4-backlog.md` §1b (:68 cold-inventory row), §2 (ranks
11–15, :112–116), §4 item 9 (:232–236, the 60/40/51/31/30-A/A′ rows), and the
consolidated `qa/REPORT-INPUTS-ITER4.md:71` "cold bench" row; the rulings are recorded
at `INDEX.md:290` + `a2-g7-token-inventory.md:28`; the preflights are A2's
(`pilots/{41,12}/preflight.md`). Ownership check (grep for owner funnels): the
r5-backlog is R5's phase-A consolidation artifact (lane closed at L1; no post-phase-A
writer named anywhere); REPORT-INPUTS-ITER4 is H-SHEPHERDED (tracker header ruling);
INDEX is H's. **Conclusion: no unowned bench file exists — this audit is REPORT-ONLY
and lives here** (appending dated blocks into a closed lane's frozen review artifact or
an H-shepherded ledger would violate the funnel rulings).

**Reading note.** "41 CHARTER / 12 DEFER" = the rulings on pilot rows 41 and 12 (see
header). Row-by-row state @ main `2f90dcc` (2026-11-18):

| Bench row | Ruling/state at bench close | Tree state now | Coherence verdict |
|---|---|---|---|
| **41** q-deformed-eight-square | **CHARTER — the iter-5 opener** (`INDEX.md:290`) | Unchanged since the preflight; `pilots/41/` holds only `preflight.md`; prerequisites (R8 round-3 clearance; eth port surface S) all still valid; no drift | **COHERENT — ready**; the iter-5 charter should convert it to a slot (Lead 2) |
| **12** parametric-savings | **DEFER — iter-5 behind 41**; P0-first mandatory (termPrime/monotonicity check at P0) | Unchanged; `pilots/12/` holds only `preflight.md` | **COHERENT**; stays behind 41 |
| **11-M3** (CH20∘VW13) | benched; "activate only when a pilot lane drains" | Unchanged (M1/M2 landed main-run; M3 untouched). NEW external input the row does not record: Fischer arXiv:2610.32162 "k-AP Hypothesis" post-refutation landscape is directly relevant to M3's instantiation choice (`novelty/iter4-external-priorart.md` §3.2.1 — a [CONSUME] citation at pilot time) | COHERENT; add the Fischer cite when piloted |
| **FF-EZ2** | was benched "behind its battery + debt g first" (`REPORT-INPUTS-ITER4.md:71`) | **LEFT THE BENCH — prerequisites landed and the item activated this wave**: battery CHARTER-GO `9dfcbc1`, debt-g pinned theorem-granular, P0 GREEN `0b1c77e`, P1 GREEN `570f3e9` (7/7 triad; open-Classical axiom-spelling finding), P2 descope-closure in flight (A3) | **STALE ROW (superseded by execution)** — the r5 §2 rank-13 row and the REPORT-INPUTS cold-bench entry are historical; no edit needed beyond the close-out stamps |
| **physlib occupation-pair probe** | benched as G-probe (`r5-…-backlog.md` rank 14) | **PROBE LANDED**: G13 standalone GREEN `68be1a2` (occupation-pair bridge elaborates on our pin). The NEXT rung (S13 full pilot — the outward relation-layer donation, `novelty/physlib-surface.md` §4(i)) remains unchartered with its differentiation gates (52 + Wick stack) standing | Bench row SATISFIED; the S13 watch row survives as the live item |
| **60** border-rank | benched; ≤21 attribution unverified (its own precondition) | Unchanged; and the fresh-bridges PermanentCubic note (border-determinantal ↔ border-rank unification, honest grade C — hard math, weak two-sided machinery, `iter4-fresh-bridges.md:79–84`) independently corroborates keeping it benched | COHERENT (dead until the attribution is verified) |
| **40** zeta-k-prime-deriv | benched; T2 contested (Šleževičienė/Broughan) at 2.25 | Unchanged | COHERENT |
| **51** ω-to-word-RAM | benched; "folds into 12" | Fold EXECUTED and encoded in 12's preflight §1 (feeder fold resolved as rescope) | COHERENT (resolved-as-fold) |
| **31** budgeted-split | benched; "shared glue already amortized by landed 32" | 32-crossing landed FINAL-GREEN `887ffd1` + articles 01/32 v2 `061fe8f` this wave — the amortization premise HELD (and the article-pitch rescopes landed, `9bcf026`) | COHERENT (still no charter; premise strengthened) |
| **30-A/A′** hall-parseval | benched; M-effort with the falsify-half banked | Article-30 template-upgrade landed (a9 compliance table PASS — editorial only); Theorem A/A′ formalization still unchartered | COHERENT |
| watch: S11 survivors (N1b/N3/bridge), S12 Weil-window transports, S13 pilot, G5a | watch (not ranked) | G5a RESOLVED by R8 verdict (Physlib direct route dropped; G10 SHELF, fire-gated — `RESEARCH.md:126–128`); S11/S12 unchanged; S13 next rung live (row above) | COHERENT; G5a sub-row is closed |

**Flags for the orchestrator (the only state changes):** (1) FF-EZ2's bench row is
superseded by execution (no action beyond the close-out stamps); (2) the physlib
probe row is satisfied (G13) — the surviving live item is the S13 pilot with its
differentiation gates; (3) 11-M3 acquires the Fischer 2610.32162 cite-consumable at
pilot time; (4) 41 is fully coherent and ready to convert from bench-opener to
chartered slot.

---

## 5. Corpus novelty scan — light (tasking item 3; max 3, leads NOT in the bench)

Method: sweep of `research/novelty/` + `research/candidates/` for discovery leads that
are (a) unclaimed (no dossier, no bench row, no iter-5 tag) and (b) feasible per the
donor maps. The 28 candidate files are all dossiered/piloted/benched; the un-claimed
material sits in the fresh-bridges NOTES (`novelty/iter4-fresh-bridges.md` §1
"noted, not dossiered") and the physlib empty zones (`novelty/physlib-surface.md` §4).
Three candidates, ranked; all would still need the dossier-level battery before any
charter (the "no FB charter before its dossier-level battery" rule,
`RESEARCH.md:131–136`).

### NS-1 — CriticalStripMass ↔ zero-counting bridge (the un-dossiered note with the clearest discovery shape)

- **Source.** `novelty/iter4-fresh-bridges.md:74–78`: OAI's `CriticalStripMass.lean` is
  a self-contained combinatorial model — path masses ρ^|p|, ρ = 1/√(2+√2) on a triangle
  lattice, `c·archMass + bridgeMass = 1`, moment ≍ N^{3/4}, bridgeMass ≍ N^{−1/4},
  monotone — **consumed by nobody in any corpus**; "bridge potential vs ZZV2
  zero-counting / tauceti orbit zeta noted, not dossiered; the model's link to actual
  L-functions exists only in the (unfound) source paper".
- **Why a discovery lead.** The first theorem connecting the discrete critical-strip
  mass model to an actual zero-counting functional (ZZV2's
  `simpleOnLineCount_lower`/`distinctZeroCount_lower` — now consumed-on-pin via the
  λ-layer — or tauceti's orbit zeta) would be a statement absent from all corpora AND
  the literature (the source paper is unfound — that is both the risk and the novelty
  space). Honest shape: dictionary-or-refutation, either branch bankable (the 78
  precedent: a clean refutation is discovery-grade).
- **Feasibility.** OAI comparator statement-port ≈ 0 (v4.34.1 statement-binder class —
  the G11/G12-registered pattern, RELEASED 2026-11-17,
  `novelty/oai-siegelzeros-piexponent-as-donor.md` §G11/G12 verdict); the combinatorial
  side is lattice-path mass bookkeeping on mathlib `Finset`/`NNReal`. First rung: a
  no-Modal citation hunt (the source paper — the R7 bib-card pattern) + a P0 statement
  probe (1–2 warm runs). **Gate before any charter**: the lit sweep (the unfound-paper
  risk is exactly what killed FB seeds at battery time).

### NS-2 — PSD-rank ladder: MatchingPSD as the third consumer of the LANDED LP layer

- **Source.** `novelty/iter4-fresh-bridges.md:87–90`: OAI's `MatchingPSD.lean`
  (`psdRank`, `MainClaim` — superpolynomial PSD rank of the perfect-matching slack
  matrix, :48–63) is a "natural third consumer of the seed-9 LP-duality layer
  (nonneg-rank ≥ psd-rank ladder) — noted, not dossiered (weaker,
  FORMALIZATION-OF-RECENT shape)". The LP layer LANDED iteration 4 (slot 1
  FINAL-GREEN, `lp_weak_duality` + `bw2_ceiling_of_dual`,
  `RESUME-BRIEF-ITER4.md:215`).
- **Why a lead.** The ladder lemma (psd-rank ≤ nonneg-rank for slack matrices) exists
  in NEITHER corpus's Lean; proving it mathlib-only and consuming `MainClaim` as a
  statement binder yields the extension-complexity corollary (superpolynomial nonneg
  rank of the matching slack matrix) — new in Lean, KNOWN informally. R6's own grade
  caps it: FORMALIZATION-OF-RECENT, engineering-plus. Charterable only as a lane-drain
  companion or the quota-slot occupant, never a discovery headline.
- **Feasibility.** Statement-port ≈ 0 (OAI comparator, same binder class); the object
  layer (psdRank/nonnegRank defs) is S-class mathlib-only glue in the LP layer's
  footprint (warm runner, 2–4 runs). Recommended disposition: HOLD on the bench as an
  LP-layer follow-on note unless the LP zone gets a second charter line.

### NS-3 — physlib ↔ area-law-corpus first contact (quantum-information empty zone ii)

- **Source.** `novelty/physlib-surface.md` §4 "Empty zone (ii)" (:121–123):
  quantum information (density matrices, entropy, partial trace) is ABSENT in physlib
  while AreaLaw2D + openai-math carry it — "a physlib↔our-AL-corpus bridge would be
  first-contact material". Differentiation: physlib's `PerturbationTheory/` wing is
  the one mature wing (§1); our side owns the landed AL-3D statement layer
  (`PlanarAreaLawVar` binder, AL-P0/P1/P2-m1 GREEN) and AreaLaw2D at statement level
  (G4 — Physlib NOT needed at statement level).
- **Why a lead.** First theorem instantiating an area-law statement on physlib's
  operator algebra (e.g. a subsystem-entropy bound phrased over physlib's
  `CrAnFieldOp`/Wick stack) is a first-contact statement in both corpora — the
  71/73-pattern dictionary aimed outward, and it is the natural second consumer of the
  G13-verified occupation-pair bridge. Risk: G5a's finding (Physlib `a50684a1` not
  `ff2494ea`-compatible at BUILD level, 17 err/1 module) means statement-binder-only
  consumption — the exact pattern the S13 design already uses.
- **Feasibility.** Statement-port ≈ 0 expected (physlib §5.1 probe precedent + G13
  GREEN); our-side substrate landed; the S13 differentiation gates (52 + Wick stack,
  `r5-…-backlog.md` rank 14) apply first. This candidate should ride BEHIND the S13
  pilot, not ahead of it — sequencing note, not a new slot request.

(One further note stays below-bar and unlisted as a candidate: the
border-determinantal ↔ border-rank unification, honest grade C
(`iter4-fresh-bridges.md:79–84`) — corroborates bench row 60's stay.)

---

## 5a. §NS-1 lit sweep (executed 2026-11-18, wave-3 re-task; supersedes §5's NS-1 entry)

The mandatory lit-sweep gate for NS-1 ran this wave. **Verdict: COVERED — NS-1 is KILLED
as a discovery-grade lead** (the model is donor-owned in-corpus with its own
formalization, and the "zero-counting bridge" was a name-collision artifact). Full
evidence below. What survives is a *donor-registration note* (§5a.4), not a candidate.

### 5a.1 The "unfound source paper" is FOUND — it is in our own corpus

- `openai-math/preprints/` holds a **nine-preprint honeycomb-SAW cluster, all dated
  September 26, 2026**, including the four companions of the comparator:
  `Critical-strip-crossing-mass-on-the-honeycomb-lattice-September-26-2026/main.pdf`
  (the CriticalStripMass source),
  `Polynomial-vacuum-representations-and-bridge-mass-for-honeycomb-walks-…`,
  `Renewal-and-changes-of-law-for-critical-honeycomb-walks-…`,
  `Critical-honeycomb-chords-with-prescribed-boundary-endpoints-…` (plus five more:
  Cap-selected-amplitudes, Cylinder-amplitudes, Mass-and-covering-exponents,
  Radial-transfer-estimates, Signed-cylinder-propagation).
- The corpus's own scope doc: `openai-math/lean/docs/237.md` — "The three-quarter
  exponent for honeycomb self-avoiding walk" — maps the comparator family
  (`ComparatorChallenges/{CriticalStripMass,HoneycombBridgeFiniteness,
  HoneycombFreeEnergy,HoneycombBridgeMassSupport}.lean`) to the papers and states what
  the linked formalization proves: strip sums finite, the **exact arch–bridge balance
  identity**, moment-increment comparison, bridge-mass monotonicity, crossing mass
  ≍ N^{−1/4}, displacement moment ≍ N^{3/4} — i.e. **every component of the
  comparator's `CriticalStripMass` prop**.
- There is also a **large PROVED tree** (comparator carries the only `sorry`):
  `openai-math/lean/OAI/Combinatorics/Honeycomb/` (FiniteCylinder, PolygonMoment),
  `…/HoneycombCorridor/` (~44 modules incl. BridgeFiniteness, StripDecay),
  `…/HoneycombBridges/`, `…/HoneycombChords/` (~100 modules), `OAI/Probability/
  Honeycomb/` — same in-corpus donor class as SiegelZeros/PiExponent (v4.34.1 pin,
  statement-binder-only per the G11/G12 registration pattern).

### 5a.2 "Critical strip" is a geometry term, not the ζ critical strip

Read at source (`/tmp` extraction of the four companion PDFs, 2026-11-18): the model is
self-avoiding paths on the honeycomb lattice at the critical weight
ρ = cos(3π/8) = 1/√(2+√2) (the inverse Duminil-Copin–Smirnov connective constant,
Ann. Math. 175 (2012) 1653–1665), crossing a strip of N triangular bands; "arches"
return to the bottom boundary, "bridges" reach the top. **Zero number-theory content**:
`grep -ci 'zeta|Riemann|L-function|Dirichlet'` = 0 for the strip-crossing, vacuum and
renewal papers; the chords paper's single "Riemann" hit (:1189) is "Riemann equation
locally in frequency" — a differential-equation phrase in its Laplace/resolvent
analysis, not ζ. R6's bridge framing ("bridge potential vs ZZV2 zero-counting /
tauceti orbit zeta", `iter4-fresh-bridges.md:76–77`) was an artifact of the comparator's
name plus the then-unfound source; it does not survive contact with the papers.

### 5a.3 External prior art on the bridge idea: NONE (and none possible without a mechanism)

- Searched (2026-11-18): "self-avoiding walk lattice model Riemann zeta zeros critical
  strip connection analogy"; "strip-crossing mass / bridge mass honeycomb −1/4 moment
  3/4". **No work connects SAW strip-crossing mass (or arch/bridge decompositions) to
  L-function zero-counting.** The only "physics analogy for ζ zeros" literature is a
  different model class: França–LeClair-style electrostatic analogies
  (arXiv:1407.4358, "A theory for the zeros of Riemann ζ and other L", 2014) and
  Bétermin's off-critical zeros of lattice energies (arXiv:2307.06002, 2023) — nearest
  misses by theme only, no SAW content, no citation obligation beyond this note.
- The model's own theorem family has a genuine informal lineage (the paper's related
  work, PDF pp.2–3): Duminil-Copin–Smirnov 2012 (critical point; strip bounds 1/N and
  1 leaving the power open); **Beaton–Bousquet-Mélou–de Gier–Duminil-Copin–Guttmann,
  surface adsorption, Theorem 10 (the N^{−1/4} crossing-mass decay)**; Glazman–
  Manolescu (shorter proof, logarithmic-bound variant, rhombic-deformation
  invariance); Krachun–Panagiotis (polynomial upper bound B_N ≤ 100·N^{−10} +
  quantitative subballisticity). The OAI papers' increment: uniform multiplicative
  constants + the 3/4 moment law. External coverage of the cluster exists (public
  reporting on "the hidden 3/4 law", 2026-11) — the cluster is *known recent math*.
- **No dictionary candidate statement exists to prove or refute.** The 78-precedent
  (refutation-as-discovery) does not apply: 78 refuted a stated substitution rule; here
  there is no bridge conjecture in any corpus or paper — only a name collision. Under
  the raised discovery bar (R2 S1: statement-level novelty with a named nearest-miss),
  NS-1 cannot charter.

### 5a.4 What survives (replacement posture)

1. **Donor-registration note (G-series candidate, SHELVED):** the Sept-2026 honeycomb
   SAW cluster (9 preprints + the ~150-module proved tree) is unregistered in our donor
   maps — a new G11/G12-pattern registration target (statement-binder class, v4.34.1,
   on-pin triad check before any consumption). No consumer exists today; same posture
   as G10: SHELF, fire-gated on a chartered consumer. Candidate future consumers (all
   speculative, none chartered): a hypothetical SAW↔explicit-formula interface, or the
   renewal/cylinder-amplitude machinery if the FB-2 explicit-L ever needs Tauberian
   side-inputs — noted, NOT a recommendation.
2. **§5 ranking correction (dated):** the NS-1 entry in §5 above is superseded by this
   sweep — remove NS-1 from the iter-5 discovery-candidate list; the novelty-scan
   survivors are NS-2 (PSD-rank ladder, engineering-plus) and NS-3 (physlib↔AL first
   contact, sequenced behind S13).
3. **Stale-note flag (report-only; the file is R6's):**
   `novelty/iter4-fresh-bridges.md:74–78` ("the model's link to actual L-functions
   exists only in the (unfound) source paper") is now FALSE twice over — the source is
   found and it has no L-function link. The owning lane/orchestrator should stamp the
   correction; this appendix is the evidence record.

— sweep executed 2026-11-18 (lane A6): corpus reads (preprint PDFs, doc 237, comparator
+ proved tree listing) + two external web searches; no Modal runs.

---

## 6. Open questions for the orchestrator (§d)

- **Q1 — in-flight resolution timing.** The five wave-3 units (A3 FF-EZ2-P2, A4
  AL-P2-c/d/e, A5 N2-packaging+M2+M3, A7 77-T1/T2, A8 74-P1) determine the day-1
  shape: which of Leads 1/4/9 open vs. roll. Should the iter-5 charter be typeset
  BEFORE the close act (conditional wording) or after (resolved wording)?
- **Q2 — quota mechanics across cycles.** Confirm the two-strike cap N=1 is per-cycle
  (fresh in iteration 5) and that FB-2's record and FB-4 compete for the SAME single
  knowledge-level slot (my reading of `RESEARCH.md:89–92` + `r2-discovery-strength.md`
  FB re-grades: yes on both).
- **Q3 — η-port billing.** Does the correctedTest scaling-covariance lemma get an
  R2-style strength ruling at charter time (technical record vs. a discovery-billed
  lemma)? The Lamzouri must-cite framing exists (`pilots/zzv2-lambda-prework.md:120–122`)
  but the formal novelty battery for it is one of the G7-retarget residuals
  (`a2-g7-token-inventory.md:65`) — the round-5 battery could carry it.
- **Q4 — FB-2 vs FB-4 sequencing.** If only one fires: FB-2 has the larger payoff
  (T2 ⇒ PNT+ REGISTER-AND-PORT + ψ-machinery for 42/75) at L-effort; FB-4 is M with a
  landed substrate (71/73). Or neither, quota unspent again. Ruling requested at
  typeset.
- **Q5 — round-5 novelty battery.** Does `novelty/round-5*` run before the iter-4
  close (it would let the 3 NOVELTY-CHECK retargets close in-cycle per
  `a2-g7-token-inventory.md` §2 note (i)) or as iteration 5's first act? It is also
  the natural carrier for Q3's battery. (The NS-1 citation hunt it would have carried
  was executed 2026-11-18 — §5a below: NS-1 KILLED, verdict COVERED.)
- **Q6 — 41's (H) phase.** Does the octonion–TL host-theorem phase (tauceti direct
  dependency build, +1–3k LoC — the NEW-graded differentiator) get its own iter-5
  slot/milestone budget, or stay the wave-tail conditional per the preflight's
  two-phase scope?
- **Q7 — bench conversions.** Convert 11-M3 or 12-P0 to chartered slots in iter-5, or
  keep both on the drain-activation rule? (My audit: both coherent as-is; 12's P0
  doubles as the F5-risk discharge and is the cheaper conversion.)

---

## 7. Files for H to pull (worktree agent-07, uncommitted by design — lanes never commit)

| file | action |
|---|---|
| `research/qa/iter4-review/a6-iter5-charter-candidate.md` | **NEW — this deliverable** (the iteration-5 charter candidate: §1 ranked leads, §2 debt rungs, §3 skeleton, §4 bench audit, §5 novelty scan, **§5a NS-1 lit sweep — appended 2026-11-18 re-task: verdict COVERED, NS-1 killed, donor-registration note instead**, §6 questions) |
| `research/qa/iter4-review/a6-41-p0-precharter.md` | **NEW (wave-3 re-task)** — pilot-41 P0 pre-charter spec: copy-paste-ready statement set + donor/binder inventory + runner plan + gates |

No other file was touched. The bench files were NOT edited (ownership check in §4:
no unowned bench file — REPORT-INPUTS-ITER4 is H-shepherded, r5-backlog is a closed
lane's frozen phase-A artifact, INDEX is H's). No Modal runs were needed for this
consolidation (all inputs are persisted records/logs on the tree).

— lane A6 (worktree agent-07), 2026-11-18. Citations verified against main @ `2f90dcc`.
