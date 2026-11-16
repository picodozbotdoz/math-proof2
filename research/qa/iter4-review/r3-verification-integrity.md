# R3 — Verification-integrity audit (Iteration-4 review, 2026-11-16)

Lane R3 of the 10-lane Cycle-2/Iteration-4 review. Mandate: before blaming the
mathematics, prove the evidence chain itself is sound — trace every Lean-backed article
assertion to the specific axcheck/final-sweep log lines and pilot source statements;
grade each article VERIFIED / OVERCLAIM / UNDERCLAIM; audit the sweep machinery itself.

Method. This is a records audit (no Modal elaborations were needed — every
statement-form question was settled from on-disk sources). Evidence quoted as
`file:line`. Verdict lines of the two sweeps of record:

- Main run (2026-11-09): 30-stage batch, per-pilot copies
  `research/pilots/*/logs/axcheck-final.log` (one shared transcript; AxPilot20_M1
  first-batch FAIL is the documented docstring-extraction artifact, cleared by the
  appended single-file re-run, `01/logs/axcheck-final.log:894,961`).
- Cycle 2 (2026-11-14): `research/feasibility/probe/logs/stepB-c2.log` (44 stages;
  43/43 plain-substrate OK, `AxPilot42_M4b` FAIL-on-plain by design at :1135 with the
  donor-tree run as verdict of record, `stepB-c2-m4b-donor.log`), Step A token scan
  `stepA-final-c2.log`, per-pilot extracts `pilots/*/logs/axcheck-c2-final.log` (15
  files, all provenance-headered), plus donor-pin evidence
  `feasibility/probe/logs-g/run32-g7-elab.log`.

**Headline finding: no mathematical overclaim was found in any of the 19 audited
articles.** Every "unconditional"/"PROVED" claim corresponds to a statement with no
donor binders; every conditional claim names its binders and the binders are donor
statements or disclosed structural parameters, never smuggled vacuity. The defects found
are records-level: one log-custody gap, systematic count drift between articles/ledger/
logs/disk, stale LoC figures, and two structural coverage limits of the sweep machinery
itself (private-theorem/lemma prints; elided excerpts + a wrapped-line counter blind
spot). Details and severities in §4; tightening checklist in §5.

---

## 1. Task 1 — Cycle-2 claim-to-log trace (9 articles)

### 1.1 Article 75 (abelian assembly) — VERIFIED

- Claimed: `zetaL_assembly_landed` + `zetaL_two_thirds_conditional` kernel-verified,
  conditional, every audited declaration exactly `[propext, Classical.choice,
  Quot.sound]`; in-file `#print axioms` covers 17 declarations (14 P-a + 3 heritage).
- Statement forms on disk: `pilots/75/Pa.lean:1473–1484` (Theorem A: binders are
  analyticity / non-degeneracy / factorization / window-finiteness / constants /
  component proportions — all structural or disclosed component hypotheses) and
  `Pa.lean:1525–1536` (Theorem B: adds `hCert : cert` + `hK673 : K673OfLayers cert …`
  — the Knausgård certificate slot, exactly as article 42's convention; article §3
  states this verbatim). No vacuity: the binders are the honest open core, and the
  article says so ("Theorem B is exactly as strong as its inputs", §7.1).
- Log trace: `pilots/75/logs/run6-final.log:6` — "GREEN — OK rc=0 errors=0 sorry=0 …
  ALL 17 declarations (3 heritage M4a landings + 11 new public + 3 private) = exactly
  [propext, Classical.choice, Quot.sound]; zero sorryAx". Sweep:
  `stepB-c2.log` stage listing "AxPilot75_Pa: 65 theorems" + verdict
  `75/logs/axcheck-c2-final.log:3` "AxPilot75_Pa: OK; axiom-lines=82, sorryAx-lines=0";
  the 3 private P-a decls print through the verbatim in-file audit tail (visible in
  stepB-c2.log:1435–1439 under `_private.AxPilot75_Pa.0.…`). Combined coverage = all
  68 theorem declarations on disk (65 public via appended prints, 3 private via the
  in-file tail).
- Count drift (LOW): article/ledger say "66 theorems"; disk has 68 declarations
  (65 public + 3 private). 66 = the ledger's stale M4a count (52) + 14 new; M4a
  actually has 54 public theorems (extractor, and article 42-M4 agrees). Coverage is
  unaffected.

### 1.2 Article 42-M4 (donor swap, "unconditional ζ-column") — VERIFIED

- Claimed: the three `_of_V2` landing theorems drop `hCert`/`hK673`/`hK839`; ζ-side
  inputs are imported donor theorems; every theorem incl. donor endpoints exactly
  triad; remaining hypotheses = Dirichlet-column (hEχ/hEχdStrip) + structural set.
- Statement forms on disk (the critical "unconditional ζ-column" check):
  `pilots/42/M4b.lean:1479–1492` — `zetaK_two_thirds_landed_of_V2` binders are
  hfin×3, `hEχ`, analyticity ×4, hntop×2, `hfac`; **no `hCert`, no `hK673`, no
  `hK839`, no hV2 binder** — the ζ column is fed `V2d4_endpoint` (the imported
  `ZetaZeros.simple_proportion_d4`) inline at :1492. Same for
  `zetaK_distinct_five_sixths_strip_landed_of_V2` (:1497–1511, fed `V2d5_endpoint`
  at :1513) and `…_of_V2_of_negligible` (:1535–1549, adds `hCZStrip`, disclosed as
  conjecture-grade). The χ-side `hEχ` remains a donor-statement binder (zeta23 ThmE
  transcription) — exactly what the article discloses.
