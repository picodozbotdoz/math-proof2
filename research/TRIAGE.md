# TRIAGE — Phase 4 candidate ranking

Status: SKELETON (created by lane H, 2026-11-09; filled by the orchestrator at
Phase 4). Inputs: dossiers in `research/candidates/NN-slug.md`; rubric below;
feasibility detail from `research/feasibility/mathlib-verification.md` (R9) and
novelty evidence from `research/novelty/round-1.md` (R8).

## Ranking rule

    rank = novelty × significance ÷ effort

All three scored 1–5 (definitions below); effort is the inverse-direction score
(high effort = high number = divides rank down). Ties broken by: (1) higher
novelty, (2) lower effort, (3) stronger bridge essentiality (§ Bridge analysis
of the dossier).

## Scale definitions (concrete)

*Cycle-2 scope note (H, 2026-11-13): for the 70-series, corpus scope = the four main-run
corpora **plus** the six AxiomMath repos (`axiommath/`: DedekindZetaZeroFree, ZetaZerosV2,
ZetaZeros, PrimeNumberTheoremAnd, Weil, AreaLaw2D) as an additional corpus; the definitions
below carry over verbatim with that extended scope.*

### Novelty (1–5)
- **5** — Statement absent from all four corpora AND no literature trace found
  (documented searches in the dossier + R8 sign-off). The combination, not just
  the phrasing, is new.
- **4** — Absent from all corpora; nearest literature result exists but the
  candidate strengthens, generalizes, or re-bases it essentially.
- **3** — Absent from corpora as stated, but a known-literature result transports
  to the new setting with moderate modification.
- **2** — One corpus contains a close variant; the candidate adds a genuinely new
  parameter, constant improvement, or model transfer.
- **1** — Essentially present somewhere; only packaging is new. (Should not have
  survived Phase 3 — reject.)

### Significance (1–5)
- **5** — Opens a new direction or connects two major areas; would be a headline
  result for the project; other candidates become easier once it exists.
- **4** — Notable standalone theorem; fills a named empty zone from a Phase 2
  bridge map that both sides' machinery points at.
- **3** — Solid contribution: a natural generalization, a reusable lemma layer,
  or a constant/quantitative improvement someone would cite.
- **2** — Useful but local; interesting mainly inside one bridge.
- **1** — Curiosity; no downstream consumer visible in any corpus.

### Effort (1–5, inverse: higher = more work = lower rank)
- **1 (S)** — < ~500 new Lean LoC; all needed API exists in mathlib or a corpus
  donor; no new analytic ingredient.
- **2** — ~500–1.5k LoC, or one small port with known friction.
- **3 (M)** — ~1.5–3k LoC, or several donor ports, or one missing-glue layer to
  build.
- **4** — ~3–10k LoC, or a nontrivial analytic API gap (e.g. new estimates) that
  must be developed in Lean along the way.
- **5 (L)** — > 10k new Lean LoC, or a missing analytic API of the scale of a
  sub-library (e.g. zero-counting machinery, Hilbert-inequality layer), or
  serious risk the statement needs external computation.

Effort anchor S/M/L in the dossier maps: S→1, M→3, L→5; triage may shift ±1 with
recorded justification from R9's feasibility notes.

## Candidate scores

Pre-built mechanical matrix (H, 2026-11-09 night). Filled columns are transcribed verbatim from
each dossier's own "Lane proposal" section and from on-disk pilot state; the four **[INCOMING]**
columns are left empty for R8's VERDICTS.md and R9's F4 grades. N/S/E = novelty/significance/
effort as proposed by the owning lane (non-binding); "score" is the lane's own arithmetic
(N×S÷E), quoted, not H's judgment.

