# Pre-work spec — iteration-4 slot 2: the AreaLaw2D 3D partial-target ladder, rung B.2 [PROPOSAL]

**[CHARTER-PENDING — this file pre-works A1's PROPOSAL (`feasibility/ITERATION4-CHARTER-
DRAFT.md` slot 2) and the iteration-4 charter decision; it presumes nothing. Everything
here is PROPOSAL-grade until the orchestrator charters iteration 4.]**

Lane A2, 2026-11-14 (execution prework, no Lean runs — this document only). Spec sources,
in precedence order: `axiommath/AreaLaw2D/docs/3D/Targets.md` (the donor's OWN frozen
provability analysis — §A north star, §B.1–B.5 partial targets with verdicts, §C.1–C.4
named open-problem fences, §D usage rules; read in full this session),
`axiommath/AreaLaw2D/OpenAI/Statements3D.lean` (the frozen statement layer — 32 `def`s
per A1's scan, of which 18 are `Prop`-valued targets and the rest the 3D encoding; read
in full this session), `axiommath/AreaLaw2D/OpenAI/Cylinder3D.lean` (the proved B.1 pair
— the architecture this pilot's P2 generalizes), `research/feasibility/ITERATION4-SEED-
DOSSIERS.md` seed 1 + `research/novelty/iter4-seed-triage.md` row 1 (NEW-LEAN,
conditional/glue grade; pre-charter gate PASS 2026-11-14), `research/feasibility/
axiommath-donor-probes.md` G4/G5a (substrate verdicts). Execution discipline mirrors
`research/pilots/71-prework.md` / `73-prework.md` / `lp-layer-prework.md` (P0 → P1 → P2;
probe-convention stubs; inline full-coverage axiom audits; Modal-only; logs with
provenance headers).

**Verdict up front: GO at Tier "mathlib-only statement layer + donor-architecture
port", zero donor imports, zero donor builds.** G4 proved the donor's 2D statement core
(incl. the entropy/Region layer) re-derives mathlib-only on our pin (0 errors, Physlib
not needed at statement level); the 3D layer adds only cubic-lattice definitions on
mathlib's `SimpleGraph` API. The donor's vendored build needs Physlib (G5a boundary
measured) — the mathlib-only restatement route avoids it entirely.

---

## §1 The pilot in one page — the rung is NAMED: **B.2 (SlabAreaLaw3D)**, staged

**The charterable surface** (A5 gate caveat, verbatim): the north star `AreaLaw3D` is
"not a target" (`docs/3D/Targets.md` §A: the 2D proof does not reach it; four named
obstructions — C.1 scanner exponents, C.2 first subvolume exponent, C.3 amplification
radius, C.4 point contacts — "any document or commit that claims progress on `AreaLaw3D`
should say which of the four it resolves"). B.1 (cylinders) is already donor-owned:
`OpenAI.cylinderAreaLaw3D` (`Cylinder3D.lean:574`, for `0 < Δ`) and
`OpenAI.cylinderAreaLawOfPlanar3D` (`:526`, every parameter set) — cite, never re-prove.
The open surface is **B.2–B.5**; this prework targets **B.2: the area law inside a slab
`ℤ² × [0, h)` for ARBITRARY finite domains and cuts** (`SlabAreaLaw3D`), the rung the
orchestrator named, with its donor-sketched route (§B.2: sites fibred over `ℤ²`,
ambient geometry on the projection, physical regions as fibres).

**Why B.2 is not one slot, honestly.** The donor's own verdict (Targets.md §B.2 :55):
"Plausible with bounded new work, most of it restating; the risk is volume, not
mathematics" — the restatement is *every Lean statement on `ℤ × ℤ` restated for a site
type with a projection to `ℤ²` and fibres of size at most `h`*, i.e., the fibre-generic
re-abstraction of the donor's 161-file `AreaLaw/` tree (S01–S11). That is donor-scale,
not pilot-scale. And the donor flags one genuine mathematical uncertainty ("I am not
certain that no step of Section 11 uses that a planar tile contains whole columns; I
found none" — Targets.md §B.2, `Uncertainties` :139).

**The staged ladder this prework proposes [PROPOSAL]:**

- **AL-P0** — the mathlib-only statement port of the frozen 3D layer (the seed's stage
  (a); serves ANY B-rung, including A1's charter-draft B.3 alternative, identically).
- **AL-P1** — the B.2 route's geometric core on our pin: the projection/fibre lemmas the
  donor's route rests on (§2.5 below), incl. the "graph distance dominates projected sup
  distance" link (Targets.md report item 9) and the column-boundary lift.
- **AL-P2** — the first B.2 rung-stone: **`SlabAreaLawColumnCuts3D`** (NEW name beside
  the frozen one, per Targets.md §D rule 2) — the slab area law for **column-closed
  cuts**, conditional on a NEW variable-height planar area-law binder
  (`PlanarAreaLawVar`, §2.4) — the `Cylinder3D.lean` architecture (column regrouping
  `finFunctionFinEquiv`, Hamiltonian/gap/entropy transfer, boundary lift) generalized
  from full cylinders of uniform height `h` to slab domains with per-column heights
  `h_u ≤ h`. This is where B.2 genuinely begins: arbitrary cuts in slabs are strictly
  harder (the donor's two-sheets counterexample kills the naive column argument —
  Targets.md §B.2 :49), and the column-closed class is exactly the cut family the
  column machinery still bounds.
- **HARD STOP before any full `SlabAreaLaw3D` attempt** (fibre-generic restatement of
  the S01–S11 tree = a separately-chartered, donor-scale tranche).

**Note for chartering (non-presumptuous):** A1's charter-draft slot 2 lists stage (b) as
`PositiveReplacement3D` (B.3, "the most routine of the targets" per Targets.md :65).
This prework executes the orchestrator's B.2 instruction; AL-P0 serves either choice
unchanged, and AL-P1's fibre lemmas are B.3-neutral (B.3 replaces counting constants
only). The charter decides; nothing here presumes.

## §2 Exact statement specs

### 2.1 The frozen target, VERBATIM (`OpenAI/Statements3D.lean:164–182`; read this session)

```lean
/-- A domain inside the slab `ℤ² × [0, h)`: every site has third coordinate in `[0, h)`. -/
def IsSlabDomain3D (h : ℕ) (Λ : Finset (ℤ × ℤ × ℤ)) : Prop :=
  ∀ x ∈ Λ, 0 ≤ x.2.2 ∧ x.2.2 < h

/-- **Target 2**, the area law inside a slab of thickness `h`: `AreaLaw3D` restricted to
domains `Λ` with `IsSlabDomain3D h Λ`.  The constant may depend on `h`. -/
def SlabAreaLaw3D (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ) : Prop :=
  ∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ × ℤ), IsSlabDomain3D h Λ →
    ∀ Φ : (X : Finset (ℤ × ℤ × ℤ)) → Matrix (Reg (Qudits3D q) X) (Reg (Qudits3D q) X) 𝕜,
      IsAdmissible3D Λ R J Φ →
    ∀ (Ω : Reg (Qudits3D q) Λ → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) (E₀ : ℝ),
      hamiltonian3D Λ Φ *ᵥ Ω = (E₀ : 𝕜) • Ω → HasGlobalGap (hamiltonian3D Λ Φ) Ω E₀ Δ →
    ∀ (A : Finset (ℤ × ℤ × ℤ)) (hA : A ⊆ Λ),
      (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary3D Λ A).card
