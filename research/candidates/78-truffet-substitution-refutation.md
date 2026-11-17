# Candidate dossier 78 — truffet-substitution-refutation

Lane A7 (external prior-art / classical-scope, R7-successor), 2026-11-17. Elevated from
`research/novelty/iter4-truffet-classical-scope.md` §10 (week-1 agenda row 3; go-condition
(i) CLOSED — the fidelity back-mapping of §10.1 is this dossier's load-bearing input).
Kind per the iteration-4 gate: **NEGATIVE (candidate DISCOVERY-grade)**. Tags:
[VERIFIED] = read at the cited locator this session (both PDFs in full, 2026-11-17;
sibling Lean files read-only); [PAPER-ONLY] = paper mathematics of §10.1, no Lean yet;
[HYPOTHESIS] = proposed pilot content.

## Name

truffet-substitution-refutation

## One-line pitch

The OAI tropical counterexample, fidelity-verified at the selection level (§10.1), is a
refutation of Truffet's v4 tropical substitution *procedure itself* — not merely of an
abstraction of it: the paper's own criteria, run verbatim on a two-row bounded instance,
assert a finite minimum that an explicit feasible witness beats by a full unit (and the
instance is in fact unbounded below); the classical sibling's Smale-9th-staking theorem
(arXiv:2604.06726 Thm 2.1) rests on the same never-justified single-bound elimination.

## Precise mathematical statement

**Setting [VERIFIED].** mpr per 2603.26423v4 (6a)–(6f): min z over the max-plus cone
a⁺_{i,·}⊗w ≥ a⁻_{i,·}⊗w, z ≥ c^T⊗x ⊕ c_h⊗h, h > O, z and h non-substitutable;
procedure = §4.2.3 case ladder, candidate set (53a)–(53b) (the D-gate), Theorem 4.3
selection (T-filter (43)–(44), θ/θ′ (45)/(50), argMin (47)/(52)), substitution and update
§4.2.4 (x_{j\*} := f≥_{i\*j\*} (27); cost := f_{z,i\*j\*} (29)/(56); cone update
(57)–(59); `setrowtozero` (7)). OAI substrate: `OAI.TruffetV4Counterexample`
(`openai-math/lean/OAI/Optimization/Tropical/TruffetModel.lean` :33–:116,
`TruffetCounterexample.lean` :126 — sibling, read-only; re-transcribed in-repo at pilot
time, no build dependency).

**Stage A — tropical refutation, publishable as stated.**

- **A1 (fidelity, [PAPER-ONLY] §10.1; pilot theorem).** For every state s of the common
  class on which the procedure is in Case 2.2.2 with singleton (53b)-set {(i\*,j\*)},
  the procedure selects Sθ≥ = {(i\*,j\*)} by (47) — no θ-value, Rλμ domain, or hB/hU
  classification participates — and performs `advance s i* j*`. (Formalizable as a
  finite case check over the 2×3 state class, or generically.)
- **A2 (refutation run, [PAPER-ONLY] §10.1; pilot theorem).** On the instance I =
  OAI `initial` (rows x₂ ≤ x₀⊕x₁ and 1⊗x₁⊕(−2)⊗x₂ ≤ x₀; cost x₀; Def-4.2-bounded),
  the procedure's run is initial →(0,x₁) middle →(1,x₀) terminal (both steps Case 2.2.2
  singleton selections per A1), terminates in Case 2.1 asserting **min z = 1** at
  x = (1,0) — while `better = (0,−1,0)` is feasible with z = 0, and the true infimum is
  −∞ (feasible family (−N,−N−1,−N)). Statement shape: `finite_execution_not_optimal`
  with the procedure layer replacing the modeled eligibility.

