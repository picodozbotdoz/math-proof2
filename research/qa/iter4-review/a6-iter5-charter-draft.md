# A6 — Iteration-5 charter TYPESET-DRAFT v1 (working consolidation for the orchestrator's typeset pass)

Lane A6 (worktree agent-07), 2026-11-18, wave 3. This is the merged working draft the
orchestrator typesets into `RESEARCH.md` §Iteration 5 (spliced per the Iteration-4
precedent: normative paragraph at the splice + template gates). Inputs merged (all
landed on main): the charter candidate `qa/iter4-review/a6-iter5-charter-candidate.md`
(committed `7fe38e8`; §5a NS-1 sweep included — NS-1 KILLED, verdict COVERED), the
pilot-41 P0 pre-charter `qa/iter4-review/a6-41-p0-precharter.md` (`7fe38e8`) = Lead 2's
payload, and A3's Landau η-port pre-charter `pilots/zzv2-lam/eta-port-precharter.md`
(`a117762`) = Lead 3's payload.

**Convention: everything orchestrator-decision-shaped is an explicitly-marked
[DECISION-n] slot — this draft never pre-decides.** The register is §6. Advisory
orderings say "recommend (input)".

---

## §0 Objective (draft opening paragraph)

Iteration 4 closed with the verification chain §10.1–10.24 complete, every chartered
slot landed or honestly recorded, quota N=1 UNSPENT (article-78 = NEGATIVE-kind,
discovery-grade, no consumption), and two hard-stop rulings minting iteration-5 payloads:
the **Landau η-port** (ZZV2-λ P2; `pilots/zzv2-lam/P1-record.md:75–90`) and **10-D4's
M-arc assembly w/ hv** (`pilots/10/D3-record.md:31–37`). Iteration 5 re-charters under the
SAME raised discovery bar (R2 S1–S4 + the iter-4 template; two-strike cap N = 1 per cycle;
≥ half of shipped articles discovery-grade) over the same five corpora plus the
Cycle-2/Iteration-4 donor registrations, with the seed inventory PRE-CONSOLIDATED (this
draft + its three payload pre-charters — no new scan needed at open) and the bench
coherence-audited (`a6-iter5-charter-candidate.md` §4: 41 CHARTER-opener / 12 DEFER stand;
FF-EZ2 and the physlib probe left the bench by execution). Discovery posture: the top
leads are chosen so every launch slot has a named NEW-statement target or a pre-ruled
opener — formalization-first work (FB-2/FB-4/η-port-Option-C) competes only for the
single knowledge-level quota slot and never displaces a discovery lead.

**[DECISION-0 — close-act coupling]** This draft is written against main @ `a117762`
with the five wave-3 in-flight units UNRESOLVED (A3 FF-EZ2-P2, A4 AL-P2-c/d/e, A5
N2-packaging+M2+M3, A7 77-T1-completion+T2, A8 74-P1-completion). The typeset charter's
day-1 wording for Leads 1 and 4 depends on their outcomes: landed ⇒ "continue"; rolled ⇒
"resume first". Ruling needed: typeset before the close act (conditional wording) or
after (resolved wording). Recommend (input): after — the close act is armed and the
payloads do not rot.

## §1 Quality gate (carried verbatim from §Iteration 4 — normative here)

An article ships only through the template — kind declaration (DISCOVERY /
DISCOVERY-CONDITIONAL / NEGATIVE / FORMALIZATION-FIRST), per-theorem status rows in the
closed four-string vocabulary, a novelty table with ≥ 2 nearest-miss rows, per-theorem
verification blocks per R3 §5, no infrastructure narration, the full §9 checklist. A
candidate is article-eligible only if it passes R2's S1–S4. Donor swaps, binder
discharges, certified numerics and formalization-first layers are first-class ENGINEERING
deliverables — never discoveries; an upgraded theorem is revised to v2 in one versioned
article. Two-strike rule FINAL: at most **one** knowledge-level / formalization-first /
donor-discharge article per cycle, and ≥ half of shipped articles discovery-grade.

## §2 Launch-ordered leads (budgets + gates; payloads cross-referenced)

