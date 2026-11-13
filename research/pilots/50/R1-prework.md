# Pilot 50 — R1 pre-stage: openai in-corpus 7/8 route (WRITTEN, NOT RUN — gated on G7b)

Lane A3, 2026-11-14. Pre-staging per the orchestrator's queue: everything below is
**staged only — no Modal runs**. Execution trigger: A7's **G7b** verdict relay (PASS ⇒
run per §5; FAIL ⇒ §6 route-dead analysis for the TRIAGE fold). Companion:
`research/pilots/50-M2-31-32-spec.md` (the route table — R1 preferred; this file stages
it), `research/pilots/50/{M1,Dirichlet}.lean` (GREEN conditional core, main run),
`research/novelty/axiommath-as-donor.md` §(a) (R2/R3 context), A7's
`research/feasibility/probe/ProbeG7b_OAI_SevenEighths.lean` + `gprobe.py` g7 (the gate
probe and the substrate pattern this pre-stage mirrors).

## 1. The exact donor statements to consume (in-corpus openai tree)

Read-only donor `/home/doz/zcode-workdir/openai-math/lean` (toolchain v4.34.1, mathlib
`d13f23b7` per its lake-manifest; verified on disk this session):

- **ζ side** — `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`
  (`OAI/NumberTheory/DirichletL/Nonvanishing.lean:29`):
  `{s : ℂ} (hs : (7 / 8 : ℝ) < s.re) : riemannZeta s ≠ 0`;
  proof delegates to `SevenEighths.ProbeFinalAssemblyUnconditional.zeta_nonzero`.
- **χ side** — `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`
  (`Nonvanishing.lean:19`): `{q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) {s : ℂ}
  (hs : (7 / 8 : ℝ) < s.re) (hpole : ¬ (χ = 1 ∧ s = 1)) :
  _root_.DirichletCharacter.LFunction χ s ≠ 0`;
  delegates to `SevenEighths.ProbeFinalAssemblyUnconditional.dirichlet_nonzero`.
- Challenge forms (statement-only, `sorry` by design — NOT the donors):
  `lean/ComparatorChallenges/QuasiRiemannHypothesis.lean:5–7`,
  `DirichletSevenEighths.lean:8–13`.

