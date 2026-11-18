/-
Pilot 75-N2 P1 — the ℚ dictionary glue (proof artifact).

CHARTER: orchestrator GO ruling of 2026-11-17 ("75-N2 P1 is GO — the dictionary
glue, executed by you"); dossier `research/candidates/75-N2-rayclass-dirichlet-consumer.md`
§Pilot spec skeleton (P1) + §Proof-strategy sketch steps 1–3; the P0 statement rung
GREEN at `pilots/75/logs/n2-p0-run4.log` (15/15 triad). A7 pre-shipping sweep folded
into the dossier 2026-11-17 (nearest-miss rows 2608.13637-Thm-B / D'Souza fork; the
dictionary is FORMALIZATION-novel only, classical per Milne — billing honored here).

HYGIENE CLASS: PROOF-ARTIFACT — zero sorry (every declaration below carries a
complete kernel proof; `#print axioms` per declaration at file end). Kernel-only,
math-proof1 standard: no sorry, no native_decide, no external CAS.

MILESTONES (incremental appends; this run = M1; the header records the plan):
  M1 (run 1) P1-a: the ℚ ideal classification (every nonzero ideal of 𝓞 ℚ = span {k},
        k > 0; `Rat.ringOfIntegersEquiv` + ℤ-PID `Ideal.span_singleton_generator`),
        the coprimality bridges (span {k} ⊔ span {q} = ⊤ ↔ IsUnit (k : ZMod q)), the
        c-trick residue-independence lemma (chi_span_residue), the dictionary
        character `ratCharOf` (via mathlib `MulChar.ofUnitHom`), and the value
        dictionary theorem (ALL k : ℕ, including k = 0, at 1 < q).
  M2 (run 2) P1-b: the L-series identification — the DZDF Hecke tsum over ideals of
        𝓞 ℚ = `DirichletCharacter.LFunction` of `ratCharOf` on ℜs > 1.
  M3 (run 3) P1-c/d: principality transfer, the q = 1 degeneracy lemma, the
        half-plane → ℂ∖{1} identity-theorem extension, the composed transfer.

FENCES (unchanged from P0): DZDF is DO-NOT-CONSUME as a build dependency — this file
consumes ONLY the statement-quotes (`IsDZDFRayClassCharacterQ`, `IsDZDFPrincipalQ`,
`HasQDirichletDictionary`, …) defined in `N2-P0.lean`, imported here via the staged
module copy `N2P0` (module-name workaround; the runner stages `N2-P0.lean` as
`N2P0.lean`; P0's file and record are untouched). zeta23 stays statement-port only.

RUN-2 NOTE (error classes fixed vs run 1, `logs/n2-p1-run1.log`): `RingHom.ext_int`
takes both homs explicitly; `symm_intCast` restated in RingHom-coe application form
(the `Ideal.map_span` output form — direct RingEquiv application is not a syntactic
match for rw); `Submodule.IsPrincipal.generator` (not `Ideal.generator`);
`Ideal.span_mul_span` + `Set.singleton_mul_singleton` (no `Ideal.span_mul` at this
pin); `(ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp` (explicit iff-args, not
dot-on-constant); `Units.isUnit`; `(Ideal.eq_top_iff_one _)`/`(Submodule.mem_sup)`
with parens; `ZMod.val_one`/`ZMod.nontrivial` are `Fact (1 < q)`-instance-governed
(haveI : Fact (1 < q)); `not_isUnit_zero` for the zero-corner.

RUN-9 NOTE (v9 fix pass, 2026-11-18 — the ONE post-closure diagnostic+fix+rerun
of the P1 charter; run 8 = the closure run, verdict 5 errors / 2 sorryAx with
exists_nat_span GREEN-triad, so M1 stands at 5/7): two persistent error classes
fixed, root causes read at the sibling mathlib source. (a) `⊢ 1 = 1` unsolved
(v7:310, v8:311): the hmod argument `((1 : ℕ) : ZMod q) = 1` proved by
`by push_cast` hits an OfNat-instance diamond — push_cast's closing rfl runs at
reducible transparency and cannot see the two `1`s defeq (Nat.cast_one's RHS-1
vs the binder's RHS-1, different instance paths, both printing as `1`). Fix:
`rw [ZMod.val_one]` (Fact (1 < q)-governed, `haveI iF := ⟨hq⟩`) then
`exact chi_span_eq_one … (Nat.cast_one)` — a TERM (default-transparency
unification), not a simp/rfl-at-reducible closer. The interim
`rw [chi_span_residue … (by …)]` form was also metavar-unsafe (its by-blocks
elaborate against unassigned ?a ?b) — removed. (b) `rw [MulChar.map_nonunit _ hk]`
(v7:352, v8:354 — "hk expected of sort Type"): rw's argument elaboration with the
`_` for χ fails before matching. Fix: χ explicit + `Eq.trans`-refine (defeq
unification, no pattern matching): `refine Eq.trans ?_ (MulChar.map_nonunit
(ratCharOf hχ hq) hk).symm`. Signatures verified at
`NumberTheory/MulChar/Basic.lean:130` (map_nonunit), `Data/Nat/Cast/Defs.lean:96`
(Nat.cast_one), `Data/ZMod/Basic.lean:640` (val_one), `Algebra/Group/Units/
Defs.lean:503` (IsUnit.unit_spec — used by the run-8-era then-branch rewrite,
`hk.unit`/`hk.unit_spec` + `MulChar.ofUnitHom_coe` at MulChar/Basic.lean:180).
RUN-9 VERDICT: descent 5→1; ratCharOf GREEN-triad (6/7). The one survivor
(hcoe, "motive is not type correct"): `rw [← hk.unit_spec]` abstracts ↑k inside
hk.unit's own elaboration (`@IsUnit.unit … ↑k hk`) — a DEPENDENT rewrite,
structurally impossible unscoped. v10 fix (on disk, to be verified by the M2
run): `conv_lhs => rw [← hk.unit_spec]` (the conv focus contains no `hk`),
then `exact MulChar.ofUnitHom_coe (chiUnitHom hχ hq) hk.unit` (default-
transparency defeq closes the coe chains; no rfl-at-reducible).

RUN-10 NOTE (M2 append + v10 verification ride-along, 2026-11-18): the M2 block
(P1-b, L-series identification) is appended per the dossier §Proof-strategy
step 2, with the v10 conv_lhs fix above verified by THIS run's audit block (the
7 M1 decls ride every elaboration). M2 API, all read at the sibling source this
session: `Ideal.absNorm_span_natCast` (RingTheory/Ideal/Norm/AbsNorm.lean:514,
`n ^ finrank ℤ S`), `NumberField.RingOfIntegers.rank` (NumberField/Basic.lean:415,
finrank ℤ (𝓞 K) = finrank ℚ K), `Module.finrank_self`, `Equiv.ofBijective`,
`Equiv.tsum_eq` (to_additive of `tprod_eq`, InfiniteSum/Basic.lean:558),
`tsum_congr` (to_additive of `tprod_congr`, :464), `LSeries.term_def₀`
(NumberTheory/LSeries/Basic.lean:81 — for `f 0 = 0` the summand IS
`f n * (n : ℂ) ^ (-s)`), `ZMod.LFunction_eq_LSeries` (NumberTheory/LSeries/ZMod.lean:94,
`1 < re s`-gated), `DirichletCharacter.LFunction` = `ZMod.LFunction` by def
(DirichletContinuation.lean:60). Design choices: the reindex is stated through
the EXPLICIT un-beta'd redex `(fun I => …) (he k)` (step-1 of the calc) so
`Equiv.tsum_eq`'s instantiation typechecks syntactically; the absNorm collapse
happens behind a full-form `show` (default-transparency defeq through the
ofBijective projection), never at rw-reducible level; the final bridge uses
`LSeries.term_def₀` + the definitional `LSeries`-unfold at `exact`, avoiding
any convergence-side work (tsum reindexing along an Equiv is unconditional).

RUN-16 NOTE (M3 append, 2026-11-18 — orchestrator re-task, fresh ≤6-run
budget): the M3 block (P1-c/d) per dossier §Proof-strategy steps 1(iii)/3:
principality transfer (`ratCharOf_eq_one_iff` — via `MulChar.ext` +
`MulChar.one_apply_coe`, sup-bridge and `Units.ne_zero`, all in-file/pinned);
q = 1 degeneracy (`isPrincipal_of_modulus_one` — `Unique (ZMod 1)` instance,
ZMod/Defs.lean:153); the identity-theorem extension
(`identity_theorem_extension`) — the DONOR'S VERBATIM PATTERN from
`DedekindZetaZeroFree/…/EntireAbelianQuotient.lean:34-49`, itself elaborated
on our pin: `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (Analysis/
Analytic/Uniqueness.lean:224, six-arg form) with
`isConnected_compl_singleton_of_one_lt_rank` (Analysis/Normed/Module/
Connected.lean:126) + `Complex.rank_real_complex` and seed z₀ = 2; the
composed dictionary (`hasQDirichletDictionary` — N2-a discharged);
the composed extension (`factorization_identity_extension` — products of
entire LFunctions via `Differentiable.fun_finsetProd` +
`DirichletCharacter.differentiable_LFunction`, P0's own call shape);
and the composed transfer (`dirichletFactorizationTransfer` — `choose`
over the family + `Finset.prod_congr` + the q=1-forced-triviality via
`ZMod.val_lt`+omega, NO dependent transport). STATEMENT-FIND (find-#4
precedent class, recorded in-decl + dossier + record): N2-P0's
`DirichletFactorizationTransferQ` as literally stated is NOT provable —
missing the nonprincipality hypothesis (counterexample class: principal
family, fK nonzero on the half-plane); M3-e carries `hnp` explicit and the
P0 amendment is owed.

mathlib pin ff2494ea @ v4.36.0-rc2.
-/
import N2P0

namespace CrossMath.Pilot75N2

open Set Finset Filter
open scoped NumberField Classical Topology

open CrossMath.Pilot75

/-! ## M0 — the ℚ ideal classification and cast toolkit

Everything reduces to one cast identity: the `Rat.ringOfIntegersEquiv.symm` ring hom
is the integer-cast ring hom (ring-hom uniqueness from ℤ), stated in the
RingHom-coe application form that `Ideal.map_span` produces. -/

private theorem symm_intCast (n : ℤ) :
    (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ) n = (n : 𝓞 ℚ) := by
  have h : ((Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ)) = Int.castRingHom (𝓞 ℚ) :=
    RingHom.ext_int _ _
  rw [h]
  simp

/-- Transport of a principal ℤ-ideal along the equiv. -/
private theorem map_span_int (n : ℤ) :
    Ideal.map (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ) (Ideal.span {n})
      = Ideal.span {(n : 𝓞 ℚ)} := by
  rw [Ideal.map_span, Set.image_singleton, symm_intCast]

/-- Round-trip: mapping an ideal of 𝓞 ℚ to ℤ and back is the identity. -/
private theorem map_symm_map (I : Ideal (𝓞 ℚ)) :
    Ideal.map (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ)
      (Ideal.map (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) I) = I := by
  rw [Ideal.map_map]
  have hcomp : (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ).comp
      (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) = RingHom.id (𝓞 ℚ) :=
    RingHom.ext fun x => Rat.ringOfIntegersEquiv.symm_apply_apply x
  rw [hcomp, Ideal.map_id]

/-- **The ℚ ideal classification**: every nonzero ideal of 𝓞 ℚ is the span of a
positive natural (its generator transported along `Rat.ringOfIntegersEquiv`; the ℤ-PID
`Ideal.span_singleton_generator` does the work; the generator's sign is absorbed by
`Ideal.span_singleton_neg`). -/
theorem exists_nat_span {I : Ideal (𝓞 ℚ)} (hI : I ≠ ⊥) :
    ∃ k : ℕ, 0 < k ∧ I = Ideal.span {(k : 𝓞 ℚ)} := by
  classical
  set g := Submodule.IsPrincipal.generator
    (Ideal.map (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) I) with hgdef
  have hgen : Ideal.map (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) I = Ideal.span {g} :=
    (Ideal.span_singleton_generator _).symm
  have hg0 : g ≠ 0 := by
    intro h0
    refine hI ?_
    have h1 : Ideal.map (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) I = ⊥ := by
      rw [hgen]
      exact (Ideal.span_singleton_eq_bot (α := ℤ) (x := g)).mpr h0
    have h2 : Ideal.map (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ)
        (Ideal.map (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) I) = ⊥ := by
      rw [h1, Ideal.map_bot]
    rw [map_symm_map] at h2
    exact h2
  refine ⟨g.natAbs, Int.natAbs_pos.mpr hg0, ?_⟩
  have step1 : I = Ideal.span {((g : ℤ) : 𝓞 ℚ)} := by
    rw [show I = Ideal.map (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ)
        (Ideal.map (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) I) from (map_symm_map I).symm,
      hgen, map_span_int]
  rw [step1]
  by_cases hpos : 0 ≤ g
  · have hg1 : ((g.natAbs : ℤ)) = g := by
      rw [Int.natCast_natAbs, abs_of_nonneg hpos]
    have hcast : ((g : ℤ) : 𝓞 ℚ) = ((g.natAbs : ℕ) : 𝓞 ℚ) := by
      conv_lhs => rw [← hg1]
      rw [Int.cast_natCast]
    exact congrArg (fun x => Ideal.span {x}) hcast
  · have hg2 : ((g : ℤ)) = -((g.natAbs : ℤ)) := by
      have h1 : ((g.natAbs : ℤ)) = -g := by
        rw [Int.natCast_natAbs, abs_of_nonpos (by omega)]
      linarith
    have hcast : ((g : ℤ) : 𝓞 ℚ) = (-(((g.natAbs : ℕ) : 𝓞 ℚ))) := by
      conv_lhs => rw [hg2]
      push_cast
      simp
    rw [hcast, Ideal.span_singleton_neg]

/-! ## M1 (P1-a) — the dictionary over ℤ: residue independence, construction, values -/

section Dictionary

variable {q : ℕ} {χ : Ideal (𝓞 ℚ) → ℂ}

/-- Natural casts are positive under every `φ : ℚ →+* ℝ`. -/
private theorem phi_pos (φ : ℚ →+* ℝ) {k : ℕ} (hk : 0 < k) : 0 < φ (k : ℚ) := by
  rw [map_natCast]
  exact_mod_cast hk

/-- **Congruence-one principal ideals evaluate to 1** (the DZDF `map_span'` field
applied over ℚ: total positivity is automatic for positive naturals). -/
theorem chi_span_eq_one (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ)
    (hq0 : q ≠ 0) {k : ℕ} (hk0 : 0 < k) (hmod : (k : ZMod q) = 1) :
    χ (Ideal.span {(k : 𝓞 ℚ)}) = 1 := by
  have iN : NeZero q := ⟨hq0⟩
  obtain ⟨hmul, htop, hzero, hspan⟩ := hχ
  refine hspan (k : 𝓞 ℚ) ?_ ?_ (fun φ => phi_pos φ hk0)
  · intro hcast
    have hE : (k : ℤ) = (0 : ℤ) := by
      simpa using congrArg (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) hcast
    omega
  · rw [Ideal.mem_span_singleton]
    have h1 : (((((k : ℤ) - 1 : ℤ))) : ZMod q) = 0 := by
      push_cast
      rw [sub_eq_zero]
      exact hmod
    have h2 : (q : ℤ) ∣ ((k : ℤ) - 1) := (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp h1
    have h3 : (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ) ((k : ℤ) - 1)
        = ((k : 𝓞 ℚ) - 1) := by
      rw [map_sub, symm_intCast, symm_intCast]
      push_cast
      simp
    have h4 : (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ) (q : ℤ) = (q : 𝓞 ℚ) := by
      rw [symm_intCast]
      push_cast
      simp
    rw [← h4, ← h3]
    exact map_dvd _ h2

/-- **Multiplicativity on principal ideals** (the DZDF `map_mul'` field). -/
theorem chi_span_mul (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ)
    (a b : ℕ) :
    χ (Ideal.span {(((a * b : ℕ) : 𝓞 ℚ))}) =
      χ (Ideal.span {(a : 𝓞 ℚ)}) * χ (Ideal.span {(b : 𝓞 ℚ)}) := by
  obtain ⟨hmul, htop, hzero, hspan⟩ := hχ
  have h := hmul (Ideal.span {(a : 𝓞 ℚ)}) (Ideal.span {(b : 𝓞 ℚ)})
  rw [Ideal.span_mul_span, Set.singleton_mul_singleton, ← Nat.cast_mul] at h
  exact h

/-- A unit of `ZMod q` has a natural representative of its inverse
(the lifted value of the inverse unit). -/
private theorem exists_mul_inv (hq0 : q ≠ 0) {k : ℕ} (h : IsUnit ((k : ZMod q))) :
    ∃ c : ℕ, (k * c : ZMod q) = 1 ∧ IsUnit ((c : ZMod q)) := by
  have iN : NeZero q := ⟨hq0⟩
  obtain ⟨u, hu⟩ := h
  have hkc : ((k : ZMod q)) * ((↑(u⁻¹ : (ZMod q)ˣ) : ZMod q)) = 1 := by
    rw [← hu, Units.mul_inv]
  refine ⟨(↑(u⁻¹ : (ZMod q)ˣ) : ZMod q).val, ?_, ?_⟩
  · rw [ZMod.natCast_zmod_val]
    exact hkc
  · rw [ZMod.natCast_zmod_val]
    exact Units.isUnit _

/-- **Coprimality bridge (forward)**: a unit residue witnesses sup = ⊤
(the Bézout certificate is manufactured from the inverse modulo q). -/
private theorem sup_eq_top_of_isUnit (hq0 : q ≠ 0) {k : ℕ} (h : IsUnit ((k : ZMod q))) :
    Ideal.span {(k : 𝓞 ℚ)} ⊔ Ideal.span {(q : 𝓞 ℚ)} = ⊤ := by
  have iN : NeZero q := ⟨hq0⟩
  obtain ⟨c, hc, _⟩ := exists_mul_inv hq0 h
  have hdvd : (q : ℤ) ∣ ((k : ℤ) * (c : ℤ) - 1) := by
    have h1 : (((((k : ℤ) * (c : ℤ) - 1 : ℤ))) : ZMod q) = 0 := by
      push_cast
      rw [sub_eq_zero]
      simpa using hc
    exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ _).mp h1
  obtain ⟨t, ht⟩ := hdvd
  have hO : ((k : 𝓞 ℚ) * (c : 𝓞 ℚ) - 1) = ((q : 𝓞 ℚ) * ((t : 𝓞 ℚ))) := by
    have hE := congrArg (Rat.ringOfIntegersEquiv.symm : ℤ →+* 𝓞 ℚ) ht
    rw [map_sub, map_one, map_mul, map_mul, symm_intCast, symm_intCast, symm_intCast,
      symm_intCast] at hE
    exact hE
  refine (Ideal.eq_top_iff_one _).mpr (Submodule.mem_sup.mpr
    ⟨(k : 𝓞 ℚ) * (c : 𝓞 ℚ), Ideal.mem_span_singleton.mpr ⟨(c : 𝓞 ℚ), rfl⟩,
      -((q : 𝓞 ℚ) * ((t : 𝓞 ℚ))),
      Ideal.mem_span_singleton.mpr ⟨(-((t : 𝓞 ℚ))), by ring⟩, ?_⟩)
  linear_combination hO

/-- **Coprimality bridge (backward)**: sup = ⊤ forces a unit residue (transport the
Bézout identity to ℤ along the equiv, then reduce mod q). -/
private theorem isUnit_of_sup_eq_top (hq0 : q ≠ 0) {k : ℕ}
    (h : Ideal.span {(k : 𝓞 ℚ)} ⊔ Ideal.span {(q : 𝓞 ℚ)} = ⊤) : IsUnit ((k : ZMod q)) := by
  have iN : NeZero q := ⟨hq0⟩
  obtain ⟨y, hy, z, hz, hyz⟩ := Submodule.mem_sup.mp ((Ideal.eq_top_iff_one _).mp h)
  obtain ⟨x, hx⟩ := Ideal.mem_span_singleton.mp hy
  obtain ⟨w, hw⟩ := Ideal.mem_span_singleton.mp hz
  rw [hx, hw] at hyz
  have hE : ((k : ℤ) * (Rat.ringOfIntegersEquiv x)
      + (q : ℤ) * (Rat.ringOfIntegersEquiv w)) = 1 := by
    have hmap := congrArg (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) hyz
    simp only [map_add, map_mul, map_one, map_natCast] at hmap
    exact hmap
  have hZ : ((k : ZMod q)) * (((Rat.ringOfIntegersEquiv x : ℤ) : ZMod q)) = 1 := by
    have h1 := congrArg (fun n : ℤ => (n : ZMod q)) hE
    push_cast at h1
    rw [ZMod.natCast_self, zero_mul, add_zero] at h1
    exact h1
  exact ⟨⟨((k : ZMod q)), (((Rat.ringOfIntegersEquiv x : ℤ) : ZMod q)), hZ,
      by rw [mul_comm]; exact hZ⟩, rfl⟩

/-- **Unit residues give nonzero values** (the DZDF `eq_zero_iff'` field, forward
direction, via the sup bridge). Requires `1 < q` (at q = 1 the zero ideal carries the
unit residue — the degenerate corner the dictionary excludes). -/
theorem chi_span_ne_zero (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ)
    (hq : 1 < q) {k : ℕ} (h : IsUnit ((k : ZMod q))) :
    χ (Ideal.span {(k : 𝓞 ℚ)}) ≠ 0 := by
  have hq0 : q ≠ 0 := by omega
  have iN : NeZero q := ⟨hq0⟩
  haveI iF : Fact (1 < q) := ⟨hq⟩
  obtain ⟨hmul, htop, hzero, hspan⟩ := hχ
  intro h0
  rcases (hzero _).mp h0 with hbot | hsup
  · have hk0 : ((k : 𝓞 ℚ)) = 0 :=
      (Ideal.span_singleton_eq_bot (α := 𝓞 ℚ) (x := ((k : 𝓞 ℚ)))).mp hbot
    have hk0' : (k : ℤ) = 0 := by
      simpa using congrArg (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) hk0
    have hkz : k = 0 := by omega
    subst hkz
    exact absurd h (by rw [Nat.cast_zero]; exact not_isUnit_zero)
  · exact hsup (sup_eq_top_of_isUnit hq0 h)

/-- Unit residues come from positive naturals. -/
private theorem pos_of_isUnit (hq : 1 < q) {k : ℕ} (h : IsUnit ((k : ZMod q))) :
    0 < k := by
  have iN : NeZero q := ⟨by omega⟩
  haveI iF : Fact (1 < q) := ⟨hq⟩
  by_contra hk0
  have hk : k = 0 := by omega
  subst hk
  exact absurd h (by rw [Nat.cast_zero]; exact not_isUnit_zero)

/-- **The c-trick (residue independence)**: the ideal value depends only on the
residue mod q. For a ≡ b (both unit residues), pick c with b·c ≡ 1; then χ(a)χ(c) =
χ(ac) = 1 = χ(bc) = χ(b)χ(c) and χ(c) ≠ 0, so χ(a) = χ(b). This is the well-definedness
of the DZDF character on ray classes of ℚ. -/
theorem chi_span_residue (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ)
    (hq : 1 < q) {a b : ℕ} (hab : ((a : ZMod q)) = ((b : ZMod q)))
    (ha : IsUnit ((a : ZMod q))) :
    χ (Ideal.span {(a : 𝓞 ℚ)}) = χ (Ideal.span {(b : 𝓞 ℚ)}) := by
  have hq0 : q ≠ 0 := by omega
  have iN : NeZero q := ⟨hq0⟩
  have hb : IsUnit ((b : ZMod q)) := by rw [← hab]; exact ha
  obtain ⟨c, hc, hcu⟩ := exists_mul_inv hq0 hb
  have hcpos : 0 < c := pos_of_isUnit hq hcu
  have hca : ((a * c : ℕ) : ZMod q) = 1 := by
    have h1 : ((a : ZMod q)) * ((c : ZMod q)) = ((b : ZMod q)) * ((c : ZMod q)) := by
      rw [hab]
    rw [Nat.cast_mul, h1, hc]
  have key : ∀ x : ℕ, 0 < x → ((x * c : ℕ) : ZMod q) = 1 →
      χ (Ideal.span {(x : 𝓞 ℚ)}) * χ (Ideal.span {(c : 𝓞 ℚ)}) = 1 := by
    intro x hx hxc
    have hmulx := chi_span_mul (q := q) hχ x c
    have h1 : χ (Ideal.span {(((x * c : ℕ) : 𝓞 ℚ))}) = 1 :=
      chi_span_eq_one hχ hq0 (Nat.mul_pos hx hcpos) hxc
    rw [h1] at hmulx
    exact hmulx.symm
  have h1 := key a (pos_of_isUnit hq ha) hca
  have h2 := key b (pos_of_isUnit hq hb) (by rw [Nat.cast_mul]; exact hc)
  exact mul_right_cancel₀ (chi_span_ne_zero hχ hq hcu) (h1.trans h2.symm)

/-- The unit-group homomorphism underlying the dictionary character. -/
private noncomputable def chiUnitHom (hχ : IsDZDFRayClassCharacterQ
    (Ideal.span {(q : 𝓞 ℚ)}) χ) (hq : 1 < q) : ((ZMod q)ˣ →* ℂˣ) where
  toFun u := Units.mk0 (χ (Ideal.span {(((u : ZMod q).val : ℕ) : 𝓞 ℚ)}))
    (chi_span_ne_zero hχ hq (by
      haveI iN : NeZero q := ⟨by omega⟩
      rw [ZMod.natCast_zmod_val]
      exact Units.isUnit u))
  map_one' := by
    have iN : NeZero q := ⟨by omega⟩
    haveI iF : Fact (1 < q) := ⟨hq⟩
    apply Units.ext
    show χ (Ideal.span {(↑(((1 : ZMod q).val) : ℕ) : 𝓞 ℚ)}) = (1 : ℂ)
    rw [ZMod.val_one]
    exact chi_span_eq_one hχ (by omega) (by norm_num) (Nat.cast_one)
  map_mul' u v := by
    have iN : NeZero q := ⟨by omega⟩
    apply Units.ext
    have hcongr : (↑(((u * v : (ZMod q)ˣ) : ZMod q).val) : ZMod q)
        = (↑(((u : ZMod q).val) * ((v : ZMod q).val)) : ZMod q) := by
      simp only [ZMod.natCast_zmod_val, Nat.cast_mul, Units.val_mul]
    show χ (Ideal.span {(↑(((u * v : (ZMod q)ˣ) : ZMod q).val) : 𝓞 ℚ)}) =
      χ (Ideal.span {((↑((u : ZMod q).val) : 𝓞 ℚ))}) *
        χ (Ideal.span {((↑((v : ZMod q).val) : 𝓞 ℚ))})
    rw [chi_span_residue hχ hq hcongr
        (by simp only [ZMod.natCast_zmod_val]; exact Units.isUnit _),
      chi_span_mul hχ _ _]

/-- **The dictionary character χ̂ (P1-a)**: the DZDF-quoted character of span {q}
read as a Dirichlet character, via mathlib's `MulChar.ofUnitHom` (values on units =
the residue-independent ideal values; 0 off units). -/
noncomputable def ratCharOf (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ)
    (hq : 1 < q) : DirichletCharacter ℂ q :=
  MulChar.ofUnitHom (chiUnitHom hχ hq)