```

(Frozen per Targets.md §D rule 1: a proof is a `theorem` whose type is the frozen `def`
applied to its parameters, hypotheses as listed, nothing more; rule 2: statements never
change — a weaker/variant result gets a NEW name beside. The 3D encoding cluster the
statement consumes, all transcribed verbatim in AL-P0: `cubicLattice3D` (:64,
`hasse ℤ □ (hasse ℤ □ hasse ℤ)`), `domainEDist3D` :75, `edgeBoundary3D` :98
(`cubicLattice3D.interedges A (Λ \ A)`), `Qudits3D` :121, `supports3D` :125,
`hamiltonian3D` :133, `IsAdmissible3D` :140 — each mathlib-only.)

### 2.2 The donor-owned B.1 pair (cite; the P2 architecture)

`OpenAI.cylinderAreaLawOfPlanar3D` (`Cylinder3D.lean:526`) : `CylinderAreaLawOfPlanar3D`
for every parameter set; `OpenAI.cylinderAreaLaw3D` (`:574`, `0 < Δ`): from `area_law`.
Architecture (donor header + file, read this session): the column map
`column x := (x.1, x.2.1)`; `IsCyl`/`cyl` (`S' ×ˢ Finset.Ico 0 h` image); the
Reg-level reindexing `(Fin h → Fin q) ≃ Fin (q ^ h)` via mathlib's `finFunctionFinEquiv`
(`Mathlib/Algebra/BigOperators/Fin.lean:577`, [VERIFIED on our pin]); term regrouping
(≤ `2 ^ (h (2R+1)²)` terms per projected support, strength `2^{h(2R+1)²} max J 1`);
path-projection (`d_{Λ'} ≤ d_Λ`); eigenvector/gap/entropy relabelling; the Araki–Lieb
column-split remainder `|B| ≤ h |∂_Λ A|`. **Consumed as PATTERN ONLY** (transcribed to
mathlib-only, never imported — the donor file pulls `OpenAI.Cylinder3DSupport` → the
whole `AreaLaw.Transfer` tree → vendored Physlib).

