# Pre-work spec — pilot 75 (abelian-assembly ζ_L proportions, wave-4)

Lane A9 (dossier-writer), 2026-11-13, per the orchestrator's pre-positioning instruction.
**SPEC ONLY — no Lean execution**; the pilot is deferred to wave-4 (empirical-record relay:
71-P2 + 73-C first, 72-M1 (A8), 75 wave-4). Consistency split per the 71/72-prework
pattern: dossier 75 (`research/candidates/75-abelian-assembly-zetaL-proportions.md`,
FINAL + A5-revised) owns novelty/positioning; this file owns statements, binder inventory,
milestones, risks, Modal plan. Companions: `research/novelty/axiommath-as-donor.md` §(f)
(the donor map), `research/survey/axiommath-cft-vendor.md` (A1-4's one-line answer — the
consumption-route authority), `research/pilots/42-M4-blueprint.md` + `research/pilots/42/
M4a-note.md` (the landed 42-M4 state cited below), `research/pilots/50-M2-31-32-spec.md`
(the shared-ℚ coordination partner, §d).

**Verdict up front: GO at the binder route — zero import gates for N0–N2.** Nothing in the
milestone chain imports DZDF, the CFT vendor, zeta23, or V2: every donor fact enters as a
verbatim-transcribed hypothesis binder (the EnclOK/hQRH precedent; A1-4: "YES for
statements … exactly the 42-M2a `hfac` pattern, with discharge deferred to a G1-cleared
DZDF build"). The single optional gate is N2's ζ-side route choice (M4b-import vs
M4b-fallback binders — A7 G2/G4), and the fallback needs nothing new.

## (a) Statement spec — the abelian-assembly landing over the GREEN 42-stack

**Base vocabulary consumed (cite: the landed M4a/M4b files, self-contained per the
pilot-01 duplication convention; M1/M2a/M3/M2b remain frozen heritage):**

- From `research/pilots/42/M4a.lean` (GREEN: 1,194 LoC; runs `logs/m4-run1.log` FAIL →
  `m4-run2.log` OK 0 errors/0 sorry; full-coverage axcheck 54 theorems triad-only,
  `logs/m4-axcheck-run1.log`): `ZeroMult`/`multOf`/`WindowFinite` (:103),
  `stripWindow` (:47), `ZeroMult.countCum`/`countOnCum` (cumulative (0,T], with
  multiplicity), `ZeroMult.distinctCountCum` (:820, STRIP-wide distinct — the faithful
  Ndist vocabulary), `commonStripCum` (:826), `EpsLowerCum` (:832),
  `EpsLowerDistinctStripCum` (:837), `distinctCountCum_add` (:856),
  `distinctCountCum_of_factorization` (:944), `assemble_eps_defect_strip_cum`,
  `K839OfLocalStrip`, and the landing shapes `zetaK_two_thirds_landed` (2/3-family,
  carried) + `zetaK_distinct_five_sixths_strip_landed(_of_negligible)` with the
  `hEχdStrip`/`hCZStrip` binders (identifier note: the spec's U+2032 primes were renamed
  `…Strip` — run-1 finding, M4a-note).
