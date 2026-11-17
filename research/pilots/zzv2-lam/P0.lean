/-
Pilot ZZV2-λ — P0 statement-facts probe (r5-iteration4-backlog §12a; zzv2-lambda-prework
§2 milestone P0; ≤2 runs; statement facts only — no new mathematics, no proof attempts).
Elaborated INSIDE the built V2 tree (M4b2 recipe). Purpose: PIN
  (a) the exact hypotheses/range of the λ-generic transfer endpoints;
  (b) whether the Landau/pair-correlation side is η-generic or MT-frozen (load-bearing);
  (c) the functional's definition sites.
Kernel-only artifact posture; this file is a probe, not a proof artifact.
-/
import ZetaZeros

-- (c) definition sites: the admissibility structure, the kernel, the functional
#check @ZetaZeros.IsAdmissible
#check @ZetaZeros.testKernel
#check @ZetaZeros.unweightedKernelSum

-- (a) the λ-generic transfer endpoints and their exact binder sets
#check @ZetaZeros.simpleOnLineCount_lower
#check @ZetaZeros.distinctZeroCount_lower
#check @ZetaZeros.simpleZeroCount_add_onLineCount_lower
#check @ZetaZeros.simpleOrOnLineCount_lower

-- (b) the pair-correlation input side: the η-generic Prop + its proof + the ψ-generic
-- kernel asymptotic + the extremal layer (frozen window lives here)
#check @ZetaZeros.PairCorrelation
#check @ZetaZeros.pairCorrelationFormula
#check @ZetaZeros.IsPairTestFunction
#check @ZetaZeros.unweightedKernelSum_cutoffTest_tendsto
#check @ZetaZeros.IsCutoff
#check @ZetaZeros.cutoffTest
#check @ZetaZeros.cutoffSelfConv
#check @ZetaZeros.extremalTest
#check @ZetaZeros.extremalSelfConv

-- donor hygiene (P0 prints; triad expected on the consumed surface)
#print axioms ZetaZeros.simpleOnLineCount_lower
#print axioms ZetaZeros.distinctZeroCount_lower
#print axioms ZetaZeros.unweightedKernelSum_cutoffTest_tendsto
#print axioms ZetaZeros.pairCorrelationFormula
