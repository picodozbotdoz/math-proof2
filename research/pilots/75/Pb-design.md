# P-b design — pilot 75 continuation (5/6 strip-distinct arm) [CHARTER-PENDING]

Lane A4, 2026-11-14. Status marker: **[CHARTER-PENDING] / iteration-4-input** — execution
is NOT authorized this cycle (Cycle-2 scope closed FINAL-FOR-ENTRY by the orchestrator,
2026-11-14, P-b carried); this file preserves the on-report design before it evaporates
and is the ready-to-execute spec for iteration 4. Companion: `research/pilots/75-prework.md`
§(a) N1-b + §(e) risk (ii) (the priced item), `research/candidates/75-abelian-assembly-
zetaL-proportions.md` (P-b)/(C1 5/6 arm), the landed entry `research/pilots/75/Pa.lean`
(GREEN, `logs/run6-final.log`), and this lane's report of 2026-11-14.

Ownership: this file is lane A4's; `75-prework.md` remains A9's. When executed, the pilot
file is `research/pilots/75/Pb.lean` (lane A4, `pilots/75/*`).

## 0. Target statements (deliverable levels)

All over the Pa.lean layer (namespace `CrossMath.Pilot75`; hypotheses as in
`zetaL_assembly_landed` unless replaced). Family data: `zK := ⟨multOf fK, hfinK⟩`,
`zF i := ⟨multOf (F i), hfinF i⟩`. The three landings:

**Pb-1 (defect form — the N1-b lift).**

```lean
theorem zetaL_assembly_distinct_defect_landed {fK fL : ℂ → ℂ} {F : ι → ℂ → ℂ}
    {c₀ cStar : ℝ} {c : ι → ℝ}
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)          -- structural set, verbatim from P-a
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinF : ∀ i, WindowFinite (multOf (F i)))
    (hcK : cStar ≤ c₀) (hcF : ∀ i, cStar ≤ c i)
    (hAKd : EpsLowerDistinctStripCum ⟨multOf fK, hfinK⟩ c₀)
    (hAFd : ∀ i, EpsLowerDistinctStripCum ⟨multOf (F i), hfinF i⟩ (c i)) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (cStar - ε) * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ)
        ≤ ((⟨multOf fL, hfinL⟩ : ZeroMult).distinctCountCum T : ℝ)
          + ((commonStripCum ⟨multOf fK, hfinK⟩
              (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T : ℝ)
            + ∑ p ∈ (Finset.univ ×ˢ Finset.univ).offDiag,
                (commonStripCum ⟨multOf (F p.1), hfinF p.1⟩
                  ⟨multOf (F p.2), hfinF p.2⟩ T : ℝ))
```

Defect convention — **THE CALL (decided): doubled `offDiag` sum.** The pair-sum runs over
ORDERED pairs `p.1 ≠ p.2` (`Finset.offDiag`, `Finset/Prod.lean:254`, `mem_offDiag` :266),
so each unordered pair is counted twice. Rationale: (i) no linear order on the abstract
index type `ι` is needed; (ii) the cons-induction's defect growth is exactly
`+ 2·∑_{i∈t} C(z a, z i)` under the symmetry `commonStripCum z w = commonStripCum w z`
(the intersection is commutative; ~5 LoC via `Set.inter_comm` + `Set.Finite.toFinset`),
so the doubled form is the induction's natural invariant with slack to spare
(`OffDiag(t) + ∑ C ≥ 0` closes the step trivially); (iii) the factor 2 is harmless at the
negligibility stage (Pb-2 quantifies over all ε anyway). An exact-`Σ_{i<j}` variant is
derivable if a consumer needs it (halve via `Nat` division bookkeeping or linearize the
index type); flagged, not planned.

**Pb-2 (`_of_negligible` full form).** Under the family binder in the SUMMED form —
`hCZStripFam : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
(commonStripCum zK (addFin zF) T : ℝ) + ∑ p ∈ offDiag, commonStripCum … ≤
ε * (countCum zL T : ℝ)` — conclude `EpsLowerDistinctStripCum ⟨multOf fL, hfinL⟩ cStar`
(δ/2-split exactly as M4a's `zetaK_distinct_five_sixths_strip_landed_of_negligible`,
with `nlinarith` on the nonneg count-cast). Design note: the binder is stated summed
(discharge-equivalent to the per-pair form of 75-prework §(b)-6: per-pair ⇒ summed via
`Finset.sum_const` + `Finset.card_biUnion_le`-style card arithmetic at
`ε' := δ / (card univ ^ 2 + 1)`; recorded as a remark in the file header, not a lemma).

