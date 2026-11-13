# Pre-work spec — pilot 72 (area-law bridge, EZ3-first route)

Lane A4, 2026-11-13. Companion docs: `research/bridges/area-law.md` (zones AL-EZ1/EZ3, §4; §0.1
toolchain reality), `research/novelty/round-4.md` §2 (zone-AL pre-check — **binding constraint on
M2**, folded in below), dossier 72 (lane A9, in preparation at time of writing; consistency note
in §3.4). This is SPEC ONLY — no Lean execution; the pilot lane is assigned after triage.
**Verdict up front: conditional GO.** M1 has an ungated fallback (Tier C) that keeps the pilot
alive regardless of G5a; M2's shape is fixed by round-4 §AL to purity/effective-rank framings.
The single import-blocking gate is **G5a (Physlib staging)**, which upgrades M1 from Tier C
(transcribed statements + hypothesis binder) to Tier B (imported AreaLaw2D statement layer).

---

## §1 The pilot in one page

Route **EZ3-first** (the 10-prework §7 precedent: smallest wall-free tranche first), because:

1. M1 (the family-265 interface theorem) needs no new mathematics — its content is transport —
   and its core lemma (ptrace-Gram) is *shared infrastructure*: it fixes the ρ_A encoding that
   M2's purity milestone consumes. Both milestones then reuse it.
2. M2 (AL-EZ1 pilot realization) has a fully unconditional matrix core (M2a+M2b) sitting on the
   PROVED pilot-01 machinery; only the entropic stretch (M2c) is research-grade and it is scoped
   as optional, hypothesis-binder form.
3. Nothing in M1/M2 touches the AreaLaw2D proof tree (the 187k-LoC development is a black box at
   theorem-statement level) or the PEPS proof tree (`MainStatement`'s remaining hypotheses are
   discharged by openai-math, not by us).

Milestones: **M1** interface theorem (§2); **M2** gap-to-inertia dictionary + purity-energy
certificate (§3). Out of scope: AL-EZ2 (LP/moment ceilings), 3D targets C.1–C.4, any poly-PEPS
representation claim (§5 R4).

---

## §2 M1 — exact statement spec: the family-265 interface theorem

### 2.1 The two endpoints, transcribed exactly [VERIFIED this session]

**Producer** — AreaLaw2D, `AreaLaw.areaLaw` (`AreaLaw/Transfer.lean:361`):

```lean
theorem areaLaw (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (hq : 1 ≤ q) (hJ : 0 < J)
    (hΔ : 0 < Δ) : AreaLaw 𝕜 q R J Δ
```

where `OpenAI.AreaLaw` (`OpenAI/Statements.lean:202`):

```lean
def AreaLaw (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) : Prop :=
  ∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ),
    ∀ Φ : (X : Finset (ℤ × ℤ)) → Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) 𝕜,
      IsAdmissible Λ R J Φ →
    ∀ (Ω : Reg (Qudits q) Λ → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) (E₀ : ℝ),
      hamiltonian Λ Φ *ᵥ Ω = (E₀ : 𝕜) • Ω → HasGlobalGap (hamiltonian Λ Φ) Ω E₀ Δ →
    ∀ (A : Finset (ℤ × ℤ)) (hA : A ⊆ Λ),
      (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary Λ A).card
```

**Consumer** — openai-math, `PolynomialPEPS.PinnedEntropy.UniformAreaLaw`
(`lean/OAI/MathematicalPhysics/PEPSFilters/Basic.lean:135`):

```lean
def UniformAreaLaw : Prop :=
  ∀ (q : ℕ), 2 ≤ q → ∀ (J Δ : ℝ), 0 < J → 0 < Δ →
    ∃ C_A : ℝ, 0 < C_A ∧
      ∀ (L : ℕ), 2 ≤ L →
      ∀ (hv : Vertex L → Operator L q) (he : Edge L → Operator L q)
        (Ω : State L q) (E₀ : ℝ),
        IsGridHamiltonian J hv he →
        UniqueGround (Hamiltonian hv he) Ω E₀ →
        FullSystemGap (Hamiltonian hv he) Ω E₀ Δ →
        ∀ A : Finset (Vertex L),
          vonNeumannEntropy Ω A ≤ C_A * (boundaryCard A : ℝ)
```

