# R2 rewrite proposal — article 72, full refocus (fence, not refutation)

Lane R2, 2026-11-16, per the adopted restructuring plan (§8: 72 → REWRITE-FULL,
technical record) and edits R4 + A3 of `r2-discovery-strength.md` §7. Rev 2 (same day):
orchestrator rulings + R1 cross-review (`r1-review-r2-rewrites.md`) applied — title
token dropped, abstract ≤ 200 words, per-theorem closed-vocabulary status rows from
`r3-verification-tables.md` §3, descent/cycle narration removed, R1 §B fold-preservation
items (i)–(vi) respected. `[R7-CITE]` status: Kuwahara slot **filled** from
`r7-bib-cards.md` §C.2 (cards landed 2026-11-16); Rényi/Beck–Schlögl have **no §C
cards** (C.1–C.5 checked) — provisional standard entries stand, card-fill if issued.
Attribution architecture: **Kuwahara's theorem is the refutation; our contribution is
the kernel-verified fence (N1–N3), the stated log-rank no-go, and the cross-encoding
interface layer.**

**Folded 2026-11-16 (R7 external read, `novelty/iter4-external-priorart.md` §2.4):**
(1) Kuwahara 2610.15199 covers **every spatial dimension d ≥ 2** (title: "…in high
dimensions"), not 2D only — scope strengthened throughout; the interface layer's
dimension-generic encodings are an asset, not a reach. (2) His rank–error trade-off is
about *approximate projectors* and does **not** state the boundary-linear log-rank
no-go — the S₀ ≥ S_α bridge and the no-go-as-a-stated-theorem are ours. (3)
Textbook-core nearest-misses named: Rényi 1961; Beck–Schlögl 1993. (4) `[R7-CITE]`
slots filled from bib cards on landing.

## Replacement article text (`research/articles/72-renyi-monotonicity-nogo-gate.md`; filename may stay — rename to `72-renyi-fence-kuwahara.md` optional with S–M sweep)

# A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws

*cross-math-fronttier research article 72 (Iter-4 edition) · kind: TECHNICAL-RECORD
(TEMPLATE-iter4 §0) · dossier `research/candidates/72-area-law-inertial-defect.md` ·
prework `research/pilots/72-prework.md` (Appendix A) · Lean `research/pilots/72/C-neg.lean`,
`research/pilots/72-M1/P72M1T{1,2}.lean` · bridge `research/bridges/area-law.md`*

**Status: TECHNICAL-RECORD.** Part I — N1/N2a/N2b PROVED-UNCONDITIONAL; N3a/N3b
PROVED-CONDITIONAL (hKL = Kuwahara's construction, arXiv:2610.15199, as the named
external binder, plus the negated candidate law); all axioms ⊆
{propext, Classical.choice, Quot.sound}. Part II — interface links 1–3
PROVED-UNCONDITIONAL; link 4 and the interface theorem are **not article claims**
(carried to Iteration 4; spec `pilots/72-M1/L3-spec.md`). Per-theorem rows: §6.

---

## Abstract (≈190 words)

Kuwahara (arXiv:2610.15199, October 2026) disproved the Rényi area-law conjecture below
α = 1: in every spatial dimension d ≥ 2, his finite-range, uniformly gapped Hamiltonians
with unique ground states have volume-law Rényi-α entropy for every 0 < α < 1, alongside
a von Neumann area law. The log-rank consequence — no bound log(Schmidt rank of ρ_A) ≤
C·|∂A| can hold for all such ground states — follows from his theorem via
log rank = S₀ ≥ S_α alone, but is not stated in his paper: his rank statement is a
positive trade-off for approximate projectors, not a boundary-linear no-go. The
refutation is his; the fence, and the no-go-as-a-theorem, are ours. We make the
corollary a machine-checked fence, valid for the whole d ≥ 2 class: (N1) S_β ≤ S_α for
0 < α ≤ β < 1; (N2) S_α ≤ log rank for PSD unit-trace matrices; (N3) a volume-law
α-entropy family with boundary ≤ n refutes every boundary-linear Rényi-α law (N3a) and
every boundary-linear log-rank law (N3b). Kuwahara's construction enters only as the
hypothesis hKL. Part II: the kernel-checked identification of AreaLaw2D's reduced
states and entropies with openai-math's PEPS encodings, boundary counts compared at
constant 1.

## 1. Introduction

[Adapted from the current §1; keep the bridge-map framing. Replace the sentence
"It is false." (current :49) with:] The tempting headline "spectral gap ⟹ rank
concentration" is false — **by Kuwahara's theorem, in every spatial dimension d ≥ 2**
(not 2D only: correct the current article's "2D finite-range" wording; scope
strengthening per the R7 external read, `novelty/iter4-external-priorart.md` §2.4).
The novelty sweep (`novelty/round-4.md` §2) found his refutation; this article does
not re-prove it or claim it. What the corpora — and Kuwahara's paper — lack is the
fence: his own rank statement is a positive trade-off for *approximate projectors*,
and the boundary-linear log-rank no-go is nowhere stated as a theorem; stating it at
the generality of arbitrary boundary functions, machine-checked, makes the no-go
survive contact with any future encoding, region family, or boundary convention.
[Keep the articles-30/50 lineage sentence but qualify:] in the tradition of the
project's negative results — with the difference that 30 refuted a conjecture
formulated *here* and 50 Part I read our target engine, whereas here the refutation is
external and enters as `hKL`; what is ours is the *stated* no-go and its verification.

**Honesty.** Part I uses no physics, no gap hypothesis and no geometry: it is a Hölder
inequality (textbook core: Rényi 1961 for the monotonicity statement; the standard
derivation per Beck–Schlögl 1993), a support bound, and a contrapositive. The informal
input that makes the gate bite is Kuwahara's, carried as a hypothesis. Part II is
glue-grade: two encodings of the same objects, proved equal — and deliberately
dimension-generic, which (given Kuwahara's d ≥ 2 scope) is an asset rather than a
reach.

## 2. Setting

[Verbatim from current §2: probability vectors, `renyi p α`, eigenvalue convention,
`C-neg.lean:52` self-owned definition, mathlib-has-no-quantum-entropies note — the
latter now externally corroborated: R7's AFP/Coq scans found no entropy definitions
either.]

## 3. Part I — results (the fence)

[Verbatim from current §3: N1 `renyi_antiMono`, N2a `renyi_le_log_card`,
N2b `renyi_le_log_rank`, N3a `renyi_area_law_nogo`, N3b `rank_area_law_nogo`. Two
edits: (a) re-label the "Reading." paragraph "Reading (whose theorem bites)" and change
"Take n = side length … in Kuwahara's family" to "…in the hypothesized Kuwahara family
(`hKL`); the gate fires the moment his theorem supplies the family"; (b) add one
sentence after N3b: "The α-range binders of N3 are unused in the proof, so both gates
hold for every α (R3 tables §1.5)." — the safe-direction note.]

## 4. Part I — proofs

[Verbatim from current §4: Hölder workhorse `sum_rpow_mul_le`, N1, N2a, N2b, N3
`nogo_core`.]

## 5. Part II — the interface layer (M1)

[Verbatim from current §5, links 1–4 and the vendor-layer paragraph, with one gloss
where "family 265" first appears: "openai-math's PEPS work (comparator family 265 —
the corpus's internal index for the PolynomialPEPS/PEPSFilters line,
`PEPSFilters/Basic.lean:74–135`)". The interface theorem framing is unchanged: glue
with a real consumer. Link 4 and the interface theorem are carried, not claimed (§6
row).]

## 6. Formal verification (per-theorem rows, closed vocabulary; from `r3-verification-tables.md` §3)

| decl | file:line | status | axioms print source |
|---|---|---|---|
| N1 `renyi_antiMono` | `pilots/72/C-neg.lean:188` | PROVED-UNCONDITIONAL (well-formedness: p probability vector, 0 < α ≤ β < 1) | `pilots/72/logs/axcheck-run1.log:24` — triad |
| N2a `renyi_le_log_card` | `pilots/72/C-neg.lean:231` | PROVED-UNCONDITIONAL (idem) | `axcheck-run1.log:25` — triad |
| N2b `renyi_le_log_rank` | `pilots/72/C-neg.lean:282` | PROVED-UNCONDITIONAL (Hermitian PSD, unit trace — definition of subject) | `axcheck-run1.log:26` — triad |
| N3a `renyi_area_law_nogo` | `pilots/72/C-neg.lean:344` | PROVED-CONDITIONAL — hKL (Kuwahara volume law, arXiv:2610.15199) + hBnd + hArea (the negated candidate law); conclusion `False` | `axcheck-run1.log:27` — triad |
| N3b `rank_area_law_nogo` | `pilots/72/C-neg.lean:354` | PROVED-CONDITIONAL — hKL + hMono + hBnd + hArea; conclusion `False` | `axcheck-run1.log:28` — triad |
| private helpers (`nogo_core`, `sum_rpow_mul_le`, `amgm2`, `div_rpow_eq`, `exists_pos_of_sum_eq_one`, `sum_rpow_pos`) | `pilots/72/C-neg.lean` (private) | supporting — no independent claim; **C1** coverage (public via sweep + private via pilot-local audit) | `axcheck-run1.log:34` etc. — triad |
| link 1 `ptrace_pureState_eq_reducedDensity` | `pilots/72-M1/P72M1T2.lean:303` | PROVED-UNCONDITIONAL (hΩ = normalization — definition of subject) | `pilots/72-M1/logs/m1-axcheck-final.log:83` — triad; sweep `axcheck-c2-final.log` (T2: 28 axiom-lines, 0 sorryAx); T2 has 1 private decl — **C3** |
| link 2 `regionEntropy_eq_vonNeumannEntropy` | `pilots/72-M1/P72M1T2.lean:330` | PROVED-UNCONDITIONAL | `m1-axcheck-final.log` — triad |
| link 3 `boundaryCard_le_edgeBoundary` | `pilots/72-M1/P72M1T2.lean:164` | PROVED-UNCONDITIONAL (constant 1; design allowed ≤ 4) | `m1-axcheck-final.log:82` — triad |
| link 4 (gap transfer) + `interface_areaLaw_uniformAreaLaw` | spec only: `pilots/72-M1/L3-spec.md` | NOT AN ARTICLE CLAIM (carried to Iteration 4; no status row per template §0) | — |

Vendor layer: `P72M1T1.lean` (702 lines, 52 axiom-lines ⊆ triad, `m1-axcheck-final.log`).
Deviations from design: [R3-FILL — carry over the three documented deviations from
current §6 verbatim].

## 7. Relation to prior work (attribution architecture; nearest-miss table)

| source | what it owns | relation to this article |
|---|---|---|
| **T. Kuwahara, arXiv:2610.15199** | the refutation: volume-law Rényi-α for all 0 < α < 1, in **every d ≥ 2** (finite range, fixed local dimension, bounded interactions, unique ground state, uniform gap, adiabatically connected); von Neumann area law coexisting; a **positive** worst-case trade-off for *approximate projectors* — optimal Schmidt rank exp[Õ((A log ε⁻¹)^{2/3})] for log ε⁻¹ ≳ A | external input, carried as `hKL`; **not** the boundary-linear log-rank no-go, which his paper does not state — the S₀ ≥ S_α bridge is the only bridge, and it is ours (R7 §2.4: the "never stated" claim survives) |
| **A. Rényi (1961, Berkeley Symposium)** | the entropies; the monotonicity statement | N1 formalizes this textbook core — no mathematics claimed. [Cite status: **no card in r7-bib-cards.md §C (C.1–C.5 confirmed absent, 2026-11-16)** — R2's standard entry used provisionally; card-fill when issued] |
| **C. Beck, F. Schlögl (1993)** | the standard derivation of H_α monotonicity and H₀ = log‖supp‖ | N1–N2a formalize this layer — no mathematics claimed. [Cite status: idem — no §C card; provisional standard entry] |
| Anshu–Harrow–Soleimanifar (2004.15009); Anshu–Arad–Gosset (1905.11337, 2103.02492); Abrahamsen et al. (2203.16012) | the positive program (entanglement spread; 2D area/sub-volume laws; 1D AGSP framework) | neighbors; the fence does not touch them |
| AxiomMath AreaLaw2D (`AreaLaw/Transfer.lean:361`, `PartialTrace.lean:25`, `State.lean:75,198`) | the formal area law — "first formal area law" belongs to it | Part II's positive side: the cross-encoding bridge |
| openai-math `PolynomialPEPS` (`PEPSFilters/Basic.lean:74–135`) | the `UniformAreaLaw` consumer | Part II's target interface |
| this project, articles 30/50 | the negative-results lineage | difference of kind per §1: 30 refuted our own conjecture; 50 Part I read our engine; here the refutation is external and hypothesized — the stated no-go is our increment |

Also fold (one line): formal-prior-art corroboration — no entropy definitions in
mathlib (on pin), AFP (R7 landing scan), or circuit-level Coq libraries (search-null);
"the pilot's own definitions" stands.

## 8. Limitations and open problems

[Verbatim from current §8: α ≥ 1 uncovered; `hKL` an informal input, formalizing
Kuwahara's construction would discharge it; Part II link 4 + interface theorem open
(carried, not claimed).]

## References

- T. Kuwahara, *The Rényi area law conjecture is false below α = 1 in high dimensions*,
  arXiv:2610.15199 (quant-ph), v1 2026-10-10; 7 pp + 25 pp appendix. [Filled from
  `r7-bib-cards.md` §C.2: all-D≥2 scope; von-Neumann-law coexistence; the
  approximate-projector trade-off exp[Θ̃((A log ε⁻¹)^{2/3})] (log ε⁻¹ ≳ A); the
  boundary-linear log-rank no-go NOT stated — the S₀ ≥ S_α bridge is ours.]
- A. Rényi, *On measures of entropy and information*, Berkeley Symposium on
  Mathematical Statistics and Probability, 1961. [No §C card issued (C.1–C.5 checked
  2026-11-16); standard entry stands pending a card]
- C. Beck, F. Schlögl, *Thermodynamics of Chaotic Systems*, Cambridge University
  Press, 1993. [Idem — standard entry pending a card]
- [R3-FILL — carry over the remaining current reference block verbatim.]

---

## README row (aligned to the ruling; live v2 row is canonical at `r1-readme-v2.md` §B)

- old (v1 README.md:43): `| 72 | [The Rényi Monotonicity No-Go Gate (+ family-265 interface layer)](72-renyi-monotonicity-nogo-gate.md) | negative result + glue | **proved** (gate unconditional given the `hKL` family); interface theorem carried |`
- new: `| 72 | [A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws](72-renyi-monotonicity-nogo-gate.md) | TECHNICAL-RECORD — fence around an external refutation + interface layer | N1/N2 PROVED-UNCONDITIONAL; N3a/b PROVED-CONDITIONAL (hKL = Kuwahara's construction + negated law); links 1–3 PROVED-UNCONDITIONAL; link 4 + interface theorem carried (no claim) |`
- note: R1 already reconciled the README-v2 §B row; the row above is the R2-concurs
  form matching the title ruling (no "Family-265") and R3's status dialect.

**Effort:** S–M (text ~70% carried verbatim; new material = §1 qualification, abstract,
§6 per-theorem table, §7 table conversion; R3 rows already final — no [R3-FILL] cells
remain except the deviations carry-over).
