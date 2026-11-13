# Abelian Assembly: Zero Proportions for ζ_L Across the Whole Abelian Tower

*cross-math-fronttier research article 75 (Cycle 2) · DRAFT (entry milestone LANDED —
A4 FORMAL REPORT LANDED, 2026-11-14; P-b carried to Iteration 4) · dossier
`research/candidates/75-abelian-assembly-zetaL-proportions.md` (70-Part-B split-out) ·
spec `research/pilots/75-prework.md` (complete) · donor map `research/novelty/
axiommath-as-donor.md` §(f) · machinery `research/pilots/42/` (M1–M2b, M4a GREEN; M4b
run2 GREEN on disk, pending A3 relay) · upgraded sibling article
`42M4-zetaK-proportions-unconditional-zeta-column.md`*

**Status: DRAFT — entry milestone LANDED (A4 FORMAL REPORT LANDED, 2026-11-14).** The
assigned Cycle-2 scope — **Pilot entry (P-a)+(C1) at 2/3, binder-postured over the GREEN
pilot-42 stack — is COMPLETE, GREEN, FINAL for Cycle 2**: `run6-final` rc=0 errors=0
sorry=0, descent 26→7→1→2→2→0; Pa.lean ≈363 new LoC on the 1,194-LoC M4a carry (1,557
LoC / 66 theorems, under the 0.6k overrun guard); **in-file audit 17/17 declarations
(3 heritage M4a landings + 11 new public + 3 private) exactly the triad, zero sorryAx**.
**P-b (the 5/6 strip-distinct arm) and the N2 ℚ-route CARRY to Iteration 4** (P-b design
on file, +0.2–0.3k LoC; A4's design note incoming). Headline as it stands: **the first
zero-proportion statement one degree up pilot-42's tower — ζ_L at 2/3 (with
multiplicity), conditional on the component-proportion binders, every abelian
extension.** The §5 fills carry the split verdict; nothing below is slot-gated anymore.

---

## Abstract (drafted; statement content from the FINAL dossier)

AxiomMath's DedekindZetaZeroFree proves, for every abelian Galois extension L/K, the
factorization ζ_L = (∏ nonprincipal ray-class Hecke L-series of K) · ζ_K — a theorem with
no consumer anywhere. Pilot 42 (main run) proved that zero-proportion statements for a
quadratic ζ_K assemble from proportion statements for its two factors by an exact
counting algebra, kernel-verified. We combine the two: the n+1-factor assembly — over the
whole abelian tower — yielding the first zero-proportion statements for ζ_L of any kind,
in any formal system: (P-a) with-multiplicity proportions (≥ 2/3 of ζ_L's window zeros on
the critical line) under component-proportion binders that no corpus can discharge
today — the named open core; (P-b) the strip-distinct defect and hCZ′-seamed 5/6 forms;
(C2) the partially-unconditional instantiation at base K = ℚ — the ζ-component discharged
outright by ZetaZerosV2's Lamzouri endpoints (the M4b route), Dirichlet components as
zeta23 ThmE binders — giving, for every abelian L/ℚ (cyclotomic fields and all
subfields), a ζ_L proportion statement conditional on strictly fewer hypotheses than any
prior ζ_L statement, there being no prior ζ_L statement; and (C3) the location-side
corollary extending unconditional strip confinement to real-place abelian fields outside
dossier 70-C2's totally-complex reach. The mathematics is deliberately corollarical —
the analytic content is quarantined into the component binders; the claims are the
statement class, the binder schema, and the ℚ-route accounting.

## 1. Introduction (drafted)

Dossier 70 Part B identified the combination (DZDF's general-abelian factorization × the
pilot-42 assembly engine) as the 70-series' discovery-grade content and split it out as
dossier 75 at A5's dossier-check; A5's PART-2 P2-3 flip resolved the gating literature
question (DLRT 1908.04876 is SCOPED — fixed quadratic K, GRH-conditional, T→∞ — nothing
uniform over K), so the primary is NOT math-known: Novelty 4 stands. Nobody, formal or
informal, states proportions for ζ_L. The pilot's design rule (prework §(a)): every donor
fact enters as a hypothesis binder — zero imports of DZDF/CFT/zeta23/V2 at the statement
layer (A1-4's authority) — so the whole tower lands on our pin with the assembly engine
GREEN beneath it (42-M1/M2a/M3/M2b; M4a; M4b run2 on disk).

**Honesty.** The assembly machinery is pilot 42's and is not claimed; the deltas are the
n+1-factor statement class, the component-binder schema (EnclOK posture: Hecke-L
proportions as named hypotheses — the open core nobody has), the ℚ-route accounting, and
C3's real-abelian strip. At K = ℚ the right half of any confinement is just DZDF@L (CT
applies to every field); the factorization route's genuine new coverage is (i) the
proportions and (ii) the left half for real-place abelian L/ℚ.