Supporting openai decls, ALL in `Basic.lean` (imports only `Mathlib`, line 1):
`Vertex = Fin L × Fin L` (:12), `ForwardAdjacent` (:14), `Edge` (:18), `Incident` (:22),
`Configuration = Vertex L → Fin q` (:29), `State = EuclideanSpace ℂ (Configuration L q)` (:30),
`Operator = Matrix (Configuration L q) (Configuration L q) ℂ` (:31), `RegionConfiguration`
(:32), `liftLocal` (:36), `SupportedOn` (:43), `EdgeSites` (:46), `Hamiltonian hv he = (∑ v,
hv v) + ∑ e, he e` (:48), `asMap = Matrix.toEuclideanCLM` (:52), `opNorm = ‖asMap a‖` (:55),
`IsGridHamiltonian` (:57 — per-term `SupportedOn` + `opNorm ≤ J` + **only the sum** Hermitian),
`phase` (:61), `UniqueGround` (:65 — `‖Ω‖ = 1`, `asMap H Ω = E₀ • Ω`, ground-energy inequality,
uniqueness up to phase), `FullSystemGap` (:74 — ∀ψ, `Δ * (‖ψ‖^2 − ‖inner ℂ Ω ψ‖^2) ≤
(inner ℂ ψ (asMap H ψ)).re − E₀ * ‖ψ‖^2`), `coefficientMatrix` (:115), `reducedDensity =
coefficientMatrix * conjTranspose coefficientMatrix` (:119), `vonNeumannEntropy = ∑ i,
negMulLog (eigenvalues … i)` (:127), `boundaryCard` (:130). Norm bridge already proved on their
side: `asMap_norm : ‖asMap B‖ = ‖B‖` (`PEPSFilters/PinnedEntropy.lean`, StarAlgEquiv route).

Supporting AreaLaw2D decls: `Qudits q = fun _ => Fin q` (Statements.lean:160), `Reg`
(`AreaLawForMathlib/QuantumInfo/Region/Basic.lean:20`), `glue` (:29), `glueEquiv` (:86),
`edgeBoundary` (Statements.lean:135), `supports` (:164), `hamiltonian` (:171), `IsAdmissible`
(:179), `HasGlobalGap` (:185), `pureState` (:191), `ptrace` (Region/PartialTrace.lean:25),
`SubState`/`MState` (Region/State.lean:28,37), `restrict` (:48), `entropy` (:69),
`entropy_eq_H` (:75), `regionEntropy` (:198), `vonNeumann` + `vonNeumann_eq_H` +
`eigenvalues_multiset_submatrix_equiv` (Entropy/VonNeumann.lean:26,31,+).

### 2.2 Target theorem (full statement)

```lean
/-- AL-EZ3 / dossier 72 M1: the family-265 interface. `hAreaLaw` is the producer side —
Tier A: `fun q J Δ hq hJ hΔ => AreaLaw.areaLaw ℂ q 1 J Δ hq hJ hΔ`;
Tier B: same statement as an imported-Prop binder;
Tier C: same Prop over a transcribed statement layer (§2.4). -/
theorem interface_areaLaw_uniformAreaLaw
    (hAreaLaw : ∀ (q : ℕ) (J Δ : ℝ), 1 ≤ q → 0 < J → 0 < Δ → OpenAI.AreaLaw ℂ q 1 J Δ) :
    PolynomialPEPS.PinnedEntropy.UniformAreaLaw := by
  intro q hq J Δ hJ hΔ
  obtain ⟨C, hC⟩ := hAreaLaw q J Δ (by omega) hJ hΔ     -- R = 1 covers site+edge terms
  refine ⟨max C 1, by positivity, ?_⟩
  intro L hL hv he Ω E₀ hGrid hUG hGap A
  -- (i)   ΛL := (ιL '' univ : Finset (ℤ × ℤ)), ιL v = (v.1.val, v.2.val)
  -- (ii)  ΦL := interaction with ΦL {v} = reindex (hermPart (hv v)),
  --        ΦL (EdgeSites e) = reindex (hermPart (he e)), 0 else        [L3a symmetrization]
  -- (iii) ΩL := Ω ∘ (configEquiv L q),  hΩL : star ΩL ⬝ᵥ ΩL = 1        [L3b norm convention]
  -- (iv)  hAdm : IsAdmissible ΛL 1 J ΦL                                 [L3, asMap_norm]
  -- (v)   hEig : hamiltonian ΛL ΦL *ᵥ ΩL = (E₀ : ℂ) • ΩL               [L3; Hamiltonian hv' he' = H]
  -- (vi)  hGap' : HasGlobalGap (hamiltonian ΛL ΦL) ΩL E₀ Δ             [L3c form→Loewner]
  -- (vii) entropy match: regionEntropy ΩL (ιL '' A) = vonNeumannEntropy Ω A   [L1]
  -- (viii) boundary comparability: boundaryCard A ≤ 4 * (edgeBoundary ΛL (ιL '' A)).card [L2]
  exact le_trans (hC ΛL ΦL hAdm ΩL hΩL E₀ hEig hGap' (ιL '' A) subset_refl)
    (by linarith [L2 L A])   -- C-existential absorbs the constant factor
```

