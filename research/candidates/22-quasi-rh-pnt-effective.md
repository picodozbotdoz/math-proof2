# Candidate 22 — quasi-rh-pnt-effective

Owner: lane R5 (ant-bridge). Realizes `research/bridges/analytic-nt.md` §4 E3.
Created 2026-11-09.

> **CLASSICAL STATEMENT — ecosystem/pilot candidate, NOT novel mathematics.**
> Every statement in this dossier is classical (Hadamard–de la Vallée Poussin
> 1896; the quasi-RH deduction is textbook; formalization history: the
> Isabelle AFP has PNT entries — see
> Novelty). Under the charter's discovery-first rule this candidate must be
> triaged in the **ecosystem/pilot category**, not as a discovery: its value
> is (i) the first Prime Number Theorem in mathlib (none exists today,
> [VERIFIED] below), (ii) converting mathlib's only zero-consumer-free
> Tauberian theorem (`WienerIkehara.tendsto_sum_div` has no consumers) into a
> consumer, (iii) gluing all four corpora in one kernel-checked theorem in
> Tier 2. It is proposed as the **pilot vehicle** for the NT cluster: every
> donor interface it exercises (toolchain port, donor-citation discipline,
> Modal check loop) is one the discovery candidates (20, 21) also need.

## Name

quasi-rh-pnt-effective

## One-line pitch

mathlib contains every ingredient of the PNT — ψ upper bound, Λ-Dirichlet
series = −ζ′/ζ, ζ zero-free on Re s ≥ 1, Wiener–Ikehara, θ/ψ/π dictionary —
but nobody has assembled them; assembling them gives mathlib its first PNT
(ψ(x) ~ x), and adding openai-math's quasi-RH zero-free band (Re > 7/8) plus
zeta23's growth lemmas and tauceti's Perron machinery gives the effective
form ψ(x) = x + O(x^{7/8+ε}) — classical statements, zero formal presence.

## Precise mathematical statement

**Tier 1 (asymptotic; mathlib-only glue).**
With `Chebyshev.psi` (`Mathlib/NumberTheory/Chebyshev.lean`, `psi_eq_sum_Icc
:93`) and `π` = `Nat.primeCounting`:

  (T1a) `Tendsto (fun x ↦ Chebyshev.psi x / x) atTop (𝓝 1)`.
  (T1b) `Tendsto (fun x ↦ (Nat.primeCounting ⌊x⌋₊ : ℝ) * Real.log x / x)
        atTop (𝓝 1)`   (π(x) ~ x/log x).