/-- **The value dictionary**: `ratCharOf` at a residue is the ideal value at the
corresponding principal span — for ALL naturals k, including k = 0 and non-coprime k
(both sides vanish there, via the DZDF `eq_zero_iff'` field and the sup bridge). -/
theorem ratCharOf_apply (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ)
    (hq : 1 < q) (k : ℕ) :
    χ (Ideal.span {(((k : ℕ) : 𝓞 ℚ))}) = ratCharOf hχ hq ((k : ZMod q)) := by
  have hq0 : q ≠ 0 := by omega
  have iN : NeZero q := ⟨hq0⟩
  obtain ⟨hmul, htop, hzero, hspan⟩ := id hχ
  by_cases hk : IsUnit (((k : ZMod q)))
  · have hcoe : ratCharOf hχ hq ((k : ZMod q))
        = χ (Ideal.span {(↑(((hk.unit : ZMod q).val) : ℕ) : 𝓞 ℚ)}) := by
      show (MulChar.ofUnitHom (chiUnitHom hχ hq)) ((k : ZMod q)) = _
      conv_lhs => rw [← hk.unit_spec]
      exact MulChar.ofUnitHom_coe (chiUnitHom hχ hq) hk.unit
    have hres : χ (Ideal.span {(↑(((hk.unit : ZMod q).val) : ℕ) : 𝓞 ℚ)})
        = χ (Ideal.span {(((k : ℕ) : 𝓞 ℚ))}) := by
      refine chi_span_residue hχ hq ?_ ?_
      · rw [ZMod.natCast_zmod_val]; exact hk.unit_spec
      · rw [ZMod.natCast_zmod_val]; exact Units.isUnit hk.unit
    rw [hcoe, hres]
  · refine Eq.trans ?_ (MulChar.map_nonunit (ratCharOf hχ hq) hk).symm
    exact (hzero _).mpr (Or.inr (fun hsup => hk (isUnit_of_sup_eq_top hq0 hsup)))