**Stage B — classical extension [HYPOTHESIS].** De-tropicalized transcription of
2604.06726 Thm 6.2 (eqs. 96–100; Prop 6.6 D-gate; Defs 5.2/6.1/6.2; Nearest-to-zero
function p. 33) over ℚ-linear (z,x,h)-forms; small-instance search for a forced,
prerequisite-satisfying ((79) + Def 5.1/5.2), suboptimal run. Located gap: §7 eq. (118) —
substitution keeps ONE chosen upper bound f≤_{i\*j\*} as an equality and discards the
other n̄−1, "0 additional inequalities", redundancy proved nowhere (scoping note §9
Outcome B). Blockers assessed passable-in-principle per §10.2 (each prerequisite
instantiated in the paper's own §9 examples); **no classical suboptimal run exhibited at
paper level** — Stage B is exploratory and gated on the search.

## Novelty (nearest-miss table)

| # | Nearest miss | What it has | Delta (why 78 is new) |
|---|---|---|---|
| 1 | `OAI.TruffetV4Counterexample.finite_execution_not_optimal` (sibling corpus, kernel-checked) | the model-level statement: modeled criteria force a suboptimal run | the fidelity bridge (§10.1 dictionary + singleton proposition) promotes it from "the modeled criteria lose the optimum" to "the paper's own procedure loses the optimum" — model-level → procedure-level is the discovery |
| 2 | Truffet, arXiv:2603.26423 v4, §2.3 + Thms 4.1–4.3 | the target-of-refutation: claims Thm 4.2 "ensures the optimality of the result"; proves only per-disjunct saturation (Thm 4.1) and interval maximality (Thm 4.3) | §10.1's worked run refutes the optimality claim on the paper's own singleton path, prerequisites satisfied; the v4 NOTA's disjunction correction is shown incomplete at the I≥-selection level |
| 3 | Truffet, arXiv:2604.06726 v4, §§6.3–9 | the classical sibling: same single-bound elimination (§7 eq. 118), Thm 2.1 (strongly-poly general LP) + Cor 2.1 (Smale's 9th) proved by complexity accounting alone, no soundness theorem (§8; scoping §9) | Stage-B target; also the stakes-context for Stage A's article framing |
| 4 | Allamigeon–Benchimol–Gaubert–Joswig, arXiv:1308.0454 (SIAM J. Discrete Math. 2015) | tropical simplex: one tropical pivoting step in O(n(m+n)), reduced costs | pivoting WITHOUT any rule-soundness characterization; shows the refutation targets Truffet's rule, not tropical LP per se |
| 5 | Butkovič, arXiv:1709.08983 | tropical LP strong/weak duality, no gap | the sound substrate the counterexample does not touch (scoping boundary: this dossier refutes a method, not tropical LP duality) |

No counterexample, soundness theorem, or follow-up exists in the Truffet line's
neighborhood (R7 gate (b) NO-KILL, `qa/iter4-review/r7-bib-cards.md` §A; S2 citations of
both papers empty, 2026-11-16). Lineage correction pattern (Lahlou–Truffet 2106.08854 →
Truffet 2408.14256) already carded there.

## Bridge claim

openai-math × external 2026 preprints, via the fidelity dictionary. Essential: the
corpus alone proves only the model-level statement (row 1); the papers alone assert
(unrefereed) correctness; only the §10.1 back-mapping — showing the paper's (53b)+(47)
selection and §4.2.4 update coincide with the corpus machine on the forced-singleton
class — converts the corpus's kernel-checked instance into a refutation of the paper's
procedure. Discovery-first: the statement "the v4 tropical substitution method is
unsound, by its own run" is absent from all corpora and the literature.

## Feasibility note (per §6 of the scoping note, carried)

- **Stage A: effort S–M, no new mathematics.** The §10.1 proposition is complete paper
  mathematics; the pilot verifies it. Transcription = the OAI template plus a procedure
  layer (candidate set, case ladder, singleton selection, substitution/update) — all
  finite/decidable on 2×3 states; A2 re-points the existing OAI proof shape
  (decide/norm_num class) at the procedure layer. Kernel-only; no sorry; no
  native_decide; no external CAS. Runner: the standard pilot app class
  (`crossmath-probe` / pilot-32 pattern); no new Modal resources beyond defaults
  (2 CPU / 4 GB per the mandatory guidelines).
- **Stage B: effort M+ (exploratory).** De-tropicalized transcription + instance
  search; the search class is decide/norm_num-shaped per the OAI proof. Fire only after
  Stage A GREEN; stop at the first negative search sweep (blockers then hold the line
  and the Stage-A article ships alone).
- **Grades.** Stage A = DISCOVERY-grade NEGATIVE (article-eligible, kind NEGATIVE, the
  §4 care framing as hard gate — dischargeable per §10.1). Stage B, if it lands, = the
  §6 headline class (refutation of a claimed strongly-polynomial general-LP method /
  claimed Smale-9th resolution). R2 re-grade at charter per S1–S4 (S1 ✓ named nearest
  misses; S2 ✓ essential bridge; S3 transcription+re-pointing = M proof content,
  surprising statement ✓; S4 n/a).

## Care framing (locked; from scoping §4, dischargeable per §10.1)

Refutation claims target the v4 criteria verbatim (eq-numbered), exhibit a
prerequisite-satisfying instance, and walk the paper's own case ladder; never announce
against the abstract claim alone. The (32) operand-order caveat (§10.1) must appear in
any writeup. Stage-B claims additionally require (79) + Def 5.1/5.2 satisfied on the
exhibited instance.

## Pilot proposal (Stage A, one file)

1. In-repo transcription of the §10.1 dictionary (state type = OAI `State` pattern;
   procedure layer: `paperCandidates` (53b), `paperSelect` (singleton case of 43–47),
   `paperStep` = `advance`).
2. Theorem A1 over the reachable states of the counterexample run (finite check), or
   generic singleton lemma if cheap.
3. Theorem A2: the run assertion + witness (re-point `finite_execution_not_optimal`).
4. Full-coverage axcheck (`axcheck_full.py` pattern); triad-clean; log persisted with
   provenance header; no `sorry` tokens outside probe-convention headers (none expected).

— filed by lane A7, 2026-11-17, from `research/novelty/iter4-truffet-classical-scope.md`
§10 (ELEVATE; go-condition (i)).
