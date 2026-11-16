/-
Statement elaboration probe — not a proof artifact.
**STAGED 2026-11-16 (lane R6, iteration-4 fresh-bridge scan) — run only on orchestrator
approval.** Numbering: G9/G10 are lane R8's; this lane takes G11/G12 (G11 = OAI-SiegelZeros,
same batch).

Probe G12 (OAI-PiExponent donor registration): openai-math's irrationality-exponent-of-π
headline quartet PLUS the generic hypothesis-binder interface, elaborated and axiom-audited
INSIDE the donor's own tree at the DONOR's pin (v4.34.1 / mathlib d13f23b7) — the G7b
precedent (donor-pin audit; axiom verdicts are pin-independent). Full-tree sweep ONLY if a
consumer lands (G7b scope convention).

Discovered by the R6 re-scan (`research/novelty/iter4-fresh-bridges.md` §0.1): the tree is
proved sorry-free (rg over `OAI/NumberTheory/PiExponent/` = 0 proof sorries) and is
UNREGISTERED in the Cycle-2 clocks and donor maps. Companion reasoning trace:
`reasoning_traces/irrationality-exponent-of-pi.pdf` ("The irrationality exponent of pi is
2", OpenAI summarized CoT); the claimed settled statements live in-tree. This exceeds every
classical record (Salikhov's μ(π) ≤ 7.6063…) — the registration claim is NOT endorsed here;
the probe audits only the donor's internal hygiene (axioms), which is what a statement-binder
consumer needs.

Donor statements (read-only donor, /home/doz/zcode-workdir/openai-math/lean):
`OAI/NumberTheory/PiExponent/Main.lean` — `pi_eventual_lower_bound` :9,
`pi_integer_eventual_lower_bound` :13, `pi_irrationalityExponent_eq_two` :17,
`main` :19, `flint_hills_summable` :29 (Flint–Hills ∑ 1/(n³ sin² n) summability);
object layer `Statement.lean` — `irrationalityExponent`/`ApproximationExponents`/
`EventualLowerBound`/`PiEventualLowerBound` :10–29.

Binder interface (the R6 find — generic in the geometry, π-specific only at the analytic
leaf): `Approximation/InterpolationConsequence.lean` —
`piEventualLowerBound_of_globalInterpolation (hgeometry :
PiExponent.DeterminantContradiction.GlobalInterpolationStatement) : PiEventualLowerBound`
:11 (siblings `pi_irrationalityExponent_of_globalInterpolation` :18,
`flintHills_of_globalInterpolation` :25). I.e. the entire conclusion layer is dischargeable
from ONE hypothesis binder; the π-specific input is `PiExponent.LiteralAnalytic.
analyticAggregate` (`Analysis/AnalyticAggregate.lean:96`), used internally. The hypothesis
type is defined at `Approximation/DeterminantContradiction.lean:94`
(`PiExponent.DeterminantContradiction.GlobalInterpolationStatement : Prop`) — audited here
as the binder-consumption surface.

Consumption class (pre-registration ruling): donor is v4.34.1 — **DO-NOT-CONSUME as a build
dependency until a G-probe verdict lands; statement-binder class only** (hypothesis-binder
form: consumers write `hμπ₂ : OAI.PiExponent.PiEventualLowerBound`-shaped binders, or port
the `EventualLowerBound` object layer mathlib-only per FB-3, `novelty/iter4-fresh-bridges.md`
§3).

Execution (orchestrator-gated): the dedicated **g11 mode** of app `crossmath-gprobe` —
`research/feasibility/probe/run_gprobe.sh g11` (added 2026-11-16, same lane; one tarball
carries both closures: SiegelZeros + PiExponent + lakefile + manifest + lean-toolchain +
patches/, on volume `crossmath-g11-tree`); NOT the plain `probe` auto-glob (this file
imports donor modules). No run staged this cycle.

Expected verdict (one line, for the probes ledger): OK + the five headline/interface decls
triad-clean `[propext, Classical.choice, Quot.sound]`, or FAIL with the stray-axiom list.
Verdicts are STATEMENT-elaboration/axiom-audit results, never proof claims of μ(π) = 2.
-/
import OAI.NumberTheory.PiExponent.Main

/-! ## Direct-import signature checks -/

#check @OAI.PiExponent.pi_eventual_lower_bound
#check @OAI.PiExponent.pi_irrationalityExponent_eq_two
#check @OAI.PiExponent.flint_hills_summable
#check @OAI.PiExponent.piEventualLowerBound_of_globalInterpolation

/-! ## The binder hypothesis surface (consumers discharge this one Prop). -/

#check @OAI.PiExponent.DeterminantContradiction.GlobalInterpolationStatement

/-! ## Donor hygiene: axiom audit of the headlines + the interface. -/

#print axioms OAI.PiExponent.pi_eventual_lower_bound
#print axioms OAI.PiExponent.pi_irrationalityExponent_eq_two
#print axioms OAI.PiExponent.flint_hills_summable
#print axioms OAI.PiExponent.main
#print axioms OAI.PiExponent.piEventualLowerBound_of_globalInterpolation
#print axioms OAI.PiExponent.LiteralAnalytic.analyticAggregate
