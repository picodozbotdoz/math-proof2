# liu1-as-donor — audit of the Liu-1 Lean repo (external donor assessment)

Lane A5, 2026-11-13. This is the §Liu1-audit deliverable requested by the coordinator
(housed here instead of inside `round-4.md` §7, which carries only a pointer — chosen
per the task's "your call"; pattern: `knausgaard-as-donor.md`). Audit performed
WITHOUT cloning (H is registering the repo): GitHub page + raw.githubusercontent
fetches of 7 of ~11 root files + `verify.py` + local cross-checks against the
openai-math corpus tree. Grep-level hygiene only — the full-tree sweep belongs to H's
registered clone.

**Repo**: github.com/liubaiying101/Slightly-improved-zero-free-half-planes-for-the-
quasi-Riemann-hypothesis ([Liu26] of arXiv:2610.12234). 11 commits, main branch,
4 stars / 2 forks, 1 open issue. Dirs: `analytic_high/`, `analytic_high_v2/`,
`analytic_low/`, `geometry/`, `moment_adapters/`, `upstream/`; root .lean files listed
below; `verify.py`; two paper PDFs.

## 1. What it actually proves

**Public entry point `RHZeroFreeExtension.lean** ("Public entry point for the
kernel-checked zero-free extension", imports `analytic_high.PerturbedFinalUnconditional`
+ `geometry.ArithmeticAssembly`; "public results carry no additional analytic
hypothesis"):

- `beta_star_le : HeckeZeroSupremum.beta ≤ (34999/40000 : ℝ)`
- `hecke_nonzero (chi) (s) (hs : (34999/40000:ℝ) < s.re) (hpole : s ≠ 1 ∨ chi.residue ≠ 1) : LFunction chi s ≠ 0`
- `dirichlet_nonzero (q ≠ 0) (chi : DirichletCharacter ℂ q) (s) (hs) (hpole : ¬(chi = 1 ∧ s = 1)) : DirichletCharacter.LFunction chi s ≠ 0`
- `zeta_nonzero (s) (hs : (34999/40000:ℝ) < s.re) (hpole : s ≠ 1) : riemannZeta s ≠ 0`

All four at the **exact rational 34999/40000 = 0.874975**, unconditional on their face.
Docstring claims transitive axioms = {propext, Classical.choice, Quot.sound} (asserted;
`#print axioms` commands present inline, outputs not visible via web).

**Constant discrepancy (recorded, not resolved):** paper B_new = 0.874957019420098946…;
README of the repo says 0.874957069799; the Lean entry theorems use **34999/40000 =
0.874975** — a WEAKENED round rational strictly above both (and strictly below
7/8 = 0.875). So the repo formalizes "Re s > 0.874975", not the paper's 0.8749570.
All three numbers are on the 7/8-crossing side; the mismatch is presumably
deliberate rounding, but the README↔Lean delta (0.874957069799 vs 0.874975) deserves
an issue-tracker check by H (the repo has 1 open issue — inspect it).

**Layered architecture (binder discipline, matches our hQRH/EnclOK convention):**
`ActualDirichletTransfer.lean` (hHecke premise → ζ/Dirichlet; "this file does not
prove it"), `ActualHeckeContinuation.lean` (probe estimates → Hecke; "does not
construct those estimates and does not assert the improved zero-free theorem"),
`ActualOriginalBoundary.lean` (`beta_le_seven_eighths : beta ≤ (7/8:ℝ)` — fidelity
check recovering the ORIGINAL OpenAI bound from upstream's nonvanishing theorem),
`V2Conditional.lean` (`PhysicalProbeEstimates` premise — "The exact missing analytic
obligation… is explicit and is not an axiom" → all four conclusions),
`V2FullVerification.lean` (constructs the probes via
`physical_probe_estimates_of_chosen_moments` ← `chosen_moments_of_original_headline`
← `beta_le_seven_eighths`; "No moment, probe-estimate, or improved-boundary
hypothesis is supplied to this entry").

## 2. Toolchain, pinning, hygiene

- `lean-toolchain`: **leanprover/lean4:v4.34.1** — NOT our pin (v4.36.0-rc2); same
  family as the openai-math corpus (v4.34.1). Builds on `upstream/` = the openai/math
  Lean tree, pinned per `upstream/closure_manifest.json` (commit hash + per-module
  SHA-256 + git blob hashes — checked by verify.py).
- **Hygiene (grep-level, files fetched = ActualDirichletTransfer, ActualHeckeContinuation,
  ActualOriginalBoundary, V2Conditional, V2FullVerification, RHZeroFreeExtension,
  verify.py): 0 `sorry`, 0 `native_decide`, 0 `axiom` declarations** in all fetched
  files; `#print axioms` checks inline. Full-tree sweep + build deferred to H's clone.
- **verify.py** (replay harness): verifies upstream integrity (closure manifest
  hashes), lake-manifest git pinning, toolchain match, source-hash stability across
  the run, `lake build RHZeroFreeExtension.CombinedPaperVerification`, then a kernel
  replay of the entry file with `--trust=0`, `autoImplicit=false`, warnings-as-errors;
  parses `#print axioms` output against the whitelist {propext, Classical.choice,
  Quot.sound} and requires all 22 EXPECTED theorem names; rejects any
  `error:|sorryAx|declaration uses 'sorry'` diagnostic; writes result.json.
  Honest scoping recorded in the script: "Not a literal verification of every
  manuscript statement or the full broad optimality claim."

## 3. Certificate mechanism — do headline theorems rest on it?

**No.** The scalar certificates (V2Optimization, exact rationals) are proved IN Lean
and feed the assembly; verify.py's "certificates" are replay metadata (hashes, axiom
table), not mathematical inputs. Nothing like an external numerics file is imported
by any fetched theorem file; the only numerals in the theorem statements are the
exact rationals (34999/40000, 7/8, 1/2). Contrast class: Trudgian–ZA 2610.16010
(Sage interval arithmetic OUTSIDE any prover) and Knausgård's C++/Arb inputs.

## 4. The ecosystem fact this audit surfaced (bigger than the repo)

**The openai-math corpus tree ALREADY proves the 7/8 ζ statement our pilots bind on.**
Locally verified: `openai-math/lean/OAI/NumberTheory/DirichletL/Nonvanishing.lean:19
LFunction_ne_zero_of_seven_eighths_lt_re` and **`:29 riemannZeta_ne_zero_of_seven_eighths_
lt_re {s} (hs : (7/8:ℝ) < s.re) : riemannZeta s ≠ 0`** — proved (via
`SevenEighths.ProbeFinalAssemblyUnconditional.zeta_nonzero`), and the entire
`OAI/NumberTheory/DirichletL/` subtree (77 files incl. Detector/FinalAssemblyUnconditional)
has **0 files containing `sorry`** (grep-level; CubicMoment estimate files sampled clean
too). The ComparatorChallenges/QuasiRiemannHypothesis.lean sorry-file is the
*challenge restatement*, not the proof. So **pilot 50's hQRH binder is dischargeable
IN-CORPUS** (statement-level; elaboration/axioms on our pin = G7 work), and Liu-1's
repo is best read as: openai-tree (7/8) + parameter-variation moment adapters +
Lean scalar certificates → 34999/40000.

## 5. CONSUME / DO-NOT-CONSUME

**DO-NOT-CONSUME the repo as a build dependency** (toolchain v4.34.1 vs our
v4.36.0-rc2; upstream pinning machinery; and its headline content adds only
0.874975-over-7/8 — a constant in the HOT cluster we must not claim). **CONSUME at
statement level only, narrowly:** (i) as the recorded external formal frontier for
round-4 §5.3's per-class table (formal ζ/Dirichlet/Hecke-Q(√−3) exponent =
34999/40000 via this repo; 7/8 via openai's own tree; 31/32 ζ_K/Hecke-all-K via
DZDF); (ii) if any pilot ever wants a stronger-than-7/8 ζ-side binder, restate the
four entry theorems as binders per the H6 transitive-trust-base discipline — never
import. **The cheapest hQRH discharge is NOT this repo** — it is the in-corpus
openai tree (§4 above).

## 6. G7 probe targets (for A7)

1. **Primary**: elaborate
   `OAI.NumberTheory.DirichletL.Nonvanishing.riemannZeta_ne_zero_of_seven_eighths_lt_re`
   (+ the Dirichlet form) against mathlib `ff2494ea` / v4.36.0-rc2 with
   `#print axioms` — statement-port expected ≈ 0 (main-run finding), and if the
   dependency closure elaborates, pilot 50's hQRH is discharged in-corpus. Scope the
   elaboration to the DirichletL subtree (77 files, 0 sorry) rather than the whole
   OAI tree.
2. If a 0.874975-class binder is ever wanted: stage the four `RHZeroFreeExtension`
   entry statements as binders (they import openai-tree names — port cost sits in
   `Character`/`LFunction`/`HeckeZeroSupremum` definitional layer, unprobed).
3. Not a target: building Liu's repo itself (defer to H's registration; verify.py
   exists for exactly that).
