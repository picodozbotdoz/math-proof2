# Round-6 — 74-P2 novelty pre-gate: the constructive marking-bound family (R9, unit 3)

Lane R9 (novelty/prior-art), 2026-11-19. Unit: the nearest-miss table (≥ 2 rows, the
novelty-table bar) for what R3 (agent-07) is executing in 74-P2 — per
`pilots/74/P2-precharter.md` (A8, commit `6216e2a`) under the iteration-5 debt rung:
**P2-a** `mgfBound_var_sharp` (sharp window-free `Var ≤ 2v` from FIND-#2's centered
windowed-MGF bound; route 1.5 decided at R3's G1, 2026-11-19), **P2-b** `t1c_sharp`
(MarginalTails class instantiation), **P2-c** the class-level tightness pair
(`BkClass` + `t4_floor_achieved` + `t4_not_littleO`) via the **FIND-#1 n-atom extremal
family used constructively** to discharge `hVarLB` — with the two-atom insufficiency find
(a two-point spectrum's `Var = δ(1−δ)log²((1−δ)/δ)` is bounded by ≈ 0.55, so it cannot
realize `Var ≥ κB` — precharter (a) P2-c). Purpose: the unit's record/article path has its
novelty section ready; flag any nearest-miss that threatens NEW-statement status. R3's
files read-only (P2.lean peeked for statement-name alignment: `t1a_floor`, `t1b`,
`t1b_window`, `t1c`, `cert_pad`, `Bk_le_Bk_succ`, `t4_floor_ceiling`, `mgfBound_var_sharp`,
`t1c_sharp` — P2-c pending G3).

**Verdict line: NO nearest-miss threatens the family's NEW-statement status — P2-c (class
tightness + constructive n-atom discharge + two-atom insufficiency) is stated nowhere in
any corpus or sweep; P2-a is formal-new-AS-STATED on our spectrum defs but mathematically
folklore, and the pre-gate's OWN FINDING sharpens its citation duty: mathlib ON OUR PIN
already carries `Probability/Moments/SubGaussian.lean` (the dossier's 2026-11-13 corpus
grep did not cover 'subgaussian') — no variance-equivalence theorem exists there (the
cgf''/tilted-variance identity appears only inside Hoeffding's proof), but the file + the
`MGFAnalytic`/`Tilted` lemmas are now MANDATORY nearest-miss rows and a wording guard.**

---

## 1. The pre-gate's new corpus finding (direct-source, encore-mathlib @ ff2494ea, this session)

`Mathlib/Probability/Moments/SubGaussian.lean` (925 lines, ON OUR PIN) — the measure-theoretic
sub-Gaussian layer: `HasSubgaussianMGF X c κ ν` (MGF class), Chernoff tails
(`measure_ge_le` :331/:696), Hoeffding (`hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero`
:815ff). Read in full for variance content:
- **NO variance-conclusion theorem** ("class ⇒ Var ≤ f(c)") exists in the file —
  `variance_tilted_mul` and `variance_le_sq_of_bounded` occur only INSIDE Hoeffding's
  proof (:823/:825). P2-a's statement (window-free sharp `varK ≤ 2 * v` over
  finitely-supported spectra, centered two-sided windowed form) is **mathlib-absent**.
