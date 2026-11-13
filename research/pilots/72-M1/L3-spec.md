# L3 + interface-theorem continuation spec — pilot 72-M1, iteration 4

Lane A8, 2026-11-14 (post FINAL-for-tranche decision). This file preserves and
elaborates the continuation note in `logs/m1-run8-GREEN.log`'s header before it
evaporates; it supersedes nothing — `72-prework.md` §2.2/§2.3 (A4's) remain the
companion specs, and where this document restates their L3 sketch it does so with
the substrate updates that landed GREEN in runs 4–8.

**Status this spec starts from (all disk-verified, all logs with provenance
headers):** T1 vendor layer 702 LoC GREEN (run 4) + axcheck 52 lines triad;
T2 L1/L2 360 LoC GREEN (run 8, descent 24→10→1→0) + axcheck 28 lines triad
(`logs/m1-axcheck-final.log`). Orchestrator decision 2026-11-14: 72-M1 is
FINAL-for-tranche — L1/L2/vendor kernel-clean; **L3 + the interface theorem are
carried to iteration 4** (same pattern as pilot 75).

---

## §1 Substrate inventory — what is already kernel-clean

**T1 (`P72M1T1.lean`, namespaces verbatim-donor):** `Arealaw` — `Reg/restr/glue`
+ transport lemmas (`glueEquiv`, `splitEquiv`, `unionEquiv`, `univEquiv`,
`card_reg*`); `H`, `H_eq_of_multiset_eq`; `vonNeumann`, `vonNeumann_eq_H`,
`eigenvalues_multiset_submatrix_equiv`; `ptrace` + `ptrace_self/ptrace_ptrace/
ptrace_eq_sum_conj/posSemidef_ptrace/trace_ptrace/extendId`; `SubState/MState/
restrict/entropy/entropy_eq_H/regionEntropy`. `OpenAI` —
`instDecidableRelAdjSquareLattice`, `edgeBoundary`, `Qudits`, `supports`,
`hamiltonian` (the powerset-`extendId` sum, :534–537), `IsAdmissible`,
`HasGlobalGap` (Loewner form `(Δ:𝕜) • (1 - vecMulVec Ω (star Ω)) ≤ H - (E₀:𝕜) • 1`),
`pureState`, `AreaLaw` (the producer endpoint, char-exact). `OAI.PolynomialPEPS.
PinnedEntropy` — the consumer preamble through `UniformAreaLaw`: `Vertex/
ForwardAdjacent/Edge/Incident/Configuration/State/Operator/RegionConfiguration/
liftLocal/SupportedOn/EdgeSites/Hamiltonian/asMap/opNorm/IsGridHamiltonian/phase/
UniqueGround/FullSystemGap/joinConfigurations/coefficientMatrix/reducedDensity/
reducedDensity_isHermitian/vonNeumannEntropy/boundaryCard/UniformAreaLaw`.

**T2 (`P72M1T2.lean`, namespace `CrossMath.Pilot72.M1`):** grid bridge `iotaL/
iotaLimg/gridDom` + membership lemmas (`iotaL_mem_gridDom`, `iotaL_mem_image`,
`iotaL_not_mem_image`, `image_subset_gridDom`, `v_mem_of_mem_image`);
`adj_squareLattice`, `adj_of_forwardAdjacent`, `ForwardAdjacent.asymm`; **L2**
`boundaryCard_le_edgeBoundary` (**constant 1**, stronger than the prework ≤ 4
safety form — the `C`-existential absorbs any constant, so L3 work never needs
to revisit boundary counting); transport `vertexImageEquiv/regEquivImage/
complImageEquiv/regComplEquiv` + `*_symm_apply` reduction lemmas, `gridVertex/
iotaL_gridVertex/gridVertex_of`, `configEquiv` (`Equiv.ofBijective`-built — its
inverse laws go through the propositional lemmas, NOT defeq: `Exists.choose` is
choice-opaque), `configEquiv_glue` (glue↔join, L1's engine); `toGrid`,
`pureState_M` (entry form of the pure state, rfl); **L1**
`ptrace_pureState_eq_reducedDensity`; `hermEigen_eq_of_matrix_eq`;
**entropy match** `regionEntropy_eq_vonNeumannEntropy` (interface step vii,
done). Known v4.36 traps encoded in T2's proofs (reuse, don't rediscover):
Eq has no field projections (`congrArg Prod.fst/snd`); subtype-statements needing
Fintype instances only elaborate inside a `classical` proof scope; `piCongrLeft'`'s
invFun is an `Eq.ndrec` cast that never reduces over `ofBijective` — orient
equivs so `.symm`-application rides the clean `toFun`.

**Verified mathlib anchors (ff2494ea, all read this session):**
`Matrix.PosSemidef` def `LinearAlgebra/Matrix/PosDef.lean:62` (Hermitian ∧
Finsupp-form); **`posSemidef_iff_dotProduct_mulVec`** `PosDef.lean:311`
(`M.PosSemidef ↔ M.IsHermitian ∧ ∀ x, 0 ≤ star x ⬝ᵥ (M *ᵥ x)` — L3c's bridge);
`Matrix.toEuclideanCLM` `Analysis/CStarAlgebra/Matrix.lean:101` with
**`toEuclideanCLM_toLp`** `:126` (`toEuclideanCLM A (toLp _ x) = toLp _ (A *ᵥ x)` —
the asMap↔mulVec bridge); `EuclideanSpace.norm_sq_eq` `Analysis/InnerProductSpace/
PiL2.lean:165` (`‖x‖^2 = ∑ i, ‖x i‖^2`); `inner_eq_star_dotProduct` `PiL2.lean:235`
(`⟪x, y⟫ = ofLp y ⬝ᵥ star (ofLp x)` — NOTE conjugation on the second factor:
the one central convention-alignment point, prework R2(a), settled once in L3b).

**Not vendored:** the donor's `asMap_norm` (`PEPSFilters/PinnedEntropy.lean`,
StarAlgEquiv route). Iteration-4 choice: reprove in-tree via the `toEuclideanCLM`
norm API or vendor the one theorem; L3a only needs `opNorm (hermPart a) ≤ opNorm a`
which follows from linearity + `‖Aᴴ‖ = ‖A‖` regardless.

## §2 L3a — per-term Hermiticity by symmetrization

```lean
def hermPart {L q : ℕ} (a : Operator L q) : Operator L q := (a + aᴴ) / 2

theorem hermPart_isHermitian (a : Operator L q) : (hermPart a).IsHermitian  -- conjTranspose + ring
theorem opNorm_hermPart_le (a : Operator L q) : opNorm (hermPart a) ≤ opNorm a
  -- asMap linearity + triangle + ‖Aᴴ‖ = ‖A‖ (asMap aᴴ = (asMap a).adjoint-style)
theorem supportedOn_hermPart {S} (h : SupportedOn a S) : SupportedOn (hermPart a) S
  -- liftLocal-under-algebra: sum/conjTranspose of liftLocals stays liftLocal
theorem hamiltonian_hermPart (hv he) :
    Hamiltonian (fun v => hermPart (hv v)) (fun e => hermPart (he e)) = Hamiltonian hv he
  -- map_sum over the linear symmetrization
```
Effort ~40–80 LoC. Rationale unchanged (prework §2.3 L3a): `IsGridHamiltonian`
assumes only the SUM Hermitian; `IsAdmissible` needs every `Φ X` Hermitian.

## §3 L3b — state conventions (hΩ discharge + eig-equation shape)

```lean
theorem toGrid_star_dotProduct_self {L q : ℕ} (Ω : State L q) (hΩn : ‖Ω‖ = 1) :
    star (toGrid L q Ω) ⬝ᵥ (toGrid L q Ω) = 1
  -- star ⬝ᵥ = ∑ conj * id = ∑ ‖·‖² (RCLike.conj_mul), Fintype.sum_equiv along
  -- configEquiv, EuclideanSpace.norm_sq_eq, hΩn
```
This discharges, inside the interface proof, the `hΩ` binder that L1 carries
(`star (toGrid L q Ω) ⬝ᵥ (toGrid L q Ω) = 1`) from `UniqueGround`'s `‖Ω‖ = 1`.
The eig-equation transfer (interface step v) rides L3d's matrix identity +
`toEuclideanCLM_toLp` (asMap-apply ↔ mulVec) + the §1 convention alignment.
Effort ~60–120 LoC.

## §4 L3c — form → Loewner (gap transfer, interface step vi)

```lean
theorem hasGlobalGap_of_fullSystemGap {L q : ℕ} (H : Operator L q) (Ω : State L q)
    (E₀ Δ : ℝ) (hΩn : ‖Ω‖ = 1) (hGap : FullSystemGap H Ω E₀ Δ) :
    HasGlobalGap (reindexed H) (toGrid L q Ω) E₀ Δ
```
Route: unfold `HasGlobalGap` as `PosSemidef (H' - (E₀:ℂ)•1 - (Δ:ℂ)•(1 - |Ω⟩⟨Ω|))`,
apply `posSemidef_iff_dotProduct_mulVec`, transport the quadratic form to
`inner ℂ ψ (asMap H ψ)` via `toEuclideanCLM_toLp` + `inner_eq_star_dotProduct`;
the rank-one term's quadratic form is `‖inner ℂ Ω ψ‖²` (vecMulVec entry =
`Ω i * star (Ω j)` — the `pureState_M` shape). Effort ~100–200 LoC; one PSD
transfer, the rest conventions.

