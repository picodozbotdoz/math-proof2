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
    haveI iF : Fact (1 < q) := ⟨hq⟩
    apply Units.ext
    have h2 : χ (Ideal.span {(((1 : ℕ) : 𝓞 ℚ))}) = 1 :=
      chi_span_eq_one hχ (by omega) (by norm_num) (by push_cast)
    show χ (Ideal.span {((((1 : ZMod q).val : ℕ) : 𝓞 ℚ))}) = (1 : ℂ)
    rw [ZMod.val_one]
    push_cast
    exact h2
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
  · show χ (Ideal.span {(((k : ℕ) : 𝓞 ℚ))}) =
      (MulChar.ofUnitHom (chiUnitHom hχ hq)) ((k : ZMod q))
    rw [← hk.unit_spec, MulChar.ofUnitHom_coe]
    show χ (Ideal.span {(((k : ℕ) : 𝓞 ℚ))}) =
      χ (Ideal.span {(↑((hk.unit : ZMod q).val) : 𝓞 ℚ)})
    rw [chi_span_residue hχ hq
        (by simp only [ZMod.natCast_zmod_val]; exact hk.unit_spec)
      (by simp only [ZMod.natCast_zmod_val]; exact Units.isUnit hk.unit)]
  · rw [map_nonunit _ hk]
    exact (hzero _).mpr (Or.inr (fun hsup => hk (isUnit_of_sup_eq_top hq0 hsup)))

end Dictionary

-- audit (expect: [propext, Classical.choice, Quot.sound] only; 0 sorryAx)
#print axioms CrossMath.Pilot75N2.exists_nat_span
#print axioms CrossMath.Pilot75N2.chi_span_eq_one
#print axioms CrossMath.Pilot75N2.chi_span_mul
#print axioms CrossMath.Pilot75N2.chi_span_ne_zero
#print axioms CrossMath.Pilot75N2.chi_span_residue
#print axioms CrossMath.Pilot75N2.ratCharOf
#print axioms CrossMath.Pilot75N2.ratCharOf_apply

end CrossMath.Pilot75N2