- The technique's core identity IS on-pin, in tilted form: **`MGFAnalytic.lean:279
  exists_cgf_eq_iteratedDeriv_two_cgf_mul`** (∃ interior point where the cgf's second
  iterated derivative equals 2·Var of the tilted measure) + **`Tilted.lean:159
  variance_tilted_mul`**. These are the formal kin of P2-a's route-1/1.5 limit argument
  and MUST-CITE rows; an alternative consumption route (transport through
  MeasureTheory) exists but is heavier than R3's route 1.5 — recorded, not recommended.
- Wording guard for any article/record phrasing: say "**mathlib-absent for
  finitely-supported spectra / as a variance-equivalence theorem**", never "sub-Gaussian
  absent from mathlib" (the physlib entropy-object lesson of the wing-check addendum
  (f), now with an in-mathlib analogue).

## 2. Nearest-miss table (≥ 2 rows delivered: 8)

| # | source | what it has | delta vs the 74-P2 family |
|---|---|---|---|
| 1 | **mathlib `Probability/Moments/SubGaussian.lean`** (on-pin, read this session) | the sub-Gaussian MGF class + Chernoff/Hoeffding, measure-theoretic | no variance-equivalence theorem, no windowed two-sided form, no finitely-supported-spectrum form, no entropy/surprisal object anywhere |
| 2 | **mathlib `MGFAnalytic.lean:279` + `Tilted.lean:159`** (on-pin) | the cgf''-at-interior = 2·Var(tilted) identity (P2-a's technique kin) | tilted-measure dressing, consumed internally by Hoeffding; not a variance bound, not on our defs |
| 3 | **OAI `PEPSSubvolume/EntropyMoments.lean`** (in-corpus donor, `moment :93`/`logMoment_derivative :128`) | the moment CALCULUS of the very same object (incl. derivative lemmas = route-1's model) | no certificate class, no ceiling, no tightness, no hierarchy (the dossier's own census, carried) |
| 4 | **AreaLaw2D `MarginalTails`** (`Statements.lean:469/:482–485`; P2-b's target) | the ACHIEVED 2-moment upper bound — the other side of T1/T4; P1/P2's hypothesis binder | a bound, never tightness-for-the-class; the class ceiling `BkClass` is ours |
| 5 | **classical Cantelli/one-sided Chebyshev** | the per-spectrum UPPER bound `W_ε ≤ √((1−ε)/ε·Var)` (FIND #1's corrected direction) and the second-moment decomposition kin of `t1a_floor`'s `Var ≤ (1−ε)W_ε² + ε·Mdev²` | textbook-grade as mathematics (the dossier says so); the formal statement over surprisal spectra + the marking-bound shape is ours |
| 6 | **AHS arXiv:2004.15009** (the dossier's row (d)) | entanglement-spread STATE-SIDE area law Õ(√b) — upper bounds | the class-side FLOOR (√-floor achieved) + constructive extremal discharge is the dual direction; no class/hierarchy/LP/tightness there |
| 7 | **physlib `QuantumInfo/Entropy/VonNeumann.lean` + `DPI.lean`** (wing-check addendum rows (f)/(g)) | the entropy OBJECT layer + sandwiched Rényi trace functionals in the wider ecosystem | no moments of any kind; wording guard only ("mathlib-absent", not "Lean-ecosystem-absent") |
| 8 | **classical sub-Gaussian variance folklore + truncated moment theory (Hausdorff extremals)** | "MGF bound ⇒ Var ≤ 2v" is a standard Taylor/limit exercise (FIND #3 already framed `2v` as the sharp classical constant); moment-problem extremal structure is the conceptual kin of P2-c's n-atom family | folklore-grade for P2-a (formalization-first billing); for P2-c nothing in the moment literature states a surprisal-deviation floor for sub-Gaussian-class spectra, nor any two-atom insufficiency lemma |

## 3. Per-component pre-gate verdicts

| component | verdict | one-line reason |
|---|---|---|
| P2-a `mgfBound_var_sharp` (Var ≤ 2v, window-free) | **formal-NEW-as-stated / mathematically FOLKLORE** | statement absent from mathlib even with SubGaussian.lean present (§1); the mathematics is the classical Taylor/limit argument — bill technical/sharp-constants, cite rows 1–2 mandatorily |
| P2-b `t1c_sharp` | **instantiation** | P2-a at the class window; no novelty claim; row 4 is the cited target |
| P2-c `BkClass` + `t4_floor_achieved` + `t4_not_littleO` + the n-atom constructive discharge + two-atom insufficiency | **NEW-statement — STANDS; no nearest-miss threatens it** | class-level tightness with an explicit constructive extremal family is stated nowhere in the eight rows, the dossier's corpus census, the physlib wing addenda, or this session's sweeps; AHS is the upper-bound dual, MarginalTails the bound not the class, mathlib classless |
| P1 carries (`t1a_floor`, `t1b`, `t1c`, `t4_floor_ceiling`) | already GREEN-triad (74-P1 completion) — the article base | the amended honest replacement statements per FINDS #1/#2/#4 are exactly what P2 extends; billing unchanged |

**Threat flags: NONE at NEW-statement level.** Two citation duties added (rows 1–2 —
the pre-gate's own finding), one wording guard (§1), one recorded-not-recommended
alternative route (measure transport via `MGFAnalytic`). The G3 caveat (the family sits
MARGINAL at small θ near the class window edge) is a proof risk, not a novelty risk —
out of this gate's scope.

## 4. Consumption notes

1. R3 (agent-07): the family's article/record novelty section can lift §2–§3 verbatim;
   the two new must-cites (mathlib SubGaussian/MGFAnalytic/Tilted) belong in the P2
   record's citation block.
2. Dossier-74 (owner's file, report-only): the corpus census line "mathlib … the objects
   are not [present]" should gain a sub-Gaussian exception note (the 2026-11-13 grep
   pattern missed it) — H folds via the errata channel if adopted.
3. CLAIMS-REGISTER row 74 (H's post-K batch): no status change (the family was SAFE at
   the statement class; the new rows narrow P2-a's formal claim wording only).

— lane R9 (worktree agent-09), 2026-11-19. Sources: encore-mathlib @ ff2494ea
(SubGaussian/MGFAnalytic/Tilted read at source), dossier-74 + P2-precharter @ main
(6f25933), R3's P2.lean header/theorem surface (worktree agent-07, read-only). No
commits (hold for the H batch).