## §5 L3d — Hamiltonian transport (the one genuinely new proof; not in prework)

The producer's `hamiltonian (gridDom L) ΦL *ᵥ ΩL = (E₀:ℂ) • ΩL` hypothesis must be
manufactured from `UniqueGround`'s `asMap H Ω = (E₀:ℂ) • Ω`. Construction:

- `a_v := (hGrid.1 v).1.choose` / `a_e := (hGrid.2.1 e).1.choose` — classical
  extraction from `SupportedOn`'s ∃ (after L3a symmetrization the terms are
  Hermitian and norm-≤ J).
- `ΦL L q hv he X : Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) ℂ` :=
  the `a`-matrix reindexed to the lattice singleton/edge shape, `0` elsewhere.
  (At `R = 1`, `supports (gridDom L) 1` = nonempty subsets of dom-diam ≤ 1 =
  singletons + adjacent pairs — exactly the shapes `ΦL` is nonzero on, via the
  `iotaL`-bijection between `Edge L` and forward-adjacent lattice pairs.)

```lean
theorem hamiltonian_gridDom_eq {L q : ℕ} (hv' : Vertex L → Operator L q)
    (he' : Edge L → Operator L q) :
    OpenAI.hamiltonian (gridDom L) (ΦL L q hv' he')
      = (Hamiltonian hv' he').submatrix (configEquiv L q) (configEquiv L q)
  -- entrywise: the powerset-extendId sum collapses to the site+edge sums over the
  -- ΦL-supported shapes (Finset.sum_subset / image-reindex along iotaL); entries
  -- glue through the T2 transport lemmas (configEquiv_glue machinery)
theorem isAdmissible_ΦL … : IsAdmissible (gridDom L) 1 J (ΦL L q hv' he')
  -- per-term Hermitian (L3a), opNorm ≤ J (L3a + hGrid), vanishing off supports (def)
```
Effort ~100–200 LoC. Fallback (stop-condition, declare rather than force): if the
full matrix identity stalls, the interface strictly needs only the eig-equation at
`ΩL` and the gap — a weaker `eig-transfer` lemma can close the proof; but
`isAdmissible_ΦL` is needed regardless. Record which shape landed.