- Log trace: `pilots/42/logs/m4b2-axcheck-run1.log:2` (header verdict: GREEN,
  triad-only, 98 prints / 72 names incl. the 2 donor endpoint prints) and the landing
  + donor lines at :139–145 — `zetaK_two_thirds_landed_of_V2`,
  `ZetaZeros.simple_proportion_d4`, `ZetaZeros.distinct_proportion_d5` all
  `[propext, Classical.choice, Quot.sound]`. Sweep of record:
  `pilots/42/logs/axcheck-c2-final.log:8` — "AxPilot42_M4b: plain-substrate FAIL
  expected (imports built ZetaZerosV2 …); verdict of record = donor-tree run: OK,
  80 axiom-lines (74 '#print' sets, all triad), 0 sorryAx"; raw donor-tree log
  `stepB-c2-m4b-donor.log` (ZetaZerosV2 build rc=0; tally 74 complete triad lines +
  6 wrapped). M4a: `m4-run2.log:2` GREEN + sweep 57 axiom-lines 0 sorryAx
  (`42/logs/axcheck-c2-final.log:7`). Fallback byte-exact at
  `pilots/42/logs/M4b-fallback-GREEN.lean` (present, 85,641 bytes) with its own GREEN
  + 68/68 triad record (`m4b-run2.log`, `m4b-axcheck-run1.log`).
- Count drift (LOW): article says M4b "68 theorems" (also m4b2-run2 header "68");
  disk has 70 theorem declarations and the full-coverage axcheck instrumented 70
  (m4b2-axcheck-run1.log:2 "70 instrumented theorems"). Undercount only; sweep
  coverage complete.

### 1.3 Article 71 (s-plane zeta of a curve) — VERIFIED

- Claimed: W1/W2/HW kernel-verified, conditional on `WeilData` (a transcription of
  AxiomMath Weil's statement); 11 theorems all triad; pole-exclusion correction.
- Statement forms on disk: `pilots/71/P2.lean:186–190` (W1 `curve_zeta_ne_zero`:
  binders = W : WeilData F X 1, 1 < #F, Re s > 1/2, and the corrected pole-factor
  exclusion `1 − q·q^{−s} ≠ 0`), :213–216 (W2), :229–236 (HW). `WeilData` is the
  donor statement as a structure-valued binder — the donor-statement-as-hypothesis
  pattern; article §7.1 discloses "RH is a hypothesis" and prices the import wall
  (G6a). Not vacuous: the WeilData fields are the Weil conjectures' content, and the
  article claims only the dictionary + transport, which is what the proofs deliver.
- Log trace: `pilots/71/logs/p2-run6.log:1` (FINAL: 11 theorems ALL triad, 0 sorry,
  0 errors; W1 pole-family correction recorded) and the in-log prints :14–24 listing
  all 11 `Pilot71.*` names incl. the three landings. Sweep:
  `71/logs/axcheck-c2-final.log` — AxPilot71_P1 OK (14 axiom-lines), AxPilot71_P2 OK
  (22 axiom-lines), 0 sorryAx; stage listing "AxPilot71_P2: 11 theorems" matches the
  article exactly.
- Records drift (LOW): article says P2 "279 lines" (as does the run6 header); disk
  has 282 and the A2 formal commit (56fba53) recorded "282 LoC disk". The 3-line
  drift is post-run6 final editing; the C2 sweep staged the current file, so the
  evidence of record covers the current bytes.

### 1.4 Article 73 (FF Hecke/Tate statement layer) — VERIFIED

- Claimed: Tier C — character class + series + continuation + window; `hRat` and
  `hPur` hypotheses throughout; Q4 not attempted; 7 theorems all triad.
- Statement forms on disk: `pilots/73/C.lean:165–171` (`hecke_continuation` with
  `hRat : heckeSeriesT χ * P₀ = P₁` — the rationality donor statement as binder) and
  :205–211 (`hecke_window` with `hPur : HeckePurity …` — purity as binder, `_hRat`
  carried as the anchor). The article's honesty notes match the file (§1 Honesty 2:
  "the rationality hypothesis is what identifies that quotient with L(·, χ)"; the
  Lean proof even keeps `_hanchor := hRat` explicit, C.lean:174).
- Log trace: `pilots/73/logs/run6-c-green.log:1` (7 theorems ALL triad, 0 sorry, 0
  errors; Q4 NOT attempted — orchestrator gate) with in-log prints :14–20; sweep
  `73/logs/axcheck-c2-final.log` — AxPilot73_C OK, 14 axiom-lines, 0 sorryAx; stage
  listing "AxPilot73_C: 7 theorems". LoC 236 matches disk exactly.

### 1.5 Article 72 (Rényi no-go gate + family-265 interface) — VERIFIED

- Claimed: N1/N2/N3 triad incl. private helpers (11/11 in axcheck-run1; sweep covers
  the 5 public ones — the article states this split itself); M1 links 1–3 proved,
  link 4 + interface theorem carried to Iteration 4.
- Statement forms on disk: `pilots/72/C-neg.lean:344–360` — `renyi_area_law_nogo` /
  `rank_area_law_nogo` take the family functions `renyiOf/bndOf` as parameters with
  the three hypotheses (volume law `hKL`, boundary, area law) → `False`. Jointly
  contradictory by design, individually satisfiable — the intended no-go form;
  Kuwahara's construction enters only through `hKL` (disclosed, §8.2). Harmless
  quirk: the `_hα`/`_hα1` binders are unused, i.e. N3a/N3b hold for all α — a slight
  UNDERCLAIM, in the safe direction, consistent with the article's own "Deviations"
  note.