### 2.3 The P2 target, NEW name beside the frozen one (Targets.md §D rules 2–3) [PROPOSAL]

```lean
/-- A cut is column-closed in `Λ`: it contains every site of `Λ` in each of its columns. -/
def IsColumnClosed3D (Λ A : Finset (ℤ × ℤ × ℤ)) : Prop :=
  ∀ x ∈ A, ∀ y ∈ Λ, (y.1, y.2.1) = (x.1, x.2.1) → y ∈ A

/-- The slab area law for COLUMN-CLOSED cuts — the first B.2 rung-stone. Weaker than the
frozen `SlabAreaLaw3D` (cut class restricted) and recorded as such, per Targets.md §D
rule 3; conditional on the variable-height planar area law (§2.4). -/
def SlabAreaLawColumnCuts3D (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ) : Prop :=
  PlanarAreaLawVar 𝕜 q R J Δ h →
    ∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ × ℤ), IsSlabDomain3D h Λ →
      ∀ Φ : (X : Finset (ℤ × ℤ × ℤ)) → Matrix (Reg (Qudits3D q) X) (Reg (Qudits3D q) X) 𝕜,
        IsAdmissible3D Λ R J Φ →
      ∀ (Ω : Reg (Qudits3D q) Λ → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) (E₀ : ℝ),
        hamiltonian3D Λ Φ *ᵥ Ω = (E₀ : 𝕜) • Ω →
        HasGlobalGap (hamiltonian3D Λ Φ) Ω E₀ Δ →
      ∀ (A : Finset (ℤ × ℤ × ℤ)) (hA : A ⊆ Λ) (_ : IsColumnClosed3D Λ A),
        (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary3D Λ A).card
```

