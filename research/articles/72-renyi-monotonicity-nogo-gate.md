# The Rényi Monotonicity No-Go Gate for Area-Law Rank Statements

*cross-math-fronttier research article 72 (Cycle 2) · DRAFT 2026-11-14 · dossier
`research/candidates/72-area-law-inertial-defect.md` · prework/pilot
`research/pilots/72-prework.md` (Appendix A) + `research/pilots/72/` (C-neg.lean, runs
1–5) · bridge `research/bridges/area-law.md`*

**Status: DRAFT — certified-negative gate in flight.** The C-neg Lean layer (N1 Rényi
monotonicity, N2 rank bridge, N3 gate theorem) is under iteration; its verdict slot is
[VERDICT:72-C-neg] in §5. The companion interface theorem M1 (family-265, Tier C) carries
[VERDICT:72-M1]. The mathematical content of the gate is elementary (a monotonicity lemma
plus a contrapositive); the point is that it is *worth formalizing*: it permanently fences
a zone that a 2026 preprint just dynamited, and the negative-result article kind has
precedent in this project (articles 30, 50).

---

## Abstract

Kuwahara (arXiv:2610.15199, 2026-10-10) disproved the Rényi-α area law conjecture below
α = 1 in high dimensions: there are 2D-embedding, unique-ground-state, uniformly gapped
interaction families whose ground states have volume-law Rényi-α entanglement for every
0 < α < 1. An immediate consequence — never stated in any corpus, and the first thing any
future "rank concentration from a spectral gap" proposal would collide with — is that
**every theorem of the form "log Schmidt rank of the ground state's region RDM ≤ f(|∂A|)
for every unique gapped 2D ground state" is false**, since log rank = S₀ ≥ S_α = Ω(volume).
We formalize the consequence chain itself, corpus-free: (N1) Rényi monotonicity
S_β(ρ) ≤ S_α(ρ) for 0 < α ≤ β at the density-matrix level; (N2) the rank bridge
log rank ρ = S₀(ρ) ≥ S_α(ρ) for α ∈ (0,1); (N3) the gate: for any proposed bound-shape
function f, a single state family with volume-law S_α (α < 1) refutes the rank statement —
Kuwahara's class supplies the family (cited as scope, not formalized). The gate is the
permanent no-go fence for the area-law zone; the same pilot carries the positive-side
interface theorem M1 (below, §6).

## 1. Introduction

The Cycle-2 area-law bridge (`research/bridges/area-law.md`) set out to connect
AxiomMath's AreaLaw2D (a proved 2D area law for gapped ground states) with the main run's
kernel-verified inertial-defect machinery (pilot 01) and openai-math's PEPS layer (which
*assumes* an area law it never proves). Lane A5's round-4 §2 sweep then surfaced
Kuwahara's refutation, which kills the bridge's most tempting headline: literal rank
concentration from a spectral gap is FALSE. This article is the fence: the formal
monotonicity-to-gate chain that turns Kuwahara's informal physics result into a permanent
typechecking obstruction inside Lean. Its value is the same as articles 30/50 in the main
run: negative results that are cheap, citable, and protect the program from re-proposing
the dead shape.

**Honesty.** The mathematics is a Jensen/log-sum computation at the density-matrix level —
no physics, no gap hypothesis, no geometry. Kuwahara's theorem is cited as the
scope-supplying informal input; the gate itself is unconditional once stated. The related
positive claims (the gap-to-inertia dictionary P1, the purity-certificate route P2) are
separate parts of dossier 72 and are NOT claimed here; P2 remains [HYPOTHESIS]-flagged.

## 2. Setting

