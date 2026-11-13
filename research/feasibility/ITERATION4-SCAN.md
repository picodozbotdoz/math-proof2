# ITERATION4-SCAN — groundwork inputs for the next research cycle (after Cycle-2 close)

Lane A1, 2026-11-14 (post-outage relaunch). **Inputs only — the orchestrator charters the
next cycle; this scan assembles and cites, it does not decide.** Statuses are as of this
date; every in-flight Cycle-2 item marked **[TRIAGE-DECISION]** will reorder priorities
when its pilot verdict lands. Sources mined: `TRIAGE-C2-ROWS.md` (A9 staging),
`TRIAGE.md` (main-run final ranking), `RESUME-BRIEF-C2.md` §Gate state,
`novelty/round-4.md` (open flags + §8 clocks), `feasibility/axiommath-donor-probes.md`
(G-series), `survey/axiommath.md` (+ cft-vendor, pntplus), `bridges/function-field.md`,
`bridges/area-law.md`, `survey/tauceti.md` §empty-zones, `VERIFICATION-LEDGER.md` §8–§9.

## §1 Carried-over candidates (status + what landing needs)

### 1a. Cycle-2 continuations and gates (in flight this relaunch — outcomes reorder everything below)

| Item | Status (2026-11-14) | What landing it needs | Reorder risk |
|---|---|---|---|
| 42-M4b | run2 GREEN 02:06 (`pilots/42/logs/m4b-run2.log`), A3 formal report pending; upgrade continuation (G2-cleared) may re-baseline | A3 axcheck + note; upgrade = direct V2 import ≤20-line delta per `pilots/42-M4-blueprint.md` | **[TRIAGE-DECISION]** upgraded-42 vs 75 wave-4 share the same GREEN stack (`TRIAGE-C2-ROWS.md` rows 42/75) |
| 50-M2 | R1 (openai in-corpus 7/8) gated on **G7b** — run19 re-launched 02:03, no verdict yet; R2 DZDF 31/32 statement-level only (G1b FAIL); R3 Liu-1 binder 34999/40000 (G7 CLEAN) | G7b verdict (donor-pin axiom audit, `axiommath-donor-probes.md` §G7b); then route choice | **[TRIAGE-DECISION]** R1 vs R3 — R1 sharper provenance, R3 sharper constant (0.874975 vs 7/8) |
| 73-Q4 | hard-stop gate: (C1) `hRat` discharge for the probe class — `pilots/73-prework.md` Q4; `hPur` STAYS a binder (RH for Kummer covers) | 73-C skeleton landing first (A2, executing); Q4 is a separate gate decision | **[TRIAGE-DECISION]** Q4 opens/closes the Tate-dictionary's provable-on-our-pin depth |
| 75 wave-4 | spec landed (`pilots/75-prework.md`, complete); P2-3 flip resolved → N stays 4 (DLRT scoped, not uniform); entry (P-a)+(C1)@2/3 | wave-4 slot; no technical gate (binder-route hard-coded in F2) | **[TRIAGE-DECISION]** slotting vs 42-upgrade sequencing |
| 71-P2 / 73-C | A2 mid-flight (P2 run1 FAIL rc=1 err=6, iterating; 73-C next) | P2 GREEN → W1/W2→HW; 73-C Q0→Q3 then STOP before Q4 | **[TRIAGE-DECISION]** FF cluster follow-ons (FF-EZ2/4/5 below) rank only after these land |
| 72-M1 (Tier-C) / C-neg | A8 slot-3 after 11-M2; C-neg A4 mid-flight (run5: 7 err) | C-neg GREEN (N1 Rényi monotonicity + N2 rank bridge + N3 gates, `72-prework.md` App. A); M1 Tier-C transcription, zero gates | **[TRIAGE-DECISION]** AL zone sequencing (EZ1/EZ2 below) rides these |
| 10-L2 / 11-M2 | A6/A8 mid-flight (L2 Part-D fixes; P11T3/RedTm2 four fixes) | GREEN + axcheck per lane queues | completion items, not charters |
| 22-T2a | **only open content** of dossier 22 (T2b closed-by-upstream: `AlexKontorovich/PrimeNumberTheoremAnd` @ `938912bb` proves StrongPNT triad-clean — `survey/axiommath-pntplus.md`; fork itself only proves MediumPNT 1/10, `survey/axiommath.md` §2(b)) | next-cycle charter; upstream statement as binder (statement-port≈0) | low — small, well-scoped |

### 1b. Main-run candidates never piloted (from `TRIAGE.md` final ranking, 2026-11-09)