Proof shape (P2, the Cylinder3D pattern at variable heights): group each column
`col_u(Λ) = {z : (u.1, u.2, z) ∈ Λ}` (height `h_u ∈ [0, h]`, finite by `IsSlabDomain3D`)
into one planar site of dimension `q ^ h_u` — the Reg reindexing is
`finFunctionFinEquiv` per column (`(Fin h_u → Fin q) ≃ Fin (q ^ h_u)`), generalizing the
donor's uniform-`h` map; terms with the same projected support add up (count
`2 ^ (h (2R+1)²)`, strength `J' = 2 ^ (h (2R+1)²) max J 1` — the `h`-uniform bound
dominates every `h_u ≤ h` count); paths project to no-longer walks on `π(Λ)`'s induced
graph; eigenvector/gap relabel verbatim; for a column-closed `A` the region entropy
equals the planar region entropy of `π(A)` (whole columns = single sites; no Araki–Lieb
remainder needed — that is exactly what column-closure buys, and why arbitrary cuts in
slabs are strictly harder); each planar crossing edge of `π(A)` lifts to a horizontal
crossing edge of `A` (AL-P1's boundary-lift lemma), so `|∂_{π(Λ)} π(A)| ≤ |∂_Λ A|`.
Apply `PlanarAreaLawVar` at the projected system.

### 2.4 The honest binder: variable-height planar area law [PROPOSAL]

```lean
/-- The planar area law at NON-UNIFORM local dimension: sites `u ∈ Λ'` carry
`Fin (q ^ h_u)` with `h_u ≤ h`; admissibility (range `R`, strength `J`), global gap `Δ`
as in `AreaLaw`. Specializes at constant `h_u = h` to the donor's uniform `AreaLaw 𝕜
(q ^ h) R J Δ` shape. A HYPOTHESIS at this tier: nobody has formalized the planar law at
variable local dimension (the donor proves the uniform case as `area_law`; the 2D proof
architecture is expected not to use uniformity — the binder records exactly that). -/
def PlanarAreaLawVar (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ) : Prop :=
  ∀ (Λ' : Finset (ℤ × ℤ)) (hU : ℤ × ℤ → ℕ), (∀ u ∈ Λ', hU u ≤ h) →
    ∃ C : ℝ, ∀ Φ : (X : Finset (ℤ × ℤ)) →
        Matrix (Reg (fun u => Fin (q ^ hU u)) X) (Reg (fun u => Fin (q ^ hU u)) X) 𝕜,
      IsAdmissibleVar Λ' R J hU Φ → … -- same eigenvector/gap/cut skeleton as AreaLaw
```

Honesty ledger for the binder: (i) it is NOT discharged in this pilot —
binder-conditional is the house style (`hQRH`/`EnclOK`/`hWeil` precedent) and A5's row-1
discipline ("the general 2D gapped law is still open informally, so keep every
statement binder-conditional" — **AAG arXiv:2103.02492 covers frustration-free 2D
only**; the uniform donor theorem `area_law` itself rests on the unrefereed [OAI265]);
(ii) at uniform heights it is the donor's `AreaLaw` shape verbatim, so a future donor
build (or a mathlib-only port of `area_law`'s statement as a second binder layer)
discharges it there; (iii) why not pad-to-cylinder instead: the padding route (extend
`Λ` to the full cylinder, add gap-preserving constant terms on complement sites) was
checked on paper this session and FAILS at the boundary count — padded columns adjacent
to `A`-columns create up to `h` new crossing edges per adjacent pair, not bounded by
`|∂_Λ A|` (comb-shaped `Λ`); recorded so nobody re-derives it.

### 2.5 The AL-P1 fibre-geometry core (B.2-route lemmas, mathlib-only; the donor's
report-item-9 link made formal) [PROPOSAL]

With `π : ℤ × ℤ × ℤ → ℤ × ℤ`, `π x := (x.1, x.2.1)`:

- **P1-a (projection contraction):** for `x y ∈ Λ`, the induced-graph distance on
  `π(Λ)` (adjacency `u ~ u'` iff some adjacent sites of `Λ` project to `u, u'`) is
  dominated by `d_Λ`: every `Λ`-walk projects to a `π(Λ)`-walk. The donor states this
  as the column-path argument (Cylinder3D header; Targets.md report item 9's ambient
  analogue). Lean shape: `Walk` image under `SimpleGraph.Hom`-style map on induced
  graphs (`SimpleGraph.induce`, `Mathlib.Combinatorics/SimpleGraph/`).
- **P1-b (boundary lift):** for `IsColumnClosed3D Λ A`, every crossing edge of
  `π(A)|π(Λ)` lifts to a horizontal crossing edge of `A|Λ`; card inequality
  `|∂_{π(Λ)} π(A)| ≤ |∂_Λ A|` via an injective lift (the donor's Cylinder3D edge-count
  step, generalized from `IsCyl` to slabs).
- **P1-c (row/fibre count):** `|(π ⁻¹' S) ∩ Λ| ≤ h * |S|` for `IsSlabDomain3D h Λ`
  (per-column fibres have ≤ `h` sites) — the "every row count acquires a factor `h`"
  step of the B.2 route (Targets.md §B.2 :51).
- **P1-d (slab basics):** `IsSlabDomain3D` closure facts used by P2's regrouping
  (column finiteness, `h_u ≤ h`).

## §3 Substrate inventory + why mathlib-only

- **G4 [CLEAN]** (`feasibility/axiommath-donor-probes.md` §G4): the donor's 2D
  statement layer — the `Reg`/`pureState`/`regionEntropy`/`HasGlobalGap`/entropy core
  (`Challenge/Basic.lean`, 262 lines) — re-derives mathlib-only on our pin after 3
  probe-side fixes; **`feasibility/probe/ProbeG4_AreaLaw.lean` IS the statement-port
  template** for AL-P0. Physlib is not needed at statement level.
- **G5a [BOUNDARY MEASURED]**: the donor's vendored build needs Physlib (lake-manifest
  dependency); staging was measured, build not completed. **Consequence: the pilot
  NEVER imports `OpenAI.*` or `AreaLaw*` from the donor** — everything donor-side is
  transcribed (statements verbatim; proof ARCHITECTURE as pattern). This also matches
  the donor's own toolchain (v4.36.0-rc2 = our pin) but the import route is blocked by
  Physlib staging cost, not toolchain.