| # | Candidate | Lane proposal (quoted N/S/E → score) | Category (dossier's own label) | Novelty adj (R8 VERDICTS) | Effort adj (R9 F4) | Pilot status (2026-11-09 night) | Depreciation tier (R8) | Draft final score (DRAFT — H arithmetic) | Notes |
|---|---|---|---|---|---|---|---|---|---|
| 01 | ez1-inertial-defect | R6: N4 S4 E3 → ≈5.3 | DISCOVERY | **4 → 3.5** (A4 narrowed: AF v2 Lemma 3.2 + §7.2(b); Lamzouri caveat) | **E2 empirical** (0-cycle port ≈ 45 min; M was over-estimate) | **(a) GREEN; (b)+(c) GREEN — master_identity PROVED + anchor** (BindingSurface+MasterIdentity OK, 0 err/0 sorry; tightness companion landing) | **HOT** (clip-trace ≠ rank-trace; our identity+tightness pair unclaimed) | **3.5×4÷2 = 7.0** | RE-SCOPE: keep structural identity + tightness ONLY; drop constant-improvement framing; cite Knausgård Thm 2 |
| 02 | ez5-bandwidth-k | R6: N5 S4 E4 → ≈5.0 (core) | CONDITIONAL-CORE | **5 → 3.5** (ceiling-ladder framing anticipated by Knausgård `Ceilings/`; H–M cite fixed) | **M core / L full — confirmed** (weaker direct evidence: no PairCeiling probe) | not started | **HOT** | **core: 3.5×4÷3 = 4.67** | RE-SCOPE (updated per donor mapping): LP weak duality **in Lean** + pair-mass B₂ axis — his r-ladder = index-distance axis, **incomparable**; dictionary = theorem-sized; his `law_lp.py` = LP-of-laws precedent (Python, unformalized); his §7.6 finished the all-windows ceiling — never claim "first barrier theory" |
| 03 | ez3-compression | R6: N3 S2 E1–2 → ≈3.0–4.5 | GLUE | **3 → 3** (03a KNOWN-INFORMAL, honesty upheld; M new-as-statement) | **S confirmed and strengthened** (donor spine probe-elaborated verbatim, 0 errors) | bundled in pilot 01 port | COLD | **3×2÷1 = 6.0** | none (bundle with 01) |
| 10 | z3-uniform-poly-space | R4: N5 S4 E3 → ≈6.7 | DISCOVERY | **5 → 5** (conjunction claimed by NOBODY; suquark/openai/eth cells disjoint) | **M confirmed** (eth time-shape elaborates verbatim; all F1 names probe-verified) | prework running (`10-prework.md`) | COLD | **5×4÷3 = 6.67** | Use r3 §7's rephrased claim wording; exclude the two taken cells explicitly |
| 11 | z1-reduction-theory | R4: N4 S5 E3 → ≈6.7 | DISCOVERY | **4 → 4** (nearest miss AFP Cook_Levin Composing.thy, different shape) | **M confirmed; milestone-1 abstract layer S** (measured-zero port cost) | **M1 COMPLETE** (acceptance GREEN, Design B; donor-verbatim faithfulness check; axioms = standard triad, no sorryAx; ≈35 min Modal) — **M2 next, not open** | COLD | **4×5÷3 = 6.67** | none |
| 12 | z4-parametric-savings | R4: N4 S3 E2 → ≈6.0 | DISCOVERY | **4 → 4** (ε(ω_b) function NEW; AVW freezes all constants) | **S–M confirmed and cheapened** (`ProbeC2_OAI_Model` elaborates the exact cited API) | not started (feeder = 51) | COLD | **4×3÷2 = 6.0** | Flag monotonicity-via-termPrime check at pilot |
| 20 | hecke-zetaK-density | R5: N4 S5 E5 → 4.0 | DISCOVERY | **(4) → 4.5** (NEW-SUPPORTED; 14 AF-citers, none Hecke/ζ_K) — constants stale on arrival | **M–L** (R9 F4; engine M, Hecke assembly L; OAI Hecke subtree closure-heavy → binder) | M1 GREEN, runs recorded Cycle 2 (`pilots/20/logs/m1-cycle2-green.log`; ledger §8) | **WARM** (IEANTN; AF-cluster may pivot) | **4.5×5÷4 = 5.63** | RE-SCOPE: value = "first Hecke/ζ_K statements", NOT record constants. EXTERNALITY (donor mapping): his patch = existence proof for window-instantiation via hypothesis-collections; his `Window/admWindow_vProf` = glue template |
| 21 | quartic-window-zeta | R5 updated: A2-path N4 S3 E3 → 4.0 | CONDITIONAL-CORE | **4 → 1.5** (outcome B realized by Knausgård formally, 0.67354; CCLM17 RH-conditional different class) | **M ((C)+(A1)) / M–L ((A2) on top)** (R9 F4) | **milestone-C DONE, certified**: cStar(1) − cFun_quartic ≥ 3.87e-4 (B closed; A2 kernel) | **HOT** | **1.5×3÷3 = 1.5** (A2-top: 1.125) | RE-SCOPE FINAL: absorbed into 02 as case study; his §7.6 also proves the A2-form (all-windows ceiling 0.68185) — only the sup over zeta23's own (c₀,r) class remains ours |
| 22 | quasi-rh-pnt-effective | R5: N1 S4 E2 → 2.0 (pilot) | ECOSYSTEM | **2 → 2** (AFP PNT+Eberl–Paulson exist; Tier-2 is the content) | **S for the Tier-1 remainder** (R9 F4) | M1 GREEN (68 LoC, kernel-clean); runs 1–6 logged; M2–M4 in flight | **WARM→HOT** (3 mathlib PRs open; PNTAnd + IEANTN converging) | **2×4÷1 = 8.0** — see donor note; treat as pilot-category, not a rank contender | STRATEGICALLY DEAD per donor mapping (`knausgaard-as-donor.md` §2d): Tier-1 formally alive, dead man walking — **stop at M4, no pilot slot**; real content = Tier 2 |
| 30 | hall-parseval-boson | R7: no numeric proposal — "pilot #1" | DISCOVERY | **4 → 4** (NEW-SUPPORTED; classical anchors Jing/Macdonald verified; no formalization; B–P–I no overlap) | **M** (Theorem A+A′; Theorem B L-if-attempted; tauceti zero-friction, mathlib side probe-verified run 10) | falsification milestone not yet landed (no dir) | COLD | **4×4[S-proposed-H]÷3 = 5.33** | S-proposed-H = 4: "first formal theorem connecting a complexity-theoretic construction … with the representation theory of symmetric groups", "tauceti's entire Frobenius-characteristic stack as downstream API" (dossier §Significance) |
| 31 | budgeted-split | R7: no numeric proposal — "second" | GLUE | **4 → 4** (NEW-SUPPORTED; Schönhage/laser classical-informal; abstraction untraced) | **M** (R9 F4; shares step-3 glue with 32 — bundle amortizes) | not started | COLD | **4×3[S-proposed-H]÷3 = 4.0** | S-proposed-H = 3: "Converts the two most expensive proof artifacts of the anthropics corpus … into *instances of one interface*" — reusable-layer anchor, not headline (dossier §Significance) |
| 32 | rc-savings-frontier | R7: no numeric proposal — "cheapest" | DISCOVERY | **4 → 3** (frontier-shape NEW but NUMERICALLY-SUPERSEDED at birth: 2610.17420 moves D ≤ N^0.172; Knausgård does not subsume) | **S–M** (R9 F4; no OAI dependency — an advantage) | M1 not yet landed (no dir) | **WARM** (AVW follow-up cluster) | **3×4[S-proposed-H]÷2 = 6.0** | S-proposed-H = 4: "the first exact optimality theorem of the PairCeiling type inside an algorithms formalization", fills bridge §3-3 named zone (dossier §Significance) | RE-SCOPE: state Γ(ε) parametrically; cite 0.1204 only as v1 anchor |
| 40 | zeta-k-prime-deriv | R1: N4 S3 E4 → ≈3.0 | DISCOVERY | **4 → 3** (T2 CONTESTED: Šleževičienė 2003 + Broughan 2009; T3 NEW-SUPPORTED) | **M–L confirmed** (toolchain-split risk halved by measurement) | not started (T3-headline re-scope) | **WARM** | **3×3÷4 = 2.25** | RE-SCOPE: T3 headline, T2 pilot only; add Šleževičienė/Broughan to nearest misses |
| 41 | q-deformed-eight-square | R1: N4 S4 E1–2 → ≈8 | DISCOVERY | **4 → 3.5** ((M)+(N) NEW-narrow; object-level CONTESTED by B–P–I 1998 q-composition; (H) NEW) | **S–M confirmed** (eth parity chain + tauceti side both measure favorably) | not started (R8-cleared, pilotable) | COLD | **3.5×4÷2 = 7.0** | RE-SCOPE: "first sign-rule/parallelogram-defect deformation"; keep (H) as differentiator |
| 42 | zeta-k-two-thirds | R1: N2 S3 E1 → ≈6.0 | ECOSYSTEM | **2 → 4** (R8 round-5(c) upgrade, post-donor-swap framing: certificate-conditional landing theorem; base VERDICTS table's 2 lags) | **S−** (donor: Hypζ via clean `*_of_local`; ThmE from zeta23-in-his-tree) | **M1 PROVED + axioms-clean (15/15)**; **M2a+M3 landed** (602+444 LoC, 48 thms — factorization discharge + C_D defect layer) | **WARM** | **4×3÷1 = 12.0** | CAVEATS: cert-as-explicit-binder; never his native_decide headlines; cumulative phrasing | CAVEATS: certificate-as-explicit-binder (EnclOK pattern); his headlines carry native_decide — bind only to the clean `*_of_local` layer; cumulative-window phrasing; constants 2 generations stale |
| 50 | quasi-rh-truncated | R2: N2 S2–3 E1–2 | ECOSYSTEM | (headline refuted by own audit, externally corroborated; S3 KNOWN via Broughan 2009) | **S (S1+S2)** (R9 F4) | **M1 PROVED** (94 LoC, GREEN, axioms = standard three); M2a running | COLD | **N2 × S2–3 ÷ 1 = 4.0–6.0** (glue-grade) | Donor mapping: NO discharge (no zero-free content in his tree — hQRH stays openai-side); what survives is S1/S2 glue |
| 51 | omega-to-wordram | R2: N1 S3 E3 — "feasibility feeder" | ECOSYSTEM | **KNOWN-INFORMAL-ONLY (Pan 1985)** — "not a dossier" per VERDICTS; consistent with lane's own N1 rescope ✓ | **M** (R9 F4; `DivisionFreeProgram` interface decouples OAI closure) | not started (after 12 scored) | COLD | **1[N-proposed-H]×3÷3 = 1.0** | N-proposed-H = 1 per VERDICTS KNOWN-INFORMAL-ONLY + lane's own label (final judgment: orchestrator) | RE-SCOPE: formalization-only or fold into Z2/12-F3b |
| 52 | unified-ccr-fock | R2: N2–3 S3 E3 | CONDITIONAL-CORE | **3.5 final** (R8 round-5: N1-universal + N3 dictionary hold up; N2 stays hypothesis) | **M** (R9 F4; N1+N3; OAI paths corrected — `Analysis/Naimark/CAR.lean`, `Laughlin/Fock/*`) | M1 VERIFIED-GREEN (R2 run14 2026-11-09; Cycle-2 reproduction 15 axiom-lines, 0 sorryAx — ledger §8, `pilots/52-note.md`) | COLD | **3.5×3÷3 = 3.5** | replaces the former "pending lane R8" note |
| 60 | border-rank-connector | R3: N1–2 S2 E1 → ≈0.5–1 | ECOSYSTEM | **1–2 → 1–2 confirmed** (Laderman/Schönhage ✓; border-rank-≤21 attribution UNCONFIRMED) | **S confirmed** (machinery chain measured self-contained) | not started (pipeline warm-up) | COLD | **1.5×2÷1 = 3.0** | Verify/drop the ≤21 attribution before writing |

### Data sources (which file feeds which column)

- **Lane proposal + category** — each `research/candidates/NN-slug.md` "Lane proposal" line and
  honesty/classification header (quotes verbatim; H added no judgment).
- **Pilot status** — `research/STATUS.md` pilots pipeline + on-disk `research/pilots/*`
  (blueprints, work dirs, `run*.log` files); refreshed per orchestrator status messages.
- **Novelty adjust + depreciation tier** — R8's `research/novelty/VERDICTS.md` — LANDED
  2026-11-09 19:26; transcribed for all 19 rows (52 = TBD-on-landing per R8).
- **Effort adjust** — R9's `## F4 grade by lane R9` dossier sections: transcribed for all 19
  rows; cross-checked against `feasibility/FEASIBILITY-SUMMARY.md` (canonical): **no
  discrepancies** on grades/scores; one nuance — row 42 carries the donor-mapping refinement
  "S → S−" on top of R9's S (both score 1). Donor-mapping deltas from
  `novelty/knausgaard-as-donor.md` folded into rows 02/20/21/22/42/50.
- **[S/N-proposed-H]** — for rows whose lane gave no numeric proposal, H quoted the dossier's
  own §Significance text and proposed a score per rubric anchors (30: S4, 31: S3, 32: S4,
  51: N1). Final judgment: orchestrator.
- **Draft final score** — H's arithmetic N×S÷E on (VERDICTS N-adjust) × (lane S) ÷ (F4 E:
  S=1, S–M=2, M=3, M–L=4, L=5); shown only where both inputs exist; DRAFT, not a decision.