| # | Candidate (final score) | Status / next step |
|---|---|---|
| 41 | q-deformed-eight-square (7.0) | R8-cleared, pilotable; re-scope keeps (H) sign-rule/parallelogram-defect as differentiator (B–P–I 1998 contests object level) |
| 02 | bandwidth-k LP core (4.67) | RE-SCOPE locked: LP weak duality **in Lean** + pair-mass B₂ axis; never claim "first barrier theory" (Knausgård §7.6) — **shares the LP-duality layer (unclaimed in the LEAN ECOSYSTEM only — Isabelle/Coq own the theorem class, A5 seed-9 verdict) with 74-T3** (synergy seed §2.9) |
| 12 | parametric-savings (6.0) | feeder = 51; monotonicity-via-termPrime check flagged at pilot |
| 31 | budgeted-split (4.0) | shares step-3 glue with 32 — 32-M1 now GREEN (ledger §1), amortization improved |
| 60 | border-rank-connector (3.0) | verify/drop the ≤21 attribution BEFORE writing |
| 40 | zeta-k-prime-deriv (2.25) | T3-headline re-scope; T2 pilot only (Šleževičienė/Broughan in nearest misses) |
| 30 | hall-parseval remainder | falsify + ClosedForm GREEN (ledger §1); Theorem A/A′ remain (M effort per row 30) |
| 51 | omega-to-wordram (1.0) | fold into 12-F3b or formalization-only |

**[TRIAGE-DECISION]** the whole of 1b competes with §2 seeds for next-cycle slots; nothing
in 1b has a live gate — they are cold inventory.

### 1c. Open novelty/verification flags (owe-closure, not pilots)

- **HKT chapter pin [chapter vs printing TBD]** — round-4 P2-11; fallback in hand (four
  zbMATH-verified papers: vdG–vdV Zbl 0729.11066; Cossidente et al. Zbl 0958.11048;
  Hirschfeld–Korchmaros Zbl 1043.51007; Giulietti et al. Zbl 1218.11064).
- **Rosen ch.-number spot-check** — due when a 73 pilot nears Q4/FE territory (round-4 tail).
- **72's α>1 Rényi re-check** — at pilot time (round-4 P2-4 residue; bridges/area-law.md §2).
- **hexagonmath archive-direct sweep** — ORCID-gated; PASS-conditional stands (P2-12).
- **QuasiRiemannTracker — audited (A5, 2026-11-14 relay):** now a STANDING ~daily clock on
  the Dirichlet class — formal frontier **0.8733458561 (Bebel)**, leapfrogging the
  conditional informal 0.87446205 (Chang–Wang). **ζ_K split survives** (tracker is
  Dirichlet-only) — row 70 tier unchanged. Re-check protocol: a single curl of the STATIC
  assets `catalogue.json` / `bound-badge.json` at `gtimg.github.io/QuasiRiemannTracker/`
  (only the HTML shell is JS-rendered); no browser pass needed.
- **DLRT erratum propagation** — CLAIMS-REGISTER row 42 + rows 42/75 nearest-miss text
  (H to apply; verify done at close-out).
- **A7 G-series unfinished**: G7b (run19, no verdict), G5a (run20 hit artifact-cache fail;
  boundary already measured: Physlib @ `a50684a1` + md4lean @ `31907cc1`, statement layer
  imports `Region.{State,TraceDistance}` → Physlib), G6a (run21 mid-fetch; priced earlier:
  StacksFrontier closure 59,173 jobs, hours-scale, drift-unbounded — `axiommath-donor-probes.md` §G6a).