## §6 The interface theorem (acceptance target, Tier C)

```lean
theorem interface_areaLaw_uniformAreaLaw
    (hAreaLaw : ∀ (q : ℕ) (J Δ : ℝ), 1 ≤ q → 0 < J → 0 < Δ → OpenAI.AreaLaw ℂ q 1 J Δ) :
    PolynomialPEPS.PinnedEntropy.UniformAreaLaw := by
  intro q hq J Δ hJ hΔ; obtain ⟨C, hC⟩ := hAreaLaw q J Δ (by omega) hJ hΔ
  refine ⟨max C 1, by positivity, ?_⟩
  intro L hL hv he Ω E₀ hGrid hUG hGap A
  -- (i)–(ii) ΛL := gridDom L, ΦL per §5; (iii) ΩL := toGrid L q Ω, hΩ via §3;
  -- (iv) hAdm := isAdmissible_ΦL (§5); (v) hEig := §3+§5; (vi) hGap' := §4;
  -- (vii) entropy match := regionEntropy_eq_vonNeumannEntropy (DONE);
  -- (viii) boundaryCard_le_edgeBoundary (DONE) + linarith through max C 1.
```
Statement-exactness anchor: conclusion is the vendored `UniformAreaLaw` unfolded
through its full ∀-chain — char-identical to `72-prework` §2.1's consumer
endpoint (`#check @OAI.PolynomialPEPS.PinnedEntropy.UniformAreaLaw` prints `Prop`,
T1 run output). New file `P72M1T3.lean` importing `P72M1T2` (sorted stage order
compiles T1<T2<T3 automatically; T2 stays frozen).