- Log trace: `pilots/72/logs/axcheck-run1.log` — 22 axiom lines over exactly 11
  distinct names: 5 public (`:24–28`) + 6 private helpers including `nogo_core`,
  `sum_rpow_mul_le` under `_private.«axcheck-72-C-neg».0.…` (`:34` etc.), all triad.
  The article's "11/11 incl. private helpers" is therefore literally evidenced. Run:
  `72/logs/run8-final.log:7` GREEN rc=0/0/0. Sweep: `72/logs/axcheck-c2-final.log`
  AxPilot72_Cneg OK, 10 axiom-lines (5 prints, wrapped) — matches the article's
  "sweep's 5 C-neg lines cover the public theorems". M1: `72-M1/logs/
  m1-axcheck-final.log:82–83` (boundaryCard/ptrace prints; 62 axiom lines over both
  files, 0 sorryAx); link names on disk at `72-M1/P72M1T2.lean:164,303,330`; sweep
  52+28 lines OK.
- Count nuance (LOW): the sweep extract reads "axiom-lines=10" while the article says
  "5 C-neg lines" — 5 prints, 10 physical lines (wrapped). Wording only.

### 1.6 Article 50-M2 (unconditional strip confinement) — VERIFIED

- Claimed: `strip_confinement_seven_eighths` holds with **no hypotheses**; donor
  audited at its own pin (G7b) before consumption; Dirichlet analogue conditional
  only on `hFEχ`.
- Statement forms on disk (the critical check, per queue):
  `pilots/50/R1.lean:93–96` — `strip_confinement_seven_eighths {ρ : ℂ}
  (hρ : IsNontrivialZeroP50 ρ) : 1/8 ≤ ρ.re ∧ ρ.re ≤ 7/8`. The only "hypothesis" is
  the definition of the object being classified (ρ is a nontrivial zero) — no donor
  binders; the M1 binder is discharged by the imported donor theorem
  (`hQRH_seven_eighths`, R1.lean:87–88, applied at :96). Vocabulary forms equally
  binder-free (:99–110). The Dirichlet landing `strip_confinement_dirichlet_
  seven_eighths_of_FE` (:161–168) keeps exactly one binder, `hFEχ` — the article's
  "single remaining hypothesis" claim is exact.
- Log trace: `feasibility/probe/logs-g/run32-g7-elab.log:137–145` — "R1.lean: OK
  rc=0 errors=0 sorry-warnings=0"; prints for all four landings triad (:138–141) and
  both donor headlines `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` /
  `OAI.DirichletCharacter.…` triad (:144–145); G7b probe itself OK (:44) with both
  delegation roots triad (:48–55). Substrate honesty: the article and R1.lean's own
  header (R1.lean:1–39) say it elaborates at the DONOR pin (v4.34.1 / mathlib
  d13f23b7), not the project pin — disclosed three times (§1, §5, §7.3); "not an
  on-pin TARGETS row" is also how the ledger records it (§9.F Step D note). The
  main-run cores on the project pin are separately swept (AxPilot50_M1 OK 4 lines,
  AxPilot50_Dirichlet OK 2 lines, both sweeps).
- No overclaim found. The phrase "first unconditional formal statement of this kind
  for ζ in our corpora" is corpus-scoped and the article simultaneously disclaims
  priority for the 7/8 half-plane itself (§1 Honesty, third bullet).

### 1.7 Article 10 (uniform poly-space ETH layers) — VERIFIED (honest OPEN headline)

- Claimed: three layers PROVED, headline theorem OPEN, assembly tranche carried to
  Iteration 4 — the status block says this in bold before anything else.
- Log trace: `10/logs/l1-run4-final.log:1–2` (L1 GREEN, full axcheck 27/27 ⊆ triad,
  0 sorryAx, sha256 0871b429… — matches current `10/L1.lean` byte hash);
  `10/logs/l2-run5-final-green.log:1–2` (L2 BOTH OK, 151 non-private theorems, 0
  sorryAx, the 31 log-truncated names all in the byte-identical M1 region, sha256
  845ce129… — matches current `10/L2.lean`); M1 per ledger §1 post-sweep note +
  `m1-run3-confirm-axcheck.log`. Sweep: `10/logs/axcheck-c2-final.log` — L1 OK 36
  axiom-lines, L2 OK 126, M1 OK 106, all 0 sorryAx; article quotes these three
  numbers exactly (§6).
- Coverage note (MEDIUM, machinery-level, not article-level): L1 has 6 private
  theorems and L2 has 26 that no Cycle-2 evidence ever printed (axcheck_full.py
  covers only non-private theorems — its own docstring). Mitigations that make the
  integrity claim nonetheless sound: Step A's token scan over all 73 files found
  exactly the 43 baseline probe sorries (stepA-final-c2.log:1) and a repo-wide
  records grep (this audit) finds zero `axiom`/`native_decide`/`unsafe`/
  `implemented_by` tokens outside compliance-header prose; and any private decl used
  by a public theorem is covered transitively by `#print axioms`. Residual risk:
  an *unused* private theorem with a non-standard axiom would be invisible — none
  exists at the token level, but the sweep should close this structurally (§5).
- Count drift (LOW): article says L1 "25 thms" while the full axcheck and sweep both
  count 27 public theorems (33 declarations incl. private on disk).

### 1.8 Article 11-B(ii) (TM2 realization addendum) — VERIFIED, with one custody gap

- Claimed: Theorem B(ii) `tm2_realized_composed` kernel-verified under the three eth
  interface binders; m2-run8 all six files OK; `m2-axcheck-final.log` 76 axiom-lines
  (64 P11T3 + 12 RedTm2), 0 sorryAx, triad-only.