- **Clocks to date claims against** (`novelty/round-4.md` §8): Liu-2 B♭ = 0.8748866 uniform
  (Lean in progress); Chang–Wang 2611.00924 conditional 0.87446205769 (conditional-only);
  Ji 2611.16665 599/600 ζ_{Q(i)}; WenrongZou/TateThesis (number-field Tate, may land within
  months — softens 73's "first formal Tate-type anywhere" to FF scope); QR-D ecosystem now
  13 repos — **no ζ_K formal artifact anywhere; row 70 per-class split survives**.

## §2 Fresh seeds from Cycle-2 finds (rationale + exact donor pointers)

1. **AreaLaw2D 3D continuation** — the repo's own terminal point: `Statements3D.lean` fixes
   statements, only the cylinder corollary is proved; `docs/3D/Targets.md` pre-specifies the
   next milestones (`survey/axiommath.md` §2(b)). Rationale: first ready-made
   statement-level 3D substrate in any corpus; our 2D-gap→entropy machinery (G4/G5 CLEAN)
   ports to it. Donors: `axiommath/AreaLaw2D/{Statements3D.lean, docs/3D/Targets.md}`.
2. **ZZV2 λ-family parameterization** — constants frozen at λ = 1 (C₀, C₁, C₂ closed forms,
   `ZetaZerosV2/Challenge/Basic.lean:209–243`, `Numeric/MontgomeryTaylor.lean:39–49`); no
   λ-family exposed at the challenge layer, unlike zeta23's `thmA/B/C_lam` families
   (`survey/axiommath.md` §2(c)). Rationale: a λ-parameterized proportion layer is
   glue-grade on our pin (V2 = BUILT donor, G2) and bridges zeta23 ↔ Lamzouri.
   Donors: `axiommath/ZetaZerosV2` (built); anthropics zeta23 λ-families.
3. **22-T2a on upstream StrongPNT** — upstream proves what the fork deleted
   (`PrimeNumberTheoremAnd` @ `938912bb`; fork's own StrongPNT is commented-out sorry,
   `StrongPNT.lean:1883–1885`). Rationale: T2a becomes a binder-postured pilot whose donor
   statement now EXISTS proved and triad-clean upstream. Donors: upstream PNT+ (statement
   binders; v4.35 — statement-port≈0), `survey/axiommath-pntplus.md` map.
4. **FF-EZ2 surviving statement** — fixed-curve simplicity obstructed (supersingular
   Jacobians force multipities ~ g; `bridges/function-field.md` §4), family version
   literature-occupied, one cheap statement survives per the bridge's design rule. Rationale:
   the trap analysis is already done; the survivor is S-effort. **[TRIAGE-DECISION]** rank
   only after 71-P2/73-C land.
5. **FF-EZ4 genus-1 identification** — tauceti `zetaFunction` = Weil `zetaSeries` at an
   elliptic curve; G6b verdict: the EllipticCurve→Scheme instance breaks on mathlib but the
   bridge EXISTS in tauceti (`EllipticCurve/Scheme/OfWeierstrass.lean`); HasseBound
   (`HasseBound.lean:44`) becomes the g=1 case of FF-EZ1(iii). Rationale: S-effort glue
   with a proved instance path on our toolchain. Donors: `tauceti` (same pin, direct dep),
   `axiommath/Weil`.
6. **FF-EZ5 family counting** — RvM-style N(T) is degenerate for a fixed curve (N_ν = b_ν
   exact, `CharpolyDegree.lean:67`); the analog lives
   over families (`bridges/function-field.md` §3 table row 3). **[A5 triage verdict:
   LIKELY-DEAD standalone — Faifman–Rudnick 0803.3534 IS family zero-counting statistics
   (CLT/variance of counts in angle intervals, genus→∞, fixed q); Rudnick 0811.3649
   adjacent. DO NOT CHARTER standalone; FOLD into seed 4 (FF-EZ2 territory) — survivors
   only as DIFFERENT quantities: multiplicity-aware counts, uniform-in-family lower
   bounds, s-plane-strip counts; round-level differentiation sweep mandatory before any
   charter.]**
7. **Kontorovich/quasi-rh 11/12 as binder donor** — README-claimed
   `riemannZeta_ne_zero_of_re_gt_elevenTwelfths` for ζ + Dirichlet (v4.34.1, reuses OAI's
   analytic core, NO ζ_K) — round-4 §8.3. Rationale: sharpest ζ/Dirichlet constant available
   statement-level; NOT a threat to row 70's ζ_K split. Donor: github.com/AlexKontorovich/quasi-rh.
8. **de Bruijn–Newman Λ ≤ 9/32 (DrMurphyIsIn, kernel-checked)** — closes main-run round-1
   §12's "Λ absent everywhere" gap via third party. Rationale: donation-surface note only
   (no C2 dossier affected); any next-cycle Λ idea starts from this artifact.
9. **The shared LP-duality layer (02-core + 74-T3)** — dossier 74's T3 "rides the same
   unclaimed LP-duality layer as 02" (`TRIAGE-C2-ROWS.md` row 74 wording; round-4
   P2-6..P2-10 clean — **scope-corrected 2026-11-14, A5 seed-9 verdict
   AFP-HAS-LP_DUALITY: unclaimed in the LEAN ECOSYSTEM only; Isabelle AFP trio +
   Coq 1706.10269 own the theorem class, mandatory nearest-miss citations**) and T3
   must state **u ≠ 1** (the `Real.rpow` zero-eigenvalue glue note, P2-10). Rationale:
   ONE mathlib/Lean-native duality layer unlocks two dossiers across cycles (main-run
   02 core, C2 74 T3). Donors: openai-math `EntropyMoments.lean:93`
   (`moment p u = ∑ (p i)^(1-u)`), AreaLaw2D `OpenAI/Statements.lean:460–490`
   MarginalTails.