Quantifier note: `IsAdmissible Λ R J Φ` at `R = 1` covers single-site and single-edge supports —
exactly the paper's `h_v + h_e` class (companion-interface paragraph 1: "Here `Γ = Λ_L` and
`R = 1`"). The `max C 1` supplies `0 < C_A`.

### 2.3 The three interface lemmas (M1's real work)

**L1 — ptrace-Gram identity (the core; = bridges/area-law.md AL-EZ3(i)).**
For `L q : ℕ`, `Ω : State L q`, `A : Finset (Vertex L)`, with `e : Reg (Qudits q) (ιL '' A) ≃
RegionConfiguration q A` and `E : Reg (Qudits q) ΛL ≃ Configuration L q` the canonical reindexes:

```lean
theorem ptrace_pureState_eq_reducedDensity (L q : ℕ) (Ω : State L q)
    (hΩ : star (Ω ∘ E) ⬝ᵥ (Ω ∘ E) = 1) (A : Finset (Vertex L)) :
    ((ptrace h (pureState (Ω ∘ E) hΩ)).submatrix e e) = reducedDensity Ω A
```

Entries: LHS `(x, y) = ∑ z : Reg _ (ΛL \ ιL '' A), Ω (glue x z) * conj (Ω (glue y z))`; RHS
`(x, y) = ∑ z : Aᶜ, Ω (joinConfigurations A x z) * conj (Ω (joinConfigurations A y z))` — the
same sum after the `glue`↔`joinConfigurations` reindex (both are "stuff the complement
configuration into the fixed A-part"). Proof: `Matrix.ext` + `Finset.sum` bijection + `simp
[ptrace, reducedDensity, coefficientMatrix, joinConfigurations, glue]`. **[pending G5b]** — A7's
probe elaborates this statement shape against the staged defs.
*Corollary (entropy match, M1 step vii):* `regionEntropy (pureState (Ω∘E) hΩ) hA' =
vonNeumannEntropy Ω A` — both sides equal `H (eigenvalues …)` (AreaLaw2D
`SubState.entropy_eq_H`, State.lean:75; openai `vonNeumannEntropy` def :127) and the two
eigenvalue multisets agree because the matrices agree up to the equiv reindex
(`eigenvalues_multiset_submatrix_equiv`, VonNeumann.lean; `reducedDensity_isHermitian`,
Basic.lean:124).

**L2 — boundary comparability (de-risked: only comparability is needed).**
`boundaryCard A ≤ 4 * (edgeBoundary ΛL (ιL '' A)).card` — indeed both count undirected
nearest-neighbour crossing edges of the `L×L` grid (`boundaryCard` over `Edge L`, whose
`ForwardAdjacent` orientation (Basic.lean:14) realizes each undirected edge exactly once;
`edgeBoundary` orients each crossing edge out of `A` once, Statements.lean:132–136). Because
`C` is **existential** in both statements, any fixed constant factor is absorbable — L2 cannot
fail on orientation subtleties, only on gross mismatch (there is none: both are the grid's edge
cut). Provable as an explicit bijection `Edge L ∩ crossing ↪ directed boundary ∪ reverse`; the
exact-equality variant `(edgeBoundary ΛL (ιL '' A)).card = boundaryCard A` is the expected
truth and the target form, with `≤ 4·` the safety net. ~60–120 LoC.

**L3 — Hamiltonian, ground state and gap transfer.** Three sub-lemmas:
*L3a (per-term Hermiticity by symmetrization — the interface detail neither side states).*
`IsGridHamiltonian` assumes only `(Hamiltonian hv he).IsHermitian` (Basic.lean:57–63), while
`IsAdmissible` requires every `Φ X` Hermitian (Statements.lean:181). Fix: `hv' v := (hv v +
(hv v)ᴴ)/2`, `he' e := (he e + (he e)ᴴ)/2`; then `Hamiltonian hv' he' = Hamiltonian hv he`
(the Hermitian-part map is linear and fixes the Hermitian sum), `opNorm (hp a) ≤ opNorm a ≤ J`,
supports unchanged. ~30–50 LoC. (If openai's intended reading is per-term Hermitian — the paper
says "Hermitian Hamiltonian", thm main eq. (model) — L3a is still needed at the Lean level.)
*L3b (state/inner-product conventions).* `ΩL := Ω ∘ E` with `star ΩL ⬝ᵥ ΩL = 1` from
`UniqueGround`'s `‖Ω‖ = 1` (EuclideanSpace `WithLp` ↔ pi-type `dotProduct` congruence;
conjugation-side conventions of `inner ℂ` vs `star ⬝ᵥ` to be aligned once, centrally).
*L3c (form→Loewner).* `FullSystemGap` (quadratic form ∀ψ, Basic.lean:74) → `HasGlobalGap`
(Loewner, Statements.lean:185): the difference of the two sides is PSD, by mathlib's
`Matrix.PosSemidef` quadratic-form characterization (`Analysis/Matrix/PosDef.lean`); the rank-one
term `|Ω⟩⟨Ω|` ↔ `‖inner ℂ Ω ψ‖²` is `star Ω ⬝ᵥ Ω · inner`-rearrangement. ~100–200 LoC of
conventions work; the mathematical content is one PSD-transfer.
Eigen-equation (step v): `asMap H Ω = E₀ • Ω` ↔ `hamiltonian ΛL ΦL *ᵥ ΩL = E₀ • ΩL` via
`Matrix.toEuclideanCLM_apply`-style lemmas.