**Acceptance criteria.** (1) `P72M1T3.lean` GREEN: 0 errors, 0 sorry-warnings.
(2) Full axcheck triad-only over ALL top-level theorems of T1+T2+T3 (extend
`make_axcheck72m1.py` TARGETS with the T3 stage; A1's frozen sweep TARGETS get
`AxPilot72_M1_T3` on landing). (3) `interface_areaLaw_uniformAreaLaw` +
`IsAdmissible`-discharge + both gap/entropy transfers depend only on
[propext, Classical.choice, Quot.sound]. (4) Regression: T1/T2 recompile GREEN in
the same run. (5) No `sorry`/`native_decide`; logs with provenance headers; probe
files never land as proof artifacts.

## §7 Effort, guards, budget

L3a 40–80 + L3b 60–120 + L3c 100–200 + L3d 100–200 + interface 60–100 ≈
**360–700 LoC new content — grade M** (prework §2.3's 250–400 for L3 was before
L3d was identified as its own tranche). Guards: **> ~0.7k LoC without GREEN ⇒
stop + diagnose note in the log dir** (declared-drop rule); fix-round budget ≤ 8
Modal runs with enforced error descent (the run-5→8 discipline: no fix round
without a written error-class hypothesis first); hard errors aborting whole
declarations make counts non-monotone — the criterion is descent of distinct
error classes, not raw counts. Machine-time ≈ 8 × 2.5 min warm Modal.

## §8 [CHARTER-PENDING] / iteration-4 inputs

- **Tier-B upgrade** (imported `OpenAI.Statements` over Physlib) still gated on
  G5a — unchanged; Tier-C binder discharge swap is a one-line change on upgrade.
- **asMap_norm**: vendor vs in-tree reprove (§1) — executor's choice, one line
  either way in L3a.
- **L2 exact-equality variant** (`(edgeBoundary _ _).card = boundaryCard A`):
  optional; the landed constant-1 form already suffices for the interface.
- **Slot decision**: M2a/M2b (pilot-01 reuse, ungated) are parallel-safe with
  this spec per prework §7 — whether iteration 4 carries them is an
  orchestrator call, not this spec's.
- **A1 sweep**: add `AxPilot72_M1_T1/T2` (present files) now and `…_T3` on
  landing, per the landing-note convention in `make_axcheck.py`.
