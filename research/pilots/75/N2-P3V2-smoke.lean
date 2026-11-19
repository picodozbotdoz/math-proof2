/-
Pilot 75-N2 P3-d — the V2-substrate SMOKE CHECK (the build-verification
artifact of the unit-8 detached infrastructure build; NOT the P3-d proof).

Purpose: verify the ZetaZerosV2 substrate builds on our pin (ff2494ea via the
redirected PrimeNumberTheoremAnd) and that `import ZetaZeros` elaborates at
the workspace root, with the d4 endpoint's on-pin axiom print banked early
(A3 recommendation 4, the M4b convention). The P3-d proof content
(`ZetaColumnOfV2Q` discharge, `N2-P3-plan.md` rung 3) lands in
`N2-P3V2.lean` at P3 execution; this file stays the substrate's green LED.

Verdict convention: OK iff rc=0, 0 errors, 0 sorry — the axiom print is
informational (V2's own axioms are expected to be triad-only per the G2
audit; any deviation is a FINDING for the record, not a smoke failure).
-/
import Mathlib
import ZetaZeros

#check @ZetaZeros.simple_proportion_d4
#print axioms ZetaZeros.simple_proportion_d4