## 2. Setting (drafted)

Pilot-42's cumulative-window vocabulary (0,T]: `ZeroMult`/`multOf` (= mathlib
`analyticOrderNatAt`), `countCum`/`countOnCum`/`EpsLowerCum`/`EpsLowerDistinctCum`
(`M2b.lean:779–804`), the engine `epsLowerCum_of_factorization` (:1024); the M4a
strip-distinct layer (`distinctCountCum` :821, `EpsLowerDistinctStripCum` :833,
`commonStripCum`, hCZ′). Donors (binder-quoted): DZDF `dedekindAbelianQuotient`
(`EntireAbelianQuotient.lean:13`) and `abelianFactorization`
(`AbelianRayCharacterFactorization.lean:62`) — the factorization datum `hAbFac : ∀ s ≠ 1,
f_L s = (∏ i, F i s) * f_K s` with the nonprincipality clause; V2
`simple_proportion_lower`/`distinct_proportion_lower` (`ZetaZerosV2/ZetaZeros/Main.lean:47,88`);
zeta23 ThmE (`hEχ`/`hEχd`). Shared glue with pilot 50-M2 (§(d) of the prework): the
Dirichlet ↔ `RayClassCharacter ℚ (q)` dictionary (d1) and the Euler-correction
strip-immunity lemma (d2) — prove once, both pilots quote.

## 3. Main results (the pilot's targets — statements from prework §(a))

**N1-a (`zetaL_assembly_landed`, with-multiplicity).** For abelian factorization data
with window-finiteness: if `EpsLowerCum z_K c₀` and `EpsLowerCum (z i) (c i)` for every
component i, then `EpsLowerCum ⟨multOf f_L⟩ c*` at c* = min(c₀, min_i c i) — the n+1-factor
generalization of `zetaK_two_thirds_landed` (`M2b.lean:1062`), same ε-shapes, hypothesis
list lifted from two factors to the family.