- **Notes** — H's QA spot-checks (`research/qa/dossiers-spotcheck.md` Parts 1–3) and the
  deferred-fix register (`research/STATUS.md`).

## Top 3 recommendations for Lean pilot

### Decision-inputs-ready checklist (H, 2026-11-09 night — do not decide until these clear)

- [x] R8 VERDICTS.md — LANDED; all 19 novelty-adjust + depreciation cells filled above.
- [x] R8 donor mapping — DONE (`novelty/knausgaard-as-donor.md`, folded into rows 02/20/21/22/42/50 above).
- [x] R9 F4 grades — ALL 19 LANDED (20/30/52 landed 19:38; transcribed above) +
      `feasibility/FEASIBILITY-SUMMARY.md` (canonical effort table) +
      `feasibility/VERIFICATION-LEDGER.md` (canonical artifact table) on disk.
- [ ] **Undecided pilots**: 30-falsify, 32-M1, 01 (b)+(c), 11-M1, 22-M4 (stop-at-M4 rule),
      42-M2a/M3/M2b, 20-M1, 52-N1a, 50-M2a.
- [x] REPORT.md skeleton drafted (top-3 + conclusions = orchestrator, in place).
- [x] Mechanical columns (proposals, categories, pilot status) — current as of this pass.
- FINAL ranking (post-decision updates: 42 N→4/rank 12; 01 E→2/rank 7.0 proved; 52 N=3.5):
  **42 (12.0)**, 22 (8.0, pilot-cat + strategically-dead discount), **01 (7.0, proved)**,
  41 (7.0), 10 (6.67), 11 (6.67), 03 (6.0), 12 (6.0), 32 (6.0, S-proposed-H), 20 (5.63),
  30 (5.33, S-proposed-H), 50 (5.0), 02 (4.67 core), 31 (4.0, S-proposed-H), 52 (3.5),
  60 (3.0), 40 (2.25), 21 (1.5), 51 (1.0, N-proposed-H).