Effort: L1 ≈ 150–250 LoC (equiv plumbing dominates), L2 ≈ 60–120, L3 ≈ 250–400 → **M1 total
≈ 0.5–0.8k LoC new content** on top of the vendored preambles (§4).

### 2.4 Import tiers and the hypothesis-binder fallback (EnclOK pattern)

The two endpoints live in different projects; the import situation is asymmetric
[VERIFIED: import lines this session]:

- **openai side is FREE**: `PEPSFilters/Basic.lean` imports only `Mathlib` (:1). Vendor the
  needed preamble (Basic.lean:10–147, ≈150 LoC of defs; namespace-renamed
  `PolynomialPEPS.PinnedEntropy` kept verbatim for statement identity). No gate.
- **AreaLaw2D side is Physlib-gated**: the statement layer chains
  `OpenAI/Statements.lean → Region/State.lean → Region/PartialTrace.lean → import
  QuantumInfo.ForMathlib.Matrix` (Physlib) and `ClassicalInfo/Entropy.lean → import
  QuantumInfo.ClassicalInfo.Entropy` (Physlib, the `H` entropy itself). **[pending G5a]**
  whether Physlib `a50684a1` elaborates/builds against mathlib `ff2494ea` on our Modal image.

| Tier | Producer side | What `hAreaLaw` is | Gated by |
|---|---|---|---|
| A (full) | `AreaLaw.areaLaw` imported and applied | discharged by the real theorem (kernel-checks the whole 187k-LoD chain) | G5a + full AreaLaw2D build on Modal (donor build health unprobed; axbump runs covered only the zeta repos, `feasibility/axiommath-bump/logs/run1.log`) |
| B (statement import) | import `OpenAI.Statements` | explicit Prop binder over the *imported, donor-exact* statement | **G5a only** |
| C (transcription) | vendor ≈200 LoC: `Reg/glue/ptrace/pureState/SubState/regionEntropy/vonNeumann/H` + `Qudits/IsAdmissible/hamiltonian/HasGlobalGap/AreaLaw` verbatim from the donor files (defs re-proved locally where their proofs used Physlib: `entropy_eq_H` ≈ 40 LoC via `trace_cfc`-route) | explicit Prop binder over the *transcribed* statement | nothing |

The EnclOK precedent (AGENTS.md conventions; pilots 20/50 `hQRH` binder pattern) covers B and C:
the binder is honest about provenance, the NEW content (L1–L3 + the interface theorem) is
kernel-verified in every tier, and a Tier C→B→A upgrade is a one-line discharge change. Pilot
plan should LAND Tier C first and upgrade.

---

## §3 M2 — AL-EZ1 pilot realization: gap-to-inertia dictionary + purity certificate

**Shape constraint (binding, from `novelty/round-4.md` §2 + orchestrator relay 2026-11-13).**
Kuwahara arXiv:2610.15199 disproves Rényi-α<1 area laws in d ≥ 2 (unique ground state + uniform
gap); by the S₀-monotonicity argument (round-4 decisive datum) **literal Schmidt-rank
concentration is FALSE**, and cap-functional area-law readings are refuted as literally posed.
M2 therefore fixes: **purity (α=2) / effective-rank framings only**; no rank-concentration
headlines; no poly-PEPS representation claims (that form is the companion preprint's territory,
round-4 AL-7). Consistency: A9's dossier 72 primary is being restructured the same way; where
`bridges/area-law.md` AL-EZ1 said "cap/purity", this § supersedes the cap-first phrasing for
executable purposes.