/-! ### M2 (P1-b) — the L-series identification

The Hecke tsum of the DZDF-quoted character over the ideals of 𝓞 ℚ reindexes along
the bijection `k ↦ span {k}` (every ideal of 𝓞 ℚ is principal-positive, M1's
`exists_nat_span` + the zero corner), collapses via `absNorm (span {k}) = k`
(rank one), reads through the value dictionary (`ratCharOf_apply`), and lands on
`LSeries.term_def₀` (the `f 0 = 0` spelling) = `LSeries` = `ZMod.LFunction` =
`DirichletCharacter.LFunction`. -/

/-- The ℤ-rank of 𝓞 ℚ is one (`NumberField.RingOfIntegers.rank` at K = ℚ). -/
private theorem finrank_rat_one : Module.finrank ℤ (𝓞 ℚ) = 1 := by
  rw [NumberField.RingOfIntegers.rank, Module.finrank_self]

/-- The absNorm dictionary on principal spans: the absolute norm of the ideal
generated by a natural is the natural itself (rank one: `k ^ 1 = k`). -/
private theorem absNorm_span_nat (k : ℕ) :
    Ideal.absNorm (Ideal.span {((k : ℕ) : 𝓞 ℚ)}) = k := by
  rw [Ideal.absNorm_span_natCast, finrank_rat_one, pow_one]