**N1-b (strip-distinct defect form).** The `EpsLowerDistinctStripCum` assembly at c* with
pairwise `commonStripCum` defects, and the hCZ′-seamed full form (n-wise strip-common
negligibility binder — inherits `pilots/20-hCZ-NOTE.md`'s not-provable-today verdict).

**N2 (`zetaL_two_thirds_landed_ℚ`, the partially-unconditional landing).** For every
abelian L/ℚ: `EpsLowerCum ⟨multOf f_L⟩ (2/3)` conditional only on the Dirichlet-component
ThmE binders + the structural set — ζ-side discharged unconditionally by the M4b-route
V2 endpoints + count-identification glue + `2/3 ≤ C₀`; the C3 location corollary at
parametric θ (31/32 in-corpus instantiation; Liu-1 external option) for real-place
abelian fields.

## 4. Proof architecture (drafted)

N-factor order-additivity from `hAbFac` (`multOf f_L ρ = multOf f_K ρ + Σ_i multOf (F i)
ρ` — pilot-42 M2a's argument iterated over `Fin n`; F i entire by nonprincipality); the
engine iterated along `ZeroMult.add` associativity with `EpsLowerCum_mono` levelling;
window-finiteness as structural hypotheses (discreteness route the fallback); N2 = (d1) +
(d2) + the M4b glue; N3 = full-coverage axcheck (pilot-10 `axcheck_full.py`, the M4a
54-theorem precedent; plus on-pin V2-endpoint axiom prints if the import route was taken).

## 5. Pilot evidence (FILLED from A4's FORMAL REPORT, 2026-11-14)

- **N0: FOLDED** — the probe checks (statement shapes + synthetic 3-factor engine
  validation) were folded into `Pa.lean`'s abstract statements rather than run as a
  separate stage (A4's execution choice; recorded here so the ledger's N0 row closes).
- **N1: LANDED GREEN — `zetaL_assembly_landed`** (the N1-a with-multiplicity assembly
  + the C1 instantiation at 2/3): run6-final OK, descent 26→7→1→2→2→0, ≈363 new LoC on
  the M4a carry. **N1-b (P-b, the 5/6 strip-distinct arm): CARRIED-TO-ITERATION-4**
  (design on file, priced +0.2–0.3k LoC).
- **N2 (ℚ instantiation + `zetaL_two_thirds_landed_ℚ`): CARRIED-TO-ITERATION-4** (the
  shared (d1)/(d2) ℚ-glue and the M4b-route discharge are Iteration-4 milestones per
  the orchestrator's scope decision).
- **N3: LANDED — axcheck GREEN** (in-file audit 17/17 exactly triad incl. the 3
  heritage M4a landings; zero sorryAx; full close-out sweep registered in
  FINAL-SWEEP-PLAN-C2 TARGETS).
- **Final: LANDED GREEN 2026-11-14** — "Pilot entry (P-a)+(C1) at 2/3, binder-postured
  over the GREEN pilot-42 stack: GREEN (run6-final, rc=0, 0 errors/0 sorry, descent
  26→7→1→2→2→0)." This fills the [VERDICT:75-final] slot; the skeleton promoted to
  DRAFT.
- **Strengthening (A4's report, fold into the binder story of §2/§3):** the landed
  binder inventory matches prework §(b) EXACTLY **except `hntop-partial-products` —
  derived away via the ℕ∞ `analyticOrderAt` route**: additivity is applied at the
  `analyticOrderAt` level, where `analyticOrderAt_mul` is unconditional, so per-factor
  ≠ ⊤ suffices and the partial-product non-⊤ binder disappears. (One fewer hypothesis
  than designed.)

Supporting landed evidence (citable now): the GREEN 42-stack incl. M4a (1,194 LoC/54
thms, ≈180 LoC assembly delta — the n = 2 instance of N1) and **M4b BOTH ROUTES
FINAL-GREEN (per A1 §9, 2026-11-14): fallback 1,560/66 + the upgrade COMPLETE on the
primary route (m4b2-run2 direct-V2-import GREEN, 1,571/68 — canonical per A3's in-run
LoC correction — landing + donor-proportion
theorems exactly triad, fallback byte-exact preserved) — the V2-glue route N2 consumes,
now proven at pilot scale**; G2 (V2 builds on-pin, 13/13 triad); A1-4
(binder route needs zero vendor imports); G1b FAIL (import route stays closed — the
statement layer was designed for exactly this).

## 6. Relation to prior work (drafted)

DLRT 1908.04876 (corrected qualifiers: GRH-conditional, fixed quadratic K, T→∞ — the
gating nearest miss, hypothesis-shape-to-hypothesis-shape); Liu-2 2610.26835 (family
overlap, half-plane nonvanishing only — C3's clock, not a (P) competitor); article 42 +
article 42-M4 (the machinery and its upgraded ζ-column); DZDF (the factorization, no
counting); dossier 20's engine route (the sibling L-effort path to the component
binders); dossier 70 (the confinement vocabulary, the ℚ glues, the per-class split and
clocks — standing notes incl. the tracker audit: ζ_K split survives; Bebel's formal
Dirichlet frontier 0.8733458561 bounds none of our claims).

## 7. Limitations and open problems (drafted)

The component-proportion binders are the open core (discharge paths: dossier 20's engine
(L), a hypothetical Lamzouri-for-Hecke); hCZ′ inherits hCZ's conjecture-grade status;
the Dirichlet components stay zeta23-conditional until the v4.33 port; window-finiteness
for ζ_L is carried structurally (A3 §(f) caveat); the falsity trap's scope note (no
per-curve family proportions — different zone, dossier 71's rule, respected).

## References (drafted)

Dossier 75; pilots/75-prework (§a statements, §b binder inventory, §c milestones, §d
shared glue); pilots/42/{M1,M2a,M3,M2b,M4a,M4b}.lean + logs; axiommath
DedekindZetaZeroFree (`EntireAbelianQuotient.lean:13`,
`AbelianRayCharacterFactorization.lean:62`) and ZetaZerosV2 (`Main.lean:47,88`); zeta23
`Challenge.lean:131–229`; DLRT arXiv:1908.04876 (corrected qualifiers); Liu
arXiv:2610.26835; dossier 70 (+ clock standing notes); articles 42, 42-M4;
`research/novelty/VERDICTS.md` C2 row 75; `research/novelty/axiommath-as-donor.md` §(f).
