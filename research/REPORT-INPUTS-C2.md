# REPORT-INPUTS-C2 — Cycle-2 input pack (A9, 2026-11-13; authorized task A9-6, ownership recorded via H)

Model: main-run `research/REPORT-INPUTS.md`. Scope: pure factual inputs for H's REPORT.md
Cycle-2 sections — **no orchestrator conclusions** (ranking, top-picks, and portfolio calls
are the orchestrator's; this pack supplies the lines they cite). Convention: N/S/E given as
**lane-proposed** (from each dossier's § Lane proposal) vs **[incoming A5/A7]**. **UPDATE
2026-11-13 (later same day): A5's PART-2 HAS LANDED** (`research/novelty/VERDICTS.md`
Cycle-2 addendum, rows 70–75 + standing notes 1–4) — the [incoming A5] cells below are
filled with the landed values and citations; **A7's G-probes (G1/G5/G6a/G7) remain open**.
Dossier 73 was filled to TEMPLATE standard after the original pack freeze; its §1 block and
§2 note are updated accordingly. Every line carries its on-disk source. Disk-verified counts
in §4.

## §1 Dossier blocks (finals; owner A9 unless noted)

### 70 — unconditional-zetaK-zero-confinement (`candidates/70-…md`, 469 ln)

- **Headline:** DZDF's Cureton–Thorner theorem on our pin discharges the *weakened* 31/32
  binders, upgrading pilot 50's conditional confinement core to unconditional strips
  [1−θ, θ] (parametric; 31/32 = DZDF instantiation) for ζ (K = ℚ route, three glue lemmas),
  Dirichlet L (only `hFEχ` left), and ζ_K/Hecke for totally complex K (via DZDF's own Hecke
  FE + the Λ↔f transfer); Part B (abelian assembly) split out to dossier 75.
- **Category:** Part A = **ECOSYSTEM/GLUE posture upgrade** (formal-new, math-known — HdV/
  Broughan nearest-miss class); per-class split: no first-claim for ζ/Dirichlet (Liu-1's
  external repo owns that class), ζ_K/Hecke first-claim holds on the Liu-2 clock.
- **Bridge:** DZDF (CT + Hecke FE — the only zero-free input and the only ζ_K FE) × pilot-50
  machinery (proved confinement shells, binder discipline) × mathlib (`riemannZeta_one_sub`,
  identity-theorem layer); no side alone states or proves the strips.
- **Pilot status:** A3 milestone 2 — pilot 50-M2-31/32, spec landed
  (`pilots/50-M2-31-32-spec.md`); **GATED on A7/G1** (DZDF full build; vendor-CFT v4.35
  blocker; fallback = `hDZ` statement-binder, elaboration-validated by bump run 1); external
  full-strength option: Liu-1 repo (A7/G7 pending, STATUS:139).
- **Must-cites:** CT hexagonmath.org/2610.00200 (hexagon-only — never cite arXiv sweeps for
  this cluster) + the DZDF repo; Liu 2610.12234 + github.com/liubaiying101/Slightly-improved-…
  (B_new = 0.8749570 ⊋ 7/8, ζ+Dirichlet, formalized); Liu 2610.26835 v2 (B♭ = 0.8748866,
  uniform every K, informal, Lean in progress); Xu–Sang 2610.15291; Ope26a/b (openai
  preprints 2026-09-30 / 10-05); Trudgian–Zuniga Alterman 2610.16010; Lee 2002.05456;
  Das–Gaba et al 2506.19319; Das–Kadiri–Ng 2508.09480; Broughan 2009 (HdV class);
  A1 §4 H1 + A3 §(a) + round-4 §3/§5.2–5.3 (the corrections this dossier absorbed).
- **N/S/E (proposed):** Part A 2 / 3 / 1–2 (rank ≈ 3–4); Part B (now 75) 3–4 / 4 / 2–3.
  **[A5 LANDED:** "artifact-grade (no discovery N)"; per-class split holds — ζ_K-strip "OURS", ζ/Dirichlet at 7/8-or-better "CONCURRENT (openai tree proves 7/8 ζ/Dirichlet NOW — `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19/:29`, liu1-as-donor §4; Liu-1 repo formalizes 34999/40000)"; tier HOT-cluster / WARM-artifact. VERDICTS C2 row 70. **A7 G1/G7 open.]**

### 71 — function-field-splane-dictionary (`candidates/71-…md`, 276 ln; renamed from
`71-function-field-simple-zero-proportions.md` — slug discipline note in-file)

