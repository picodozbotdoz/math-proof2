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
| 20 | hecke-zetaK-density | R5: N4 S5 E5 → 4.0 | DISCOVERY | **(4) → 4.5** (NEW-SUPPORTED; 14 AF-citers, none Hecke/ζ_K) — constants stale on arrival | **M–L** (R9 F4; engine M, Hecke assembly L; OAI Hecke subtree closure-heavy → binder) | M1 staged (`pilots/20/M1.lean`; [runs-unrecorded] per ledger) | **WARM** (IEANTN; AF-cluster may pivot) | **4.5×5÷4 = 5.63** | RE-SCOPE: value = "first Hecke/ζ_K statements", NOT record constants. EXTERNALITY (donor mapping): his patch = existence proof for window-instantiation via hypothesis-collections; his `Window/admWindow_vProf` = glue template |
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
| 52 | unified-ccr-fock | R2: N2–3 S3 E3 | CONDITIONAL-CORE | **3.5 final** (R8 round-5: N1-universal + N3 dictionary hold up; N2 stays hypothesis) | **M** (R9 F4; N1+N3; OAI paths corrected — `Analysis/Naimark/CAR.lean`, `Laughlin/Fock/*`) | M1 in iteration (axcheck: FAIL 13–15 err, 9 sorryAx — mid-flight) | COLD | **3.5×3÷3 = 3.5** | replaces the former "pending lane R8" note |
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
First simple-or-on-line proportion statements for Dedekind ζ_K anywhere (DLRT-2019 prior: only
>45% distinct via SDP) — a 45%→5/6-class quantitative jump. Dependency precision (per
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
  space-invariant threading through Wrap/Sim; prework landed (`pilots/10-prework.md`).
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