### 3.1 M2a — the gap-to-inertia dictionary (unconditional, S effort)

Using pilot-01's ported definitions verbatim (`research/pilots/01/port/09_MasterIdentity.lean`:
`posIndexAbove hA θ := #{i | θ < hA.eigenvalues i}` :56; `posIndex_conj_le` :846):

```lean
theorem posIndexAbove_of_hasGlobalGap {n : Type*} [Fintype n] [DecidableEq n]
    {H : Matrix n n 𝕜} (hH : H.IsHermitian) {Ω : n → 𝕜} (hΩ : star Ω ⬝ᵥ Ω = 1) {E₀ Δ : ℝ}
    (hΔ : 0 < Δ) (hGap : OpenAI.HasGlobalGap H Ω E₀ Δ) {θ : ℝ} (hθ : -Δ < θ) :
    posIndexAbove hH θ ≤ 1

theorem posIndexAbove_conj_of_hasGlobalGap … (B : Matrix n d 𝕜) … :
    posIndexAbove (isHermitian_conjTranspose_mul_mul B hH') θ ≤ 1   -- via posIndex_conj_le (G − θ·1)
```

Proof route: `HasGlobalGap` gives `(E₀ − H) ⪯ 0` with kernel `𝕜Ω` and `⪯ −Δ` on `Ω^⊥`
(Statements.lean:185–187; eigenvector bookkeeping via mathlib `Spectrum.lean:143,202`); apply
`posIndex_conj_le` to `Bᴴ(E₀ − H − θ)B`. No entropy, no Kuwahara exposure (a statement about
`H`, not `ρ_A`). This is AL-EZ1 part 1 / the door lemma of `bridges/area-law.md` §2 L1.

### 3.2 M2b — the purity-energy certificate (unconditional matrix core; the ONE functional)

**Why purity (tr ρ²), decided:** (i) α = 2 sits outside the Kuwahara no-go (α < 1), while the
cap functional's area-law reading is refuted-as-posed and rank is false outright — purity is the
strongest surviving Rényi choice; (ii) **parameter-free**: `c` appears only as a proof parameter
under an explicit cap hypothesis, not in the statement's meaning; (iii) purity IS the Frobenius
energy `frobSq ρ`, exactly the quantity pilot-01's identity controls — the natural functional of
the PROVED machinery; (iv) its entropic reading (participation ratio `1/tr ρ²`) is the
effective-rank form round-4 AL-6 found unclaimed everywhere.

Binding surface (all in `research/pilots/01/port/09_MasterIdentity.lean`, self-contained,
axiom-audited): `rank_trace_mult_k` :1658 (signature verbatim below), `Pmat` :1512, `Wmat`
:1509, `xsq` (implicit, `xsq v j = ‖v j‖²`), `kc` :1640, `rtrace` :76, `frobSq` :79,
`posIndex` :47, `master_identity` :1983, `rank_trace_mult_k_of_master` :2019.

```lean
-- donor surface, verbatim (09_MasterIdentity.lean:1658):
theorem rank_trace_mult_k {m : ι → ℝ} (hm : ∀ j, 0 ≤ m j) (v : ι → n → 𝕜)
    {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) {b : ℕ} (hb : posIndex hQ ≤ b) {c : ℝ} (hc : 0 < c) :
    2 * c * rtrace (Pmat m v + Q) - frobSq (Pmat m v + Q) ≤ (∑ j, kc c (m j * xsq v j)) + c ^ 2 * b

-- M2b target 1 (cap-equality reduction): under the cap, kc collapses to atom purity.
theorem sum_kc_eq_two_c_sub_atomPurity (u : ι → ℝ) (hu : ∀ j, 0 ≤ u j) (hΣ : ∑ j, u j = 1)
    {c : ℝ} (hc : 0 < c) (hcap : ∀ j, u j ≤ c) :
    ∑ j, kc c (u j) = 2 * c - ∑ j, (u j) ^ 2        -- k_c(x) = 2cx − x² below the cap

-- M2b target 2 (atom–spectrum bridge): atom purity ≤ spectral purity, with equality iff
-- the Gram off-diagonal vanishes (this gap is exactly one defect of master_identity :1983).
theorem atomPurity_le_purity {m : ι → ℝ} (hm : ∀ j, 0 ≤ m j) (v : ι → n → 𝕜) :
    ∑ j, (m j * xsq v j) ^ 2 ≤ frobSq (Pmat m v)     -- frobSq (Pmat m v) = re tr (Pmat²) = purity

-- M2b MAIN (purity-energy certificate; unconditional; P instantiated at ρ_A's factorization
-- W_A = coefficient matrix, atoms u_j = m j * xsq v j = column squared norms, ∑ u_j = 1):
theorem purity_energy_certificate {ι n} [Fintype ι] [Fintype n] [DecidableEq ι] [DecidableEq n]
    (m : ι → ℝ) (hm : ∀ j, 0 ≤ m j) (v : ι → n → 𝕜) (hΣ : ∑ j, m j * xsq v j = 1)
    {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) {b : ℕ} (hb : posIndex hQ ≤ b)
    {c : ℝ} (hc : 0 < c) (hcap : ∀ j, m j * xsq v j ≤ c) :
    ∑ j, (m j * xsq v j) ^ 2 ≤ frobSq (Pmat m v + Q) - 2 * c * rtrace Q + c ^ 2 * b
    -- reading: the atom purity (= participation-ratio denominator of the coefficient-matrix
    -- factorization, an α=2 object) is certified by the Frobenius energy of ρ + Q at the
    -- budget price c²·b. Master identity :1983 upgrades ≤ to an equality with named defects.
```