Density matrices: ρ ⪰ 0, tr ρ = 1, eigenvalue list p (a probability vector on ℂ^n). For
α ∈ (0,1) ∪ (1, ∞), S_α(ρ) := (1/(1−α)) log Σ_i p_i^α; S_1 := −Σ p_i log p_i
(von Neumann); S₀(ρ) := log #{i : p_i > 0} = log rank ρ (Hartley, by limit). All three
corpora' encodings: AreaLaw2D's `SubState.regionEntropy` (`State.lean:198`) with
`entropy_eq_H` (:75), openai-math's `vonNeumannEntropy` (`PEPSFilters/Basic.lean:127`).
No corpus has Rényi entropies at all (dossier 72 §Novelty: mathlib has no
`Mathlib/Information/` quantum entropy; the pilot defines S_α over the eigenvalue layer).

## 3. Main results

**N1 (Rényi monotonicity in α).** For every density matrix ρ and 0 < α ≤ β (α, β ≠ 1;
S_1 by limit): S_β(ρ) ≤ S_α(ρ). Proof: log-sum-interpolation on the eigenvalue vector
(the α ↦ log Σ p_i^α log-convexity layer; elementary, the pilot's only real analysis).

**N2 (rank bridge).** log rank ρ = S₀(ρ) ≥ S_α(ρ) for every α ∈ (0, 1): N1 at β = 0,
with S₀ the limit form. Hence volume-law S_α (α < 1) forces log rank ρ = Ω(volume).

**N3 (the gate).** For any f : ℕ → ℝ and any region family (Λ, A) with |∂A| = o(|A|):
if there exists a family of unique-gapped 2D ground states whose region RDMs satisfy
S_α(ρ_A) ≥ c·|A| for some α ∈ (0,1) (hypothesis-class H_Kuw, quoted as a binder citing
arXiv:2610.15199), then the statement "∀ unique-gapped 2D ground states,
log rank ρ_A ≤ f(|∂A|)" is false. The formal content is N1+N2+contraposition; H_Kuw is an
explicit Prop binder (the EnclOK/hQRH consumption pattern — the physics refutation is
imported as a hypothesis, never re-proved).

## 4. Proofs

N1 is the load-bearing computation (prework Appendix A prices it "the only real proof"):
power-mean monotonicity of the eigenvalue list, transported through the log. N2 is the
limit case β ↓ 0. N3 is pure logic on top. Expected shape: a 3-theorem Lean file over
mathlib's `Matrix`/probability-vector layer, no imports beyond mathlib (Appendix A's
mini-spec: `N1`, `N2`, `N3_gate` with the H_Kuw binder).

## 5. Formal verification

**Landed (evidence):** the AL-side bridge shapes elaborate clean on the pin — A7's
G5b (ptrace-Gram, boundary-match, interface conditional, gap dictionary: **OK, 0
errors**) and G5c (`reducedDensity = Pmat` W Wᴴ ↔ atom-sum + trace bookkeeping:
**OK, 0 errors**) verdicts (`research/feasibility/axiommath-donor-probes.md` §table);
G4 (AreaLaw2D full Challenge statement layer re-derives mathlib-only, Physlib not needed
at statement level: OK). These de-risk both prongs below.

**Pending (slots — not citable until filled):**

- C-neg.lean GREEN + axcheck (triad-only): [VERDICT:72-C-neg]. In-flight state at draft
  time: run5 = FAIL rc=1, errors=7, sorry=0 (honest descent 20→14→12→6→7 across runs
  1–5, lane A4 relaunch; logs `research/pilots/72/logs/run1.log`–`run5.log`).
- Final LoC / theorem count: [VERDICT:72-C-neg]. Log provenance headers owed at close-out.

## 6. Companion: the family-265 interface theorem (M1, AL-EZ3)