**Pb-3 (C1, 5/6 arm).** `zetaL_distinct_five_sixths_strip_conditional` and
`…_of_negligible`: the Pb-1/Pb-2 instantiations at `c₀ = c i = 5/6` with the ζ_K slot via
the carried `K839OfLocalStrip` + `five_sixths_le_839` (`EpsLowerDistinctStripCum_mono`),
family components at 5/6 binders — mirroring `zetaL_two_thirds_conditional` and M4a's two
distinct landings one degree up the tower.

## 1. The engine (new lemmas, in dependency order)

**E1 — sub-family aggregator.**
`ZeroMult.addFinOver (s : Finset ι) (z : ι → ZeroMult) : ZeroMult` with
`mult := fun ρ => ∑ i ∈ s, (z i).mult ρ` (windowFinite: the finite-union argument of
`addFin`, with `Set.Finite.biUnion`; `addFin z` is `addFinOver Finset.univ z` by rfl —
remark in-file, no new lemma). Identity bridge:
`addFinOver_cons : addFinOver (Finset.cons b u hb) z = ZeroMult.add (addFinOver u z) (z b)`
— pointwise `Finset.sum_cons` + `Nat.add_comm`; **friction point F1**: equality of
`ZeroMult` terms (mult + a `WindowFinite` proof field) — structure-eta/proof-irrelevance
should make `funext` + `sum_cons` + `add_comm` suffice; if `ZeroMult.ext` friction
appears, add a private `ZeroMult.eq_of_mult` (~8 LoC). ≈ 30 LoC.

**E2 — binary sub-additivity of the pair-defect.**
`commonStripCum_add_le : commonStripCum (ZeroMult.add u v) w T
≤ commonStripCum u w T + commonStripCum v w T` — proof: `supp_add_eq` (carried) +
`Set.union_inter_distrib_right` + toFinset transport + `Finset.card_union_le`
(`Finset/Card.lean:590`). ≈ 30 LoC.

**E3 — union-intersection bound (the priced sub-item).**
`commonStripCum_addFin_le : commonStripCum (addFinOver s z) w T
≤ ∑ i ∈ s, commonStripCum (z i) w T` — cons-induction: base trivial (`sum_empty`,
`supp` of the empty sum); step via E1 + E2 + `Nat.add_le_add`. ≈ 25 LoC.
(Alternative route if the toFinset transport fights: supp-subset
`supp (addFinOver s).mult ∩ S ⊆ ⋃ i ∈ s, (supp (z i).mult ∩ S)` +
`Set.Finite.toFinset_biUnion` + `Finset.card_biUnion_le`
`BigOperators/Group/Finset/Basic.lean:1008`; keep as fallback within E3, same cost.)

**E4 — two-level Bonferroni (the invariant).**
```lean
theorem bonferroni_addFinOver (s : Finset ι) (z : ι → ZeroMult) (u : ZeroMult) (T : ℝ) :
    (u.distinctCountCum T : ℕ) + ∑ i ∈ s, (z i).distinctCountCum T
      ≤ ((ZeroMult.add u (addFinOver s z)).distinctCountCum T : ℕ)
        + ((commonStripCum u (addFinOver s z) T : ℕ)
          + ∑ p ∈ (s ×ˢ s).offDiag, (commonStripCum (z p.1) (z p.2) T : ℕ))
```
cons-induction on `s`: step = the 2-factor `distinctCountCum_add` (carried, M4a:856)
transported along E1's identity (`D(A∪B) + C(A,B) = D(A) + D(B)` with
`A := add u (addFinOver t)`, `B := z a`), then E2+E3 decompose `C(A, z a) ≤ C(u, z a) +
∑_{i∈t} C(z i, z a)`; the offDiag-growth identity
`(t ×ˢ t).offDiag`-vs-cons — **friction point F2**: `Finset.cons` vs `Finset.insert` in
`×ˢ`/`offDiag` rewriting; expect `Finset.offDiag_insert`-shaped simp lemmas or a manual
`Finset.sum_subset` bridge (+10–15 LoC buffer). ≈ 70 LoC (incl. F2 buffer).

**E5 — n-ary distinct identification of ζ_L.**
`distinctCountCum_of_abelFac : ∀ T, (⟨multOf fL, hfinL⟩ : ZeroMult).distinctCountCum T
= (ZeroMult.add zK (addFin zF)).distinctCountCum T` — the set identity
`supp (multOf fL) ∩ stripWindow 0 T = supp (multOf fK) ∩ stripWindow 0 T ∪
⋃ i, (supp (multOf (F i)) ∩ stripWindow 0 T)` from `multOf_of_abelFac` (P-a, landed)
by the per-point `Nat.add_eq_zero_iff` argument, then the toFinset-inj transport exactly
as M4a's `distinctCountCum_of_factorization` (:946). ≈ 40 LoC.