Proof: `rank_trace_mult_k` + target 1 + `ring`/`linarith`. Effort: targets 1–2 ≈ 60–120 LoC;
MAIN ≈ 40 LoC on top. **[pending G5c]** — A7's probe elaborates `Wmat/Pmat/kc/rank_trace_mult_k`
+ the `reducedDensity = Pmat` dictionary statement together (the M2-side encoding bridge).

Defect sharpening (optional M2b+): re-run the MAIN proof through `master_identity` (:1983)
instead of `rank_trace_mult_k`, keeping the five named defects — positions exactly how much of
the certificate's slack is rearrangement vs Schur–Jensen vs positive-coupling (dossier 01
Theorem A machinery, all proved).

### 3.3 M2c — the entropic stretch (OPTIONAL; hypothesis-binder form only)

The gap enters M2 only through a gap-derived `Q_A` with boundary-linear budget. Scoped as:

```lean
theorem purity_certificate_of_budget (hQ : ∀ A, ∃ Q_A, posIndex hQ_A ≤ b * |∂A| ∧ …) : …
```

i.e. the budget construction (`E_A(Σ_{X crossing} k_X)` from `PositiveReplacement`,
Statements.lean:259–277, via `condExpect` :240) is carried as an explicit hypothesis — EnclOK
style — and is NOT a pilot deliverable. Rationale: round-4 shows the area-law-strength purity
claim (`H_2 ≤ C|∂A|` from a global 2D gap) is neither known nor promised by anything we possess;
M2c's binder form is kernel-clean and honest. If the pilot lands M1+M2a+M2b with budget left,
M2c's *single-crossing-term instance* (one `h_X` straddling the cut, budget computed by hand) is
the one allowed exploration.

### 3.4 Consistency with dossier 72 (A9)

A9 owns `research/candidates/72-*.md` (not on disk at writing); this prework owns
`research/pilots/72-prework.md`. Agreed split to maintain: dossier carries novelty/positioning
(round-4 §AL framing, Kuwahara/AAG/AHS/AGSP nearest misses); prework carries statements,
port inventory, gates, Modal plan. M2's purity-primary shape here matches the relayed A9
restructuring; if A9's final statement differs in inessentials (e.g. effective-rank-first
phrasing), the pilot takes the union: M2b MAIN is the participation-ratio statement in disguise
(`1 / ∑ u_j² ≥ …`-form derivable by `one_div_le_one_div`-route from it).

---

## §4 Port inventory

**From AreaLaw2D** (M1; all `file:line` [VERIFIED]): `OpenAI/Statements.lean` — `edgeBoundary`
:135, `Qudits` :160, `supports` :164, `hamiltonian` :171, `IsAdmissible` :179, `HasGlobalGap`
:185, `pureState` :191, `AreaLaw` :202; `AreaLawForMathlib/QuantumInfo/Region/Basic.lean` —
`Reg` :20, `glue` :29, `glueEquiv` :86 (211 LoC, Mathlib-only imports); `Region/
PartialTrace.lean` — `ptrace` :25 (imports Physlib `QuantumInfo.ForMathlib.Matrix`);
`Region/State.lean` — `SubState` :28, `MState` :37, `restrict` :48, `entropy` :69,
`entropy_eq_H` :75, `regionEntropy` :198; `Entropy/VonNeumann.lean` — `vonNeumann` :26,
`vonNeumann_eq_H` :31, `eigenvalues_multiset_submatrix_equiv`, `trace_cfc` (Mathlib-only
imports); `ClassicalInfo/Entropy.lean` — `H` (imports Physlib `QuantumInfo.ClassicalInfo.
Entropy`). **Physlib modules the statement layer needs** [pending G5a]:
`QuantumInfo.ClassicalInfo.Entropy`, `QuantumInfo.ForMathlib.Matrix` (+ `MatrixNorm.TraceNorm`,
`HermitianMat.{Inner,Proj}` only if `D₁`/TraceDistance is ever touched — M1 does not need it).