10. **50-M2-R3 Liu-1 statement-binder (already CLEAN)** — consume the PROVED rational
    34999/40000 (NOT the README decimal — G7 discrepancy note); Liu-2 clock (B♭ uniform,
    Lean in progress) is the future external donor for the same binder shape.
    Donors: `liu-zerofree` (statement-level only), `axiommath/DedekindZetaZeroFree` (31/32,
    statement-level per G1b).
11. **tauceti within-corpus empty zones** (`survey/tauceti.md` §"within-corpus empty zones"):
    type-II codes ↔ theta series/modular forms; orbit zeta ↔ Lefschetz; CAR/Fock ↔ QFT;
    free probability ↔ random-matrix eigenvalue flow; Vaught counting ↔ Morley–Vaught.
    Rationale: un-mined bridge pairs inside the corpus we can build against directly
    (same toolchain, direct dep). **[A5 triage: POSSIBLY-KNOWN bundle — the DICTIONARIES
    are classical (Nebe–Rains–Sloane; Lefschetz; Voiculescu/Biane–Speicher; Morley–Vaught)
    AND the CAR/occupation-universal "statistics-universal sign-calculus" framing is DEAD
    (physlib `ExchangeSign` — Tooby-Smith — carries the sign cocycle + sign-aware Wick
    stack, pushed 2026-11-13; `novelty/physlib-surface.md`). Surviving content = the
    occupation-pair layer + dual-family + a tauceti↔physlib bridge (see seed 13); any
    charter must differentiate from BOTH article 52 and physlib's `WickContraction/Sign/`
    stack; per-pair round-level battery mandatory.]**
12. **Weil-as-binder for FF window clauses** — G3 CLEAN: the LeanEval `weil_conjectures`
12. **Weil-as-binder for FF window clauses** — G3 CLEAN: the LeanEval `weil_conjectures`
    statement elaborates verbatim mathlib-only, all three geometric classes are mathlib's
    on our pin; Tier A (Stacks) stays priced-and-blocked (G6a). Rationale: FF-EZ1-style
    window transports can consume Weil RH by binder NOW, no Stacks build.
    Donors: `axiommath/Weil` statements; mathlib `Geometry.lean` classes per G3.