/-- The span map is surjective onto the ideals of 𝓞 ℚ (M1's classification plus
the zero corner `span {0} = ⊥`). -/
private theorem surj_span : ∀ I : Ideal (𝓞 ℚ), ∃ k : ℕ,
    Ideal.span {((k : ℕ) : 𝓞 ℚ)} = I := by
  intro I
  by_cases hI : I = ⊥
  · refine ⟨0, ?_⟩
    rw [hI]
    exact (Ideal.span_singleton_eq_bot (α := 𝓞 ℚ) (x := ((0 : ℕ) : 𝓞 ℚ))).mpr
      (by rw [Nat.cast_zero])
  · obtain ⟨k, -, hk⟩ := exists_nat_span hI
    exact ⟨k, hk.symm⟩

-- (maxHeartbeats raised 3× for the theorem below: the statement's L-function
-- import closure plus the four-step calc exhausted the 200k default at runs
-- 10–12 — elaboration budget only, no proof semantics.)
set_option maxHeartbeats 600000 in
/-- **M2 (P1-b): the L-series identification** — the DZDF Hecke tsum over the ideals
of 𝓞 ℚ equals the mathlib Dirichlet L-function of the dictionary character on the
half-plane ℜs > 1. This is the second component of `HasQDirichletDictionary`
(`N2-P0.lean`): the factorization donor's Hecke series, read through the value
dictionary, IS the mathlib L-function. -/
theorem heckeTsum_eq_ratCharOf_LFunction
    (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ) (hq : 1 < q)
    {s : ℂ} (hs : 1 < s.re) :
    ∑' I : Ideal (𝓞 ℚ), χ I * (Ideal.absNorm I : ℂ) ^ (-s)
      = @DirichletCharacter.LFunction q ⟨by omega⟩ (ratCharOf hχ hq) s := by
  have hq0 : q ≠ 0 := by omega
  have iN : NeZero q := ⟨hq0⟩
  obtain ⟨hmul, htop, hzero, hspan⟩ := id hχ
  have hbot : Ideal.span {(((0 : ℕ) : 𝓞 ℚ))} = ⊥ :=
    (Ideal.span_singleton_eq_bot (α := 𝓞 ℚ) (x := ((0 : ℕ) : 𝓞 ℚ))).mpr
      (by rw [Nat.cast_zero])
  -- the ideals of 𝓞 ℚ are exactly the spans of naturals: a bijection ℕ ≃ Ideal (𝓞 ℚ)
  -- (`let`, not `have`: the per-k reindex needs the definition transparent)
  let he : ℕ ≃ Ideal (𝓞 ℚ) :=
    Equiv.ofBijective (fun k : ℕ => Ideal.span {((k : ℕ) : 𝓞 ℚ)})
      ⟨fun k k' h => by
        have h2 := congrArg Ideal.absNorm h
        rw [absNorm_span_nat, absNorm_span_nat] at h2
        exact h2,
      surj_span⟩
  calc ∑' I : Ideal (𝓞 ℚ), χ I * (Ideal.absNorm I : ℂ) ^ (-s)
      = ∑' k : ℕ, (fun I : Ideal (𝓞 ℚ) => χ I * (Ideal.absNorm I : ℂ) ^ (-s)) (he k) :=
        (Equiv.tsum_eq he (fun I : Ideal (𝓞 ℚ) => χ I * (Ideal.absNorm I : ℂ) ^ (-s))).symm
    _ = ∑' k : ℕ, χ (Ideal.span {((k : ℕ) : 𝓞 ℚ)}) * ((k : ℕ) : ℂ) ^ (-s) :=
        tsum_congr fun k => by
          show χ (Ideal.span {((k : ℕ) : 𝓞 ℚ)})
              * ((Ideal.absNorm (Ideal.span {((k : ℕ) : 𝓞 ℚ)}) : ℂ)) ^ (-s)
              = χ (Ideal.span {((k : ℕ) : 𝓞 ℚ)}) * ((k : ℕ) : ℂ) ^ (-s)
          rw [absNorm_span_nat]
    _ = ∑' k : ℕ, ratCharOf hχ hq ((k : ZMod q)) * ((k : ℕ) : ℂ) ^ (-s) :=
        tsum_congr fun k => by rw [ratCharOf_apply hχ hq k]
    _ = @DirichletCharacter.LFunction q ⟨by omega⟩ (ratCharOf hχ hq) s := by
        have hf0 : (fun n : ℕ => ratCharOf hχ hq ((n : ZMod q))) 0 = 0 := by
          show ratCharOf hχ hq ((0 : ℕ) : ZMod q) = 0
          rw [← ratCharOf_apply hχ hq 0, hbot]
          exact (hzero ⊥).mpr (Or.inl rfl)
        have hLS : LSeries (fun n : ℕ => ratCharOf hχ hq ((n : ZMod q))) s
            = ∑' k : ℕ, ratCharOf hχ hq ((k : ZMod q)) * ((k : ℕ) : ℂ) ^ (-s) := by
          rw [show LSeries (fun n : ℕ => ratCharOf hχ hq ((n : ZMod q))) s
              = ∑' n : ℕ, LSeries.term (fun n : ℕ => ratCharOf hχ hq ((n : ZMod q))) s n
              from rfl]
          exact tsum_congr fun k =>
            @LSeries.term_def₀ (fun n : ℕ => ratCharOf hχ hq ((n : ZMod q))) hf0 s k
        rw [← hLS, ← ZMod.LFunction_eq_LSeries (ratCharOf hχ hq) hs]
        rfl

