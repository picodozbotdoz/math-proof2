# Pilot 74 / P2 precharter (lane A8, 2026-11-18) — iter-5 front-load, paperwork only (NO runs)

Basis: P1 **GREEN** (2026-11-18, `74-P1-record.md`; 7/7 theorems triad-only, 770 LoC,
sha `6ddbda11d5da4f35`) + the dossier §Iteration-4 amendment's status lines, which name
P2 as the remaining door: **sharp constants + class-level tightness** (both deliberately
descoped from P1 as shape-(i)/limit-argument classes). This precharter typesets the P2
statement set, binder inventory, runner plan, budget, and gates — copy-paste-ready for
the iter-5 charter. No Modal was touched for this document.

## (a) Statement set at the corrected-statement basis

All statements build on P1's GREEN defs (`IsSpectrum`, `dev`, `varK`, `massTail`, `W`,
`Mdev`, `mgfBound`, `subG`, `InSubGClass`, `datum`, `CertValid`, `Bk`, `padA`) — no
definitional changes except one (P2-c's class-indexed ceiling, the Q1 shape-(i) object).

**P2-a — sharp variance constant, window-free (the limit-argument upgrade of `t1b`).**
`theorem mgfBound_var_sharp {p : ι → ℝ} (hp : IsSpectrum p) {v δ : ℝ} (hv : 0 ≤ v)
    (hδ : 0 < δ) (h : mgfBound p v δ) : varK p ≤ 2 * v`
— i.e. the dossier T1(b)'s original `Var ≤ 2σ²`, now provable from the CENTERED bound
(FIND #2's form) on ANY positive window: the limit argument takes u → 0 inside the
window. Contrast P1's explicit window-edge `t1b` constant `32(e^{1/4}−1)σ² ≈ 9.06σ²` —
P2-a's `2σ²` is the sharp MarginalTails-grade constant (a 4.5× improvement, and the
dossier's [HYPOTHESIS] constant exactly). Two routes, in preference order:
1. **Deriv route (preferred):** `g u := ∑ i ∈ supp p, p i * Real.exp (u * dev p i)`;
   `HasDerivAt` termwise (Mathlib `HasDerivAt.sum`, exp-of-linear), `g 0 = 1` (via
   `supp_sum_eq_one`), `g' 0 = ∑ p·dev = 0` (centered — new lemma `sum_p_dev_eq_zero`,
   ~15 LoC from `supp_sum_K_eq_S`-style), `g'' 0 = 2·Var` (via `varK_eq`). From
   `h : g u ≤ exp (v u²)` with equality and equal (zero) first derivatives at 0, the
   local-minimum-at-critical-point inequality gives `2v − g'' 0 ≥ 0`. API risk: the
   "interior local min ⟹ second deriv ≥ 0" lemma — check `IsLocalMin`/`IsMinOn` +
   second-derivative API on-pin at core-prep; fallback route 2.
2. **Pair-ε route (fallback, no deriv):** the even-function displacement:
   `(g u + g (−u) − 2)/u² ≤ (2·e^{v u²} − 2)/u²` for `0 < u ≤ δ` (P1's `exp_pair_bound`
   machinery, reversed locally: `e^x + e^{−x} − 2 ≤ (1+η(δ))·x²` on `|x| ≤ δ`, η explicit),
   then squeeze — yields `Var ≤ 2v(1+η(δ))`: an explicit-η upgrade, NOT the sharp 2v;
   honest billing as such.

**P2-b — MarginalTails sharp class constants (T1c upgrade; pure instantiation).**
`theorem t1c_sharp {p : ι → ℝ} (hp : IsSpectrum p) {θ B : ℝ} (hθ : 0 < θ) (hB : 1 ≤ B)
    (hC : InSubGClass p θ B) : varK p ≤ 1024 * Real.exp 1 * θ * B`
— P2-a at `v := 512·e·θ·B` (the class window `1/(32√((1+θ)B)) > 0` suffices; the
window-freeness of P2-a is what makes the instantiation total — no σ-window matching
needed, the P1 `t1b`→`t1c` gymnastics disappear). The window clause of `t1c` stays as
P1 proved it (already explicit-constant; sharpness of the window constant is NOT
claimed by the dossier and is not a P2 deliverable). ~20 LoC on top of P2-a.

**P2-c — class-level tightness, shape (i) (T4's descoped clauses; the genuinely new
mathematics).** Requires the ONE definitional change Q1 reserved: the class-indexed
ceiling `BkClass (F) (k) (𝒞) := sSup {c₀ | ∃ a : Fin k → ℝ, ∀ q, 𝒞 q → c₀ + ∑ j, a j *
datum q k j ≤ F q}` (certificates valid against class members only; `𝒞` the
InSubGClass-family predicate). Statements:
1. `t4_floor_achieved` — the √-floor IS achieved at the class level: with the explicit
   extremal family discharging `hVarLB` (see (b)), `BkClass W_ε 1 𝒞 ≥ √((1−ε)/ε · κB)`
   along the family — the dossier T4's first clause, honest only at shape (i) (FIND #1).
2. `t4_not_littleO` — the o(√B) negation: `¬ (∀ ε ∈ (0,1), W_ε (P B) = O[filter atTop]
   (√B))` on the family — the dossier T4's "no 2-moment certificate can certify
   W_ε = o(√𝓑)"; via the floor + the `Real.not_isLittleO` bookkeeping core-prep
   already scoped (P0's Q1 ruling).
   The extremal-family discharge is the load-bearing new lemma, and the family is the
   **FIND #1 n-atom family** (one heavy atom at `1−δ`, `n` tail atoms at `δ/n`), NOT
   the two-atom spectra core-prep §1 P1-e sketched: a two-point spectrum's
   `Var = δ(1−δ)·log²((1−δ)/δ)` is BOUNDED (max ≈ 0.55 at δ ≈ e^{−2}), so it cannot
   realize `Var ≥ κB` with κ uniform — the n-atom family with `δ = 1/2, n = e^{√B}`
   gives `Var ≈ B/4` AND `W_{1/2} ≈ const` (the FIND #1 counterexample itself, now
   used constructively). Caveat recorded for G3: the family sits near the class
   boundary (at the window edge `u·dev ≈ 1/(64√(1+θ))` vs MGF budget
   `e^{eθ/2(1+θ)}` → 1 as θ → 0) — class membership is plausible but MARGINAL at
   small θ, which is exactly why G3's 1-run statement probe gates the proof
   investment.

**Mechanical reachability (the 8+1 signature taxonomy dividend).** The P1 completion
closed and DOCUMENTED every API-drift class the dossier ecosystem hits on this pin
(single_le_sum order, sInf/sSup family, sum_mul direction, min'/max' arities,
le_add_of_nonneg swaps, not_le.mp, projection-notation gaps, exp_add directions,
field_simp closure behavior, heartbeat budgeting). Consequence for P2: the only NEW
API surface is the **deriv/limit family** (route 1) and, in P2-c, the
**isLittleO/asymptotics family** — both small, both pre-verifiable read-only in
encore-mathlib@ff2494ea before authoring (the batch-1 lesson: verify-then-fire took
the descent 46→29 in one run; the same pre-verification for ~10–15 deriv-family
signatures is zero-cost). P2-a/P2-b are S-class with that pre-verification; P2-c is
M-class (the exp inequality for class membership + the new def + two theorems).

## (b) Donor / binder inventory (EnclOK naming; hygiene gates per AGENTS.md)

| Binder / donor | Where | Status |
|---|---|---|
| `mgfBound` (FIND #2 centered form) | P2-a/b hypothesis | NOT a donor import — P1's own GREEN def (the MarginalTails lineage stays a header citation, `Statements.lean:482–485`; no build dep) |
| `hVarLB` | P2-c | P1 kept it a binder; P2-c's deliverable is its DISCHARGE by the explicit n-atom extremal family (the FIND #1 family used constructively — see (a) P2-c for why two atoms provably cannot) — the one genuinely new lemma; descoped variant keeps the binder (see (d)) |
| OAI `EntropyMoments.lean` calculus (`logMoment_derivative :128`, `summand_derivative :107`) | route-1 model | citation-only (Liu-1 convention, v4.34.1 DO-NOT-CONSUME); re-proved on our defs |
| Mathlib deriv/asymptotics API | route 1 + P2-c.2 | substrate, not donor; signatures pinned at core-prep (gate G1) |
| tauceti `OperatorJensen` (:64/:124) / physlib HayataGroup wing | row-7 rule 3 | latent — no P2 route uses operator-Jensen (spectral/pair routes only); citations stand as recorded in P1's header, no new obligation |
| physlib sandwiched-Rényi DPI | row-7 rule 2 | latent, unchanged — mandatory only if any P2 restatement phrases m_u as trace functionals (none does) |

No new external donors. The G-series statement-elaboration gate is not triggered
(nothing imported beyond Mathlib).

## (c) Runner plan + budget (from the run 1–5 baseline)

- **Runner:** the `crossmath-pilot-74p1` lineage — `pilots/74/run_p1.py` (full error
  output) + `stage_and_fire.sh` (sha guard), doz CLI `/home/doz/dozenv/bin/modal`,
  image layers warm on `semraker` from the completion series (run 5 wall 30 s proves
  the warm path). SPEC cpu=2.0/mem=4096, LEAN_NUM_THREADS=2, telemetry every run,
  `maxHeartbeats 8000000` carried in-file (the run-3 lesson), no build phase.
- **Budget (r5 sizing from the baseline):** descent 29→10→10→4→0 cost 5 runs for 770
  LoC with ~45 pre-verified signature fixes; per-batch yield ≈ 50–70% error reduction
  when signatures are pre-verified. P2-a+b ≈ 250–350 new LoC on a 770-LoC GREEN base:
  **≤5 runs, expected 3–4** (the deriv family is the only new surface). P2-c ≈ 400–600
  LoC (new def + family construction + exp inequality + two theorems): **≤5 runs,
  expected 4–5**, charter as a SEPARATE milestone so P2-a/b GREEN is bankable
  independently (the ZZV2 hard-STOP pattern).
- **Artifact discipline unchanged:** zero sorry, no native_decide, kernel-only,
  `#print axioms` full-coverage tail on every public theorem, logs with provenance
  headers under `pilots/74/logs/`, sha-guard trail in the record.

## (d) Go/no-go gates + descope options

- **G1 (core-prep, no runs):** pin the deriv/limit + isLittleO API signatures in the
  encore checkout (read-only); decide route 1 vs 2 for P2-a by whether the
  "local min ⟹ f'' ≥ 0" lemma exists on-pin (else route 2's explicit-η statement is
  the honest charter text). GO iff route decidable + all P1 defs re-elaborate (they
  do — GREEN).
- **G2 (P2-a/b pilot, ≤5 runs):** GREEN gate = `mgfBound_var_sharp` + `t1c_sharp`
  triad-only, zero sorry. NO-GO at budget ⇒ record honest residue (the taxonomy
  predicts residue ≤ 5 mechanical classes) — P2-b falls with P2-a (it is pure
  instantiation).
- **G3 (P2-c gate, after G2 GREEN):** the n-atom family's class-membership MGF
  inequality survives a 1-run statement probe (state the inequality as a Prop,
  elaborate on-pin; the marginal-θ caveat above is the known risk) BEFORE the proof
  investment. NO-GO ⇒ descope, in order: (i) full descope of P2-c to
  iter-6 with the family inequality recorded as the open core; (ii) P2-c′ binder
  form — keep `hVarLB` as a binder and prove the class-indexed ceiling + not-littleO
  conditionally (still shape (i), still the Q1 object, honestly binder-billed);
  (iii) minimum viable — `BkClass` def + `BkClass`-monotonicity only (the T2-pattern
  routine lemma), tightness clauses deferred.
- **Standing exclusions (carried from P1):** T3/the LP layer stays UNCHARTED here
  (dossier-02 cost-share); Kuwahara-family wording rules, mathlib-absent phrasing,
  and the physlib must-cite set unchanged.

— lane A8, 2026-11-18. Sources: `74-P1-record.md` (GREEN verdict + frozen 11-17
history); `logs/p1-completion-runs1-5.log` (sha-guard trail, descent, telemetry);
dossier 74 §Iteration-4 amendment; `core-prep.md` §1/§5 (P1-e design, Q1). No Modal
runs in this precharter.