**Tier 2 (effective; three-corpus glue).**

  (T2a, from openai's quasi-RH band) ∀ ε > 0, ∃ C_ε, ∀ x ≥ 2:
        |Chebyshev.psi x − x| ≤ C_ε · x^(7/8 + ε),
  from `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`
  (`lean/ComparatorChallenges/QuasiRiemannHypothesis.lean:7`).
  (T2b, stronger classical variant, from openai's classical region)
        |Chebyshev.psi x − x| ≤ C · x · Real.exp (−c * Real.sqrt (Real.log x))
  for some absolute c, C > 0, from `regularizedZeta_zero_free_region`
  (`OAI/NumberTheory/Ostmann/ZeroDensity/ZetaZeroFreeRegion.lean:43`:
  ∃ c ∈ (0, 1/4], every zero ρ of the regularized zeta satisfies
  1 − ρ.re ≥ c/(log(|ρ.im|+2)+1)).

All constants inexplicit (∃-form), matching the corpus presentations.

## Novelty check

**As mathematics: NONE claimed — the label at top is part of the dossier.**
What is verified absent is the *formal presence*:

- **mathlib** (`ff2494ea`, 2026-11-09): no PNT asymptotic anywhere.
  `rg -n 'tendsto' Mathlib/NumberTheory/PrimeCounting.lean` → only
  `tendsto_primeCounting`/`'` (`:98,102` = divergence of π, not the
  asymptotic); `rg -rn 'psi.*atTop|primeNumberTheorem' Mathlib/` → 0
  asymptotic statements; `Chebyshev.lean` stops at two-sided Chebyshev
  bounds (`psi_le_const_mul_self :485`, `psi_ge :510`) and the
  ψ/θ/π integral identities (`primeCounting_eq_theta_div_log_add_integral
  :668`); `WienerIkehara.lean`'s `tendsto_sum_range_div/tendsto_sum_div`
  (`:693,:700`) have **zero consumers** (`rg -rln 'WienerIkehara'
  Mathlib/` → the file itself). [VERIFIED]
- **anthropics/zeta23**: has PNT-grade inputs (Chebyshev–Mertens `Zeta23.Cheb.
  chebyshevMertens`; the `FromPNTPlus/` port) but no ψ-asymptotic statement
  (`rg -rn 'psi' Zeta23/` → no Chebyshev-ψ-asymptotic theorem — ψ occurs only
  in one comment mention ("Mathlib's Chebyshev.psi indexing", `Hypotheses.lean:80`)
  and as the unrelated `Taper.psi` taper profile; the engine consumes the
  moment bounds only). [erratum 2026-11-09, H/QA: v1 said "ψ never appears",
  which the comment mention contradicts; the substantive absence — no
  ψ(x) ~ x statement — holds.]
- **openai-math**: no ψ/PNT statement over Mathlib's ψ; their Ostmann tree
  has `PrincipalSmoothingPNT.lean`, `ProgressionPrincipalPNT.lean`
  (PNT-shaped inputs for the sieve, in their internal API) and
  `regularizedZeta` — different function, different statement; the
  quasi-RH preprint's "later applications are not included"
  (`lean/docs/003.md`: "The paper's later applications are not included").
  [VERIFIED]
- **tauceti**: has the number-field analogue but for Frobenius-ψ:
  `frobeniusPsi_asymptotic` (`Chebotarev/PrimeCounting/Chebotarev.lean:210`)
  — K = ℚ principal class gives a ψ-PNT for prime ideals, NOT for mathlib's
  `Chebyshev.psi` over ℕ, and via their own Wiener–Ikehara, not mathlib's.
  [VERIFIED — this is simultaneously the nearest formal miss and a
  proof-template donor]

Literature / formalization status: `[R8 confirmation pending — round 2]`.
Queued queries: Isabelle AFP `Prime_Number_Theorem` / Avigad–Eberl entries
(R8 round-1 method: GitHub mirror `isabelle-prover/mirror-afp-devel` git-trees
scan; expect AFP `Prime_Distribution_Elementary` / `PrimeNumberTheorem` to
already contain ψ(x) ~ x and possibly effective versions — this dossier
claims no first-ever formalization, only first-in-mathlib/first-in-this-
corpus-family); classical refs for T2: Titchmarsh §3 (de la Vallée Poussin
error), IK04 Thm 5.10 family; for T2a's shape from a fixed zero-free band:
textbook Perron-shift argument.

## Bridge analysis

- Corpora bridged: Tier 1 is mathlib-internal assembly (the "empty zone" is
  mathlib's own unconsumed-Tauberian gap, bridges/analytic-nt.md §0).
  Tier 2 is a genuine four-corpus bridge: openai-math (zero-free input),
  zeta23 (ζ growth + log-derivative bounds), tauceti (Perron formula),
  mathlib (ψ/ζ/Λ API and the target statements).
- Essentiality: Tier 1 needs only mathlib — its "bridge" is internal
  completeness (the nearest-miss triangle: nonvanishing exists,
  Tauberian exists, series-identification exists, assembly missing).
  Tier 2 is essential-bridge: no single corpus has both a zero-free region
  for ζ *and* the contour/Perron machinery *and* the ψ target API.
- Empty-zone fit: `research/bridges/analytic-nt.md` §4 E3 verbatim.

## Proof-strategy sketch

**Tier 1 (routine end-to-end; the genuine pilot).**
1. Set f := fun n ↦ (Λ n : ℝ) (`ArithmeticFunction.ln`, `Λ` notation;
   `vonMangoldt_nonneg` (`ArithmeticFunction/VonMangoldt.lean:81`) gives
   `hpos : 0 ≤ f` for `WienerIkehara`'s fourth
   hypothesis, `LSeries/WienerIkehara.lean:107`).
2. `bound` hypothesis (`:105`, `∀ n, ∑ i ∈ range n, f i ≤ C·n`): transport
   `Chebyshev.psi_le_const_mul_self` (`Chebyshev.lean:485`, ψ x ≤ (log 4+4)x)
   across the ψ/partial-sum index change (`psi_eq_sum_Icc :93`). [Routine.]
3. `hG'` agreement (`:107`, `LSeries ↗f s − A/(s−1) = G s` on Re s > 1):
   `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`
   (`LSeries/Dirichlet.lean:439`: L↗Λ s = −ζ′(s)/ζ(s)) with A := 1 — the
   residue is forced by `riemannZeta_residue_one`
   (`LSeries/RiemannZeta.lean:242`: (s−1)·ζ(s) → 1). [Routine.]
4. `hG` continuity on Re ≥ 1 (`:106`): G := −ζ′/ζ − 1/(s−1) is continuous on
   {Re ≥ 1}: ζ is differentiable off 1 (`differentiableAt_riemannZeta`,
   `RiemannZeta.lean:139`), nonvanishing on the closed half-plane
   (`riemannZeta_ne_zero_of_one_le_re`, `Nonvanishing.lean:417` — the
   Hadamard–de la Vallée Poussin input), and the pole subtraction is
   continuous at 1 by step 3's residue. [Routine but the one place analysis
   care is needed: two limit processes at s = 1.]
5. Apply `WienerIkehara.tendsto_sum_range_div` (`:693`) → (T1a).
6. (T1b): ψ/θ swap via `psi_sub_theta_le` (`Chebyshev.lean:526`,
   ψ − θ ≤ 2√x·log x = o(x)), then the θ/π dictionary
   `theta_eq_primeCounting_mul_log_sub_integral` (`:705`). [Routine.]

**Tier 2 (the analytic work; hardest steps flagged).**
7. Perron truncation for −ζ′/ζ with f = Λ: tauceti's
   `truncatedPerron_LSeries` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/
   Perron/Formula.lean:130`) + `norm_truncatedPerron_LSeries_sub_sum_le`
   (`:229`) — or zeta23's contour machinery (`Zeta23/WeilEF/Contour.lean`)
   as the alternative; the log-derivative on the critical contour is
   controlled by zeta23's `zeta_logDeriv_partial_fraction`
   (`WeilEF/Landau.lean:512`) + `logDeriv_partial_fraction_unit/disk`
   (`:299,:348`). [HARDEST STEP for T2b: the classical Borel–Carathéodory
   bootstrap from the zero-free region to a −ζ′/ζ bound on the shifted line
   is the part no corpus has in Lean; zeta23's `RvM/ZetaGrowth.lean`
   (`zeta_growth :102`, `zeta_growth_right_at :119` [erratum 2026-11-09, H/QA:
   v1 cited "zeta_growth_right :143"; the decl is `zeta_growth_right_at` at
   :119]) is the ζ-side donor,
   openai's `DirichletLogDerivativeBound.lean`/`ZetaZeroFreeLogDerivative.
   lean` (Ostmann/ZeroDensity) the log-derivative-side donor — both need
   porting to the other's function presentation.]
8. Shift the Perron contour to Re s = 7/8 + ε (T2a: openai's
   `riemannZeta_ne_zero_of_seven_eighths_lt_re`) resp. to
   Re s = 1 − c/(2 log T) (T2b: `regularizedZeta_zero_free_region`); collect
   residues (pole at 1 gives x; zero terms are absent/controlled);
   optimize T against the truncation error. [Standard, long.]
9. Identify openai's presentation with mathlib's ζ where needed
   (`regularizedZeta` vs `riemannZeta`: openai-internal bridge —
   `RegularizedZeta.lean`; flagged as API-mismatch risk in F5).

**Hardest step**: step 7's log-derivative bootstrap (T2b); T2a avoids the
classical region's subtlety but still needs polynomial ζ bounds on
Re = 7/8+ε, which follow from `zeta_growth` after porting.

## Feasibility

F0. Target: (T1a), (T1b); then (T2a)/(T2b) as separate milestones.

F1. Mathlib entry points [VERIFIED this session + R9 probe]:
   - `Chebyshev.psi/theta` (`NumberTheory/Chebyshev.lean`: `psi_eq_sum_Icc
     :93`, `psi_le_const_mul_self :485`, `psi_sub_theta_le :526`,
     `primeCounting_eq_theta_div_log_add_integral :668`,
     `theta_eq_primeCounting_mul_log_sub_integral :705`);
   - `ArithmeticFunction.ln` (= Λ; `ArithmeticFunction/VonMangoldt.lean`,
     notation `Λ`, `vonMangoldt_nonneg :81`);
   - `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`
     (`NumberTheory/LSeries/Dirichlet.lean:439`);
   - `riemannZeta_ne_zero_of_one_le_re`
     (`NumberTheory/LSeries/Nonvanishing.lean:417`);
   - `riemannZeta_residue_one` (`NumberTheory/LSeries/RiemannZeta.lean:242`);
   - `WienerIkehara.tendsto_sum_range_div` / `tendsto_sum_div`
     (`NumberTheory/LSeries/WienerIkehara.lean:693,:700`; hypotheses
     `bound/hG/hG'/hpos` at `:105–107`) — port-probe §2 confirmed the
     namespace and full signature (probe A, "OK*").

F2. Donor lemmas:
   - openai-math: `riemannZeta_ne_zero_of_seven_eighths_lt_re`
     (`lean/ComparatorChallenges/QuasiRiemannHypothesis.lean:7`);
     `regularizedZeta_zero_free_region` (`OAI/NumberTheory/Ostmann/
     ZeroDensity/ZetaZeroFreeRegion.lean:43`); log-derivative donor files
     (`Ostmann/ZeroDensity/{DirichletLogDerivativeBound,ZetaZeroFreeLog-
     Derivative}.lean`). Toolchain v4.34.1 + its own Mathlib pin.
   - zeta23: `Zeta23/RvM/ZetaGrowth.lean` (`zeta_growth :102`,
     `zeta_growth_quarter :109`, `zeta_growth_right_at :119`);
     `Zeta23/WeilEF/Landau.lean:512 zeta_logDeriv_partial_fraction`
     (+`:299,:348`). Toolchain v4.33.0-rc2, Mathlib `51e6992e`.
   - tauceti: `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/
     Formula.lean:130 truncatedPerron_LSeries`, `:229`; the K = ℚ
     specialization pattern of `frobeniusPsi_asymptotic`
     (`NumberTheory/Chebotarev/PrimeCounting/Chebotarev.lean:210`) as the
     whole-proof template. Toolchain v4.36.0-rc2 (same as workspace).

F3. Missing glue:
   a. definitional: ψ partial-sum ↔ `∑ i ∈ range n, Λ i` index bridge (S);
      openai `regularizedZeta` ↔ `riemannZeta` agreement on the region used
      (S–M; their internal files provide the identity to restate);
   b. genuinely absent: the −ζ′/ζ contour bound on Re = 7/8 + ε resp. the
      Borel–Carathéodory bootstrap (T2's driver, M–L of real analysis);
   c. porting debt: zeta23 growth lemmas carry no hypotheses (pure) — port
      S–M each; openai's zero-free theorems are comparator-shaped (trusted
      statements + their proof tree in `OAI/NumberTheory/DirichletL/Hecke/`,
      `Ostmann/`) — statement-level port S, proof not needed if cited as
      donor axiom-free imports after porting.

F4. Effort: Tier 1 = **S–M** (~1–2k LoC; all API present; the pilot);
   Tier 2a = **L** (~5–10k: Perron + porting + bootstrap);
   Tier 2b = **L** (the classical bootstrap is the deep part).

F5. Risk factors:
   - **upstream race** [VERIFIED via R8 round-1]: mathlib has in-flight
     Mertens/PNT PRs (#41394, #44062, #43238) — Tier 1 may be landed
     upstream before this project finishes it; value then collapses to
     Tier 2 (which upstream will not have). This is the main argument for
     Tier-1-as-pilot NOW and Tier-2 as the real content;
   - API mismatch: two ζ presentations (mathlib `riemannZeta` vs openai
     `regularizedZeta`), two ψ presentations (mathlib ℕ-indexed vs tauceti
     prime-ideal-indexed) — keep targets in mathlib's objects;
   - the Wiener–Ikehara hypothesis `hG` requires continuity exactly ON
     Re s = 1 (not a punctured neighborhood) — the classical subtlety,
     step 4;
   - churn: all touched mathlib files are 2026-fresh.

F6. Verification plan: kernel-only, no sorry/native_decide/external CAS;
   Modal loop per `math-proof1/AGENTS.md` once this repo has lake
   scaffolding (AGENTS.md convention: mirror math-proof1's
   `lean_build.py`/`lean_check.py`).

Toolchain split note: target workspace = v4.36.0-rc2 (`ff2494ea`); zeta23
(v4.33.0-rc2) and openai-math (v4.34.1) donors must be ported — R9's
round-2 port-probe (`research/feasibility/port-probe.md`, DONE 2026-11-09)
showed donor statements elaborate against v4.36 with zero errors and the
consumer API (`WienerIkehara.tendsto_sum_div`, `riemannZeta`, `analyticOrderAt`)
probes OK; proof re-fixing is the cost center (probe §3 caveat). The task
brief's "port-probe pending" is outdated — the probe has landed.

## Significance

Not mathematical novelty (by construction of the label) but: mathlib's first
PNT, the first consumer of its Wiener–Ikehara, and — in Tier 2 — the
reference implementation of the "zero-free input → effective prime count"
pipeline that candidates 20 (RvM/Backlund transfers) and 21 (nothing) and
the uniform-in-q programme (bridges §4 E4) all reuse. As pilot: it exercises
cross-corpus porting at S–M scale before any L-scale discovery candidate
commits, with a theorem everyone in the cluster cites.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (R5, non-binding)**: triage in the ecosystem/pilot category
per the charter: Novelty 1 (classical; formal-first-in-mathlib only),
Significance 4 (unlocks/consumes the Tauberian layer; pilot vehicle for the
cluster), Effort 2 for Tier 1 (S–M) → rank 2.0 if scored by the standard
rule — which understates pilot value; recommend an explicit pilot-category
slot in Phase 4 rather than the rank formula. If Phase 4 keeps the formula
only: rank 2.0, Tier 2 separately as L-effort follow-on (Novelty 1,
Significance 4, Effort 5 → 0.8).

## F4 grade by lane R9

2026-11-09, round 5. Evidence: pilot 22 artifacts read this session; Modal port-probe
runs 1–6 (`research/feasibility/port-probe.md`).

- **Grade: S for the Tier-1 remainder — upgraded from the dossier's implicit posture by
  pilot evidence.** `research/pilots/22/M1.lean` is a **complete kernel proof** (header:
  "milestone M1 PROOF … Full proof, no `sorry`, no `axiom`, no `native_decide`"; zero
  sorries in file; `run4.log`: `M1.lean: OK`, `ProbeP1_PNT.lean: OK` on the crossmath-probe
  Modal infra) — the pilot pattern (R3) is proven green end-to-end.
- **F1 confirmations by probe**: `WienerIkehara.tendsto_sum_div/_range_div` full signatures
  captured (runs 1–2, probe A2 — the dossier's line numbers :693/:700 confirmed);
  `riemannZeta_ne_zero_of_one_le_re`-side surface (`Nonvanishing`) intact; the OAI
  quasi-RH statement itself elaborates standalone against v4.36 (`ProbeC1_OAI_QuasiRH.lean`,
  run 3: 0 errors) — so the T1 hypothesis-binder route (dossier 50's mitigation) is
  validated for this dossier too.
- **Remaining cost for T1a/T1b**: effective-error-term assembly over the pilot's green M1 +
  Chebyshev API — statement-side ≈ 0 (all surfaces probe-verified), proof-side S-scale
  calculus bookkeeping. T2a/T2b unchanged (separate milestones, donor-side Ostmann closure
  2924 files/486k LoC if imported — binder posture avoids it).
- Verdict: Tier-1 remainder S; the dossier's toolchain concern (OAI v4.34.1) is discharged
  by ProbeC1 + the binder pattern (ProbeE).

## Pilot outcome (appended by R3, 2026-11-09 — execution record; sections above are R5's, untouched)

**Status: PROVED-TO-M4** — mathlib's first PNT (ψ-form, = Tier-1a of this dossier), sorry-free,
kernel-only, at mathlib `ff2494ea` / v4.36.0-rc2.

- **M1** `CrossMath.Pilot22.exists_tendsto_riemannZeta_sub_inv` (`research/pilots/22/M1.lean`) —
  the Laurent constant of ζ at 1 exists. **M2** `exists_logDerivExtension`,
  **M3** `exists_range_sum_vonMangoldt_le`, **M4** `tendsto_psi_div_atTop`
  (= `(T1a)` verbatim, `research/pilots/22/Tier1.lean`). All four: `#print axioms` =
  `[propext, Classical.choice, Quot.sound]`, 0 sorry-warnings. M4 consumes
  `WienerIkehara.tendsto_sum_range_div` (:693) — **Wiener–Ikehara's first consumer** — via M2 +
  `LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (Dirichlet.lean:439) + M3.
- **Evidence trail**: `research/pilots/22/run1..12.log` (Modal app `crossmath-probe`), per-run
  error anatomy in `research/pilots/22-blueprint.md` §7 (M1) and §8 (M2–M4), status line §9.
- **Tier 2**: `stmt_Tier2` (T2a shape: ∀ε>0, ∃C, ∀x≥2, |ψ x − x| ≤ C·x^(7/8+ε)) elaborates green
  in Tier1.lean — statement-only record; inputs per §F2 (openai quasi-RH band, tauceti Perron).
- **M5 (θ/x→1) / M6 (π·log x/x→1) skipped** by coordinator instruction (upstream race: PNTAnd
  in-tree depth + converging PRs — see §F5 and blueprint §8's stop rationale). Resume kit
  (exact lemmas, all in `Mathlib/NumberTheory/Chebyshev.lean` unless noted): M5 from M4 +
  `isBigO_psi_sub_theta_sqrt` :639 (alt `psi_sub_theta_le` :526) + `Real.tendsto_sqrt_atTop`
  (Analysis/Real/Sqrt.lean:139); M6 from M5 + `primeCounting_eq_theta_div_log_add_integral`
  :668 + `integral_theta_div_log_sq_isBigO` :791 (alt `theta_eq_primeCounting_mul_log_sub_
  integral` :705); transport: `tendsto_nat_floor_div_atTop` (SpecificLimits/Basic.lean:738),
  `tendsto_nat_floor_atTop` (:703), `tendsto_add_atTop_nat` (AtTopBot/Basic.lean:340).
- **Effort settled empirically: S** — 358 new LoC total (68 + 290), 51 min wall over 12 Modal
  runs, no milestone blocked (worst: M2 at 6 fix-cycles). Confirms this dossier's F4 Tier-1
  estimate at its S end; the E2 (500–1.5k) band was not needed.
- **Lane proposal: unchanged** (R5's §Lane-proposal — Novelty 1, Significance 4, Effort 2 →
  rank 2.0, explicit pilot-category slot), now upgraded to **proof-of-record** status: the
  pilot category has its first completed member, with the empirical effort data point (S/<500
  LoC) recorded for Phase-4 calibration.