- From `research/pilots/42/M4b.lean` (on disk, 1,551 LoC = the M4a layer carried + the
  V2 addendum; **no persisted m4b run log at this prework's freeze** — its fallback
  route is executable with `run_m4.sh` unchanged per M4a-note's Next section): the V2
  counting vocabulary re-declared, the pilot↔V2 set/count identifications, the numeric
  endpoint lemmas, the ζ-side discharges from the `hV2d4`/`hV2d5` binders, and the
  LANDED forms `zetaK_two_thirds_landed_of_V2`,
  `zetaK_distinct_five_sixths_strip_landed_of_V2(_of_negligible)` (`#print axioms` at
  :1548–1551) — the template N2 consumes.

**New declarations pilot 75 adds (the n+1-factor lift; nothing else is new):**

- **N1-a (P-a), the with-multiplicity landing:** for factorization data
  `(f_K, F : Fin n → ℂ→ℂ, f_L)` and `z_K := ⟨multOf f_K, hfinK⟩`,
  `z i := ⟨multOf F i, hfin i⟩`, `c* = min (c₀, ⨅ i, c i)`:

    `zetaL_assembly_landed : hAbFac → (∀ i, EpsLowerCum (z i) (c i)) →
    EpsLowerCum z_K c₀ → (structural set) → EpsLowerCum ⟨multOf f_L, hfinL⟩ c*`

  via an n-fold `ZeroMult.add` iteration (`ZeroMult.addFin`) with
  `countCum_addFin`/`countOnCum_addFin` (the 2-factor `countCum_add`/`countOnCum_add`
  iterated — `Finset.sum` associativity bookkeeping) and `EpsLowerCum_mono` levelling
  all components at c* before applying the 2-factor engine n times. This is
  `epsLowerCum_of_factorization` (the M2b-lineage engine, carried in M4a/M4b) with the
  iteration made explicit — engine unchanged.
- **N1-b (P-b), the strip-distinct defect form:** ∀ε>0, ∃T₀, ∀T≥T₀:
  `(c* − ε)·countCum z_L T ≤ distinctCountCum z_L T + Σ_{i<j} commonStripCum (z i) (z j) T`
  — the 2-factor `assemble_eps_defect_strip_cum` lifted pairwise; see risk (ii) for the
  inclusion–exclusion care. `_of_negligible` full form under the family binder
  `hCZStripFam` (§b-6).

## (b) Binder inventory (EnclOK posture; statement-only, zero imports — A1-4's authority)

1. **`hAbFac` — the factorization binder** (mirrors `dedekindAbelianQuotient`
   `EntireAbelianQuotient.lean:13` / `abelianFactorization`
   `AbelianRayCharacterFactorization.lean:62`, statement-quoted):
   `∀ s ≠ 1, f_L s = (∏ i, F i s) * f_K s`, with the analyticity datum — f_K, f_L
   analytic off {1}; each F i ENTIRE (the nonprincipality `¬(χ i).IsPrincipal` of
   `abelianFactorization`'s conclusion is carried as "F i entire", which is all the
   assembly consumes). Discharge: deferred to a G1-cleared DZDF build; never imported
   in N0–N3.
2. **Component-proportion binders (the named open core):**
   `hAcomp : ∀ i, EpsLowerCum (z i) (c i)` — Hecke-L proportions nobody has; the schema
   every future donor (dossier 20's engine; a Lamzouri-for-Hecke) discharges slot-in.
3. **ζ-component binder/discharge (at K = ℚ only):** base form
   `hAK : EpsLowerCum z_K c₀`; at ℚ, discharge via M4b's route — either the V2 import
   (`ZetaZeros.simple_proportion_lower`, `ZetaZerosV2/ZetaZeros/Main.lean:47`; gated A7
   G2/G4) or M4b's fallback `hV2d4` numeric-endpoint binder + the numeral lemma
   `2/3 ≤ C₀` (the M4b pattern verbatim; needs nothing new).
4. **Dirichlet-side binders (at ℚ):** per-component `hEχ`-family — zeta23 ThmE statement
   shapes in the `hEχ`/`hEχdStrip` pattern (statement port ≈ 0 cost corpus-wide; proofs
   are the v4.33 tree — out of scope, they stay binders).
5. **Structural set:** per-factor `AnalyticAt`/`analyticOrderAt ≠ ⊤` (`hntop*` pattern)
   + **window-finiteness `hfin*`** per A3 §(f) — no on-pin donor for ζ_L or the Hecke
   factors; carried explicitly, with the named derivation route (zeros of a nonzero
   function analytic off {1} are discrete ⇒ `WindowFinite`, the `zeroMultOf hfin` /
   `IsCompact.inter_riemannZetaZeros_finite` pattern — routine, a real obligation).
6. **`hCZStripFam`** — the n-wise strip-common negligibility (full distinct form only):
   every pairwise `commonStripCum (z i) (z j)` is a density-zero fraction of
   `countCum z_L`; inherits `20-hCZ-NOTE.md`'s not-provable-today verdict — binder by
   design.

## (c) Milestones

- **N0 (probe, S, <0.2k LoC):** statement-layer elaboration of `hAbFac`'s shape and a
  synthetic 3-factor engine check — run the 2-factor engine twice over synthetic
  `ZeroMult` data (ζ × L(χ₁) × L(χ₂)-shaped) to validate the `addFin` plumbing before
  any donor statement is touched. Zero gates; `run_m4.sh` infra unchanged.
- **N1 (assembly engine, M, ≈0.4–0.7k):** `ZeroMult.addFin` + the additivity lemmas +
  `zetaL_assembly_landed` (N1-a) + the pairwise defect form (N1-b). The priced item is
  risk (ii).
- **N2 (unconditional-at-ℚ instantiation, M, ≈0.4–0.8k):** the ℚ ray-class dictionary +
  Euler-immunity lemma (§d) + M4b-route ζ-side discharge + `hEχ` binders ⇒
  `zetaL_two_thirds_landed_ℚ`: for every abelian L/ℚ (cyclotomic fields and subfields),
  `EpsLowerCum ⟨multOf f_L⟩ (2/3)` conditional only on the Dirichlet-component binders +
  structural set — the partially-unconditional landing of dossier 75 (C2).
- **N3 (axcheck, S):** full-coverage axcheck (pilot-10 `axcheck_full.py` — the M4a
  54-theorem precedent) over every N0–N2 file; if the V2-import route was taken at N2,
  add the on-pin `#print axioms` of the V2 endpoints (A3 recommendation 4); persist logs
  with provenance headers per the log-rescue convention.

## (d) Shared-ℚ glue — prove-once coordination with pilot 50-M2

Two lemmas are shared consumers with dossier 70 / pilot 50-M2 (R2 route):

- **(d1) the Dirichlet ↔ `RayClassCharacter ℚ (q)` dictionary** (fields checked
  axiom-by-axiom against `Arithmetic/RayClasses/Character.lean:12–18`; total positivity
  kills the archimedean sign clause over ℚ);
- **(d2) the Euler-correction strip-immunity lemma** (imprimitive-character correction
  factors `(1 − χ*(p)p^{−s})` have all zeros on ℜs = 0, hence none in the open strip —
  `Complex.abs`-level).

**Consumer map (flagged per the coordinator's note):** 75-N2 needs BOTH (d1)+(d2);
50-M2's **R2 route** (DZDF 31/32 at K = ℚ) needs (d1) only; 50-M2's **preferred R1
route** (openai in-corpus at 7/8) needs NEITHER (it stays at the
`DirichletCharacter.LFunction` level) — and R3 (Liu-1 external, statement-binder) also
does not need (d1). Recommendation: land (d1)+(d2) once in a single shared staging file
(natural home: `research/pilots/75/` with 50-M2's spec cross-referencing it, or a
coordinator-designated shared location — ownership call is the orchestrator's); both
pilots then quote the statement. Do not duplicate.

## (e) Effort estimate + risk register

**Effort:** N0 S (<0.2k) + N1 M (0.4–0.7k) + N2 M (0.4–0.8k; less if 50-M2 has landed
(d1) by then) + N3 S ⇒ **≈0.9–1.7k LoC total**, self-contained over the carried
M4a/M4b vocabulary (copy sources: the two GREEN/on-disk 42 files). Anchor: M4a landed at
1,194 LoC for a re-vocabulary; 75's lift is narrower (iteration + dictionary) but adds
the ℚ glue.

**Risks:**

- (i) **n-fold bookkeeping** — `ZeroMult.add` associativity, supp-of-sum finiteness,
  `Finset.sum` reindexing: mechanical, the known friction (M2b's `countCumOf_add`
  pattern generalizes).
- (ii) **the pairwise-defect lift (N1-b) is the priced mathematical item**: distinct
  counts over an n-fold multiset union do not lift trivially from the 2-factor
  `commonStripCum` defect — an inclusion–exclusion argument is needed, with the
  conservative fallback of stating the defect as the ITERATED 2-factor defect (weaker
  statement, same proof shape) if the clean pairwise form resists. Flagged for N1.
- (iii) **window-finiteness obligations** (A3 §(f)): no on-pin donor; the discreteness
  route is routine but per-factor and must not be silently assumed.
- (iv) **M4b unrun**: no persisted m4b log at this freeze. N2's ζ-side does NOT depend
  on M4b being green — the fallback `hV2d4`/`hV2d5` binder pattern is executable today
  — but if M4b's own run surfaces issues, N2 should quote only its fallback layer.
- (v) ** clocks/depreciation:** none adverse — Liu-2's Lean (when it lands) touches
  half-planes, not proportions; DLRT resolved (A5 P2-3: scoped, N stays 4); the
  statement's value is stable across the QR-D cluster's motion.
- (vi) **coordination risk** on (d1)/(d2): dual consumers — mitigate by the single
  shared staging file (§d); if 50-M2 lands them first, N2 shrinks by ≈0.2k.
- (vii) identifier hygiene: no U+2032 primes (M4a run-1 finding); follow the `…Strip`
  naming convention.

**Modal plan:** the `run_m4.sh` pattern (Modal app `crossmath-pilot-42-m4` → a 75
sibling; axbump staging, doz CLI), statement-only staged files importing Mathlib alone;
logs persisted with provenance headers; axcheck per N3.

— end spec (A9; pilot lane assignment is post-triage; wave-4).