- **mathlib names [VERIFIED on the encore checkout @ ff2494ea this session]:**
  `finFunctionFinEquiv {m n} : (Fin n → Fin m) ≃ Fin (m ^ n)` —
  `Mathlib/Algebra/BigOperators/Fin.lean:577` (the column-regrouping reindex);
  `SimpleGraph.hasse`/`□` (`SimpleGraph.Hasse`/`.Prod` — the donor's own statement
  imports, `Mathlib.Combinatorics.SimpleGraph.{Hasse,Prod,Metric}`); `Finset.Ico`,
  `Finset.interedges` (`SimpleGraph.interedges`), `Finset.image`/`+` pointwise — all in
  the donor's statement-import list, all standard. The entropy core names come from the
  G4 probe (already elaborated green once).
- **No analysis substrate beyond the G4 core** — B.2's staged ladder is graph-counting
  + the G4 entropy layer; the analytic 2D machinery (filters, LR bounds, comparators)
  sits BEHIND the `PlanarAreaLawVar` binder and is never touched.

## §4 Runner, substrate, custody [PROPOSAL]

- **Pilot directory** `research/pilots/al3d/` (new; lane-owned at charter). Runner:
  clone `research/pilots/73/run_pilot.sh` + `run_pilot.py` → app
  **`crossmath-pilot-al3d`**, stage `/tmp/crossmath-al3d-stage`, image recipe unchanged
  (elan v4.2.4, `v4.36.0-rc2`, mathlib @ `ff2494ea`, `lake exe cache get`; layers
  shared with the 71/73/lp apps). Probe-convention check stays `rel.startswith("P0")`
  — probe file `P0.lean`.
- **elan mirror** (orchestrator instruction): pin
  `https://github.com/leanprover/elan/releases/download/v4.2.4/elan-x86_64-unknown-linux-gnu.tar.gz`
  (proven, 13/13 runs this session); `leanprover-community/elan` is dead.