/-! ### M3 (P1-c/d) — principality transfer, the q = 1 degeneracy, the
identity-theorem extension, the composed transfer -/

/-- Cast-zero transport for the ℚ ideal layer (used at `span {↑k} ≠ ⊥`). -/
private theorem natCast_eq_zero_iff {k : ℕ} : ((k : ℕ) : 𝓞 ℚ) = 0 ↔ k = 0 := by
  constructor
  · intro h
    have h2 : (Rat.ringOfIntegersEquiv : 𝓞 ℚ →+* ℤ) ((k : ℕ) : 𝓞 ℚ) = 0 := by
      rw [h, map_zero]
    rw [map_natCast] at h2
    omega
  · intro h
    rw [h, Nat.cast_zero]

/-- **M3-a (P1-c, principality transfer)** — dictionary component (iii): the
DZDF character is trivial on the coprime cone iff the Dirichlet character it
induces is trivial (so DZDF nonprincipality delivers the `ψ ≠ 1` that the
engine's entireness input needs). -/
theorem ratCharOf_eq_one_iff (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ)
    (hq : 1 < q) :
    IsDZDFPrincipalQ (Ideal.span {(q : 𝓞 ℚ)}) χ ↔ ratCharOf hχ hq = 1 := by
  have hq0 : q ≠ 0 := by omega
  have iN : NeZero q := ⟨hq0⟩
  haveI iF : Fact (1 < q) := ⟨hq⟩
  constructor
  · intro hpr
    refine MulChar.ext fun u => ?_
    have huv : ratCharOf hχ hq ((u : ZMod q))
        = χ (Ideal.span {(((u : ZMod q).val : ℕ) : 𝓞 ℚ)}) := by
      show (MulChar.ofUnitHom (chiUnitHom hχ hq)) ((u : ZMod q)) = _
      rw [MulChar.ofUnitHom_coe]
      rfl
    have hvne : ((u : ZMod q).val : ℕ) ≠ 0 := by
      intro h0
      refine Units.ne_zero u ?_
      have hcoe : ((u : ZMod q)) = (((u : ZMod q).val : ℕ) : ZMod q) :=
        (ZMod.natCast_zmod_val (u : ZMod q)).symm
      rw [hcoe, h0, Nat.cast_zero]
    have hne : Ideal.span {(((u : ZMod q).val : ℕ) : 𝓞 ℚ)} ≠ ⊥ := fun hbot =>
      hvne (natCast_eq_zero_iff.mp
        ((Ideal.span_singleton_eq_bot (α := 𝓞 ℚ) (x := ((u : ZMod q).val : ℕ))).mp hbot))
    have hsup : Ideal.span {(((u : ZMod q).val : ℕ) : 𝓞 ℚ)} ⊔ Ideal.span {(q : 𝓞 ℚ)} = ⊤ := by
      refine sup_eq_top_of_isUnit hq0 ?_
      rw [ZMod.natCast_zmod_val]
      exact Units.isUnit u
    rw [huv, hpr _ hne hsup, MulChar.one_apply_coe]
  · intro h1 I hI hsup
    obtain ⟨k, hk0, hk⟩ := exists_nat_span hI
    rw [hk, ratCharOf_apply hχ hq k, h1]
    rw [hk] at hsup
    have hu : IsUnit (((k : ℕ) : ZMod q)) := isUnit_of_sup_eq_top hq0 hsup
    rw [← hu.unit_spec, MulChar.one_apply_coe]

/-- **M3-b (P1-c, the q = 1 degeneracy)** — at the modulus (1) of 𝓞 ℚ every
DZDF ray-class character is already principal (`ZMod 1` is a subsingleton:
every k satisfies k ≡ 1 mod 1, so `chi_span_eq_one` fires unconditionally).
This is what forces q > 1 in any nonprincipal factorization family. -/
theorem isPrincipal_of_modulus_one (hχ : IsDZDFRayClassCharacterQ
    (Ideal.span {((1 : ℕ) : 𝓞 ℚ)}) χ) :
    IsDZDFPrincipalQ (Ideal.span {((1 : ℕ) : 𝓞 ℚ)}) χ := by
  intro I hI _
  obtain ⟨k, hk0, hk⟩ := exists_nat_span hI
  rw [hk]
  exact chi_span_eq_one hχ one_ne_zero hk0 (Subsingleton.elim _ _)

/-- **M3-c (P1-c, the identity-theorem extension)** — the DZDF
`EntireAbelianQuotient.lean:34–49` pattern: two functions differentiable on
ℂ∖{1} that agree on the half-plane ℜs > 1 agree everywhere off {1} (the
punctured plane is connected — `isConnected_compl_singleton_of_one_lt_rank` —
and the agreement spreads from the seed point z₀ = 2 via
`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`). -/
theorem identity_theorem_extension {f g : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f ({1}ᶜ : Set ℂ)) (hg : DifferentiableOn ℂ g ({1}ᶜ : Set ℂ))
    (hEq : ∀ s : ℂ, 1 < s.re → f s = g s) : ∀ s : ℂ, s ≠ 1 → f s = g s := by
  have hmain : Set.EqOn f g ({1}ᶜ : Set ℂ) :=
    AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq (𝕜 := ℂ)
      (hf.analyticOnNhd isOpen_compl_singleton)
      (hg.analyticOnNhd isOpen_compl_singleton)
      ((isConnected_compl_singleton_of_one_lt_rank
        (by rw [Complex.rank_real_complex]; norm_num) (1 : ℂ)).isPreconnected)
      (z₀ := (2 : ℂ))
      (by simp)
      (Filter.eventually_of_mem
        ((Complex.continuous_re.isOpen_preimage (Set.Ioi 1) isOpen_Ioi).mem_nhds
          (by simp : 1 < (2 : ℂ).re)) fun s hs => hEq s hs)
  exact fun s hs => hmain (by simpa using hs)

/-- **M3-d (P1-c, the composed dictionary)** — the N2-a dictionary Prop is
discharged at every `1 < q`: `HasQDirichletDictionary` holds with the
canonical ψ := ratCharOf (components (i) `ratCharOf_apply`, (ii)
`heckeTsum_eq_ratCharOf_LFunction`, (iii) `ratCharOf_eq_one_iff`). -/
theorem hasQDirichletDictionary (hχ : IsDZDFRayClassCharacterQ (Ideal.span {(q : 𝓞 ℚ)}) χ)
    (hq : 1 < q) : HasQDirichletDictionary (Ideal.span {(q : 𝓞 ℚ)}) χ :=
  ⟨q, by omega, rfl, ratCharOf hχ hq,
    ratCharOf_apply hχ hq,
    fun s hs => heckeTsum_eq_ratCharOf_LFunction hχ hq hs,
    ratCharOf_eq_one_iff hχ hq⟩

/-- **M3-c2 (P1-c, the composed identity extension)** — M3-c applied to the
factorization identity: with every component nontrivial (hence entire), the
half-plane factorization `fL = (∏ LFunction) * fK` extends to all of ℂ∖{1} —
exactly the `hAbFacQ` binder shape the P0/engine layer consumes. -/
theorem factorization_identity_extension {fK fL : ℂ → ℂ} {n : ℕ} {q : Fin n → ℕ}
    {ψ : (i : Fin n) → DirichletCharacter ℂ (q i)} (hN : ∀ i, NeZero (q i))
    (hne : ∀ i, ψ i ≠ 1)
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ) (hL : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fL ρ)
    (hfac : ∀ s : ℂ, 1 < s.re →
      fL s = (∏ i, @DirichletCharacter.LFunction (q i) (hN i) (ψ i) s) * fK s) :
    ∀ s : ℂ, s ≠ 1 →
      fL s = (∏ i, @DirichletCharacter.LFunction (q i) (hN i) (ψ i) s) * fK s := by
  have hg : Differentiable ℂ
      (fun s => ∏ i, @DirichletCharacter.LFunction (q i) (hN i) (ψ i) s) :=
    Differentiable.fun_finsetProd (u := (Finset.univ : Finset (Fin n))) fun i _ =>
      @DirichletCharacter.differentiable_LFunction (q i) (hN i) (ψ i) (hne i)
  exact identity_theorem_extension
    (fun ρ hρ => (hL ρ hρ).differentiableAt.differentiableWithinAt)
    (fun ρ hρ =>
      ((hg.differentiableAt (x := ρ)).mul ((hK ρ hρ).differentiableAt)).differentiableWithinAt)
    hfac

