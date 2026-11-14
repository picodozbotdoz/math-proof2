/-
Statement elaboration probe — not a proof artifact.
Probe G7b (donor round, 2026-11-13, G7 primary): openai-math's OWN 7/8 quasi-RH theorems,
elaborated and axiom-audited INSIDE the donor's Nonvanishing subtree built at the donor pin
(v4.34.1 / mathlib d13f23b7) on Modal (app crossmath-gprobe, function g7; tarball = pruned
2924-file closure). Axiom verdicts are pin-independent (they report the proof tree, not the
mathlib revision), so this audits donor hygiene without any v4.34→v4.36 porting.
Sources (read-only donor, /home/doz/zcode-workdir/openai-math/lean):
OAI/NumberTheory/DirichletL/Nonvanishing.lean:19 (Dirichlet form) and :29 (zeta form);
proof delegates to SevenEighths.ProbeFinalAssemblyUnconditional.
-/
import OAI.NumberTheory.DirichletL.Nonvanishing

/-! ## Direct-import signature checks -/

#check @OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re
#check @OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re

/-! ## Donor hygiene: axiom audit of the headlines -/

#print axioms OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re
#print axioms OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re

/-! ## The delegation root (the assembly layer the proofs sit on). -/

#print axioms OAI.SevenEighths.ProbeFinalAssemblyUnconditional.dirichlet_nonzero
#print axioms OAI.SevenEighths.ProbeFinalAssemblyUnconditional.zeta_nonzero