- **Headline:** the first formal s-plane zeta of a curve — ζ_C(s) := Z_C(q^{−s}) meromorphic
  (poles exactly {0,…,d}), every nontrivial zero *exactly* on Re s = 1/2 (the function-field
  quasi-RH with window 1/2, stated in the DZDF shape), uniform Hasse–Weil point-count
  transport, and the anti-CT window-comparison corollary (step-function zero density at
  1/2 vs the number side's 31/32) — the dictionary every other FF zone consumes.
- **Category:** primary = **GLUE/formalization-first** (math classical: Weil 1948, Hasse,
  Silverman V.2.4); secondary (FF-EZ2-family Lamzouri constants for an FF family via ZZV2's
  multiset inequalities) = **DISCOVERY-grade [HYPOTHESIS]**, effort L, flagged not-pilot.
- **Bridge:** Weil (only source of rationality + eigenvalue-modulus + base change) × mathlib
  (the s-plane/meromorphic layer — exists nowhere else) × DZDF (statement shape + comparison
  conjunct); ZZV2 (multiset inequalities, mathlib-only challenge layer) for the secondary.
- **Pilot status:** prework LANDED — `pilots/71-prework.md` (lane A2, 380 ln): **GO, zero
  import gates** (Tier-C binder posture — Weil's statements transcribed as hypothesis
  binders, hQRH/EnclOK precedent; G6 Stacks pricing only upgrades provenance). Pilot lane
  assigned post-triage.
- **Must-cites:** Suzuki 2610.41115 (method-neighbor, 2026-10-30, month-scale clock);
  Faifman–Rudnick 0803.3534; Rudnick 0811.3649 (power-sums = the base-change collision
  data, different question); Bui–Florea 1605.07092 (family simple-zero lower bounds,
  non-Lamzouri constants); Katz–Sarnak 1999; DLRT 1908.04876; the supersingular falsity
  trap (tauceti `Frobenius/Supersingular.lean` genus-1; every-genus citation = round-4's
  `[A9 verify]` open item).
- **N/S/E (proposed):** primary 2–3 / 3–4 / 1–2 (rank ≈ 3–5); family secondary 4 / 4 / 4–5.
  **[A5 LANDED:** "primary (P): formalization-first (dictionary value); FF-EZ2-family: N as proposed (DISCOVERY-grade [HYPOTHESIS], dossier-flagged)"; tier WARM (Suzuki month-clock); trap citation "ANSWERED at mechanism level … r4 §6.3 — chapter-number pin pending". VERDICTS C2 row 71. **A7 G6 open.]**

### 72 — area-law-inertial-defect (`candidates/72-…md`, 388 ln)

- **Headline:** restructured post-Kuwahara before writing: the gap-to-inertia dictionary
  (HasGlobalGap ⇔ `posIndexAbove θ (E₀−H) ≤ 1` on θ ∈ (−Δ,0], provable now — with A9's
  in-file QA erratum: the bridge's "every B" compression claim is false for non-isometric B,
  counterexample recorded, isometric form stated), a purity (α = 2) certificate route
  [HYPOTHESIS] via pilot-01's PROVED master identity on (ρ_A, Q_A), a formalizable
  Kuwahara no-go gate (Rényi monotonicity ⟹ rank ≥ e^{S_α}), and the AL-EZ3 interface
  theorem discharging openai-math's unproved PEPS `UniformAreaLaw` from AreaLaw2D's
  `AreaLaw.areaLaw` as Milestone-1.
- **Category:** P1 + C-neg = **formal-new glue**; P2 = **DISCOVERY-grade [HYPOTHESIS]**
  (the zone's only surviving discovery claim — rank/cap-functional dead per round-4 §2);
  AL-EZ3 = **GLUE with a real consumer** (openai's MainStatement tree); AL-EZ2 secondary
  now owned outright by dossier 74 (A4's boundary note, no overlap).
- **Bridge:** AreaLaw2D (gap/k_X/condExpect + the proved area law — no certificate layer) ×
  pilot-01's PROVED inertial-defect machinery (no entropy) × openai-math (the Gram-form RDM
  + the consumer) × mathlib spectral substrate; the dictionary is written nowhere.
- **Pilot status:** prework LANDED — `pilots/72-prework.md` (lane A4, 493 ln): **conditional
  GO** — M1 has an ungated Tier-C fallback; single import gate **G5a (Physlib staging)**;
  M2's shape fixed by round-4 §AL to purity/effective-rank; A9's isometric-B erratum
  applied to prework §3.1 + bridge AL-EZ1 this cycle (per 74's boundary note).
- **Must-cites:** Kuwahara 2610.15199 (the no-go: Rényi-α<1 volume laws in the
  unique-ground-state + uniform-gap class, d ≥ 2); Anshu–Harrow–Soleimanifar 2004.15009
  (entanglement spread — nearest positive, different functional); Anshu–Arad–Gosset
  2103.02492 + 1905.11337; AAH FOCS 2022 (cite directly); Abrahamsen et al 2203.16012
  (AGSP — nearest classical technique); OAI265 + the poly-PEPS companion (in-corpus, the
  representation-form nearest miss); round-4 §2 rows AL-1–AL-7.
- **N/S/E (proposed):** primary 3–4 / 3–4 / 2–3 (M, with an S decider probe); AL-EZ3
  milestone 2 / 3 / 1–2. **[A5 LANDED:** "P1: formal-new (moderate); P2: N as proposed ([HYPOTHESIS], flagged); C-neg: precedent-backed (50/30 lineage)"; tier WARM ("hard NO-GO on literal rank statements — already honored"); P2-4: "no α≥1 2D Rényi area law found; residual re-check at pilot". VERDICTS C2 row 72. **A7 G5 open.]**

### 73 — function-field-hecke-tate (`candidates/73-…md`, FINAL 273 ln — filled from the
pre-registered skeleton on 2026-11-13, task A9-7)

- **Headline:** the FF Hecke-L statement class in the DZDF `heckeCorollary` shape with
  **every Weil-side input a binder** (`hTate`/`hRat`/`hPur`, the hQRH precedent): (i)
  rationality/continuation of L(s,χ) via `hRat` + 71's t ↔ s transfer; (ii) the RH-form
  with **window exactly 1/2** (the anti-CT contrast at the Hecke level); (iii) the Tier-A
  dictionary clause; (C1) the 𝔽_q(T) probe — post A2's honesty correction: `hRat`
  dischargeable (elementary periodicity), `hPur` STAYS A BINDER (it is the RH for Kummer
  covers of ℙ¹ — Weil, deep) ⇒ (C1) lands (i) unconditional + (ii) conditional;
  (C2) the three-corpus window-comparison (1/2 vs 31/32 vs B_new); (C3) proportion
  extensions fenced off (trap-reasoned: multiplicity proportions die,
  existence/rationality/nonvanishing survive).
- **Category:** **CONDITIONAL-CORE, Stacks-blocked, formalization-first — the
  highest-ceiling item of the 70–75 series, with the least claimable today.**
- **Bridge:** Weil (L(X,ℱ) + purity — the only source, behind StacksFrontier) × DZDF
  (the `RayClassCharacter` structure + `heckeCorollary` shape to transplant/mirror) ×
  mathlib (function-field substrate + 71's t ↔ s dictionary) × tauceti (the only
  ℓ-adic-adjacent arithmetic — genus-1 layer); the vendored CFT offers nothing
  (number-field-only, every `Tate` = Lubin–Tate — A1-4 §(d), LANDED): the binder
  posture is the only route.
- **Pilot status:** **73-C skeleton DECIDED + EXECUTING (A2)** (binders + class def +
  (i)/(ii) statements, ≈ 0.4–0.6k LoC per A2's FF-sequencing memo, zero import gates);
  the (C1) `hRat` discharge is the sequenced M-item (0.3–0.6k LoC; `hPur` binder per the
  A2 correction, dossier revised); Tier A blocked (L(X,ℱ)/purity behind un-cloned
  StacksFrontier ~63k modules; Kummer sheaves not even in Weil).
- **Must-cites:** round-4 §6.2 EXECUTED verdict — KNOWN-INFORMAL-ONLY (Tate 1950 thesis;
  Weil *Basic Number Theory* ch. VII; Rosen GTM 210 ch. 8–9 incl. the grössencharakter
  case; no post-2000 arXiv claim of the dictionary as new); Suzuki 2610.41115
  (method-neighbor, ζ_C-only, month-clock); Boyang Hu (hexagonmath, different layer);
  Rosen chapter-number pin owed (A5's dossier-level re-run).
- **N/S/E (proposed):** 3 / 4 / 2–3 for the Tier-C pilot (rank ≈ 4.8); 5 for Tier A
  (blocked — a priced ceiling, not a slot). **[A5 row still `[incoming]` (written
  pre-fill): "queries re-run on landing (incl. Rosen chapter numbers)" — the
  dossier-level re-run is owed; zone tier WARM (formalization-first). A7 G6a open.]**

### 75 — abelian-assembly-zetaL-proportions (`candidates/75-…md`, 320 ln; 70-Part-B split-out)

- **Headline:** DZDF's `dedekindAbelianQuotient`/`abelianFactorization` (ζ_L = (∏ nonprincipal
  Hecke L-series)·ζ_K, every abelian L/K) turns pilot 42's proved two-factor assembly into
  n+1-factor landing theorems for ζ_L — the first zero-proportion (and real-abelian strip)
  statements for any ζ_L — with the **component-proportion binder schema as the named open
  core** (nobody has Hecke-L proportions) and the partially-unconditional K = ℚ accounting
  (ζ-side discharged by V2 per A3's 42-M4; Dirichlet side stays zeta23-conditional;
  DZDF/Liu-1's Dirichlet results are location-only, never proportions).
- **Category:** **DISCOVERY-grade claim on the statement class (DLRT-gated), CONDITIONAL-CORE
  today**; assembly machinery explicitly pilot 42's, not claimed.
- **Bridge:** DZDF (factorization + component zero-free) × zeta23 (Dirichlet ThmE constants)
  / V2 (ζ-column, unconditional on-pin) × pilot-42/20 PROVED machinery × mathlib; no side
  alone can state it.
- **Pilot status:** **DEFERRED — wave-4** (orchestrator's empirical-record relay);
  proposed entry (P-a)+(C1)@2/3 when slotted, binder-postured (the factorization datum
  is one hypothesis); M4b (the V2 ζ-side discharge) proceeds independently as a gated
  continuation (A3; blueprint `pilots/42-M4-blueprint.md`, STATUS:140 GO).
- **Must-cites:** **DLRT 1908.04876 — the gating scope question** (uniform-over-K ⟹
  math-known, N caps 2–3; Dirichlet/quadratic-scoped ⟹ N 4; relayed to A5 as a gating
  PART-2 item); Liu-2 2610.26835 (family overlap, wrong quantity); dossier-20's R8 set
  (AF/Lamzouri Dirichlet-only); Trudgian–ZA 2610.16010; A3 §(f) + A1 H1(a).
- **N/S/E (proposed):** 4-or-2–3 (DLRT-gated) / 4 / 2–3 (rank ≈ 4–8 conditional).
  **[A5 LANDED — P2-3 FLIP RESOLVED:** "DLRT 1908.04876 is SCOPED (fixed quadratic K, GRH-conditional, T→∞) — NOT uniform ⇒ primary is NOT math-known ⇒ N stays 4"; N-adjust "4 (per flip rule)"; tier WARM; DLRT erratum (standing note 3) propagates to nearest-miss text. VERDICTS C2 row 75. **A7 G1 open (binder discharge only).]**

## §2 Adjacent 70-series rows (recorded for completeness; not A9-owned)

- **73** — formerly this section's [expected] stub; **filled to FINAL by A9 on
  2026-11-13 (task A9-7) and promoted to a full §1 block above**; the pre-registered
  skeleton's zone facts (Stacks-blocked root; the 𝔽_q(T) probe; highest ceiling) all
  carried into the full dossier unchanged.
- **74 — surprisal-moment-hierarchy-ceilings** [LANDED, lane A4, 247 ln]: owns AL-EZ2
  outright (T1 two-sided window theorem, T2 class-inclusion ladder, T3 LP core contingent
  on dossier-02's unclaimed layer, T4 method-barrier corollary; consumer = AreaLaw2D's 3D
  bottleneck C.3); boundary note vs 72 records no statement overlap and non-inheritance of
  the 72 §P1 erratum. Block data: A4's file.

## §3 Donor events (factual; 2–3 lines each)

1. **QR-D cluster timeline (six papers in six weeks, two external Lean artifacts):**
   Ope26a 7/8 (openai preprint 2026-09-30, ζ included, Lean = sorry challenge) → Ope26b
   11/12 + Landau–Siegel corollary (10-05) → Liu-1 B_new = 0.8749570 incl. ζ + every
   Dirichlet L (2610.12234, 10-08, v2 10-12; **formalized, public repo**) → Xu–Sang
   0.8748867 conditional on Ope26a inputs (2610.15291, 10-11) → CT 31/32 every number
   field (hexagonmath 2610.00200, 10-12/14; **formalized = our DZDF donor**) → Liu-2
   B♭ = 0.8748866 uniform over all K incl. ζ_K (2610.26835, 10-19, v2 10-29; Lean in
   progress); alongside Trudgian–ZA low-lying zeros h(K) < 0.58 (2610.16010, 10-12).
   Informal frontier below 7/8 uniformly ⇒ pilot 50's `hQRH` TRUE informally (Liu-1
   Cor 14.1). Sources: round-4 §3 + §5.1–5.3 (the strongest-per-class table); VERDICTS C2
   addendum preamble.
2. **This cycle's responses:** dossier 70 (weakened-binder discharge, constants restated
   parametrically per the §5.3 re-scope line), dossier 75 (the abelian assembly), A3's
   donor remap (`novelty/axiommath-as-donor.md`: no deltas for 20/21/22/40 — hCZ and
   stop-at-M4 unchanged; new cross-cutting donor `dedekindAbelianQuotient`), pilot specs
   landed (`pilots/50-M2-31-32-spec.md` gated on G1; `pilots/42-M4-blueprint.md` GO;
   STATUS:138–140). Sources: the files cited.
3. **Liu-1 registration:** shallow clone at `/home/doz/zcode-workdir/liu-zerofree/`
   (rev `7d10420`, v4.34.1), AGENTS.md sibling bullet, commits `2d5a663`/`0079dc3`;
   consumer = pilot 50 `hQRH` class (full-strength 7/8 formal discharge); probe = A7/G7,
   pending — statement portability unprobed (Knausgård-style external donor handling).
   Sources: STATUS.md external donor-candidate register (:151–153) + commit log (:185–187).
4. **upstream-PNT+ DEFER + triggers:** upstream `AlexKontorovich/PrimeNumberTheoremAnd`
   @ `938912bb` (2026-11-12) — **StrongPNT now PROVED, triad-clean** per A1's `/tmp`
   inspection (`survey/axiommath-pntplus.md`; contrast the axiommath clone's copy, where
   the StrongPNT endpoint is commented out — survey §2b). Decision on disk: **DEFERRED —
   do NOT clone** until (i) A1–A3's recommendation and (ii) a triage-named consumer exist
   (STATUS register :154–157). Update at pack refresh (A5 standing note 1, VERDICTS C2):
   "**22's Tier-2 T2b is CLOSED-BY-UPSTREAM — formalization-only to recover on our pin;
   T2a (quasi-RH-conditional x^{7/8+ε}) survives as 22's only open content**"; fork-vs-
   upstream Mathlib-subtree drift = 39/75 files ("a real port, not a rebase").
   Dossier-22 stop-at-M4 posture unchanged (A1-3 pntplus-glue-as-donor.md §d).
5. **Kuwahara no-go alarm:** Kuwahara 2610.15199 (2026-10-10) disproves Rényi-α<1 area
   laws in d ≥ 2 for unique-ground-state + uniform-gap systems ⇒ by S₀ ≥ S_α, literal
   rank concentration from a gap is FALSE; A5 round-4 §2 issued the standing alarm BEFORE
   dossier drafting; dossier 72 was restructured pre-write accordingly (purity/effective-
   rank framings; cap functional dropped as dead-on-arrival; a formalizable no-go gate
   corollary added); A9's isometric-B QA delta relayed to A4 and applied to the bridge +
   pilot-72 prework (74's boundary note). Sources: round-4 §2 (rows AL-1/AL-3), dossier
   72 honesty header, `bridges/area-law.md` (post-erratum, 480 ln).

## §4 Cycle-2 disk state (pack freeze, 2026-11-13; re-pull before REPORT close)

| Item | Count / status | Source |
|---|---|---|
| Surveys (Cycle 2) | `survey/axiommath.md` 581 ln; `survey/axiommath-pntplus.md` 299 ln | `wc -l` |
| Bridge maps (Cycle 2) | `bridges/function-field.md` 492 ln (A2); `bridges/area-law.md` 480 ln (A4, post-erratum) | `wc -l` |
| Novelty (Cycle 2) | `round-4.md` 404 ln (PART 1 + §5 precision pass + §6 FF stubs); `axiommath-as-donor.md` 353 ln (A3); `VERDICTS.md` Cycle-2 addendum — **PART-2 LANDED at refresh** (rows 70–75 DOSSIER-CHECKED/incoming + standing notes 1–4; row↔file offset reconciled in-table) | `wc -l`; VERDICTS :145 ff |
| DLRT erratum (A5 standing note 3) | main-run §5.2(c) "unconditional 45% distinct" corrected: Thm 1.1/Cor 1.3(i) are GRH-conditional, fixed quadratic K, T→∞ — propagates to CLAIMS-REGISTER row 42 + rows 42/75 nearest-miss text (H to apply; applied to dossier 75's text at this refresh; CLAIMS-REGISTER row 42 applied at `c046e8e` — verified with qualifiers in place at the 2026-11-14 H propagation sweep) | VERDICTS C2 note 3 |
| Dossiers 70-series | 70: 469 / 71: 276 / 72: 388 / 73: 26 (skeleton) / 74: 247 (A4) / 75: 320 ln — 1,726 total | `wc -l` |
| Pilot specs/prework | `pilots/71-prework.md` 380 (A2, GO); `pilots/72-prework.md` 493 (A4, conditional GO); `pilots/50-M2-31-32-spec.md`; `pilots/42-M4-blueprint.md` (GO) | `wc -l`; STATUS |
| A7 probes on disk | `feasibility/probe/ProbeG1_DZDF.lean`, `ProbeG2_ZetaZerosV2.lean`, `ProbeG3_Weil.lean` (landed; verdicts pending at freeze) | `git status` 2026-11-13 |
| Donor builds on our pin | ZetaZeros OK (run5), ZetaZerosV2 OK (v2-run9, 8,262 jobs); **DZDF statement-level only** (Challenge OK, run1; full build never run — G1) | `feasibility/axiommath-bump/logs/` |
| External donors | liu-zerofree registered (rev `7d10420`); upstream PNT+ DEFERRED (`938912bb`) | STATUS register |
| Cycle-2 close-outs (A8) | 52 M1 VERIFIED-GREEN; 20 CLOSED (hCZ unchanged) | STATUS :137–138 |

— end of pack (A9; pure inputs; orchestrator conclusions intentionally absent).