The same pilot family carries the first Lean contact between the two halves of openai's
family 265: a chain (i) ptrace-Gram identity — the two encodings of ρ_A (AreaLaw2D's
partial-trace form and openai's `reducedDensity := W Wᴴ` coefficient-matrix form) are
equal on the L×L grid instance; (ii) boundary match `(edgeBoundary Λ A).card =
boundaryCard A`; (iii) gap-form match `FullSystemGap` (quadratic form) ↔ `HasGlobalGap`
(Loewner); (iv) the discharge theorem: `AreaLaw.areaLaw ℂ q 1 J Δ` (`Transfer.lean:361`)
implies `PolynomialPEPS.PinnedEntropy.UniformAreaLaw` (`Basic.lean:135`) — making
openai-math's `MainStatement` (:97) unconditional modulo its remaining hypotheses.
Corollary-grade mathematics, statement-transcribed at Tier C (zero import gates); the
G5b/G5c/G4 elaboration verdicts above are its de-risking evidence.
Verdicts: [VERDICT:72-M1] (Tier-C landing; slot-3, lane A8). The reader should treat M1
as GLUE-with-real-consumer (dossier 72 §Significance), not as a discovery claim.

## 7. Relation to prior work

- **Kuwahara, arXiv:2610.15199** (2026-10-10): the refutation itself — finite-range,
  fixed local dimension, bounded interactions, UNIQUE ground state, UNIFORM gap,
  volume-law Rényi-α for all 0 < α < 1; also Schmidt-rank trade-offs for approximate
  projectors (the 1D-style mechanism). The gate formalizes its consequence; the paper is
  cited as scope-binder H_Kuw, never re-proved.
- **Anshu–Harrow–Soleimanifar, arXiv:2004.15009** (Nature Physics 2022): entanglement-
  *spread* area law from the same hypothesis class — the nearest POSITIVE result, and a
  different functional (spread vs purity/rank; neither implies the other).
- **Anshu–Arad–Gosset arXiv:2103.02492 + 1905.11337; AAH FOCS 2022**: the modern 2D
  area-law cluster. **Abrahamsen et al arXiv:2203.16012**: 1D AGSP framework (the
  classical technique nearest rank-certificates-from-a-gap).
- **AreaLaw2D** (AxiomMath, our donor): the proved area law — "first formal area law"
  framings are dead on arrival (it IS the first); our novelty is the cross-bridge, and
  here the fence.
- In-corpus: openai-math's PEPS companion preprint (representation form); A5 PART-2 row 72
  ("P1: formal-new (moderate); P2: N as proposed ([HYPOTHESIS]); C-neg:
  precedent-backed (50/30 lineage)", tier WARM with "hard NO-GO on literal rank
  statements — already honored").

## 8. Limitations and open problems

- The gate fences RANK and (via monotonicity) all α < 1 statements; it says nothing about
  α ≥ 1 (the dossier's P2 purity route lives there, [HYPOTHESIS], H-QA unprobed).
- H_Kuw is informal-input: a future formalization of Kuwahara's construction would
  discharge it; until then the gate theorem is a conditional of the cleanest kind.
- P2 (the certificate route to purity-type bounds linear in the boundary budget) is the
  zone's surviving discovery-grade objective and is NOT part of this article.

## References

- T. Kuwahara, arXiv:2610.15199. A. Anshu, A. W. Harlow, M. Soleimanifar,
  arXiv:2004.15009 (Nature Physics 2022). A. Anshu, I. Arad, D. Gosset, arXiv:2103.02492
  and arXiv:1905.11337. A. Abrahamsen, L. Tong, Y. Bao, N. Su, R. de Wolf, arXiv:2203.16012.
  axiommath `AreaLaw2D` (`OpenAI/Statements.lean:185–259`, `AreaLaw/Transfer.lean:361`,
  `AreaLawForMathlib/QuantumInfo/Region/PartialTrace.lean:25`, `State.lean:75,198`).
  openai-math `PolynomialPEPS/PEPSFilters/Basic.lean:74–135`. Dossier 72;
  pilots/72-prework Appendix A; `research/novelty/round-4.md` §2; main-run article 50
  (`50-zero-free-regions-cannot-move-certificate-constants.md`) and article 30 for the
  negative-result precedent.