### 1. <candidate>

Chosen after all dossiers are scored; per candidate:

### 1. Candidate 42 — ζ_K zero-density proportions (certificate-conditional landing theorem)
First simple-or-on-line proportion statements for Dedekind ζ_K anywhere (DLRT-2019 prior: >45%
distinct via SDP — for a FIXED quadratic K, GRH-conditional, asymptotic in T; erratum per
`novelty/round-4.md` P2-3) — a 45%→5/6-class quantitative jump. Dependency precision (per
`pilots/20-hCZ-NOTE.md` §c): the **with-multiplicity on-line ≥ 2/3 for ζ_K is unconditional
— a-fortiori via `family_merge`/`two_thirds_of_components` (V1 assembly, no hCZ needed)**;
the distinct (5/6), simple-numerator, and Montgomery–Taylor-window forms are **engine+hCZ-
only** (hCZ conjecture-grade today — weakest sufficient form S₁ = o(N), hCZ-NOTE §b); the
certificate-conditional framing covers exactly those. Pilot: M1 PROVED (337 LoC / 20 thms,
axioms-clean, formally re-verified 15/15) + M2a/M3 landed (602+444 LoC / 48 thms:
factorization discharge + C_D defect layer); donor-accelerated (Knausgård clean-layer
discharge; native_decide avoided via explicit certificate binder). Effort empirically S−;
novelty upgraded N2→N4 per R8 round-5(c) (post-donor-swap framing). Recomputed rank ≈ 12.
- Pilot plan sketch: M1 (done) → M2a factorization (landed) → M3 C_D defect (landed) →
  **M2b donor swap closes the landing theorem** (next milestone); Modal loop per math-proof1.
- First Lean milestone: M1 — achieved (axcheck 15/15 clean).

### 2. Candidate 10 (Z3) — uniform-in-k ∧ min-rate ∧ polynomial-space ETH refutation
The conjunction is claimed by nobody (suquark: 3-SAT+poly-space, no uniformity/min-rate;
openai: per-fixed-k, weaker formal rate; eth: uniform, no space). NOVEL-SUPPORTED high;
conditional-GO after the W3/FitsG wall analysis with a bounded G1 audit as first milestone.
Rank 6.67.
- Pilot plan sketch: pad-compression route (a) vs clocked simulation (b) decision first;
  space-invariant threading through Wrap/Sim; prework landed (`pilots/10-prework.md`);
  M1 (= L3) proved 2026-11-10 (`pilots/10-blueprint.md`).