**From openai-math** (M1; vendor, Mathlib-only): `PEPSFilters/Basic.lean:10–147` preamble
(§2.1 list) + `reducedDensity_isHermitian` :124; optionally `asMap_norm` from
`PEPSFilters/PinnedEntropy.lean` if the CLM-norm route is preferred over the Matrix-norm route
in L3a/L3(iv).

**From pilot 01** (M2; in-repo, kernel-verified, axiom-clean): `research/pilots/01/port/
09_MasterIdentity.lean` (2,060 LoC, self-contained — every def re-defined in-file): `posIndex`
:47, `posIndexAbove` :56, `rtrace` :76, `frobSq` :79, `posIndex_conj_le` :846,
`weyl_posIndexAbove_le` :968, `Wmat` :1509, `Pmat` :1512, `kc` :1640, `rank_trace_mult_k`
:1658, `master_identity` :1983, `rank_trace_mult_k_of_master` :2019. Pattern precedent for
Tier-C vendor files: `research/pilots/01/BindingSurface.lean` (probe-convention header, "NOT a
proof artifact", one import + one `#check` per binding).

**From mathlib (substrate; all confirmed on `ff2494ea` via pilot-01 probes / bridge §1):**
`Analysis/Matrix/Spectrum.lean` (`eigenvalues₀_antitone` :63, `spectral_theorem` :143,
`rank_eq_card_non_zero_eigs` :202, `trace_eq_sum_eigenvalues` :240), `Analysis/Matrix/PosDef.
lean` (`PosSemidef` + quadratic-form characterization), `Analysis/Matrix/HermitianFunctional
Calculus.lean`, `LinearAlgebra/Matrix/Kronecker.lean`, `Matrix.toEuclideanCLM` API,
`Analysis/Matrix/Order.lean:316–335` (L2Operator norm scope), `Data/Finset/...` reindexing.

**Import-boundary question G5a must answer** [pending G5a]: (1) does Physlib `a50684a1`
elaborate against mathlib `ff2494ea`/v4.36.0-rc2 on the Modal image (statement-level first:
`QuantumInfo.ClassicalInfo.Entropy`'s `H` + `QuantumInfo.ForMathlib.Matrix` key decls); (2) if
yes, does `OpenAI/Statements.lean` elaborate whole (Tier B unlocked); (3) note the donor's
`lake-manifest.json` staleness (`db584cd6` vs lakefile `ff2494ea`, bridges §0.1) — probes must
resolve mathlib explicitly (the axbump.py recipe clones mathlib at `ff2494ea` itself, which is
the right pattern).

---

## §5 Risk register

- **R1 — Physlib staging (the gate).** [pending G5a]. Tier C keeps M1 alive with zero import
  risk; Tier B/A are upgrades. Physlib's own mathlib pin at `a50684a1` predates the donor's
  re-pin; elaboration (not full build) suffices for Tier B.
- **R2 — PEPS interface convention mismatches.** (a) inner-product conjugation sides
  (`inner ℂ Ω ψ` vs `star Ω ⬝ᵥ ψ`) — settle once in L3b, reuse; (b) `EuclideanSpace`/`WithLp`
  ↔ pi-type `dotProduct` (`star Ω ⬝ᵥ Ω = 1` vs `‖Ω‖ = 1`); (c) `asMap` ↔ `mulVec`;
  (d) per-term Hermiticity gap — SOLVED by L3a symmetrization (§2.3), must not be skipped;
  (e) boundary-card orientation — de-risked by C-existential (only comparability needed, §2.3
  L2). Overall: fiddly, bounded, exactly the kind of work pilot 01's fix cycles calibrated.
- **R3 — G5b/G5c mismatches.** If `glue`↔`joinConfigurations` reindexing or the
  `reducedDensity = Pmat` dictionary hits `Reg`-dependent-type friction, fall back to stating
  L1 entrywise (two `Finset.sum` equalities) and building the matrix equality from entries.
- **R4 — scope creep (explicitly banned).** AL-EZ2 (LP/moment ceilings), the 3D targets
  C.1–C.4, H_2-area-law claims, and any poly-PEPS/bond-dimension representation statement are
  OUT (round-4 AL-7: representation form is companion territory; AL decisive datum: rank/α<1
  refuted). M2c stays hypothesis-binder. The pilot's success criterion is M1 + M2a + M2b
  kernel-clean.
- **R5 — novelty discipline.** Every M2 statement frozen to purity/effective-rank shape before
  Lean starts (round-4 §AL mandatory-nearest-miss list travels in the dossier, not here).
- **R6 — donor build health (Tier A only).** axbump run1 showed zeta-repo build FAILs on the
  bump; AreaLaw2D unprobed; treat Tier A as aspirational bonus, never a dependency.

---

## §6 Modal run plan sketch (no execution now)

- **Runner**: clone `research/pilots/32/run_pilot.sh` → `research/pilots/72/run_pilot.sh`
  (stage `/tmp/crossmath-72-stage`, world-readable; `MODAL_USER=${MODAL_USER:-doz}` —
  substrate note: the doz fallback is approved and already the axbump practice, per
  `feasibility/axiommath-bump/logs/run1.log` provenance header "doz Modal CLI"; the xyz route
  remains the default elsewhere). App `crossmath-pilot-72`, image recipe = `axbump.py`'s (elan
  v4.2.4, toolchain `v4.36.0-rc2`, mathlib clone at `ff2494ea` + `lake exe cache get`, ~9k
  olens, cold ≈ 3¾ min / warm ≈ 68 s–2.5 min per AGENTS.md cost model).
- **G5 probes (A7, queued)**: G5a Physlib staging + `OpenAI/Statements.lean` elaboration;
  G5b ptrace-Gram statement (L1) elaboration; G5c `Wmat/Pmat/kc/rank_trace_mult_k` +
  `reducedDensity` dictionary elaboration. Verdicts route into §2.4's tier choice and §4.
- **Milestones on Modal** (once a pilot lane is assigned): P0 = Tier-C vendor file elaborates
  (both preambles + all §2/§3 statements, `sorry`-free statements only — probe-convention
  header per BindingSurface pattern); P1 = L2 + L3a (cheapest lemmas, conventions shakeout);
  P2 = L1 + entropy corollary; P3 = interface theorem (Tier C binder); P4 = M2a + M2b
  (pilot-01 reuse; `#print axioms` audit over every new theorem per FINAL-SWEEP axcheck
  pattern, `research/feasibility/probe/run_axcheck.sh`); P5 (conditional) = Tier B upgrade if
  G5a positive. Logs to `research/pilots/72/logs/` with provenance headers (log-rescue lesson).

## §7 Recommendation — GO (conditional), sequencing

1. **G5a first** (A7, already queued): decides M1's tier. G5b/c are preflights, not gates.
2. Pilot starts at **Tier C + M2a in parallel** (both ungated; M2a is pure pilot-01 reuse).
3. M2b after G5c; M1's L1–L3 in the §2.3 order (L2, L3a cheapest first — the 10-prework
   "smallest wall-free tranche first" rule).