- **Files**: `P0.lean` (statement port probe, "not a proof artifact" header),
  `A1.lean` (fibre-geometry core, proof artifact), `A2.lean` (the rung-stone theorem,
  proof artifact; imports `A1` — pilot-11 sibling-import pattern, same note for A1's
  make_axcheck rewrite as lp's `L1 → AxL1`). Elaboration weight: the G4-style entropy
  core makes imports heavy — one warm run per milestone like G4's.
- Modal-only, `MODAL_USER=doz`, `/home/doz/dozenv/bin/modal`; NEVER local lake/lean;
  logs → `research/pilots/al3d/logs/` with provenance headers; inline full-coverage
  `#print axioms` per proof artifact (71/73 convention); artifact-cache transients:
  retry once or twice.

## §5 Milestone sequencing + guards (P0 → P1 → P2)

- **AL-P0 (S–M; one–two warm runs; guard ≤ 0.45k LoC):** statement port — the G4 core
  (carried from `ProbeG4_AreaLaw.lean`'s green shapes) + the 3D encoding cluster
  (§2.1 list) + the frozen `SlabAreaLaw3D`/`CylinderAreaLaw3D`/
  `CylinderAreaLawOfPlanar3D` signatures + the NEW `IsColumnClosed3D`/
  `SlabAreaLawColumnCuts3D`/`PlanarAreaLawVar` (§2.3–2.4), probe-convention stubs.
  Doubles as the substrate preflight (3D lattice API spellings).
- **AL-P1 (S; ≈ 0.15–0.35k LoC; guard ≤ 0.4k):** the fibre-geometry core P1-a…P1-d
  kernel-clean + inline axcheck. GO/NO-GO: if P1-b's boundary lift needs more than the
  induced-graph walk machinery (i.e., a fibre-generic restatement of donor lemmas),
  STOP — that is B.2-full territory, diagnose and report.
- **AL-P2 (M; ≈ 0.4–0.8k LoC; guard ≤ 0.9k):** `SlabAreaLawColumnCuts3D` under the
  `PlanarAreaLawVar` binder, GREEN + inline full-coverage axcheck. The statement is
  honestly labeled weaker-than-frozen (Targets.md §D rule 3) with the binder honestly
  labeled not-known-discharged (§2.4 ledger).
- **Stop gates (hard):** (i) NEVER `AreaLaw3D` or progress-adjacent phrasing without
  naming a C-item (§A fence); (ii) full `SlabAreaLaw3D` (arbitrary cuts) — separate
  charter, donor-scale; (iii) B.3/B.4/B.5 content — other rungs, other slots (B.5's
  hypothesis-inconsistency caveat applies if chartered later); (iv) donor imports —
  banned (G5a boundary); (v) discharging `PlanarAreaLawVar` — out of scope (binder
  discipline).
- **Overrun rule:** guard breach without GREEN ⇒ stop, diagnose-note in the log dir,
  report.

## §6 Consumer/rung map (which artifact feeds what)

| Artifact | Status after this pilot | Feeds |
|---|---|---|
| mathlib-only 3D statement layer (AL-P0) | elaboration-green, reusable verbatim | ANY B-rung (incl. A1's B.3 charter alternative); later cycles' 3D work |
| fibre-geometry core (AL-P1) | proved | B.2-full's substrate; B.4's clearance clauses (same sup-distance domination); AL-P2 |
| `SlabAreaLawColumnCuts3D` (AL-P2) | proved, binder-conditional | the first B.2 rung-stone; strict generalization of B.1's statement shape within slabs |
| `PlanarAreaLawVar` binder | stated, NOT discharged | the honest gap record; dischargeable later by a uniform-case donor port or a mathlib-only 2D port (separate tranche) |
| — (NOT this pilot) | — | B.1 re-proof (donor-owned), B.3/B.4 (other rungs), B.5 assembly, C.1–C.4 (fenced open) |

## §7 Risk register

- **R1 — informal-status discipline [mandatory citations]:** the uniform planar law the
  whole ladder leans on is the donor's `area_law` from the UNREFEREED [OAI265]
  (2026-09-24); the informal 2D gapped case is open — **AAG arXiv:2103.02492 is
  frustration-free 2D only**. Every unconditional-sounding claim is therefore
  binder-conditional (`PlanarAreaLawVar`); article wording cites [OAI265] (unrefereed)
  + AAG per A5 row 1.
- **R2 — challenge-repo clock (A5 row 1 / seed 1 (i)):** AreaLaw2D is an active
  challenge repo; the donor or a contestant may land B.2–B.5 first — date all claims;
  our artifacts are corpus-scoped regardless.
- **R3 — B.2's own uncertainty:** the donor's §11 whole-column caveat (Targets.md
  `Uncertainties` :139) shadows B.2-FULL, not the staged ladder (P2 never touches §11);
  `PlanarAreaLawVar`'s non-uniform case is genuinely unformalized — if a dossier-level
  check finds the 2D proof DOES use uniform local dimension, the binder becomes the
  honest permanent fence (and the finding itself is worth recording).
- **R4 — substrate:** G5a's Physlib boundary (banned-import consequence, §3); G4-style
  heavy imports (one warm run per milestone); 3D lattice API spellings (P0 preflights).
- **R5 — scope creep (banned list per §5 gates):** no `AreaLaw3D`, no full
  `SlabAreaLaw3D`, no B.3/B.4/B.5, no binder discharge, no donor imports, no Physlib.
- **R6 — statement fidelity:** AL-P0 transcribes the frozen layer VERBATIM (Targets.md
  §D rule 1); the two NEW defs (`SlabAreaLawColumnCuts3D`, `PlanarAreaLawVar`) obey
  rule 2 (new names beside, old untouched) and rule 3 (recorded as weaker/variant, not
  as progress on the frozen `SlabAreaLaw3D`).

## §8 Sources (this session)

Donor (read in full): `axiommath/AreaLaw2D/docs/3D/Targets.md` (§0 encoding, §A :15–23,
§B.1 :29–43, §B.2 :45–55, §B.3 :59–67, §B.4 :69–79, §B.5 :81–91, §C.1–C.4 :103–127,
§D :129–134, Uncertainties :136–141); `OpenAI/Statements3D.lean` (:64–431 — encoding +
18 Prop targets + templates cluster); `OpenAI/Cylinder3D.lean` (:1–80 header/column
layer read; theorems at :526/:574; `Cylinder3DSupport.lean` :319 `area_law`);
`OpenAI/Statements.lean` import block (the mathlib statement-import list);
`lean-toolchain` (v4.36.0-rc2); `lake-manifest.json` (physlib dependency). This repo:
`research/feasibility/ITERATION4-SEED-DOSSIERS.md` seed 1 (:51–105);
`research/novelty/iter4-seed-triage.md` row 1 + seed-1 gate evidence (OAI265 tex 0
3D-hits; `Statements3D.lean` frozen-defs header; B-rung caveat);
`research/feasibility/ITERATION4-CHARTER-DRAFT.md` (a)(d) slot 2 [PROPOSAL];
`research/feasibility/axiommath-donor-probes.md` §G4 (statement layer mathlib-only,
0 errors) + §G5a (Physlib boundary); `research/feasibility/probe/ProbeG4_AreaLaw.lean`
(the port template). mathlib (`ff2494ea`): `Mathlib/Algebra/BigOperators/Fin.lean:577`
(`finFunctionFinEquiv`), `Mathlib/Combinatorics/SimpleGraph/{Hasse,Prod,Metric}.lean`
(donor-cited statement imports). Execution conventions: `research/pilots/71-prework.md`,
`73-prework.md`, `lp-layer-prework.md`, `research/pilots/73/run_pilot.{sh,py}`,
`research/pilots/71/logs/p2-run6.log` (inline axcheck pattern; elan URL proven),
AGENTS.md.

— end prework (A2; PROPOSAL — chartering, rung choice and slot ordering are the
orchestrator's; this file owns the execution spec only).