13. **Occupation-pair semantics for `CrAnFieldOp` (physlib bridge — A5's
    `novelty/physlib-surface.md`, added 2026-11-14)** — instantiate article 52's
    occupation-calculus axioms on physlib's tagged creation/annihilation operators: the
    71/73 dictionary pattern aimed OUTWARD at a live corpus (relation-layer donation FROM
    us). Rationale: physlib has ONE mature wing (perturbative QFT: `ExchangeSign` cocycle
    + sign-aware Wick stack) and **no CAR/CCR relation layer anywhere** — A5 rates this
    the sharpest physlib opening; must differentiate from BOTH article 52 and physlib's
    `WickContraction/Sign/` stack; re-check `FieldStatistics/` + `WickContraction/Sign/`
    + `WickAlgebra/` before chartering (the surface FIRED once already: ExchangeSign took
    the universal-calculus core on 2026-11-13). Donors: article 52 (`articles/52-*`,
    pilot 52 M1 GREEN dual-family), physlib `CrAnFieldOp` (leanprover-community/physlib,
    v4.35.0 — one minor behind our pin: DZDF-class consumption gap, statement-binder
    class). **NAME-COLLISION TRAP (charter corpus note):** THREE distinct "Physlib"s —
    (i) leanprover-community/physlib (HEPLean's successor, this seed's target);
    (ii) AreaLaw2D's VENDORED dependency package `leanprover-community/physlib` @
    `a50684a1` (G5a's measured import boundary — same upstream name, different role);
    (iii) the "PhysLean" precedent name in the literature. Never conflate them in a
    citation.

## §3 Substrate / toolchain notes for the next cycle

1. **Modal substrate (doz pattern, canonical)**: `MODAL_USER=doz`, binary
   `/home/doz/dozenv/bin/modal` (v1.6.2; workspace `semraker`); `sudo -n -u xyz` is blocked
   in this environment (no-new-privileges). Runner pattern: `pilots/71/run_pilot.sh`
   (stage to world-readable /tmp, `chmod -R a+rX`, `modal run <app>.py --dir <stage>`).
   `feasibility/probe/run_axcheck.sh` now defaults to doz + forwards subset stage-names
   (verified end-to-end 2026-11-14: `logs/axcheck-c2-machinery-check.log` — OK, 0 sorryAx).
   App `crossmath-probe` image: elan v4.2.4, toolchain v4.36.0-rc2, mathlib `ff2494ea`
   (~8,710 cached oleans); per-run 4 CPU/32 GiB (probes) or 16 CPU/64 GiB (builds).
   Costs: probe warm 3–4 min; g2-style full builds ≈ 15 min; g1b-style tarball builds
   ≈ 19 min; single-file axcheck warm ≈ 2–3 min.
2. **Artifact-cache outage mode**: `mathlib: failed to fetch cache` / `Reservoir lookup
   failed (invalid JSON)` — transient, retry 1–2× before declaring blocked (killed runs
   17/18 and A7's run20; my machinery check and A2/A3 pilot runs succeeded in the same
   window). Treat any single cache-fetch failure as retryable, not verdict-bearing.
3. **axcheck coverage lessons (this cycle, fixed/recorded)**:
   - Sibling-import rewrite in `make_axcheck.py` covers only `^import (P11T[12])$` —
     `11/RedTm2.lean` imports `P11T3`; extend the regex or align stage names at execution
     (documented in `FINAL-SWEEP-PLAN-C2.md` §3). Generalize next cycle: map every
     staged-name → rewrite ALL sibling TARGETS imports, not per-file regexes.
   - R9-era gaps (dotted top-level names, `@[simp]`-prefixed theorems) are fixed in the
     current namespace-aware extractor, but `pilots/10/axcheck_full.py` remains the
     full-coverage variant for pilot-10-style files.
   - Pilot files may embed their own `#print axioms` tails (e.g. `10/L1.lean:517–529`) —
     staged copies then show idempotent duplicate prints; the tool's `axiom-lines=N` count
     excludes "does not depend on any axioms" lines. Both benign; don't re-investigate.
4. **Step A sorry-classifier**: docstring-interior lines (ANY `/- … -/` block) are prose;
   the Cycle-2 baseline = 36 header-justified probe tokens (9 main-run + 23 G-series +
   4 in `pilots/71/P0.lean`), re-confirmed 2026-11-14 with 0 unexplained (plan §1).
5. **Donor-consumption classes on our pin** (verified this cycle): BUILT = ZetaZerosV2
   (G2: 8,262 jobs, 13/13 triad), tauceti (same toolchain, direct dep); STATEMENT-LEVEL
   ONLY = DZDF (G1b: vendored CFT breaks, 62 err/11 modules), Liu-1 (v4.34.1 + 4 patched
   deps), Weil-without-Stacks (G3), upstream PNT+ (v4.35); Physlib = boundary measured,
   build incomplete (G5a). Statement-port≈0 corpus-wide (FEASIBILITY-SUMMARY) — proofs,
   not statements, are the cost.
6. **Toolchain split recap**: ours v4.36.0-rc2; anthropics v4.33.x; openai-math + Liu-1
   v4.34.1; DZDF v4.35.0-rc3. Match the family when a `lean-toolchain` is ever added here.
7. **Log custody (log-rescue lesson)**: tee every Modal transcript to /tmp AND rescue
   in-repo with a one-line provenance header (original path, mtime, producing lane, date);
   every log in `pilots/*/logs/` and `logs-g/` follows this. Post-outage: treat log tails
   written during an outage window as suspect until re-verified.
8. **Sweep discipline for any cycle close**: TARGETS table in the cycle's sweep plan →
   all rows final-or-declared-drop → Step A (local classifier) → Step B (one warm Modal
   axcheck batch via `run_axcheck.sh`) → Steps C–D ledger + compliance sign-off. The
   Cycle-2 instance: `FINAL-SWEEP-PLAN-C2.md` + `VERIFICATION-LEDGER.md` §9.
9. **Standing external clocks, cheap re-check protocol** (A5 tracker audit, 2026-11-14):
   QuasiRiemannTracker (Dirichlet class) — curl the static assets
   `https://gtimg.github.io/QuasiRiemannTracker/catalogue.json` and `bound-badge.json`
   (the HTML shell alone is JS-rendered); formal frontier at audit 0.8733458561 (Bebel).
   Date every QR-D artifact claim against it and the Liu-2 clock (B♭ = 0.8748866 uniform,
  Lean in progress).

— end scan (A1; assembly only; chartering = orchestrator).