/-- **M3-e (P1-d, the composed factorization transfer)** — the dictionary
converts the Hecke-form factorization into the Dirichlet-LFunction form with
the nonprincipality scope `1 < q i ∧ ψ i ≠ 1`.

STATEMENT-FIND (recorded for the P0 amendment; the find-#4 precedent class):
`N2-P0.lean`'s `DirichletFactorizationTransferQ` as literally stated is NOT
provable — its hypothesis list omits the nonprincipality input. For a
principal family (e.g. the trivial character at modulus (2), fK := ζ-side,
fL := Hecke·fK nonzero on the half-plane) the conclusion's `ψ i ≠ 1` would
force `LFunction (ψ ≠ 1) = principal-Hecke` on ℜs > 1, contradicting
coefficient comparison; the DZDF factorization's own `∀ i, ¬IsDZDFPrincipalQ`
is the intended input and appears here as an explicit hypothesis `hnp`. -/
theorem dirichletFactorizationTransfer {fK fL : ℂ → ℂ} {n : ℕ}
    {m : Fin n → Ideal (𝓞 ℚ)} {χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ}
    (hdic : ∀ i, HasQDirichletDictionary (m i) (χ i))
    (hnp : ∀ i, ¬ IsDZDFPrincipalQ (m i) (χ i))
    (hfac : ∀ s : ℂ, 1 < s.re →
      fL s = (∏ i, ∑' I : Ideal (𝓞 ℚ), χ i I * (Ideal.absNorm I : ℂ) ^ (-s)) * fK s) :
    ∃ (q : Fin n → ℕ) (hN : ∀ i, NeZero (q i)) (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)),
      (∀ i, 1 < q i ∧ ψ i ≠ 1) ∧
      ∀ s : ℂ, 1 < s.re →
        fL s = (∏ i, @DirichletCharacter.LFunction (q i) (hN i) (ψ i) s) * fK s := by
  choose q hq hm ψ hval hLS hpr using hdic
  have hN : ∀ i, NeZero (q i) := fun i => ⟨hq i⟩
  refine ⟨q, hN, ψ, fun i => ?_, fun s hs => ?_⟩
  · refine ⟨?_, fun h => hnp i ((hpr i).mpr h)⟩
    rcases Nat.lt_or_ge 1 (q i) with h | h
    · exact h
    · exfalso
      have hqi := hq i
      have hq1 : q i = 1 := by omega
      haveI iN' : NeZero (q i) := ⟨hq i⟩
      have hzsub : ∀ x y : ZMod (q i), x = y := by
        intro x y
        have hx : x = ((x.val : ℕ) : ZMod (q i)) := (ZMod.natCast_zmod_val x).symm
        have hy : y = ((y.val : ℕ) : ZMod (q i)) := (ZMod.natCast_zmod_val y).symm
        rw [hx, hy]
        have h1 : x.val = 0 := by
          have hv := ZMod.val_lt x
          omega
        have h2 : y.val = 0 := by
          have hv := ZMod.val_lt y
          omega
        rw [h1, h2]
      have hψ1 : ψ i = 1 := by
        refine MulChar.ext fun u => ?_
        have hz : ((u : ZMod (q i))) = 1 := hzsub _ _
        have hl : ψ i ((u : ZMod (q i))) = ψ i 1 := by rw [hz]
        rw [hl, map_one (ψ i), MulChar.one_apply_coe]
      exact hnp i ((hpr i).mpr hψ1)
  · rw [hfac s hs]
    have hprod : (∏ i : Fin n, ∑' I : Ideal (𝓞 ℚ), χ i I * (Ideal.absNorm I : ℂ) ^ (-s))
        = ∏ i : Fin n, @DirichletCharacter.LFunction (q i) (hN i) (ψ i) s :=
      Finset.prod_congr rfl fun i _ => hLS i s hs
    rw [hprod]

end Dictionary

-- audit (expect: [propext, Classical.choice, Quot.sound] only; 0 sorryAx)
#print axioms CrossMath.Pilot75N2.exists_nat_span
#print axioms CrossMath.Pilot75N2.chi_span_eq_one
#print axioms CrossMath.Pilot75N2.chi_span_mul
#print axioms CrossMath.Pilot75N2.chi_span_ne_zero
#print axioms CrossMath.Pilot75N2.chi_span_residue
#print axioms CrossMath.Pilot75N2.ratCharOf
#print axioms CrossMath.Pilot75N2.ratCharOf_apply
#print axioms CrossMath.Pilot75N2.heckeTsum_eq_ratCharOf_LFunction
#print axioms CrossMath.Pilot75N2.ratCharOf_eq_one_iff
#print axioms CrossMath.Pilot75N2.isPrincipal_of_modulus_one
#print axioms CrossMath.Pilot75N2.identity_theorem_extension
#print axioms CrossMath.Pilot75N2.hasQDirichletDictionary
#print axioms CrossMath.Pilot75N2.factorization_identity_extension
#print axioms CrossMath.Pilot75N2.dirichletFactorizationTransfer

end CrossMath.Pilot75N2