4. M2c and Tier B/A only as post-success upgrades; R4's ban list enforced at every milestone.

## §8 Sources (this session)

AreaLaw2D: `OpenAI/Statements.lean` (all), `AreaLaw/Transfer.lean:355–372`, `AreaLawForMathlib/
QuantumInfo/Region/{Basic,PartialTrace,State}.lean`, `Entropy/VonNeumann.lean`,
`ClassicalInfo/Entropy.lean` (import lines + decls), `lakefile.toml`/`lake-manifest.json`.
openai-math: `lean/OAI/MathematicalPhysics/PEPSFilters/Basic.lean:1–147` (all defs read),
`PEPSFilters/PinnedEntropy.lean:1–50` (`asMap_norm`), directory listings. This repo:
`research/pilots/01/port/09_MasterIdentity.lean` (decl sites :47–:2019; `rank_trace_mult_k`
signature read verbatim), `research/pilots/01/BindingSurface.lean` (header), `research/
pilots/32/run_pilot.sh`, `research/feasibility/axiommath-bump/{axbump.py,logs/run1.log}`,
`research/novelty/round-4.md` §2 (all), `research/bridges/area-law.md` (own, this cycle).
Literature via round-4 §2: Kuwahara 2610.15199, Anshu–Arad–Gosset 2103.02492 + 1905.11337,
Abrahamsen et al 2203.16012, AHS 2004.15009, OAI265 + PEPS companion.