- First Lean milestone: bounded G1 audit (per orchestrator's decision text).

### 3. Candidate 01 — inertial defect-form master identity + tightness (structural)
The only candidate already an UNCONDITIONAL kernel-verified new theorem (master_identity +
donor-theorem anchor proved; tightness companion closing). Statement survives the Knausgård
squeeze structurally (clip-trace ≠ rank-trace; his Δ₊ move anticipated, our identity+
tightness pair unclaimed). Effort empirically E2 (0-cycle port, 45 min). Rank 3.5×4÷2 = 7.0.
- Pilot plan sketch: (a) port GREEN → (b) BindingSurface GREEN → (c) MasterIdentity GREEN →
  tightness companion (landing) → A3/A4 corollaries.
- First Lean milestone: (a)+(c) — achieved (0 err / 0 sorry-warnings, latest run log).

**Alternates (in order): 41** (top discovery score among unproved; (M)+(N) core;
object-level Benkart–Pérez contest noted; 30-falsify outcome pending), **11** (Red calculus
infrastructure; bake-off pending), **30** (Hall/Parseval; pending falsification milestone).
**Excluded: 22** (strategically dead pilot-category — its rank-8.0 carries the discount
flag), **21** (absorbed), **51** (killed).

## Decision log

| Date | Decision | By | Rationale |
|---|---|---|---|
| 2026-11-09 | Skeleton created | H | Phase 4 not started; no dossiers yet |
| 2026-11-09 | 19-row mechanical matrix pre-built (proposals/categories/pilot-status; 4 incoming columns empty) | H | per orchestrator Task 7; quotes verbatim from dossiers, no judgment added |
| 2026-11-09 | Incoming columns filled from VERDICTS.md (all 19) + F4 (10 rows); DRAFT scores computed for 10 rows; decision-inputs checklist added under Top-3 (left unfilled) | H | per orchestrator Task 8; Top-3 remains the orchestrator's call |
| 2026-11-09 night | 6 more F4s transcribed (21/22/31/32/50/51; 20/30/52 pending); donor-mapping deltas folded (02/20/21/22/42/50); DRAFT scores now on 13 rows (22 flagged strategically dead); checklist refreshed | H | per orchestrator Task 9 |
| 2026-11-09 night 2 | Final 20/30/52 F4s transcribed; effort column cross-checked vs FEASIBILITY-SUMMARY (no drift); S-proposed-H for 30/31/32 + N-proposed-H for 51; COMPLETE 19-row DRAFT ranking (52 TBD) | H | per orchestrator Task 10 |
| 2026-11-09 night 3 | Deferred-fix register applied (12 sites / 8 dossiers; 41 verified clean); 52 note added (final N pending lane R8); pilot statuses refreshed from rescued logs (42-M1/50-M1/11-T2 now axioms-recorded clean) | H | per orchestrator Task 11 |
| 2026-11-09 final | **TOP-3 DECIDED (orchestrator): 42, 10, 01**; alternates 41/11/30; excluded 22/21/51. Inputs consumed: H's complete DRAFT ranking, R8 VERDICTS rounds 1–5 (42 N→4 r5(c); 52 N=3.5 final), FEASIBILITY-SUMMARY, VERIFICATION-LEDGER + rescued run logs (01 b+c GREEN; 42-M2a/M3 602+444 LoC/48 thms), donor mapping. Rows 01/42/52 updated; ranking finalized | orchestrator, typeset by H | charter Phase 4 |
| 2026-11-13 | Cycle-2 addendum opened: rubric carried over verbatim (scope note added under Scale definitions); 5-row [expected] mechanical matrix pre-built (70/71/72 + reserved 73/74); pilot-decision checklist staged for the orchestrator | H | per orchestrator Task H-3; verdicts remain the orchestrator's |
| 2026-11-14 | **CYCLE-2 DECIDED (orchestrator): delivered 71-P2 + 72-C-neg + 72-M1 tranche + 42-M4 (both routes) + 73-C (Tier C) + 75 entry milestone + main-run completions 10-L2 and 11-M2 (every slot GREEN + axcheck) + knowledge closures (22-T2b upstream; Liu-1 constants; QR-D ecosystem audit incl. tracker — formal Dirichlet frontier 0.8733458561, ζ_K split survives); 50-M2-R1 resolved by G7b (item 5); 74 + the carried tranches go to Iteration 4.** Matrix filled (71 renamed, 73/74 landed, 75 added); inputs: A9's `TRIAGE-C2-ROWS.md` (reconciled + PROPOSED §decision + Matrix fill), A5 VERDICTS C2 rows, A7 donor-probes, empirical pilot record (no overrun past graded band) | orchestrator | charter § Cycle 2; standing one-article-per-discovery rule applied (42-M4 standalone, main-run 42 frozen) |

## Post-close outcomes (append, 2026-11-09 resume session — no re-ranking)

- **30**: Theorem B **refuted** at h = 1 (kernel-verified, `pilots/30-falsify-TheoremB-h1.lean`);
  replacement closed form proved (`pilots/30/ClosedForm.lean`). Theorem A (ω-twisted Hall
  identification) untouched and still the dossier's core; alternate slot unchanged.
- **32**: M1 green — frontier formula, unique crossing, phase transition at ε*, ceiling
  (`pilots/32/M1.lean`); crossing point as a parameter; lane proposal ≈ 6 (N3·S2÷E1).
- Final sweep: 30/30 staged files OK, 0 sorryAx (`feasibility/VERIFICATION-LEDGER.md` §1, §6–§7).
- Articles, one per discovery: `research/articles/` (10 articles + README).

## Cycle 2 addendum (opened 2026-11-13)

Status: DECIDED (2026-11-14 — orchestrator, from A9's reconciled `TRIAGE-C2-ROWS.md` +
its PROPOSED §decision block, spliced below). The main-run sections above are FINAL and
frozen (2026-11-09); this addendum's matrix is filled from the landed dossiers and A5/A7
verdicts; the §Cycle-2 pilot decision below supersedes the 2026-11-13 staging checklist.
Every Cycle-2 pilot slot is terminal (GREEN + axcheck); the one gated item is 50-M2-R1
(row 70) — LANDED on G7b PASS (item 5).

Rubric: the main-run **ranking rule and scale definitions carry over verbatim** —
novelty/significance 1–5, effort 1–5 inverse, ties broken by novelty, then effort, then
bridge essentiality; effort anchors S→1, M→3, L→5 with recorded ±1 shifts. No
Cycle-2-specific rescaling: A5/A7 adjustments move within the same anchors. Corpus scope:
see the one-line note under Scale definitions (six AxiomMath repos added to the four
main-run corpora).

### Cycle-2 matrix (filled 2026-11-14 from landed inputs — A9 Matrix fill M-1)

Same column contract as the main-run matrix: Lane proposal + Category are quoted verbatim
from each dossier's own "Lane proposal" line and honesty/classification header once landed
(A9); H adds no judgment. Draft score = H's arithmetic N×S÷E on adjusted inputs; DRAFT,
not a decision.

| # | Candidate | Lane proposal (quoted N/S/E → score) | Category (dossier's own label) | Novelty adj (A5 round-4, LANDED) | Effort adj (A7 landed + empirical) | Pilot status (2026-11-14) | Depreciation tier (A5) | Draft final score (DRAFT — H arithmetic on landed inputs, A9-precomputed) | Notes |
|---|---|---|---|---|---|---|---|---|---|
| 70 | unconditional-zetaK-zero-confinement | "Part A: Novelty **2** …, Significance **3**, Effort **1–2 (S)** — rank ≈ 3–4 …" | "**Part A = ECOSYSTEM/GLUE-grade posture upgrade** …" (Part B split to 75) | artifact-grade (no discovery N); per-class split: ζ_K-strip OURS / ζ-Dirichlet 7/8 CONCURRENT | R2 statement-level (G1b FAIL: 62 err/11 CFT modules); R3 binder-CLEAN (G7); R1 gated (G7b run19); substrate S-cost | **50-M2 R1 LANDED** (G7b PASS; ζ strip [1/8, 7/8] unconditional, `pilots/50/R1.lean`) | HOT-cluster / WARM-artifact | **4.0** (2×3÷1.5; E empirical-pending pilot) | tracker-audited split survives (n6); Bebel 0.8733458561 bounds the ζ/Dirichlet class's claim space |
| 71 | function-field-splane-dictionary (**RENAMED** from function-field-simple-zero-proportions — slug discipline kept) | "Primary (P)+(C): Novelty **2–3** …, Significance **3–4** …, Effort **1–2 (S–M)** — rank ≈ 3–5 …" | "**(P)/(C)/(W) = GLUE/formalization-first …; (S) = DISCOVERY-grade [HYPOTHESIS] …**" | primary formalization-first (dictionary value); FF-EZ2-family N as proposed ([HYPOTHESIS]) | G3 OK, G6b OK; G6a pending (Tier-A provenance only); empirical: P0+P1 243 LoC + P2 279 LoC/11 thms (S–M confirmed) | **DELIVERED — P2 FINAL-GREEN, A2 formal LANDED** (p2-run6; 279 LoC; descent 6→4→2→1→0; W1 pole-family exclusion + Core-2 delta) | WARM (Suzuki month-clock) | **5.8** (2.5×3.5÷1.5, delivered) | HKT cited at Part-3 level only (P2-11 PARTIAL-PIN); article 71 promoted past DRAFT |
| 72 | area-law-inertial-defect | "Primary AL-EZ1: Novelty **3–4** …, Significance **3–4** …, Effort **2–3 (M, with an S decider probe)**. AL-EZ3 … Effort 1–2 (S–M) …" | "**P1/C-neg = formal-new glue …; P2 = DISCOVERY-grade [HYPOTHESIS] …; AL-EZ3 = GLUE-with-real-consumer …**" | P1 formal-new (moderate); P2 N as proposed ([HYPOTHESIS]); C-neg precedent-backed (50/30 lineage) | G4 OK (statement layer mathlib-only), G5b/G5c OK; G5a pending (Tier-B only); empirical: **C-neg 369 LoC/11 thms/8 runs (S confirmed)**; M1 tranche 702+360 LoC/25 thms, zero gates as priced | **C-neg DELIVERED FINAL-GREEN** (run8-final 0/0; axcheck 11/11 triad); **M1 tranche DELIVERED partial-GREEN — [VERDICT:72-M1] FILLED (A8 formal)**: L1 ptrace-Gram + entropy match + L2 at constant 1 + vendor layer kernel-clean (m1-run8-GREEN; axcheck 52+28 triad-only); L3 + interface → Iteration 4 by design | WARM ("hard NO-GO on literal rank statements — already honored") | **4.9** C-neg-delivered (3.5×3.5÷2.5); M1 GLUE value LANDED at tranche scope | u≠1-analog deviations documented (72-prework :495); article 72 both halves at Cycle-2 scope (C-neg + M1-tranche) |
| 73 | function-field-hecke-tate (**LANDED** — was "[PENDING ZONE VERDICTS] reserved") | "Novelty **3** …, Significance **4** …, Effort **2–3 for the Tier-C pilot** … / **5 for Tier A** … (rank ≈ 4.8 at Tier C) …" | "**CONDITIONAL-CORE, Stacks-blocked, formalization-first — the highest-ceiling item of the 70–75 series …**" | formalization-first (dictionary value; Tier-C binder-designed, provable on our pin); "first formal Tate-type" SUPPORTED in FF scope + WenrongZou softening | G3 OK; G6a pending (Tier-A ceiling only); G2 OK adjacent; empirical: Q0 143 + Q1–Q3 236 LoC/7 thms (delivered) | **DELIVERED — 73-C FINAL-GREEN, A2 formal LANDED** (Q0 143 first-try; Q1–Q3 236/7 triad); Q4 UNTOUCHED → Iteration 4 | WARM | **4.8** Tier-C (3×4÷2.5, delivered at 236+143 LoC) | highest ceiling / least claimable; n5 WenrongZou clock |
| 74 | surprisal-moment-hierarchy-ceilings (**LANDED** — was reserved) | "Novelty 3.5 …, Significance 3 …, Effort 2 (S core; T3's M rides on the shared 02 LP layer) → proposed rank ≈ 5.25 …" | "**CONDITIONAL-CORE** dossier in the post-re-scope pattern of dossier 02 …" | transport-grade (02-pattern CONDITIONAL-CORE; T3 rides the shared unclaimed LP-duality layer); EntropyMoments.lean:93 id VERIFIED | G4 OK (statement layer); G5 only-if-consumed; empirical: none (no pilot) | unassigned; activates on Iteration-4 chartering (LP layer = charter slot 1) | WARM | **5.25** conditional (3.5×3÷2, unlanded) | u≠1 glue note APPLIED in-dossier 2026-11-14 |
| 75 | abelian-assembly-zetaL-proportions (**ADDED** — 70-Part-B split-out; not in the original matrix) | "Novelty **4 if DLRT is Dirichlet/quadratic-scoped …**, Significance **4** …, Effort **2–3 (M over the GREEN stack; no new analysis)** — rank ≈ 4–8 …" | "**DISCOVERY-grade claim on the statement class (gated by the DLRT scope check), CONDITIONAL-CORE today …**" | N stays 4 (P2-3 flip: DLRT SCOPED — fixed K, GRH, T→∞ — NOT uniform ⇒ primary NOT math-known); DLRT erratum must-cite | G2 OK (V2 on-pin, 13/13 triad); G1b FAIL ⇒ binder-route (hard-coded F2); empirical precedents: M4a ≈180 delta + M4b both routes 1,560/66→1,571/68 | **ENTRY LANDED — FINAL for Cycle 2** (A4 formal: run6-final GREEN, 17/17 triad; [VERDICT:75-*] FILLED split — N0 folded, N1/N3/final GREEN, N2+P-b carried) | WARM | **6.4** DELIVERED-entry (4×4÷2.5; run6-final GREEN) | the cycle's discovery-grade core — landed at entry scope; P-b + ℚ-route to Iteration-4 |

Data sources (Cycle 2): lane proposal + category ← `candidates/7N-*.md` (A9); novelty adj +
depreciation tier ← `novelty/round-4.md` (A5); effort adj ←
`feasibility/axiommath-donor-probes.md` (A7, cross-checked vs probe/logs-g); pilot status ←
STATUS.md § Cycle-2 pilots pipeline + on-disk `research/pilots/*`; donor-remap deltas ←
`novelty/axiommath-as-donor.md` (A3).

### Cycle-2 pilot decision (DECIDED — orchestrator, 2026-11-14)

Cycle 2 set out to consume the AxiomMath corpus as Lean donors and close the main run's
open pilots. Both halves delivered. The discovery headline is **not a constant and not a
first-formal claim in the hot cluster** — it is the **first formal zero-proportion and
zero-location statements for Dedekind zeta functions of non-quadratic shape**: the 42→42-M4
line (quadratic ζ_K proportions, now with an unconditionally discharged ζ-column) and its
abelian-tower generalization (75, executing). Around it, the cycle landed the FF
s-plane dictionary (71), the Rényi no-go gate (72-C-neg), and three knowledge-level
closures (22-T2b by upstream; the Liu-1 constant story; the QR-D Lean-ecosystem audit
incl. the tracker). Honest posture: per A5's landed tiers, one WARM discovery-grade
conditional core (75), one WARM formalization-first tower (73), and artifact-grade
posture upgrades in the QR-D cluster (70) — the cycle's rank rests on delivery, not on
claims the 2026 cluster has already taken.

**1. Candidate 71 — FF s-plane dictionary (delivered, FINAL-GREEN).** The first s-plane
zeta of a curve in any formal system — meromorphic dictionary, exact-1/2 window
(W1 as landed with the pole-FAMILY exclusion — honest correction), perfect zero-density
(W2), uniform Hasse–Weil transport (HW) — 279 LoC / 11 theorems all triad, descent
6→4→2→1→0 over p2-run1..6 (A2 formal report LANDED; LoC corrected 282→279; W1 statement
delta: pole-family exclusion + Core-2 re_eq_one_of_card_mul_wOf). Formalization-
first (Weil 1948 classical; A5 tier WARM), the load-bearing substrate for the FF zone;
per-curve uniform proportions correctly absent (maximal-curve trap; HKT cited at
Part-3 level only). Recomputed rank ≈ 5.8 ⟨orchestrator: 2.5·3.5÷1.5⟩.
- Pilot plan sketch: P0/P1 substrate (243 LoC) → P2 W1→W2→HW — all achieved; P2c
  packaging optional post-sweep.
- First Lean milestone: P0 — achieved (probe, 4 justified stubs).

**2. Candidate 72 — Rényi monotonicity no-go gate (C-neg + M1-tranche delivered,
FINAL-GREEN).** The Kuwahara obstruction as a permanent kernel-verified fence: N1 (Rényi
monotonicity, 0<α≤β<1), N2 (rank bridge), N3 concrete-family FALSE forms with Kuwahara as
the external `hKL` binder (EnclOK pattern) — 369 LoC / 11 theorems, 8-run honest descent
20→0, axcheck 11/11 triad. Negative-result kind (articles 30/50 lineage); A5 tier WARM
with the hard NO-GO honored. **[VERDICT:72-M1] RESOLVED — partial-M1 GREEN, FINAL for
the tranche (A8 formal report, 2026-11-14): the row's GLUE half landed at Cycle-2 scope —
vendor layer + L1 ptrace-Gram/entropy match + L2 at constant 1, all kernel-clean
(m1-run8-GREEN; m1-axcheck-final 52+28 axiom-lines, 0 sorryAx, triad-only; 702+360 LoC /
25 thms); L3 and the interface theorem itself carry to Iteration 4 by design (spec in the
run-8 header) — the deliverable completes as designed at tranche scope.**
Recomputed rank ≈ 4.5 ⟨orchestrator: 3.5·3.5÷2.5, C-neg-only⟩.
- Pilot plan sketch: C-neg (achieved) → M1 Tier-C (tranche achieved; L3 + interface →
  Iteration 4) → P2 decider probe (unchartered).
- First Lean milestone: C-neg — achieved.

**3. Main-run carry 42-M4 — unconditional ζ-column (delivered, FINAL both routes).** The
donor-swap upgrade of the main run's #1 pilot: Knausgård certificate binders replaced on
the ζ side by ZetaZerosV2's Lamzouri endpoints — fallback GREEN (1,560 LoC/66 by run-header count; full-coverage axcheck 68/68 triad)
AND the direct-V2-import upgrade COMPLETE — **A3 formal report LANDED (M4-note.md)**:
FINAL artifact `pilots/42/M4b.lean` = 1,571 LoC / 68 thms, m4b2-run2 GREEN 0/0, **M4c(i)
fully discharged** (consumer-side d4/d5 + G2-run3's 13 donor lines incl.
*_proportion_lower; primary axcheck 70 theorems + 2 donor prints, triad-only), fallback
preserved byte-exact, net +11 LoC (−3 binders, +2 endpoint bridges). First ζ_K proportion statements with no external
certificate artifact in the dependency tree. Standalone article (42-M4); main-run
article 42 frozen.
- Pilot plan sketch: M4a strip layer (achieved, ≈180 LoC delta) → M4b fallback (achieved)
  → M4b primary upgrade (achieved).
- First Lean milestone: M4a — achieved.

**4. Candidate 75 — abelian assembly (entry milestone DELIVERED; the cycle's
discovery-grade core).** The n+1-factor generalization: first zero-proportion statements for ζ_L across
the whole abelian tower, component-proportion binders as the named open core,
partially-unconditional ℚ-route (V2 ζ-side; the consumed glue is now pilot-proven at
42-M4b scale). A5 N4 (DLRT flip resolved — not math-known); tier WARM. Spec complete;
A4's report LANDED — entry milestone GREEN; article promoted SKELETON→DRAFT; P-b + the
ℚ-route carried to Iteration 4.
**[VERDICT:75-*] FILLED — A4 FORMAL REPORT LANDED (2026-11-14): the entry milestone
(P-a)+(C1)@2/3 is GREEN (run6-final; descent 26→7→1→2→2→0; 17/17 in-file triad incl.
3 heritage landings) — the cycle's discovery claim LANDS at rank ≈ 5.3–6.7 ⟨orchestrator:
4·4÷3..4·4÷2⟩; the article promoted SKELETON→DRAFT. P-b (5/6 strip arm, +0.2–0.3k design
on file) and the N2 ℚ-route CARRY to Iteration-4 with the engine warm; the binder schema
remains the named open core, one hypothesis lighter than designed (hntop-partial-products
derived away via the ℕ∞ analyticOrderAt route).**
- Pilot plan sketch: N0 probe → N1 assembly (N1-a/N1-b) → N2 ℚ-instantiation → N3 axcheck.
- First Lean milestone: N0 — achieved (folded into the entry milestone).

**5. Candidate 70 — unconditional ζ_K zero confinement (artifact-grade; gated).** Part A
is the ECOSYSTEM/GLUE posture upgrade: pilot 50's conditional shell re-based on
parametric θ-strips. Per-class honesty (A5-confirmed, tracker-audited): the ζ/Dirichlet
class carries no first-claim (openai in-corpus; Liu-1 external at the exact algebraic
B_new; Kontorovich 11/12; **and the tracker's formal Dirichlet frontier 0.8733458561 —
below even the conditional informal frontier**); the ζ_K/all-K strip is OURS alone today
(no ζ_K formal artifact anywhere; on the Liu-2 B♭ clock). Routes: R2 statement-level
(G1b FAIL), R3 binder-CLEAN (G7), R1 preferred. **[RESOLVED 2026-11-14: G7b PASS + R1 GREEN — the Part-A ζ theorem lands UNCONDITIONALLY at [1/8, 7/8]
on the donor pin (article 50-M2); Dirichlet at 7/8 with `hFEχ` only; the parametric θ-design
absorbs the cluster clock.]** Recomputed rank ≈ 3–4 (artifact-grade; A5 "no discovery N").
- Pilot plan sketch: route decision → glue (d1/d2 shared with 75) → landing theorems.
- First Lean milestone: pilot-50 shells GREEN since main run (the discharge is the delta).

**6. Candidate 73 — FF Tate dictionary, statement layer (DELIVERED at Tier C; highest ceiling).**
First formal Tate-thesis-type statements in the function-field scope (A5 P2-13 SUPPORTED;
WenrongZou nearest-neighbor clock), Tier-C binder-designed, zero import gates, provable
on our pin. **[VERDICT:73-C] FILLED-FINAL (A2 formal report LANDED): the FF L-substrate layer
LANDS GREEN (Q0 first-try, 143 LoC; Q1–Q3 236 LoC/7 triad) and the three-column window
table completes; **Q4 (the hRat discharge) UNTOUCHED per gate — carries to
Iteration 4**, A2 owning the recommendation.**
Recomputed rank ≈ 4.8 at Tier C ⟨orchestrator: 3·4÷2.5⟩ — delivered at cost (236+143 LoC).
- Pilot plan sketch: Q0 → Q1 → Q2(i) → Q3(ii); hard STOP before Q4.
- First Lean milestone: Q0 — achieved (first-try GREEN, 143 LoC).

**7. Candidate 74 — surprisal-moment ceilings (unassigned this cycle).** Transport-grade
(A5: 02-pattern CONDITIONAL-CORE; T3 rides the shared unclaimed LP-duality layer);
u≠1 glue note applied in-dossier. No pilot; carried to Iteration-4 where the LP layer is
the charter-draft's slot-1 candidate. **[CONDITIONAL: row activates on Iteration-4
chartering, not on a Cycle-2 slot.]** Recomputed rank ≈ 5.25 conditional ⟨orchestrator⟩.