**Why consumption is definitional (no glue chain — R1's advantage over R2).** Pilot 50's
M1/M2a binders were transcribed FROM these very challenge forms in the main run
(`M1.lean` header provenance; `Dirichlet.lean` binder-delta note): the universally
quantified binder `hQRH : ∀ s : ℂ, (7/8:ℝ) < s.re → riemannZeta s ≠ 0` is the donor's ζ
statement under `∀`; likewise `hQRHχ` (with the explicit-instance bookkeeping recorded in
`Dirichlet.lean:9–19` — logically inert). Discharging is a lambda:
`fun s hs => OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re hs` (and the `@`-applied
Dirichlet analogue). **No count identifications, no ℤ-ideal dictionary, no
identity-theorem transfer — none of R2's §2 glue.**

## 2. Binder inventory the 7/8 discharge removes

| Binder | M1 / M2a (main run) | R1 landing |
|---|---|---|
| `hQRH` (ζ 7/8) | on all three ζ theorems (`M1.lean:45,76,86`) | **DROPPED** — discharged by the imported donor theorem |
| `hQRHχ` (Dirichlet 7/8) | on `strip_confinement_dirichlet` (`Dirichlet.lean:41`) | **DROPPED** — same |
| `hFEχ` (Dirichlet FE reflection χ → χ⁻¹) | `Dirichlet.lean:44` | **REMAINS** (mathlib gap unchanged; DZDF's `heckeFunctionalEquation` is totally-complex-only, ℚ excluded) |
| structural | none (M1 is binder-lean) | none |

Landed statements (drafted in `R1.lean`, §4): `strip_confinement_seven_eighths`
(UNCONDITIONAL: every nontrivial zero of ζ satisfies 1/8 ≤ Re ρ ≤ 7/8 — no hypotheses),
the `_mem`/`_set` vocabulary forms, and
`strip_confinement_dirichlet_seven_eighths_of_FE` (single remaining binder `hFEχ`).
Constants stay at the FULL conditional-strength 7/8 — R1 is the strongest route
(vs R2's 31/32, statement-level only per G1b FAIL; vs R3's Liu-1 34999/40000
statement-binder).

## 3. The kernel-facing hygiene claim G7b must certify

G7b (`feasibility/probe/ProbeG7b_OAI_SevenEighths.lean`, elaborated inside the donor's
pruned Nonvanishing closure built at the DONOR pin — axioms are pin-independent, they
report the proof tree) must certify, for all four names:

- `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`
- `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`
- `SevenEighths.ProbeFinalAssemblyUnconditional.zeta_nonzero`
- `SevenEighths.ProbeFinalAssemblyUnconditional.dirichlet_nonzero`

**PASS = each `#print axioms` reports exactly `[propext, Classical.choice, Quot.sound]`**
— no `sorryAx`, no `native_decide` axiom, no fourth name, anywhere in the delegation
closure. Anything else (a `sorryAx` in the assembly, or a certificate-style axiom)
⇒ FAIL: the "unconditional" wording is unavailable and R1's consumption reverts to the
M1 binder posture (constants 7/8 conditional) — see §6. A5's audit already found the
tree "0 sorry" at grep level (round-4 §5); G7b is the kernel-level confirmation
(run16 died in the outage; re-run owned by A7).

## 4. Substrate + staged files (WRITTEN, NOT RUN)

**Substrate: the DONOR's workspace, not ours.** The 2,924-file Nonvanishing closure is
v4.34.1-only (main-run `port-probe.md` §7: statement forms elaborate at v4.36; the
library port is pending) — so R1 elaborates INSIDE a pruned donor tree exactly as A7's
g7 function stages it (tarball = the import closure of
`OAI/NumberTheory/DirichletL/Nonvanishing.lean` + `lakefile.lean` +
`lake-manifest.json` + `lean-toolchain` + `patches/`; `lake exe cache get` at the
donor pin; `lake build OAI.NumberTheory.DirichletL.Nonvanishing`; then `lake env lean`
on the staged consumer files). Consequently **R1 lives in its own file, not in the
spec's `M2.lean`**: `M2.lean` (unwritten) is the mathlib-only v4.36 substrate for
R2-binder/R3 and the parametric refactor; `R1.lean` is the donor-pin substrate. Both
instantiate the same parametric θ-core idea, but on different pins they cannot share a
file. The pilot-50 core (~95 LoC M1 + ~35 LoC Dirichlet shell) ports DOWN to v4.34.1 —
expected friction (all flagged in-file, resolved at first run):

1. `push Not` (v4.36 tactic name, used in M1/Dirichlet `by_contra` blocks) — the R1
   draft avoids the question entirely by replacing it with `lt_of_not_le` (core order
   lemma, pin-stable).
2. `riemannZeta_one_sub` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean`, v4.36 shape
   `(∀ n : ℕ, s ≠ -(n : ℂ)) → s ≠ 1 → riemannZeta (1 - s) = …`) — expected present at
   the donor pin (pre-v4.34 API); **verify at probe run** (`R1probe.lean` carries
   `#check @riemannZeta_one_sub` + an `example` of the FE shape). If absent/drifted:
   fallbacks in order — the completed-ξ symmetry route, or the OAI tree's own FE
   lemmas (it ships completed-L machinery), last resort the reflection as a named
   binder (posture drop, recorded).
3. `riemannZetaZeros`/`mem_riemannZetaZeros`, `DirichletCharacter.LFunction` /
   `IsPrimitive` / `χ⁻¹` — old stable API, low risk (probe-checked likewise).

**Staged this session (all under `research/pilots/50/`, no Modal calls):**
- `R1.lean` — the DRAFT proof artifact (probe-convention header: "not a proof
  artifact" until first GREEN; no `sorry`, no `native_decide`; self-contained M1 +
  Dirichlet port + the two one-line discharges + the four landings + `#print axioms`).
- `R1probe.lean` — the first-run statement probe (elaboration-only, probe convention):
  donor `#check`s + `#print axioms` (G7b re-confirmation from the consumer side) + the
  v4.34.1 friction checks (FE lemma presence/shape, vocabulary).
- `run_r1.py` / `run_r1.sh` — the runner (app `crossmath-pilot-50-r1`, doz CLI): g7's
  staging recipe (pruned-closure tarball builder copied from `gprobe.py`'s g7 branch)
  + my run_m4 verdict conventions (error-context printing incl. `error(<code>)`
  forms, sorry detection, axioms report) + one cache-get retry against the
  artifact-cache outage. NOT RUN.

## 5. On G7b PASS: execution protocol (pre-authorized, standard guards)

1. `run_r1.sh R1probe.lean` first (statement probe; expect OK + the four triad lines
   from the consumer side). Iterate on friction-2/3 findings if any (budget: ≤ 2 runs
   of fixes before a diagnose-note).
2. `run_r1.sh R1.lean` → iterate to GREEN (0 errors / 0 sorry-warnings); the in-file
   `#print axioms` on the four landings must be triad.
3. Full-coverage axcheck (`axcheck_full.py` pattern) → logs with provenance headers to
   `research/pilots/50/logs/r1-run<N>.log`, `r1-axcheck-run<N>.log`.
4. Report → A9's dossier-50 outcome note via the orchestrator; TRIAGE fold: R1 constants
   [1/8, 7/8] unconditional (ζ) / hFEχ-conditional (Dirichlet).
   Overrun guard: R1.lean beyond ~250 LoC or > ~4 fix runs without GREEN ⇒ stop +
   diagnose-note.

## 6. On G7b FAIL: the route-dead analysis (for the TRIAGE fold)

A `sorryAx`/`native_decide`/fourth-axiom finding in the OAI closure ⇒ the openai
quasi-RH theorems are not kernel-clean consumables on any pin ⇒ **R1 dead as an
unconditional route**; constants 7/8 remain M1-binder-conditional; the unconditional
strip reverts to R2's 31/32 (itself statement-level only per G1b's 62-error full-build
FAIL — so the honest TRIAGE row becomes: *no unconditional strip constant is landable
in-corpus today; best available = 7/8 single-binder (M1, GREEN) or 31/32
statement-binder (R2 fallback shape)*). The R1 infra staged here stays reusable if the
OAI tree is ever hygiene-fixed or ported (the runner is route-agnostic donor-pin
scaffolding).