- Statement form on disk: `pilots/11/RedTm2.lean:392–409` — `tm2_realized_composed
  (hTm : EthExistsTm) (hPoly : EthPoly) (hComb : EthIsPoly) … : ∃ c, Tm2Sol …`. The
  interface binders are verbatim eth statement-level interfaces (the article lists
  their donor file:line provenance); they are genuine donor statements, and the
  "Still open" block says discharging them is future work. Not smuggled, not vacuous.
- Log trace: `11/logs/m2-run8-GREEN.log:7–8` (ALL SIX FILES OK, 0 errors, 0
  sorry-warnings; in-file triad audit table). RedTm2 side of `m2-axcheck-final.log`
  fully persisted (:18–25 — all 8 declarations incl. `map_headD_sf` "does not depend
  on any axioms", `orbit_sf [propext]`, exactly as the article's distribution note
  says). Sweep: `11/logs/axcheck-c2-final.log` — AxPilot11_P11T3 OK 71 axiom-lines,
  AxPilot11_RedTm2 OK 12, RedCompA/B OK 5+5, 0 sorryAx — the article quotes 71 and 12
  exactly.
- **Custody gap (MEDIUM):** `m2-axcheck-final.log` claims "P11T3: 64 axiom-lines
  (88-theorem transcript)" (:13) but the persisted log contains **only the two
  `[ax]` verdict lines** (:16–17) — the 64 P11T3 print lines are not in the file. The
  claim is header-asserted, not line-evidenced, in that artifact. Closed independently
  by the C2 sweep (stepB-c2.log:533 "AxPilot11_P11T3.lean: OK; axiom-lines=71,
  sorryAx-lines=0" + excerpted prints :534–586, all triad or subsets), so the
  *conclusion* stands; the *cited artifact* overstates what it persists. Fix in §5.
- Count drift (LOW): article/ledger say P11T3 has 88 theorems; the file has 110
  public theorem declarations and the sweep instrumented 110 (stage listing
  stepB-c2.log header block). Also m2-run8's header says RedTm2 "410 LoC (final)"
  vs 421 on disk/article — the file grew post-run8; m2-axcheck-final and the sweep
  staged the current 421-line file, so coverage of the current bytes exists.

### 1.9 Article 22-closure (PNT ψ-form + upstream closure note) — VERIFIED

- Main-run claim: M4 `tendsto_psi_div_atTop` unconditional, triad. Statement form on
  disk: `pilots/22/Tier1.lean:221–222` — `theorem tendsto_psi_div_atTop : Tendsto
  (fun x : ℝ => Chebyshev.psi x / x) atTop (𝓝 1)` — **no hypothesis binders of any
  kind**. Log: `22/logs/axcheck-final.log:499` and :503 (both copies of the shared
  transcript) — triad. Sweep stage listing "AxPilot22_Tier1: 4 theorems" incl. the
  M1–M4 chain; article's §3 table names match.
- Closure note claim (T2b closed by upstream): the note asserts nothing as ours and
  cites the upstream repo + survey. Cross-checked: `research/survey/axiommath-pntplus.md:76–90`
  records upstream `StrongPNT.lean:2900–2905` with the inline
  `#guard_msgs #print axioms` triad check at :2906–2908 and the fork-amputation
  story — the article's citation is faithful to the in-repo record. Correctly framed
  as "closed-by-upstream, cite upstream not us".
- The Tier-2 statement is labeled "elaborates as a statement only" — no proof claim.

---

## 2. Task 2 — Main-run set spot-deep (10 articles)

| art | verdict | trace (one line each) |
|---|---|---|
| 42 | VERIFIED | M2b landings triad in `42/logs/axcheck-final.log:731,772`; LoC table (337/612/453/1150) matches disk exactly; §5 binder list matches `M2b.lean` statement forms (hCert/hK673/hK839/hEχ/hEχd + structural set, "removing a binder … yields the unconditional statement"); `native_decide` posture (never consumed, EnclOK-style) verified at token level. |
| 20 | VERIFIED | "conditional core PROVED" — binders = PaperInputs card/traces/engine step (M1.lean decl list matches article §5 table); sweep OK (36→38 axiom-lines main→C2, 0 sorryAx); §4.3 common-zero analysis flagged "paper result" in the status block. LOW drift: article "27 theorems / 576 LoC" vs disk 28 public theorems / 582 LoC (sweep staged current file). |
| 11 | VERIFIED | RedA/RedB 5 axiom-lines each + P11T2 19 lines, 0 sorryAx, in both sweeps; "abstract DetTimeModel interface only" matches P11T1/T2 design; M2 addendum covered in §1.8 above. |
| 50 | VERIFIED | Part I honestly "source-verified mathematical argument, not a Lean theorem" (status line) — no kernel claim made for it; Part II binder-conditional with hQRH/hQRHχ/hFEχ named and transcribed-from-donor disclosed; M1.lean 94 LoC / Dirichlet.lean 73 LoC match disk; AxPilot50_M1/Dirichlet OK both sweeps. LOW: the cited `combined-run14-green.log` is one of the 28 headerless class-k logs (debts-register item k) — the headered axcheck logs carry the verdict of record. |
| 21 | VERIFIED-as-labeled (see §3) | Status "CERTIFIED NUMERICALLY, not kernel-verified" + "The in-Lean proof path is specified but not executed"; ledger §1 and REPORT:172/:215 list it outside the kernel standard. Label adequate; tightening recommended (§3). |
| 01 | VERIFIED | `master_identity` (port/09:1983–1990) and `rank_trace_mult_k_of_master` (:2019–2023) carry only well-formedness hypotheses (Hermitian, 0 < c) — no donor binders, "unconditional" is fair for the identity layer; triad at `01/logs/axcheck-final.log:306,358,362`; port/10 = 2,234 LoC exact; port09/10 sweeps 42/41 axiom-lines OK. |
| 30 | VERIFIED | The "instances kernel-checked" split is stated twice and precisely (status block: "general moment identities of §4.3 are paper proofs … with kernel-checked instances"; §5: "Corollary 5 in full generality is **not** formalized; its instances are"); instance names (`moment1_V1`, `moment2_V1`, `moment2_V2_t2`) and closed-form names all appear in the sweep stage listings; `scalar_second_diff` [propext, Quot.sound] matches the article's "or fewer" wording. |
| 52 | VERIFIED | `dual_family` (52/M1.lean:105–106) is over the abstract occupation pair — a parameter (the object of study), not a donor binder; axioms `[propext, Quot.sound]` at `52/logs/axcheck-final.log:843,851` matching the article's "not even choice" claim; fermionic instance triad. LOW: "294 LoC" vs disk 292. |
| 32 | VERIFIED | `frontier_of_crossing` (32/M1.lean:433–434) carries `e : IsCrossing ε cₓ` — the parameterized crossing-point existence the header discloses ("enters as a parameter; see §5"); note `frontier_nonempty_iff` (:452–453) has no crossing binder at all; sweep 22 axiom-lines OK; declaration table matches. |
| 22 | VERIFIED | See §1.9. |

## 3. Special assessments

**Article 21 vs the no-external-CAS ground rule.** The ground rule ("no sorry, no
native_decide, no external CAS — Lean kernel verification only") governs what may be
*claimed as proved*; article 21 never claims kernel verification — its status line is
"CERTIFIED NUMERICALLY, not kernel-verified" and §4 lists the unexecuted Lean proof
path. The certification vehicle is a stdlib-only Python script (exact rationals +
explicit Taylor-remainder enclosures, milestone note §6, reproducible). As presented it
does not violate the rule; it is correctly quarantined from the proof ledger (ledger
§1: "not a kernel artifact; listed in REPORT §7 separately"; REPORT:215: "outside the
kernel standard"). **Recommendation for the honest label:** the word "certified" is
doing heavy lifting — the certifier is itself unverified code. Next iteration should
(1) keep the status out of any "PROVED" tally (already true), and (2) relabel as
**"computationally certified (external script, not kernel-verified, excluded from
proved-artifact counts)"** at every mention, including the abstract's "(certified)"
marker, or execute the specified Lean path. Same posture as pilot 21's own §4.

**Article 50 Part I.** "Source-verified argument" = a structured reading of donor
source files, not a Lean theorem and not claimed as one. This is the right label; keep.
(The negative result kills a bridge, so over-labeling risk was the danger; none found.)

**Article 30 split.** The instances/general split is explicit and the instance names
are enumerable in the sweep; no gap between claim and record.

---

## 4. Sweep-integrity findings (machinery audit)

What was independently re-verified for this report:

1. **Step B tally re-derived from the raw log.** All 678 complete "depends on axioms"
   lines in `stepB-c2.log` classify as 568 full triad + 59 `[propext, Quot.sound]` +
   43 `[propext]` + 8 line-wrapped triad openings — no other axiom name appears, and
   0 `sorryAx` anywhere (the 81 "sorryAx" strings in the file are all
   `sorryAx-lines=0` verdict syntax). The ledger §9.F tally (568/59/43, "+74
   donor-tree") reproduces; its triad count folds the 8 wrapped lines differently
   (footnote-level imprecision only).
2. **Stage accounting.** 44 stages staged (stepB-c2.log:51); 43 OK on plain substrate;
   the single FAIL is AxPilot42_M4b's by-design plain-substrate failure (:1135,
   :1500) with the donor-tree run (80 axiom-lines, 74 print-sets, all triad, 0
   sorryAx) as the recorded verdict. The queue's paraphrase "44/44 OK" should be read
   as "43/43 plain + M4b donor-tree OK" — that is how the ledger writes it (§9.F).
3. **Step A.** `stepA-final-c2.log:1`: 73 files, exactly the 43 enumerated
   probe-convention tokens (9 main-run + 23 G-series + 4 in 71/P0 + 7 in 73/P0), 0
   unexplained; new-since-baseline files (50/R1, R1probe) at 0 tokens.
4. **Forbidden-construct scan (this audit, repo-wide over `research/pilots/**`):**
   zero `axiom` declarations, zero `native_decide` tactics, zero `unsafe` /
   `implemented_by` / `@[extern]`, zero `protected theorem` forms; every token hit is
   compliance-header prose. This closes the residual risk left by finding 6 below.

Findings (severity-ranked):

- **F1 (MEDIUM, custody). `m2-axcheck-final.log` does not persist the 64 P11T3 axiom
  lines its header claims** (`pilots/11/logs/m2-axcheck-final.log:13,16` — verdict
  lines only). The C2 sweep independently covers P11T3 (71 axiom-lines, excerpts
  triad), so no conclusion is threatened, but the cited artifact overstates its own
  content. Rule for Iteration 4: a log must contain the lines it tallies, or the
  header must say "tally only, prints not persisted" and name the covering artifact.
- **F2 (MEDIUM, coverage). Step B prints only public `theorem` declarations.**
  `make_axcheck.py:86–87` drops `private theorem`, and the regex never matches
  `lemma`; `axcheck_full.py` (the "full-coverage" variant) is *also* non-private-only
  by its own docstring. Declarations with no direct axiom print anywhere in Cycle-2
  evidence: 10/L1 (6 private), 10/L2 (26 private), 30-falsify (53 lemmas),
  30/ClosedForm (3 lemmas), 32/M1 (28 lemmas), 72/C-neg (6 private — covered by the
  pilot-local audit, not Step B), 72-M1/T2 (1), 75/Pa (3 private — covered by the
  in-file audit tail). Mitigations that hold today: Step A token scan + finding 4's
  construct scan + transitivity of `#print axioms` into printed consumers. Was
  axcheck_full used everywhere it should have been? **No** — Step B used make_axcheck
  for all 44 stages; axcheck_full ran only inside pilot-10's own logs, A3's
  full-coverage generator covered M4b (72 names), and a pilot-local script covered
  C-neg's privates. Fix: fold private+lemma printing into the Step-B generator (one
  regex change + a `_private.` name-shape rule) or run axcheck_full per pilot at
  close.
- **F3 (LOW, tooling). Two counter blind spots in `axcheck_probe.py`:** (a) `bad` is
  filtered to lines containing "depends on axioms" (:85–87), so a `sorryAx` landing
  on the *continuation line* of a wrapped axiom list would not be counted; (b) large
  stages print only head-40 + tail-12 excerpts with "(…N more) tail:" (:93–98), so
  the persisted record cannot be re-verified line-by-line for big stages (e.g.
  P11T3's middle 70 lines). Both are mitigated today by Step A + the construct scan;
  both are cheap to fix (join wrapped lines before classifying; persist all
  "depends on axioms"-bearing lines at full length).
- **F4 (LOW, records). Systematic count drift.** No single counting convention exists
  across articles / VERIFICATION-LEDGER / run-log headers / sweep listings / disk.
  Observed (article → disk/sweep): 75: 66 → 68 decls (65 public); 42-M4 M4a: 54 → 54
  (ledger §9's "52" is the stale one); 42-M4 M4b: 68 → 70; 11-P11T3: 88 → 110; 10-L1:
  25 → 27 public; 20: 27 → 28 public; ledger §8 20: "26"; M2b axiom-lines 55 (main)
  → 57 (C2, improved extractor). None affects coverage (the sweep instrumented ≥ the
  article counts in every case where they diverge in the dangerous direction — they
  diverge only downward, i.e. undercount). Iteration 4 should generate these counts
  from the extractor, not hand-copy them.
- **F5 (LOW, records). Stale LoC in frozen articles.** 71-P2: 279 (article + run
  header) vs 282 disk; 20-M1: 576 vs 582; 52-M1: 294 vs 292; m4b2-run2 header 1,570
  vs disk 1,571; m2-run8 header RedTm2 410 vs 421 disk. In every case the *sweep*
  staged the current bytes, so evidence-of-record covers the disk state; but articles
  citing run logs alone cite logs of earlier bytes. Rule: every article verification
  block carries the file's sha256 at sweep time (pilot-10's A6 logs already do this —
  `l1-run4-final.log:2`, `l2-run5-final-green.log:2`, both matching current hashes,
  verified by this audit).
- **F6 (LOW, known-class). Headerless logs.** Main-run mid-iteration logs without
  headers (28 files, incl. 50's `combined-run14-green.log` cited by article 50) are
  the documented debts-register item k (RECORDED, frozen history); outage-killed
  logs-g run17/18 were the item-e class, now closed with supersession headers. No
  *evidence-of-record* log is headerless: all 15 `axcheck-c2-final.log` extracts and
  both stepB raw logs carry provenance headers (verified, §0 of each file).

**Overall integrity verdict: the evidence chain is sound.** Both sweeps re-verify
from their raw logs; every headline theorem name quoted in the articles appears in an
axiom print that this audit read directly or (for elided middles) confirmed via the
stage's 0-sorryAx counter over a clean rc=0 elaboration plus the token-level scans.
The user-facing "unsatisfactory results" cannot be attributed to a broken evidence
chain; the defects above are hygiene, and the math-level questions belong to the
other lanes.

---

## 5. Protocol tightening — "article verification block" format (Iteration 4)

Every article that asserts a Lean-backed result carries, per asserted theorem, a block
like:

```
### Verification: <Theorem n> — `<full.decl.name>`
- file: research/pilots/<NN>/<file>.lean:<decl line span>   (sha256 <12 hex> at sweep)
- exact statement form: <binder list verbatim, or "no hypothesis binders">
- binder inventory: for each named binder — donor statement + donor file:line, or
  "structural" (well-formedness), or "parameter of the statement class". A theorem
  with zero donor binders may be labeled unconditional; otherwise the label must be
  "conditional on <binder names>".
- substrate: mathlib <rev> / Lean <toolchain>  (or DONOR PIN <…> — must be flagged
  in the status line, not only in §5)
- evidence:
  - elaboration: <run log>:<line> — rc/0-errors/0-sorry, of the sha-staged bytes
  - axioms: <axcheck log>:<line range> — "'<name>' depends on axioms: […]"
  - coverage: <n> of <m> declarations in <file> printed (public/private/lemma split);
    if < m, name the mitigation (in-file tail / transitivity / token scan)
- honest label: PROVED-unconditional | PROVED-conditional(<binders>) |
  PROVED-defect-form(<defect>) | PROVED-at-donor-pin | STATEMENT-ONLY |
  COMPUTATIONALLY-CERTIFIED (excluded from proved counts) | OPEN
```

Checklist rules distilled from this audit:

1. **Unconditional** means: the declaration's binders contain no donor statements
   (definition-of-subject hypotheses like `hρ : IsNontrivialZeroP50 ρ` are
   acceptable and should be listed anyway).
2. **Conditional** articles must enumerate binders and prove they are donor
   statements or disclosed structural parameters — checked against the .lean source,
   never against article prose alone (this audit found prose and source agreeing
   everywhere, but the check must stay source-based).
3. **The log must contain the lines it tallies** (F1): either persist full print
   output for all stages, or mark tallies "counter-only" and cite a second artifact
   that persists the prints.
4. **Counts come from the extractor** (F4): LoC, theorem counts, axiom-line counts in
   articles/ledger are generated, not hand-written; private/lemma declarations are
   included in the printed set (F2).
5. **sha256 at sweep time** in every run log header and every article block (F5);
   sweep-time staging is the bytes of record.
6. **Donor-pin artifacts** are labeled in the status line ("PROVED-at-donor-pin"), as
   50-M2 already practices in §5–§7 — make it status-line-level.
7. **Wrapped-line joining** in the classifier before sorryAx/axiom-set decisions (F3a).

## 6. Honest-label flags (where the current label should stay or weaken)

- **Keep as is (labels are accurate):** 42-M4 ("PROVED" + ζ-column-unconditional —
  the column qualification is in the title and §3 binder list), 50-M2
  ("PROVED, FINAL" unconditional-for-ζ, single-binder-for-Dirichlet — accurate;
  consider "PROVED at donor pin" in the status line), 71/73/75 (conditional with
  named donor binders), 72 (including the α-range underclaim), 10 (headline OPEN),
  11 (interface-binder disclosure), 22 (unconditional + closed-by-upstream), 01/52/32
  (unconditional or disclosed-parameter), 30 (instances split), 42/20/50 main-run
  (certificate/binder-conditional/source-verified splits).
- **Weaken:** article 21's abstract "(certified)" and status "CERTIFIED NUMERICALLY"
  → append "external script; not a proof under the project's kernel-only standard;
  excluded from proved-artifact counts" (§3 above). It is already quarantined in the
  ledgers; the article text itself should carry the quarantine clause verbatim.
- **Correct (records, not math):** article 71 "279 lines" → 282; article 75 "66
  theorems" → 68 (65 public + 3 private); article 42-M4 "68 thms" (M4b) → 70;
  article 11 addendum "88 theorems" (P11T3) → 110; article 10 "25 thms" (L1) → 27
  public; article 20 "27 theorems" → 28; ledger §9 row M4a "52" → 54; §8 pilot-20
  "26" → 28. All are undercounts (safe direction); none weakens any proof claim.

---

## 7. AxCHECK upgrade mini-spec (Iteration-4 sweep; closes F1 + F2; queue item 2)

Owner at execution: the Iteration-4 sweep lane; R9 folds the standing rule into its
conventions block (checklist line given in 7.4). All changes are to
`research/feasibility/probe/{make_axcheck.py,axcheck_probe.py}` and
`research/pilots/10/axcheck_full.py` (retire the divergence — one generator).

### 7.1 Full-coverage variant: private + lemma aware (closes F2)

`make_axcheck.py:86–87` currently drops `private theorem`, and the regex never matches
`lemma`; `axcheck_full.py` repeats the non-private assumption in its docstring and
additionally misses multi-attribute lines (`(?:@\[...\]\s+)?` — single optional
attribute only). Changes:

1. Extraction regex (both generators, unified):
   `^(?:@\[[^\]]*\]\s+)*(?:(?:private|protected)\s+)?(?:theorem|lemma)\s+([^\s:({\[]+)`
   — i.e. capture `private`/`protected` `theorem` and plain `lemma` decls, with any
   number of attribute prefixes. Do **not** emit `#print axioms` for `def`/`abbrev`.
2. Private-name resolution: appending `#print axioms <name>` at the END of the same
   staged file works for private declarations (file-scope privacy) — this is exactly
   how the 72 pilot-local audit printed `_private.«axcheck-72-C-neg».0.…` names and
   how Pa.lean's in-file tail prints its 3 private decls. Keep the stage = verbatim
   copy + appended tail, so the appended prints sit in the same file as the privates.
3. `axiom`-declaration hard gate: a stage FAILs (new verdict class `FORBIDDEN-TOKEN`)
   if the source contains any line matching `^(?:@\[[^\]]*\]\s+)*axiom\s`,
   `native_decide`, `^unsafe\s`, `implemented_by`, or `@[extern]` outside block
   comments — codifying the records scan R3 ran by hand (audit §4 finding 4) into the
   sweep itself. (Compliance-header prose is inside `/- … -/` comments; the extractor
   already tracks block-comment depth — reuse it.)
4. Acceptance test before adoption: regenerate `AxPilot72_Cneg` (must print 11 names,
   6 with `_private.` prefixes, all triad — matches `72/logs/axcheck-run1.log`),
   `AxPilot75_Pa` (68 decls = 65 public + 3 private), `AxPilot10_L2` (177 = 151 + 26
   private), `AxPilot30_falsify` (12 + 53 lemmas). Expected axiom-line totals rise;
   all must remain ⊆ triad.

### 7.2 Counter fixes in `axcheck_probe.py` (closes F3a + the known `error(<code>)` gap)

1. **Wrapped-line joining.** Before classifying, reassemble print records: accumulate
   lines from each `'…' depends on axioms:` opener until brackets balance (the record
   may wrap over up to 3 physical lines). Classify sorryAx / axiom-set on the JOINED
   record. This kills the blind spot where a `sorryAx` landing on a continuation line
   escapes `bad` (current :85–87 filter only sees lines containing "depends on
   axioms").
2. **Error-form coverage.** Count `": error"` lines AND `re.search(r"error\(lean\.[\w.]+\)", l)`
   forms (the m4b-run1/m4b2-run1 lesson — `error(lean.unknownIdentifier)` /
   `error(lean.dependsOnNoncomputable)` carry no `: error:` prefix; `run_m4b2.py`
   already widened its regex — fold that fix back into the shared probe). rc≠0 stays
   the primary FAIL signal; the widened counter is for the log record only.
3. **Verdict line extension:** `[ax] <file>: OK; decls-printed=N; axiom-records=M;
   sorryAx=0; forbidden-tokens=0` — N is the generator's decl count (stage listing
   already prints it; carry it into the verdict so per-pilot extracts carry coverage
   without the raw log).

### 7.3 Middle-excerpt ban (closes F3b + the F1 custody class)

Replace the head-40 + tail-12 excerpt (`axcheck_probe.py:93–98`) with: persist **all**
joined `depends on axioms` / `does not depend on any axioms` records IN FULL, plus the
first 20 and last 12 of the remaining output (warnings etc.). If the full record set
exceeds ~400 lines, split the run per stage rather than truncating. Standing custody
rule (the F1 lesson, made binding): **a persisted axcheck log must contain every axiom
record it tallies; if a log is tally-only, its header must say so and name the
covering artifact** — retroactively, `pilots/11/logs/m2-axcheck-final.log:13` ("P11T3:
64 axiom-lines") is the one Cycle-2 log in this class; its covering artifact is
`feasibility/probe/logs/stepB-c2.log:533–586` (see §8 relabel item 2).

### 7.4 Standing rule for R9's conventions block (one checklist line)

> **Full-coverage axcheck is the DEFAULT for donor-swap pilots and for every final
> sweep.** The final-sweep generator prints every `theorem`/`lemma` declaration,
> private and public (`make_axcheck.py` post-upgrade); `pilots/10/axcheck_full.py` is
> retired into it. A donor-swap pilot (ZetaZerosV2-style import) additionally audits
> the donor's headlines + delegation roots from the consumer side (G2/G7b precedent)
> and, when the consumer elaborates at a donor pin, says so in the stage header.

(AGENTS.md's Cycle-2 conventions already gesture at this — "the pilot-10 axcheck_full
pattern is now the standard for donor-swap pilots"; the line above makes it a gate,
not a gesture. R9 folds.)

---

## 8. Relabel one-liners for H (exact old → new; queue item 3)

1. **Article 21 status line** (`research/articles/21-quartic-window-transplant-certified-loss.md:7`,
   and wherever the file lands after r2 §8's move to `research/pilots/21-certified-comparison.md`;
   same wording in dossier 02's case-study fold-in):
   - old: `**Status: CERTIFIED NUMERICALLY, not kernel-verified.**`
   - new: `**Status: CERTIFIED-NUMERIC — computationally certified by an external
     stdlib-only script; not a proof under the project's kernel-only standard;
     excluded from proved-artifact counts.**`

2. **Pilot-11 custody-gap disclosure** (append as a correction line to the header of
   `research/pilots/11/logs/m2-axcheck-final.log`; logs are append-only — do not edit
   the original header text):
   ```
   # Correction (R3 audit, 2026-11-16): this log persists ONLY the two [ax] verdict
   # lines (:16–17) and the RedTm2 prints (:18–25). The "P11T3: 64 axiom-lines" claim
   # at :13 is TALLY-ONLY — the P11T3 print lines were not captured. The P11T3 axiom
   # evidence of record is the Cycle-2 final sweep:
   # feasibility/probe/logs/stepB-c2.log:533 (AxPilot11_P11T3 OK; 71 axiom-lines,
   # 0 sorryAx) + excerpted prints :534–586 (all ⊆ triad), mirrored at
   # VERIFICATION-LEDGER.md §9.F. Cite both artifacts for P11T3.
   ```
   Ledger companion (H, next ledger edit): §9 row 11-M2's "m2-axcheck-final … 64 + 12
   = 76 axiom-lines" gains the pointer "(P11T3 tally-only in that log; prints of
   record = stepB-c2.log:533–586)".

3. **Stale-LoC corrections** (audit §4 F5; all in the safe direction — sweep-time
   staging covered the current bytes):
   - `research/articles/71-splane-zeta-curve-dictionary.md:9` and `:160`:
     `279 lines` → `282 lines` (both occurrences). The run-header figure
     (`pilots/71/logs/p2-run6.log:1`, "279 LoC") stays as the frozen run snapshot —
     do not edit logs; the article/commit record (56fba53: "282 LoC disk") is the
     corrected figure.
   - `research/articles/20-common-zero-seam-dedekind-zero-density.md:120`:
     `576 LoC` → `582 LoC` (ledger §8 already carries 582).
   - `research/pilots/11/logs/m2-run8-GREEN.log:3` and `m2-run5/6/7.log:3`
     ("RedTm2.lean 410 LoC / ~410 LoC"): frozen run snapshots — append one
     correction line to m2-run8 only:
     ```
     # Correction (R3 audit, 2026-11-16): RedTm2 final on disk is 421 LoC (article 11
     # addendum and ledger §9 row carry 421); run8 elaborated a 410-line predecessor.
     # Elaboration + axiom evidence of record for the 421-line file:
     # m2-axcheck-final.log (RedTm2 12 axiom-lines, 0 sorryAx) and
     # stepB-c2.log AxPilot11_RedTm2 (OK, 12 axiom-lines, 0 sorryAx), both staged from
     # the current bytes.
     ```
   - Same class, add while at it (R1 audit also lists it):
     `research/articles/50M2-unconditional-strip-confinement.md:67`: `R1.lean (178
     lines)` → `R1.lean (180 lines)`.

Canonical per-article tables delivering the same fixes article-side live in
`qa/iter4-review/r3-verification-tables.md` (the [R3-FILL] payload for R1's and R2's
rewrite drafts).

— Lane R3, 2026-11-16. Files written/modified this lane:
`qa/iter4-review/r3-verification-integrity.md` (this file, §§7–8 appended 2026-11-16),
`qa/iter4-review/r3-verification-tables.md`. No other files touched.
