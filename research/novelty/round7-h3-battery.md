# Round-7 — dossier-41H follow-on novelty battery: the n≥4 TL hunt (R9, Iteration 5 restart)

Lane R9 (novelty/prior-art, worktree agent-09), 2026-11-20. Unit: the novelty table
(≥ 2 nearest-miss rows) + component verdicts for the **n≥4 Temperley–Lieb hunt** — the
41H program's deferred next-wave seed (R4's tranche-3 scope note,
`pilots/41/H-record.md:174–209`, + my round-6 §NEGATIVE tail N2's open remainder:
"higher strand count (n ≥ 4), non-trace evaluation shapes — stay OPEN and UNCLAIMED").

**Provenance rider (the queue's fallback clause):** R4/agent-08's
`pilots/41/H3-precharter.md` had NOT appeared in its worktree at battery time (polled
every few minutes from 18:22Z; this battery started at the >30-min fallback on the
41H article's own deferred-seed scope note + the round-6 §NEGATIVE tail). If/when the
precharter lands with a materially different scope, RE-RUN this battery against it
(the corpus evidence and table rows below are scope-independent; only the component
list would move). Battery object as scoped by the deferred seed:

- **(Q4)** the realization QUESTION: do 8 four-strand braid/TL words w_p and a
  NON-TRACIAL functional F on TL₄ exist with F(w_p · w_p′) = σ_q(p,p′) — the 64
  σ_q-equations at q = −A² under the Jones/Kauffman dictionary (tracial shapes are
  dead: Theorem A; dim-5 factoring is dead: Theorem B — both kernel-certified, 41H);
- **(D4)** the generalized rank constraint: any dim-d-algebra realization needs
  d ≥ rank(σ) = 8 (the Walsh certificates' argument at general d), so TL₄
  (dim 14 = Catalan C₄) clears the bound — necessary, not sufficient;
- **(S4)** the bounded decide-search over TL₄-generator words (length ≤ L, one
  decide-checkable 64-equation system per candidate; the H2 certificates' pattern);
- **(G4)** the q-genericity rider: det M(q) ≠ 0 as a POLYNOMIAL (≈25 integer
  evaluation points), killing all-but-finitely-many q in one blow;
- **(N4)** the negative outcome, if the search fails: a third obstruction finding
  (the "no dictionary at any strand count" prior is raised by the Walsh-rigidity of
  the σ-table).

Method per the round-5/6 conventions: corpus greps direct-source (tauceti / mathlib
encore pin / axiommath / openai-math `lean/OAI` / anthropics eth — every negative
claim below re-verified at source this session), external sweep with exact citations,
the G-series hygiene discipline (claim vs on-pin proof), and the AGENTS decl-index
caveat honored (no TSV-only claims anywhere in this file). Zero Modal (corpus-grep +
web-cite tier, per the lane's standing instruction).

**Verdict line: (Q4) NEW-narrow — the sign-family ↔ TL_n realization question at n ≥ 4
is posed nowhere (class row EMPTY, corpus and external); (D4) NEW-narrow lemma-grade;
(dim-14) COVERED classically and NOT corpus-native — binder-or-cite, never claim;
(S4) methodology, NOT claimable; (G4) NEW-narrow method-grade; (N4) discovery-grade
NEGATIVE if it lands (78/41H precedent; class row empty). TWO wording locks added by
this battery's material finding (§1): the tauceti SPIN MODEL is a corpus-native
non-tracial-functional substrate (never claim "first non-tracial functional layer on
TL"), and Avan et al. 2013 own the Hadamard→TL-representation direction (never claim
"first Hadamard–TL connection"); our claimable object is the realization QUESTION and
its answer for the σ_q family specifically. Effort risk: DOWN (host candidates
corpus-native) with one UP rider (the dim-14 fact has no corpus proof —
`Basic.lean:49–51` disclaims the diagram basis).**

---

## 1. Corpus side (direct-source `rg`, 2026-11-20; read-only siblings)

**NEW FINDING (this battery's material change): the tauceti spin model is a
corpus-native NON-TRACIAL-functional substrate on TL_n, sitting in the exact
negative-q regime of the H2 Walsh certificates — the hunt's natural first dictionary
candidate class, and a wording hazard the article/precharter must respect.**
At source:

- `TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean` — the spin model of TL_n:
  `spinCup q : Bool → Bool → R` (−q on (true,false), 1 on (false,true), 0 on parallel
  spins — the ice-type vertex constraint), `spinCap`, `markovWeight q b` (−q / −q⁻¹),
  and **`spinRep : TemperleyLieb R δ n →ₐ[R] Matrix (Fin n → Bool) (Fin n → Bool) R`**
  (:300) — TL_n acting on the 2ⁿ-dimensional (Z/2)ⁿ configuration chain, at loop value
  δ = −(q + q⁻¹) (the same family as `jonesDelta` at a² = q). Matrix coefficients
  ⟨s, spinRep(x) t⟩ are non-tracial functionals; at n = 4 the carrier is 16-dimensional
  (≥ 8 — the rank bound clears).
- `TauCeti/Algebra/TemperleyLieb/Spin/Positive.lean` — positivity at NEGATIVE real q:
  `markovWeight_pos`/`spinWeight_pos` (hq : (q : 𝕜) < 0), the faithful positive
  weighted trace whose pullback is the Markov trace ("tracial on the represented
  algebra, not in general on the entire matrix algebra" — the file's own words).
  q = −1 — the H2 certificates' specialization point — is inside this regime.
- **Consistency check (the no-go is not evaded at n = 3 by the spin route):** a
  spin-rep matrix coefficient x ↦ ⟨s, spinRep(φ(x)) t⟩ still FACTORS through TL₃
  (algebra dim 5), hence lies inside Theorem B's refuted C·Φ·Cᵀ class (rank ≤ 5 < 8).
  The spin route opens only at n ≥ 4 — exactly the deferred hunt's shape.
- `TauCeti/KnotTheory/Jimbo/TemperleyLieb.lean` — the spin model IDENTIFIED with the
  two-colour Jimbo representation at q = a² (the braid-algorithm comparison layer).
  So the corpus's spin/Jimbo/Jones routes are one connected machine, general n.

**The dim-14 gap (cost rider, at source):** `TauCeti/Algebra/TemperleyLieb/Basic.lean:49–51`
— "free of rank the Catalan number `catalan n` on the planar-matching diagrams … is
the fundamental structure theorem of the algebra, and **it is not proved here: it
needs the diagram basis, which is a separate construction**." The corpus carries the
PRESENTATION (`Rel`, `e i`, `e_mul_self`, `e_mul_e_mul_e`, `commute_e`, `lift`,
`induction`, `aug`), the two-strand non-collapse (`e_ne_zero_two`), the Jones–Wenzl
projectors (`JonesWenzl.lean`, recursive + `aug_jonesWenzl`), quantum dimensions, the
trace tower/uniqueness (`Trace/Basic.lean:88 unique`), the star structure
(`Star.lean`), the tower spanning set (`Tower.lean`) — but NO dim TL_n = Catalan n
theorem anywhere. H3's "TL₄, dim 14" necessary-condition narrative must therefore
either binder-ize dim TL₄ = 14 as a hypothesis or cite it classically; building it
would mean constructing the diagram basis (explicitly out of scope at source).

**Negatives (each direct-source this session):**
- **No σ_q / eight-square / sign-family realization content anywhere**: `rg -inw
  "eight-square|Graves"` over openai-math `lean/OAI/` → 0 (round-6, re-confirmed);
  tauceti → 0; `rg "sigmaQ|sigma_q"` tauceti/mathlib → 0 (Setoid noise only, round-6
  carried). eth `proof/networks/Eight/` — `rg -il "temperley|jones|braid|kauffman"`
  → **0 files** (re-verified this session): the σ_q family's home corpus has no host
  content at all.
- **No "realization of a sign/character table as TL evaluations" content in any
  corpus**: no `rg` pattern of the shape (dictionary/realizability) hits anything in
  tauceti KnotTheory, `Algebra/TemperleyLieb/`, mathlib, axiommath (0 TL content,
  round-6 carried), or OAI (its TL layers are the `HarmonicArtin.TemperleyLieb`
  JW-at-roots-of-unity development — `lean/OAI/Topology/ArtinGroups/Diagrams/
  Circle.lean:7–60`, `circle m = 2cos(π/m)`, `jonesWenzl m n`, projector properties —
  and the HoneycombChords dilute-TL loop model; neither poses any evaluation
  dictionary question).
- **mathlib (encore, ff2494ea): no TL/Jones/knot content** (round-6 carried); the
  certificate-side substrate IS mathlib-native: `Mathlib/LinearAlgebra/Matrix/
  HadamardMatrix.lean` (`IsHadamard` structure + closure calculus: conjTranspose,
  kronecker, neg, …) — the Walsh/Hadamard facts' ambient theory, with no σ_q or TL
  connection.

## 2. Nearest-miss table (≥ 2 rows delivered: 9 + class row)

| # | source | what it has | delta vs (Q4)/(D4)/(N4) |
|---|---|---|---|
| 1 | **tauceti Jones/TL/Hecke stack** (`KnotTheory/TemperleyLieb.lean` general-n `jones : BraidGroup n →* (TemperleyLieb R (jonesDelta a) n)ˣ`; `MarkovBraid.jonesTrace`; `BraidWord/Jones.lean`; `Homfly/Jones.lean`; Khovanov/Jimbo) | the complete formal Jones polynomial + TL host at EVERY n incl. 4 | the host-if-imported; zero sign-family/realization content; round-6 §NEGATIVE row 3 carried at n ≥ 4 |
| 2 | **tauceti spin model** (`Algebra/TemperleyLieb/MarkovTrace.lean:88–313` `spinCup`/`spinCap`/`markovWeight`/`spinRep`; `Spin/Positive.lean` positivity at q < 0; `Jimbo/TemperleyLieb.lean` the Jimbo identification) | a corpus-native NON-TRACIAL functional layer: TL_n → matrices on (Fin n → Bool), positive weighted trace at negative q, general n | **the hunt's first candidate dictionary class** (matrix coefficients at n = 4); but no σ_q family, no 64-equation dictionary, no realization question is stated anywhere — our object is the QUESTION + answer; wording lock: never "first non-tracial functional layer on TL" |
| 3 | **Avan–Fonseca–Frappat–Kulish–Ragoucy–Rollet, arXiv:1306.2927** = Theor. Math. Phys. **178** (2014) 223–238 (abstract read this session) | rank-n REPRESENTATIONS of TL_N(q) constructed FROM pairs of generalized complex Hadamard matrices (Fourier/Butson special cases), with partial classifications | the Hadamard ↔ TL bridge exists at representation level — but direction Hadamard→TL, no realization question for a specific sign table, no Walsh-specific statement, no obstruction/no-go results; wording lock: never "first Hadamard–TL connection"; ALSO a report-only hunt lead (the σ-table at q = −1 is a {±1}-Butson-type matrix — the Avan input class) |
| 4 | **Eisermann, "Knot colouring polynomials", Pacific J. Math. 231 (2007) 305–336** (abstract read this session) | finite-group colouring data realized as Yang–Baxter invariants = traces of linear braid-group representations | the nearest classical genre for "finite-group sign data inside braid evaluations"; direction group→invariant, no TL-algebra dictionary, no realization obstruction question |
| 5 | **MathOverflow 207540 (2015), "How many traces are there on Temperley-Lieb, Fuss-Catalan, Iwahori-Hecke, Birman…"** (thread read at abstract level) | the trace-classification neighborhood (Ocneanu essential uniqueness of the Markov trace) | the TRACIAL side's context — Theorem A's kin; nothing about non-tracial dictionaries or sign families |
| 6 | **Hartsell, "A Normal Form for Words in the Temperley-Lieb Algebra and the Artin Braid Group on Three Strands"** (ETSU thesis, 2018; located this session) | a word normal form for TL + B_3 — the classical tool for the (S4) search space | methodology kin only; 3-strand; no evaluation dictionary, no realization question |
| 7 | **Pourkia, arXiv:2611.10850** (Nov 7 2026; abstract read this session) | a non-homogeneous LOCAL representation of B_n by tracking individual strand labels through crossings | the freshest B_n-representation kin (same month); no TL/Jones algebra, no sign-table realization content (abstract level; sweep-limited) |
| 8 | **mathlib `HadamardMatrix.lean`** (encore pin ff2494ea; declarations listed this session) | the ambient Hadamard calculus (`IsHadamard`, kronecker/closure) | the (D4)/(N4) certificates' substrate; no σ_q, no TL connection — the bridge is ours to state |
| 9 | **OAI `HarmonicArtin.TemperleyLieb`** (`lean/OAI/Topology/ArtinGroups/Diagrams/Circle.lean`) | JW projectors at roots of unity (`circle m`, `quantumRatio`, idempotence/annihilation properties) | a second corpus JW layer; no n ≥ 4 realization question, no sign content |
| — | **CLASS ROW (checked EMPTY at 2026-11-20): "sign-family / character-table REALIZATION questions in TL_n at any strand count"** — any source posing or answering whether a specific (Z/2)³-graded sign table arises as TL_n word-evaluations under a functional class | **NONE, corpus or external** — rows 1–9 + this session's sweeps (the two web-sweep batches below) contain no member; extends round-6 §NEGATIVE N1's sharpest row from 3 strands to all n | the (Q4) question and any answer (positive dictionary or third obstruction) are first-movers in the class |

Context rows (checked, not table-grade): dim TL_n = Catalan C_n is classical (the
braid-basis literature — e.g. "A Temperley-Lieb basis coming from the braid group"
("dimension equal to the Catalan number C_n"); Wikipedia's TL article states it) —
(4) = 14 confirmed; Daugherty 2025 two-boundary-TL calibrated representations
(classification context, arXiv located); no new Lean/Coq/Agda/Isabelle TL
formalization surfaced in this session's query-level re-sweep (2026-11-20; round-6's
sweep-limited negative of 2026-11-19 carried — tauceti remains the only formal TL).

Sweep record (for the caveat discipline): webSearchGlobal batches (1) "Temperley-Lieb
algebra non-tracial functional matrix coefficient four strand braid representation"
and "TL_4 dimension Catalan rank 14" (2) "Lean formalization Temperley-Lieb Jones
2026", "realizing character table finite group as knot invariant evaluations braid
trace obstruction dimension", "Avan Hadamard abstract", "Hartsell normal form",
"non-homogeneous local representation braid Nov 2026"; arXiv abstracts read via
fetch: 1306.2927 (full abstract + construction direction), 2611.10850 (abstract).
Claims above are abstract/thread-level except where a file:line corpus citation is
given; no full-text sweep of 1306.2927's 17 pages was performed (flag: if H3's
charter consumes the Avan construction as a candidate-generator, a full-text read
becomes warranted — recorded as the trigger).

## 3. Verdicts (component-wise; vocabulary per the round-5/6 battery precedent)

| component | verdict | one-line reason |
|---|---|---|
| (Q4) the n≥4 realization question + any answer | **NEW-narrow** | the class row is empty at every strand count; the question is structural (a dictionary-existence problem for a specific Walsh-rigid sign family), and both outcomes are first statements of their kind |
| (D4) dim-d ≥ rank-8 generalized constraint | **NEW-narrow (lemma-grade)** | elementary linear algebra, but unstated in this connection anywhere; the H2 certificates' pattern at general d |
| (dim-14) TL₄ = Catalan 4 = 14 | **COVERED (classically); NOT corpus-native** | classical textbook fact; `Basic.lean:49–51` disclaims the diagram basis in-corpus — binder-or-cite in H3, never a novelty claim |
| (S4) bounded word-enumeration search | **NOT CLAIMABLE (methodology)** | the hunt's engine, not its finding; classical normal-form kin (row 6) |
| (G4) q-genericity lemma (det M(q) ≠ 0 as polynomial) | **NEW-narrow (method-grade)** | evaluation/interpolation certificate unstated in this connection; rides along, does not headline |
| (N4) third-obstruction negative (if the search fails) | **discovery-grade NEGATIVE per precedent** | 78 (2026-11-17) + 41H BANK-AS-NEGATIVE (2026-11-19) rulings; the raised "no dictionary at any n" prior makes this the LIKELY outcome — priced as search-with-no-go-escalation per the scope note's own honesty read |
| host machinery (Jones rep, spin model, JW, trace tower) | **COVERED-by-corpus (tauceti)** | §1: all present at general n; consumption stays statement-binder class unless an import is chartered (then on-tauceti-pin triad FIRST — the G-series gold standard) |

Risk register delta vs round-6 §NEGATIVE: novelty risk COLD (unchanged; the class row
is empty); EFFORT risk DOWN materially (the spin-model dictionary candidates are
corpus-native — no host machinery to build); ONE new cost rider (dim-14 has no corpus
proof); TWO new wording locks (spin model §1; Avan row 3). One report-only positive
pointer for R4's charter: the Avan construction's Butson/Hadamard input class +
tauceti's `spinRep` matrix coefficients are two concrete candidate-generators for the
64-equation search — recorded here, not consumed.

## 4. Hygiene + article-facing riders

- **G-series discipline:** every tauceti citation above is tree-reading at the
  current checkout (read-only sibling; toolchain v4.36.0-rc2 lineage) — CLAIM-class
  evidence for wording purposes; nothing was imported or elaborated this session, so
  no on-pin `#print axioms` was fired (none needed at this tier). If H3 charters a
  real tauceti import, the H1 §T gate pattern applies: on-tauceti-pin triad FIRST,
  the five named donors stay statement-binder class otherwise (H-record tranche-3
  item 2, carried).
- **Billing:** the hunt's article (if it lands) bills per the 41H lineage — NEGATIVE
  if (N4) materializes (quota-free, discovery-grade), DISCOVERY if a dictionary
  exists (quota-consuming, S1–S4 pass required — this battery's (Q4)/(D4) rows are
  the S1 inputs); the dim-14 fact never appears as content.
- **Re-run rider (the fallback clause):** this battery graded the deferred-seed
  scope note (`pilots/41/H-record.md:174–209`) + round-6 §NEGATIVE N2. When R4's
  `H3-precharter.md` lands, re-check: (i) the dictionary class list (tangle/
  Kauffman-bracket vs explicit functionals vs spin-coefficients), (ii) whether the
  q-genericity rider survived chartering, (iii) any new component (e.g. a
  Cayley–Dickson anchor fallback) — the table rows and corpus evidence here are
  scope-independent and carry.

— lane R9 (worktree agent-09), 2026-11-20. No commits (H commits on main; REPORT
ONLY). Companion outputs this session: `novelty/iter6-seed-census.md` (queue item 2,
same hold).

---

## §RE-RUN ADDENDUM (2026-11-20, post-relay) — R4's H3-precharter landed; battery
## re-graded against it per the fallback clause's rider

**Provenance:** the coordinator relayed the precharter at sha16 `726e3d695e766da6`
(339 lines); at my read it had ALREADY moved to **`b9e911cdac5f1c90` (346 lines)** —
R4's parallel refinement pass, delta noted, no restart (per the relay's own
instruction). File: `worktrees/agent-08/research/pilots/41/H3-precharter.md`
(worktree-side, read there). The precharter's scope CONFIRMS the fallback battery's
object and extends it: TARGET-C (the two-fiber strand-free rank closure,
near-certain), TARGET-D (the TL₄ dictionary hunt, raised-negative prior), the P1–P6
paper-level findings, and §8's five scan directions — all re-graded below. The base
battery's corpus evidence, table rows 1–9, and wording locks carry unchanged; this
addendum is the precharter-indexed delta.

### R1. The five §8 scan directions — verdicts

| direction | verdict | evidence (this session) |
|---|---|---|
| (i) TARGET-C's class: a source certifying Walsh/nonsingularity of cubic-phase sign tables AND drawing a finite-dimensional realization obstruction (two-fiber + d ≤ 7 shape) | **EMPTY (class row)** | the two halves are separately classical — character-table nonsingularity (Frobenius), rank-factorization folklore (the sweep returned only generic low-rank/PSD material, e.g. Recht 2007-class) — but the COMBINED shape as a realizability no-go appears nowhere in rows 1–9, the precharter's §3 rows, or this session's four sweep batches |
| (ii) TARGET-D's class: sign-family ↔ TL₄/diagram dictionaries at degenerate δ = ±2 | **EMPTY for dictionaries at any δ** — the dossier's math-ph collision risk does NOT materialize at the question level | nearest kins found this session: **Morin-Duchesne, "Dimer representations of the Temperley-Lieb algebra"** (2015; spin-chain reps of dim 2ⁿ⁻¹ = **8 at n = 4** — the d = 8 boundary host class, at loop value 0 not ±2); **Spencer, "Modular Temperley-Lieb theory"** (RMJM 2020 / 2023: TL in char 2, where the SIGN representation collapses into the trivial — note our σ-table's mod-2 shadow is exactly the all-ones degeneration, the ℤ-lift being the entire content); **Ikhlef 2022** (periodic-TL fusion, loop models — context). Plus the precharter's own §3 row 3 (Westbury 1995 / Martin / Goodman–Wenzl — the classical cell structure at degenerate δ, which owns Q2's ground) |
| (iii) the P1 mechanism: cubic permutations of 𝔽₂³ + Walsh readings | **COVERED-CLASSICALLY-IN-SPIRIT — the §3-row-4 wording lock is CONFIRMED and tightened** | the ANF/Walsh literature owns the ambient machinery: Carlet's vectorial-Boolean-functions survey (APN/power-function permutation theory), Armario Sampalo 2025 ("Almost Bent functions for Hadamard matrices and APN"), Turan 2021 (cubic Boolean multiplicative complexity); P1's "distinct row-gradients ⇒ permuted Walsh" is kin to APN/crookedness conditions — NEVER claim the Walsh lemma; the claimable content is the two-fiber CERTIFICATION for the Graves/cubic-corrected sign family + the obstruction tier |
| (iv) the P5/P6 shape: "constrained Gram realizability" (host algebra + single functional + associativity) | **EMPTY** | the Gram-realizability literature is PSD/low-rank only (Wikipedia/MathWorld/Recht-class results; "every nonsingular matrix is a Gram matrix" is trivial and IS the precharter's row-5 point); no source poses the associativity-constrained, single-functional shape |
| (v) corpus re-check: n = 4 TL structure-constant / dimension content | **VERIFIED CLEAN (independently, before the relay)** | `Basic.lean:48–53` read verbatim — the disclaimer stands ("not proved here: it needs the diagram basis"); `rg catalan` over tauceti → FreeProbability moments ONLY (free Poisson/CLT Catalan moment combinatorics — nothing TL-dimensional); `rg "structure.?constant|mulTab|Fin 14"` over tauceti/OAI-ArtinGroups/mathlib → 0; mathlib TL-negative carried. **The precharter's load-bearing row (dim-14 corpus-NONE, the A14 literal-host design being forced) is R9-confirmed at source** |

### R2. Component verdicts re-graded against the precharter's named targets

| component (precharter id) | verdict | one-line reason |
|---|---|---|
| **TARGET-C / Theorem C** (both closed fibers = permuted Walsh character tables; no d ≤ 7 realization at either; non-tracial force at all n; eth's own σ covered) | **NEW-narrow — the obstruction-tier extension** | R1(i) empty; the statement family (q ∈ {−1,+1} × d ≤ 7 × strand-free tracial corollary) is stated nowhere; billing NEGATIVE-kind quota-free (41H lineage; register locked "elementary certificates, nonelementary closure"); within it, P1's mechanism is wording-locked (R1(iii)) and the rank-factorization argument is folklore-grade — the NEW content is the certification-for-THIS-family + the closure statement |
| **TARGET-D / Theorem D** (H4-DICT: 8 TL₄ words + non-tracial φ, 64 equations) | **NEW-narrow, two-sided** (base battery (Q4) re-indexed) | R1(ii) empty at every δ; positive ⇒ DISCOVERY quota-consuming (S1–S4 needed); bounded-miss ⇒ NEG-H4-bounded reportable (third obstruction); P6 rigidity keeps the prior negative-leaning, P5 keeps it live — honest posture per the precharter's own §6 |
| **P4 genericity rider** (det M(q) ≠ 0 by ONE certified fiber; degree ≤ 24 ⇒ ≤ 24 bad fibers) | **NEW-narrow method-grade; the refinement is SOUND** | det M(−1) = ±8⁴ ≠ 0 (H2's certificates) ⇒ the polynomial is nonzero — the 25-point scan is indeed over-designed; the surviving cost is the eval/det commutation (Polynomial.map/det ring-hom) — L-rung per the precharter's §5; unstated in this connection anywhere |
| **P5 quotient ansatz** (8 matrices in M₃, tr(K X_p X_p′) = M(p,p′)) | **NEW-narrow as a question; hypothesis-grade** | R1(iv) empty; the K-weighted nonsymmetric Gram shape has no classical statement found; battery grades it the hunt's internal machinery, not an independent claim |
| **P6 rigidity heuristics** (rank-one and diagonal-associative hosts die) | **NOT CLAIMABLE (heuristics)** | paper-level counterweight; the honest-negative register's evidence, never a theorem claim |
| **H4-M3-quotient / NEG-H4-tracial-n4 / NEG-H4-bounded** | covered by TARGET-C/TARGET-D verdicts above (corollary-grade / restatement / the search's outcome) | precharter §1 table's own classes stand |

### R3. Battery deltas vs the precharter's §3 table (report-only, for R4)

1. **The tauceti spin model row (base battery §1 / row 2) is ABSENT from the
   precharter's §3** — add it: `spinRep` at negative q is BOTH a wording lock (never
   "first non-tracial functional layer on TL") AND the corpus-native candidate
   generator for TARGET-D's word/functional search (matrix coefficients on the
   (Fin 4 → Bool) chain, dim 16 ≥ 8). Consistency note: at n = 3 the spin route stays
   inside Theorem B's refuted class (it factors through TL₃, dim 5) — the hunt opens
   only at n = 4, matching the precharter's tier exactly.
2. **The Avan et al. row (base battery row 3) is ABSENT** — add arXiv:1306.2927
   (Theor. Math. Phys. 178 (2014) 223): Hadamard/Butson → TL-rep constructions; a
   wording lock ("never first Hadamard–TL connection") + a candidate-generator class
   (the σ-table's q = −1 fiber is a {±1}-Butson-type matrix). Full-text read becomes
   warranted IF the charter consumes the construction (trigger recorded).
3. **The Morin-Duchesne dimer row (R1(ii) above) is ABSENT** — add: dim-2ⁿ⁻¹ TL
   modules (d = 8 at n = 4) exist in the loop-model literature at loop value 0; the
   d = 8 boundary host class is nonempty in the literature even though TL₄(±2)
   dictionaries are unstated. Feeds P5's quotient direction.
4. Smaller adds: Eisermann PJM 231 (2007) colouring-polynomials-as-braid-traces
   (genre row); Pourkia arXiv:2611.10850 (Nov 2026, strand-label B_n reps — freshest
   kin); MO 207540 (trace uniqueness — the tracial side's context); Hartsell 2018
   (TL/B_3 word normal forms — the (S4) enumeration kin).
5. **The §7 NO-GO check resolves NO-GO-FALSE**: no collision on the two-fiber
   obstruction class (R1(i) empty) — the battery returns GREEN for the hunt's novelty
   posture with the wording locks above; the banking-vs-hunting choice stays the
   orchestrator's (precharter §7's own NO-GO branch).

— §RE-RUN R9, 2026-11-20, against precharter `b9e911cdac5f1c90` (moved from the
relayed `726e3d695e766da6` mid-battery — refinement delta noted, not restart).
Same hold: no commits.