**E6 — ε-wiring (Pb-1).** Mirror `assemble_eps_defect_strip_cum`'s algebra (max-T₀ via
the P-a `Finset.le_sup' T₀ (mem)` pattern, `push_cast`, `Finset.mul_sum`, `linarith`),
with the component distinct-bounds summed (`Finset.sum_le_sum`), the countCum-additivity
from `countCumOf_add_of_abFac` (P-a, landed), and E4+E5 supplying the defect inequality.
≈ 50 LoC.

## 2. Substrate

- Carried whole from `Pa.lean` (1,557 LoC, GREEN run6): the M4a strip-distinct layer
  (`distinctCountCum`, `commonStripCum`, `distinctCountCum_add`, `supp_add_eq`,
  `EpsLowerDistinctStripCum(_mono)`, `K839OfLocalStrip`, `five_sixths_le_839`,
  `assemble_eps_defect_strip_cum` as the algebra model) + the P-a n-ary layer
  (`addFin`, `countCum_addFin`-family, `sum_inter_distrib_fin_mem`, `multOf_of_abelFac`,
  `countCumOf_add_of_abFac`, the `sup'` pattern). `Pb.lean` := Pa.lean carried + §1
  (single self-contained file per the duplication convention; Pa.lean stays frozen as
  the GREEN entry record — the M1→M4a freeze pattern).
- New mathlib surface (verified on the pin `ff2494ea`): `Finset.offDiag`/`mem_offDiag`
  (`Finset/Prod.lean:254/:266`), `Finset.card_union_le` (`Finset/Card.lean:590`),
  `Finset.card_biUnion_le` (`BigOperators/Group/Finset/Basic.lean:1008`),
  `Finset.sum_cons`, `Set.union_inter_distrib_right`. Nothing Physlib-/donor-gated;
  runner `crossmath-pilot-75` already staged and warm.

## 3. Estimate + guards

- **Effort: ≈ +0.25–0.35k LoC** (E1 30 + E2 30 + E3 25 + E4 70 + E5 40 + E6 50 +
  Pb-2/Pb-3 60 + prints/headers 20), on top of the 1,557-LoC carry.
- **Guards (iteration-4 hard stops):** (i) 0.45k LoC of new content without GREEN ⇒ stop;
  (ii) 6 consecutive runs without clear error descent ⇒ stop; (iii) F1 (ZeroMult ext) or
  F2 (offDiag-cons algebra) consuming > 3 runs each ⇒ invoke the fallback (§4) or park.
- Expected run count to GREEN: 3–5 (E4 is the only genuinely new friction; everything
  else is transported M4a/P-a algebra).

## 4. Guarded descent path (spec-sanctioned fallback)

If E4's offDiag machinery (F2) resists past its sub-guard, replace the pairwise defect by
the **iterated 2-factor defect** (75-prework §(e) risk (ii)'s conservative fallback): fix
an enumeration `e : Fin n ≃ ι` (`Fintype.equivFin ι`), define the tail aggregates
`tail k := addFinOver ((Finset.range (n - k)).map e.symm ·) zF`, and state the defect as
`∑ k ∈ Finset.range n, commonStripCum (ZeroMult.add zK (tail (k+1))) (e k) T` — the
induction's own accumulated defect, order-dependent, weaker statement, same proof shape
(E2 only; E3 and the offDiag sum drop out). Cost delta ≈ +0.1k over primary (the map/
range bookkeeping); honesty note required in the file header (statement is
enumeration-dependent; the `_of_negligible` form is enumeration-robust since the binder
bounds the SUMMED defect either way).

## 5. Acceptance criteria (iteration 4)

1. `Pb.lean` GREEN on Modal (rc=0, errors=0, sorry=0), logs `pilots/75/logs/pb-run*.log`
   with provenance headers (date, file+LoC, command, verdict) per the log-rescue rule.
2. In-file `#print axioms` over every new declaration (E1–E6 + the three landings +
   privates): triad-only `[propext, Classical.choice, Quot.sound]`, zero sorryAx.
3. No donor imports (EnclOK binder posture unchanged); Kuwahara—no donor statements
   consumed; `hAbFac`/`hCZStripFam` remain external binders.
4. Report relay: A9 (dossier-75 §Pilot-outcome P-b line + C1-5/6-arm fill), A1 (ledger
   §9 row update), H (commit).

— end design (A4, 2026-11-14; charter-pending, iteration-4 input).