Advisory order below is the candidate's §3 ranking (input). Each lead names its first
kernel-checkable milestone (the strict-bar convention).

**1. 75-N2 completion → the unconditional-at-ℚ ζ_L landing** (the strongest
discovery-grade lead; S4(a)-class). M2 (P1-b L-series identification, ≈0.15–0.25k LoC) →
M3 (P1-c/d principality transfer + identity-theorem extension + composed transfer,
≈0.15–0.25k) → N3 axcheck (S) → `zetaL_two_thirds_landed_ℚ`. Substrate warm
(`crossmath-pilot-75`); 1–3 runs per milestone; M1-packaging closure first if A5 left it
open (one run). The 50-M2-R2 binder fold resolves here ((d1) staging shared). Citations:
`pilots/75/N2-P1-record.md` (milestone table + §P2/P3), dossier
`candidates/75-N2-rayclass-dirichlet-consumer.md`, pre-shipping sweep 3×NOVEL (`3e5aaef`).
Gate: none hard. **[DECISION-0 coupling: resume-vs-continue per A5's outcome.]**

**2. Pilot 41, q-deformed-eight-square — the pre-ruled iteration-5 OPENER**
(`INDEX.md:290`). **Payload: `qa/iter4-review/a6-41-p0-precharter.md` — copy-paste-ready
P0** (verbatim eth port `EightSquareStatement.lean:37–53` + `SecCrossing_Identity.lean:126–136`;
`sigmaQ`/`Gq` in `Polynomial ℤ` + `aeval` — the no-Laurent pin; Prop-valued zero-sorry
statements (M)/(B)/(P1)/(P2)/(N)/(N′); (H) as the EnclOK `HostTransport` binder).
Budget: P0 1–2 warm runs (`crossmath-probe`, doz CLI, SPEC 2cpu/4GB,
LEAN_NUM_THREADS=2); core S–M ≈ 0.5–1k LoC, 3–5 runs; (H) a separate gated milestone
(+1–3k LoC) — **[DECISION-4: does (H) get its own iter-5 slot/milestone budget or stay
wave-tail conditional?]**. Descope ladder pre-negotiated ((N′) degenerate branch; (H)
no-match ⇒ Cayley–Dickson anchor; decide-too-slow ⇒ enumeration; aeval friction ⇒ map
form). Gates G-P0(a)–(c) as specced. **Note: the dossier-41 G_q display errata are
stamped (worktree copy, this session) and the pre-charter carries the corrected `Gq` —
the pilot consumes the corrected form.**

**3. The Landau η-port (ZZV2-λ P2) — the minted iteration-5 ask.**
**Payload: `pilots/zzv2-lam/eta-port-precharter.md` (A3, `a117762`).** Target:
`exists_KSAsymptotic_of_pos` (∃ c, `KSAsymptotic lam c ∧ |c − scaledConstLam lam| < ε`
for all λ > 0) via the scaling-covariance ladder (`dilateTo`/`extremalLam`/
`cutoffTestLam`/`correctedTestLam` with the (2λ)² coefficient — the definition-level
content P0(b) pinned as absent tree-wide). **Cost note, verbatim per A3 §2.2: the donor
bridge chain is ENTIRELY private (14 lemmas, `Zeta/Kernel.lean:237–599`) ⇒ local
re-proof, no transport-by-invocation shortcut** (the P1 private-copy precedent
`P1.lean:95/:109` writ large; sibling-read-only forecloses donor patching). Budget:
**6–10 runs, honest ceiling 12–13; 0.8–1.5k LoC, class L** (composition: 1 pin-probe +
4–8 proof-loop + 1 regression/assembly; ≈1–1.9 h total at SPEC; staged-image option per
A3 §4 Phase 2 if the loop grows past ~4 runs). **Donor-hygiene action at the pin probe
(carried from A3 §3): consumer-side `#print axioms` triad prints for the newly consumed
public names — minimally `PairCorrelation.tendsto` + the `pairCorrelationSum`/
`pairWeight` surface** (P0's 4-name check predates the port's consumption set).
Regression discipline: λ = 1/2 recovers the frozen constants bit-for-bit (L4-anchor
pattern), proved FIRST as the mid-ladder checkpoint (A3 risk-2 mitigation).
**[DECISION-2: billing — A3's three options staged in its §5: (A) pure technical record,
quota-free; (B) discovery-billed covariance layer, battery-gated; (C) split — port as
record + the consumer corollary class (full-domain discharge + no-numerics
strict-improvement margin) held as a conditional DISCOVERY-CONDITIONAL slot. The round-5
novelty battery (§4 rung 1) is the determining input for all three; Option C, if fired,
joins the [DECISION-1] quota competition.]**

**4. FB-5/77 continuation at C+ billing** (the 4 binding conditions:
`candidates/77-…-laughlin.md:331–341` — C+ cap, Casimir out, physlib clock rides the
pilot at start AND end, effort per §Feasibility minus the dropped rung). Inherits A7's
T1-completion (≤4) + T2 (≤4) if rolled; if T1 landed, iter-5 runs T2 + the dictionary
article. **[DECISION-0 coupling per A7's outcome.]**

**Same-week engineering rungs (never discovery-billed):**

- **10-D4 M-arc assembly w/ hv** — all inputs GREEN (`D3-record.md:31–37`); the assembly
  must supply the value-poly binder `hv : ∃ k, ∀ x, e x ≤ (|x|+2)^k` or derive it
  Solver-side (the adjudicated two-true-forms amendment, `D1-record.md:42–45`). ~120 LoC
  + the hv decision; 1–3 warm runs. Closes the dossier-10 machine layer.
- **72-M1 L3b–d + the interface theorem** (`REPORT.md` §I4.2 post-wave row; spec
  `pilots/72-M1/L3-spec.md`).
- **Liu B_new statement-level port** — the never-fired "named cheap iteration-4 item"
  (`RESEARCH.md:143–146`; informal frontier B♭ 0.8748866 / B_new 0.8749570 now beats the
  in-corpus 7/8 donor by ≈0.0001 — `novelty/iter4-external-priorart.md:208–211`):
  statement-binder port of Liu's B_new, Liu-1 convention (statement-level citation ONLY,
  DO-NOT-CONSUME as build dep, `novelty/liu1-as-donor.md` §5). Warm, 1–2 runs, <250 LoC
  binder artifact (`pilots/50-M2-31-32-spec.md` §3 precedent, G7 Liu-1 pattern).

**Wave-tail / lane-drain queue (charter names them, no slot by default):** 12-P0 (the
DEFERred bench #2 — P0-first MANDATORY, the termPrime/monotonicity check rides the P0;
`pilots/12/preflight.md:94–106`); 11-M3 (CH20∘VW13; carries the Fischer arXiv:2610.32162
cite-consumable); FB-1/76-T1a (dual-value convergence rung; T2's 78-gate is now clear);
AL-3D B.3 (the designated iteration-5 rung at the 6.3k-LoC transcription pricing —
recommend (input): hold behind the AL-P2 c/d/e outcome + the challenge-repo clock).

## §3 Quota + watchlist (the [DECISION-1] asks)

- **Quota N=1 is fresh for iteration 5** (per-cycle rule; iter-4's unspent status is the
  health indicator, not a carry-over — **[DECISION-3 confirms this reading + the
  single-slot competition]**). Known competitors for the knowledge-level slot, NONE
  pre-decided:
  1. **FB-2 PNT-AP explicit-L** (`RESEARCH.md:150–160` ignition rule; `r2-discovery-strength.md:750`):
     L-grade explicit-formula build, donors registered (G7b 7/8 tree; G11 SiegelZeros
     binder fallback); PNT-AP at x^{7/8+δ} = QRH-paper2 Cor 1.2 verbatim —
     formalization-of-recent; fires PNT+ T2 ⇒ DEFER → REGISTER-AND-PORT (upstream
     StrongPNT imported at the donor pin).
  2. **FB-4 FF-PNT** (`r2-discovery-strength.md:752`): M-effort, formalization-first
     technical record; natural second consumer of the 71/73 FF substrate; "must not
     consume a discovery slot".
  3. **η-port Option C's conditional corollary slot** (if fired per [DECISION-2]).
  - Recommend (input): decide AFTER the round-5 battery + the wave-1 landings; the
    default is spend-only-if-executed (iter-4 precedent: unspent again is a healthy
    outcome).
- **T2 ignition rule carried verbatim** (`RESEARCH.md:150–153`): IF an FB-2 PNT-AP pilot
  charters, T2 FIRES (PNT+ REGISTER-AND-PORT; G9 preflight staged). Not fired by this
  draft.
- **PNT+ watchlist stays DEFER** (T1/T2/T3 unfired; upstream v4.35.0 as of the last
  fetch).

## §4 Debt rungs (summarized; full detail = candidate §2 + §4)

1. **The 5 RETARGET-ITER-5 G7 sites** (`a2-g7-token-inventory.md:56–73`):
   `SEED-DOSSIERS.md:56` (OAI family-265 companion sweep + AreaLaw2D 3D third-party
   formal activity), `CHARTER-DRAFT.md:58` (AL-3D + ZZV2 novelty batteries — the ZZV2
   sub-item is [DECISION-2]'s determining battery), `lp-duality-bridge.md:68` (mathlib
   LP/PNT PR clock), `pilots/10/next-tranche-spec.md:3` + `10-blueprint.md:187` (resolve
   with the D4 charter line). **[DECISION-5: does `novelty/round-5*` run as iteration 5's
   first act or was it pre-close? It is the determining input for [DECISION-2] and the
   natural carrier for the residual batteries.]**
2. **Bench rows** (audit at candidate §4): 41 → converted to a slot (Lead 2); 12 stays
   DEFER behind 41; 11-M3/60/40/31/30-A/A′ stay benched with reasons; FF-EZ2 + physlib
   rows superseded (executed); S13 pilot = the live physlib item behind its
   differentiation gates.
3. **Standing clocks** (`qa/REPORT-INPUTS-ITER4.md:69`): tracker, Liu-2, WenrongZou,
   physlib pushed_at + wing sweep, mathlib PNT/LP PRs, AreaLaw2D challenge repo; QR-D
   race consumers (Bhargava–Vemulapalli 2611.09031; Baldwin–Sivek 2611.06705; Cao–Gao–
   Huang–Nie 2610.37179; Frei–Sofos–Widmer 2610.18491; Walsh 2610.40439).
4. **Debts f/h/l** open (HKT partial pin; tracker as_of convention; the Λ-absence ban
   carries verbatim into this charter's text per debt-l). Debt g closed 2026-11-17.
5. **Donor-registration note (new, from the NS-1 sweep):** the Sept-2026 honeycomb-SAW
   cluster (9 OAI preprints + ~150-module proved tree, `OAI/Combinatorics/Honeycomb*`)
   is unregistered — G11/G12-pattern registration available, **SHELF, fire-gated on a
   chartered consumer** (none exists; candidate §5a). Stale-note flags (report-only,
   owners' files): `novelty/iter4-fresh-bridges.md:74–78` (source found; no L-function
   link) and the NS-1 candidate row in candidate §5 (superseded by §5a).

## §5 Standing rules + close-out protocol (carried forward verbatim-in-substance)

Ground rules: discovery-first, kernel-only (no sorry, no native_decide, no external
CAS), siblings read-only, exact citations; donor statements only as hypothesis binders,
verbatim marked probe copies, or built on-pin libraries; logs persisted with provenance
headers; one writer per file; H commits only. Modal per AGENTS.md §Modal usage
guidelines (2 CPU / 4 GB, telemetry every run, LEAN_NUM_THREADS=2, taskset-not-`-j` on
lake phases, investigate-not-upgrade, cached image layers for long builds, never
over-reserve). Lane topology: H + A-lanes, queue-loaded, sticky. Close-out: the
Iteration-4 adopted protocol (scoped final gates, gate-run persistence, INDEX
reconciliation as a close gate, date discipline, staging-file supersession stamps).

## §round-5-battery — the η-port discovery-layer novelty battery (executed 2026-11-18, lane A6; the [DECISION-2] determining input; scoped to the η-port layer ONLY — the AL-3D sub-item residual and the canonical `novelty/round-5*` record remain the L6-carrier's; this section is the input)

**Scope battery'd (A3 precharter §1.3–§1.4):** (i) the scaled closed form
`c_λ = ρ²·c₀ + (1−ρ²)·Q(0)`, ρ = 2λ, with its change-of-variables derivation; (ii) the
`correctedTest` definition-level divergence (the (2λ)² coefficient class); (iii) the
consumer payoff pair (full-domain `exists_KSAsymptotic_of_pos` + the no-numerics
strict-improvement corollary). Zero Modal; corpus greps + external abstract-level reads.

### Evidence

**Corpus side (formal):** double-confirmed A3's census — `axiommath/ZetaZerosV2/ZetaZeros/`
has NO dilation/scaling/covariance content (grep `dilate|scal.*covari|covari` = 0 hits
over the tree; `Zeta/Kernel.lean` carries 44 `private` decls — the frozen 14-lemma chain
among them); the donor's transfer layer is λ-generic only in its HYPOTHESES
(`Zeta/Transfer.lean:126/:151`), never in a computed constant; our own `P1.lean`
deliberately guessed NO closed form in λ (P1-record "Constants … inline at the
endpoints, NO closed form in `lam` guessed"). Corpus-collision NONE stands
(`novelty/iter4-seed-triage.md` row 2; survey §2(c): no other corpus exposes the family).

**Informal side (nearest-miss = Lamzouri + the framework literature):**
- **Lamzouri, arXiv:2609.02882** (v2, 2026-09-08; the donor README's source): abstract
  read — ">2/3 … simple and on the critical line", ≥83.62% distinct, NEW ≥88.76%
  simple-or-on-line, average ≥83.62%; method = "a single Hilbert space inequality" +
  Montgomery pair correlation in the unconditional BGS-TB form. **No test-function
  scaling, no λ-parameter, no dilation content, no parameter-dependent formulas** (the
  paper's constants are frozen endpoints).
- **Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh, arXiv:2306.04799** (Acta Arith.,
  published 2024-04-22; the P1-record's Lemma-5 pair-correlation input): abstract read —
  unconditional Montgomery-type theorem; applications conditional on a thin box
  |β−1/2| < 1/(2 log T) or a zero-density hypothesis. **No test-function-support
  parameterization, no scaling/covariance content.**
- **BGS-TB, arXiv:2501.14545** ("Pair Correlation … I", v3 2026-09-01, under review):
  generalization axis = horizontal distribution + box width b/log T (b = 0.3185 ⇒ 2/3
  simple-and-on-line, conditional). **A different axis entirely; no λ-window scaling
  formulas.**
- **Classical framework status (the honesty core):** support-parameterized test
  functions ARE the standard Montgomery framework (ICM 1974) — narrower-support =
  weaker-hypothesis is folklore, and the change-of-variables behavior of an integral
  functional under dilation of its test function is routine-calculus content every
  practitioner can derive on demand. Nobody publishes it as a lemma because nobody
  needs it as one; the informal λ-family over ALL supports is trivially available
  (nothing stops dilation in the informal world).

### Verdicts (per component; NOVEL / PARTIALLY-COVERED / COVERED)

| component | verdict | one-line reason |
|---|---|---|
| (i) scaled closed form `c_λ = ρ²c₀ + (1−ρ²)Q(0)` | **PARTIALLY-COVERED** | the underlying dilation idea is classical-framework folklore (routine change of variables); the exact identity is stated nowhere checked (corpus no; Lamzouri no; BGS-TB ×2 no) — but as mathematics it is lemma/exercise-grade |
| (ii) `correctedTest` (2λ)² divergence | **PARTIALLY-COVERED** | formally novel-as-stated (no covariance lemma exists in ANY corpus — the P0(b) pin; the de-freezing move's value is real) but mathematically a calculus observation on a definition; externally nobody parameterizes the corrected test at all |
| (iii-a) full-domain `exists_KSAsymptotic_of_pos` | **COVERED** (informally) | the informal family over all supports is trivially available classically; the content is entirely FORMAL (de-freezing the donor's MT-frozen bridge) |
| (iii-b) strict-improvement corollary | **PARTIALLY-COVERED** | unpublished as stated (no parameter formulas anywhere checked); a one-line sign observation (Q ≥ 0, Q ≢ 0 ⇒ Q(0) < pairMainTerm Q); the improvement DIRECTION may be implicit in the classical optimization folklore — A3 §1.4(b)'s open flag stays open, though abstract-level evidence is uniformly negative |

**Caveat (honest limitation):** abstract-level reads for the three papers above (the two
BGS-TB papers develop their test-function machinery internally; full texts not swept for
a λ-window lemma inside those sections). A full-text pass is warranted ONLY if the
orchestrator still wants [DECISION-2] Option B/C after this battery — say so and it runs
(one lane-hour, no Modal).

### Consequences for [DECISION-2] (one line each — A6 informs, orchestrator decides)

- **Option A (pure technical record): battery-consistent DEFAULT.** Every component
  grades below the S1 bar as informal mathematics (folklore-change-of-variables +
  calculus observation + corollary-grade sign argument); the port's genuine value is
  formal de-freezing infrastructure — exactly Option A's billing. This battery also
  CLOSES the G7-retarget ZZV2 residual (`a2-g7-token-inventory.md:65`: "Lamzouri
  must-cite framing exists but the formal battery does not" — it now does, here).
- **Option B (discovery-billed covariance layer): NOT SUPPORTED.** S1 fails on all
  three components — nearest-miss is Lamzouri's own framework + classical folklore,
  and R2's bar says corollary-level lemmas never pass S1; firing B would repeat the
  Cycle-2 "discovery headline on donor content" failure mode the iteration-4 bar was
  raised to prevent.
- **Option C (split: record + conditional corollary slot): condition (ii) evaluates
  FALSE on this battery.** The only piece with any statement-level novelty is
  (iii-b), graded corollary-grade with an unresolved folklore-direction flag; if the
  orchestrator still wants the C slot held, it should be held at R2-strength
  re-review-at-landing (fire only if that re-review — with the optional full-text
  pass — upgrades (iii-b) above S1), and NOT pre-chartered as article-shaped.

### CORRECTION — 2026-11-18 (post-ruling; A3's staging amendment, relayed same day)

**Component (ii)'s premise is AMENDED — the (2λ)² coefficient-divergence claim is
WRONG.** A3's staging found the pairWeight cancellation `4/(4−z²)` family-independent
(at `z = rescaledDiff`, `π²z²/log²T = −(ρ−ρ′)²/4` exactly, cancelling for κ = 1
regardless of kernel family), so **`correctedTestLam` keeps the donor's
`1/(4 log²T)` coefficient VERBATIM — there is no definition-level divergence.** The
dated amendment lands in the η-port precharter via H; this battery folds it.

- **Verdict update (component ii): PARTIALLY-COVERED → COVERED.** With no divergence,
  the "scaled corrected test" is a pure re-instantiation of the donor's definition at
  the scaled family — arguably WEAKER as novelty than the battery's original grading
  (the original "formally novel-as-stated" credit is retracted with the premise).
  Still not S1-passing — now a fortiori.
- The battery's other components are unaffected: (i) the scaled closed form remains
  the port's one covariance-identity lemma (PARTIALLY-COVERED, exercise-grade);
  (iii-a)/(iii-b) unchanged.
- **DECISION-2 (RULED 2026-11-18: Option A) is UNAFFECTED — indeed STRENGTHENED**: the
  port is now even more clearly re-instantiation infrastructure over the donor's
  frozen machinery, reinforcing record-billing; the port's honest cost note is also
  slightly friendlier (the correctedTest transcription simplifies — donor form
  verbatim), though the 14-lemma private-chain re-proof cost stands unchanged.



| # | decision | options / determining input |
|---|---|---|
| 0 | typeset timing vs the close act (five in-flight units) | before (conditional wording) / after (resolved) — recommend (input) after |
| 1 | the N=1 quota occupant | FB-2 / FB-4 / η-port-Option-C corollary / unspent; default spend-only-if-executed; after round-5 + wave-1 landings |
| 2 | η-port billing | A3's §5 Options A / B / C; determining input = the round-5 battery ([DECISION-5]) |
| 3 | quota mechanics | confirm: the cap is per-cycle (fresh N=1 in iteration 5; iter-4's unspent status is not a carry-over) AND FB-2 / FB-4 / the Option-C corollary compete for the SAME single slot (draft reading per `RESEARCH.md:89–92` + R2's FB re-grades) |
| 4 | 41's (H) phase | own slot+milestone budget vs wave-tail conditional (preflight's two-phase scope) |
| 5 | round-5 novelty battery timing | iteration-5 first act vs pre-close; determines [DECISION-2]; carries the residual batteries + the (H)-phase novelty check |
| 6 | bench conversions | 12-P0 and/or 11-M3 to chartered slots vs drain-activation rule (audit: both coherent as-is; 12-P0 is the cheaper conversion) |

## §6 DECISION-slot register (the asks, consolidated — all orchestrator)

| # | decision | options / determining input |
|---|---|---|
| 0 | typeset timing vs the close act (five in-flight units) | before (conditional wording) / after (resolved) — recommend (input) after |
| 1 | the N=1 quota occupant | FB-2 / FB-4 / η-port-Option-C corollary / unspent; default spend-only-if-executed; after round-5 + wave-1 landings |
| 2 | η-port billing | **RULED 2026-11-18 (orchestrator): Option A — record-billed, quota-free.** Per the §round-5-battery consequence line, verbatim: "**Option A (pure technical record): battery-consistent DEFAULT.** Every component grades below the S1 bar as informal mathematics (folklore-change-of-variables + calculus observation + corollary-grade sign argument); the port's genuine value is formal de-freezing infrastructure — exactly Option A's billing. This battery also CLOSES the G7-retarget ZZV2 residual (`a2-g7-token-inventory.md:65`: 'Lamzouri must-cite framing exists but the formal battery does not' — it now does, here)." Options B (unsupported) and C (condition (ii) false) stand rejected by the same battery |
| 3 | quota mechanics | confirm: the cap is per-cycle (fresh N=1 in iteration 5; iter-4's unspent status is not a carry-over) AND FB-2 / FB-4 / the Option-C corollary compete for the SAME single slot (draft reading per `RESEARCH.md:89–92` + R2's FB re-grades) — **note post-ruling: the η-port Option-C competitor is OUT (DECISION-2 = A), the slot contest is now FB-2 vs FB-4 vs unspent** |
| 4 | 41's (H) phase | own slot+milestone budget vs wave-tail conditional (preflight's two-phase scope) |
| 5 | round-5 novelty battery timing | **RESOLVED-BY-BATTERY 2026-11-18 for the η-port scope**: the determining input is delivered (§round-5-battery) and consumed by the DECISION-2 ruling. Still open, unaffected: the AL-3D sub-item residual + the canonical `novelty/round-5*` record + the optional BGS-TB/Lamzouri full-text pass (now warranted only if a future consumer challenges the ruling) |
| 6 | bench conversions | 12-P0 and/or 11-M3 to chartered slots vs drain-activation rule (audit: both coherent as-is; 12-P0 is the cheaper conversion) |

## §7 Files (cross-references for the typeset pass)

Payloads: `qa/iter4-review/a6-iter5-charter-candidate.md` (ranked leads + audits + §5a
NS-1 sweep), `qa/iter4-review/a6-41-p0-precharter.md` (Lead 2),
`pilots/zzv2-lam/eta-port-precharter.md` (Lead 3). Erratum stamped this session
(worktree copy, uncommitted for H): `candidates/41-q-deformed-eight-square-temperley-lieb.md`
(the two G_q display errata, dated block, prose untouched). **§round-5-battery appended
2026-11-18 (re-task): the η-port discovery-layer battery — verdicts per component
(closed form PARTIALLY-COVERED / divergence PARTIALLY-COVERED / full-domain COVERED-
informally / strict-improvement corollary PARTIALLY-COVERED), citations = Lamzouri
arXiv:2609.02882 v2 + BGS-TB arXiv:2306.04799 + arXiv:2501.14545 (abstract-level) +
corpus greps; consequence lines for [DECISION-2] A/B/C in the battery §.**

— lane A6 (worktree agent-07), 2026-11-18. Drafted against main @ `a117762`; battery
pass 2026-11-18 (same session).