**Main-run completions folded into this cycle's record:** 10-L1 GREEN + full axcheck
(529/25) **and 10-L2/M3 GREEN + axcheck-clean (A6 formal LANDED: 2,625 LoC/151 thms,
all ⊆ triad; countdown loop + PolyTVal + polyTVal_id + countdown_cut — the assembly
wd↔cw walk + counter-padM′ remains, declared no-wall next-tranche, so the ETH headline
stays open)**, 11-M2 GREEN (B(ii) proved — **A8 FORMAL REPORT RECEIVED 2026-11-14: all
six files OK, corrected error series 4→2→3→6→3→2→2→0, axcheck 76 axiom-lines / 0
sorryAx / triad-only**), 52 VERIFIED-GREEN close-out, 20 runs recorded.
**Both main-run conditionals RESOLVED GREEN: [VERDICT:10-L2] (A6 formal report LANDED —
the three-layer certificate stack completes; article 10 promoted FINAL by the
orchestrator's 2026-11-14 decision, assembly tranche honestly carried, headline a
target not a claim) and [VERDICT:11-M2] (A8 formal report — Theorem B(ii) completes and
article 11's addendum closes; article Status line carries "+ M2 COMPLETE").]**

**Empirical cost ledger (typeset verbatim from this file's block above):** C-neg 369/11
(S confirmed) · M4a 1,194/54 (≈180 delta) · M4b 1,560/66 fallback + axcheck 68/68 + 1,571/68 primary FINAL artifact (A3 formal report LANDED; M4c(i) discharged) (M) ·
P0+P1 243 · 71-P2 279/11 (6-run descent) · 73-C 236+143/7 · 10-L1 529/25 + full axcheck · 10-L2 2,625/151 all-⊆-triad (A6 formal; M3 tranche) · P11T3 1,100/88 (GREEN first run) ·
RedTm2 421/8 FINAL (m2-run8 all-six OK; M2 COMPLETE per A8 formal; corrected series 4→2→3→6→3→2→2→0) · 72-M1 702+360/25 (partial-M1 GREEN; descent 24→10→1→0; axcheck 52+28 triad-only). **Finding: every landed pilot finished inside its graded
band; no overrun materialized** — A7's [incoming] grades substitute cleanly.

**Ecosystem standing notes (n6–n8, dated 2026-11-14):** (n6) the formal Dirichlet
frontier is the tracker's 0.8733458561 (Bebel, continuum-anchor, tri-kernel verified:
Lean+NanoDa+con-ron over triad-restricted axioms) — leapfrogging Chang–Wang's
CONDITIONAL 0.87446205 and every informal uniform claim for that class; the ζ_K/all-K
split SURVIVES the audit (tracker Dirichlet-only), strengthening the 70/75 line as the
only formal ζ_K zero-location family anywhere. (n7) the de Bruijn–Newman Λ gap is TAKEN
by a third party (kernel-checked Λ ≤ 9/32) — no Cycle-2 row carries a Λ framing; keep it
so. (n8) Liu's B_new is independently tracked at the exact algebraic (1507−2√921)/1653
("proved in Lean" on the tracker's vendored tree) — cite at R3 above the public entry's
34999/40000.

**Carried to Iteration 4 (gates attached):** 50-M2 R2 (31/32 ζ_K strip, statement-level) — R1 LANDED;
73-Q4 hRat discharge (separate gate, A2 recommendation); 75 wave-4 completion (the N2
ℚ-route + P-b arms of the FILLED 75 verdict); 42-M4b-upgrade residuals (A3 log-hygiene
formal report); 22-T2a (small, upstream-statement binder); 72-M1's carried L3 +
interface theorem (continuation spec verbatim in the m1-run8-GREEN.log header; A8
formalizing next); the LP-duality layer + AL-3D + ZZV2 λ-family seed
slots per ITERATION4-CHARTER-DRAFT (all [A5-SEED-TRIAGE]/[TRIAGE-DECISION] — next-cycle
decisions, not this close-out's). Iteration-4 chartering itself waits on the close-out
chain ([SWEEP] gates the §Iteration 4 addendum typeset — CHARTER-DRAFT:100).

**Deferred/hold (no rank change):** 74 (unassigned → Iteration-4); 71-(S) ensemble
objective and 72-P2 purity route stay flagged [HYPOTHESIS] objectives, not slots; 51/21
exclusions carry over from the main run.

