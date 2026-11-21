# Article revisions — applying the 2026-11-21 external referee set

**Date:** 2026-11-21. **Input:** the independent referee reports at
`/home/doz/dsh-workdir/math-proof2-reviewer/article-review-docs/` (one per article +
`00-corpus-review.md`, per `REVIEW-SPEC.md`). **Action:** every finding verified against
the repository artifacts (pilot `.lean` files, logs, sibling repos, git history — read-only)
before acting; valid findings fixed **in place** in the articles; reviewer errors refuted in
`article-review-docs/refute1/`; `research/articles/README.md` rows synced centrally.
**Scope guard:** only article files + the articles README were edited; no pilot `.lean`,
log, dossier, qa, novelty or feasibility file was touched; nothing committed in this pass.

**Global outcome, from the referees themselves and confirmed by our verification: NO
kernel-proved theorem was found false anywhere in the corpus.** Every substantive defect
was in the prose layer: claims broader than the artifact, prior-art misstatements,
status-billing accuracy, citation locators, template/register drift. The corrections below
are claim-scope retractions and precision fixes, not mathematical repairs.

## Per-article summary

| art. | referee verdict | what was fixed (key items) | notes |
|---|---|---|---|
| 01 | MINOR 14/16 | skeleton to template order; §6 table-only with re-measured lines; references split; inline change log removed; binder note added. **Honest catch:** the §-scope `rg` claim failed on re-run (non-manifest hits exist) — rewritten truthfully with the re-run date | README row unchanged |
| 10 | MAJOR 9/16 | abstract 223→190 words, one paragraph, headline OPEN stated; D1 row split (`padM'_state_poly` PROVED-CONDITIONAL, binder `hv`); §6 rebuilt (17 rows, re-measured); changelogs deleted; paths fixed (`eth/` root, `Wrap/Main.lean:115`). **Beyond the report:** D2 also re-billed PROVED-CONDITIONAL (PolyT Prop binders) | README row updated (leads with OPEN headline) |
| 11 | MAJOR 9/16 | **BLOCKER fixed:** "3sum-apsp programs cannot call subroutines" is false (donor `Lang/Calls.lean:86–125` has call combinators) → "programs do call subroutines; transfer claims are not composable objects"; binder lists completed; two change logs removed; §8 skeleton normalized | README row updated |
| 20 | MAJOR 8/16 | **Seam dependency claim removed** (42/75 do not import Pilot20 — verified by grep); Thm 1 restated (TracesFamily + EngineStep; Card20 carried unused); "any finite sum" → binary/iterated; Thm 4 re-billed PROVED-CONDITIONAL (hz/hw; hdisj); template/register pass | README row updated |
| 22 | MAJOR 14/16 | **M1 novelty re-scope:** Mathlib at the project pin already proves `tendsto_riemannZeta_sub_one_div` (sharper, `ZetaAsymp.lean:343`) and M4 never uses M1 → "three missing links" → two; kind-provenance chain cited; PNTAnd provenance disclosed; §6 table-only | README row still accurate |
| 30 | MAJOR 14/16 | abstract 193 words with scoped novelty + nearest prior; two change logs removed; §6 table-only; title discloses the Kronecker term. **Refute1 written:** referee's B1 rationale (power-sums-vs-monomials) is void — monomials map to power sums via Theorem A′ + `TauCeti.hallInner_psumPart`; referee's "E = 0" idempotence fix is false (Q±2 idempotent on V₁; Q_s = 0 for \|s\| ≥ E+2) — exact Q₀ statement proved instead | `refute1/30-…md` |
| 32 | MAJOR 13/16 | superseded-constants caveat moved into the abstract (193 words); crossing existence promoted to numbered Theorem 6 (domain 0 < ε < ε* read off the decls); every PROVED-UNCONDITIONAL row lists its statement-domain binders; title de-numbered (donor-internal "Corollary-31" removed); §6 rebuilt | README row updated |
| 41 | MAJOR 8/16 | theorem numbering unified (§3 scheme); **false "iff" fixed** (forward implication; converse needs cancellable 1−q); **§5 bracket corrected** to the uniform parity-weighted `1 − q^gap` (the old `1 + (−q)^gap` display failed on 384 even-gap quads); Q1 ≡ Q2 (mod 2) on the stratum; both witness quads displayed, nondegeneracy rests on `alternation_fails_at_q_minus_one`; content-bearing corollary `mainCor_one_implies_signs` cited (mainImpliesSigns = P0-shape remark); all 12 formal-record line refs re-measured (+18 offset fixed) with log :line refs; arXiv title corrected (*A quantum octonion algebra*); tauceti paths `TauCeti/`-prefixed; 41H/41H3 cross-refs; abstract 196 words five elements; §9 gate removed | README row updated; all numeric facts independently re-verified by exact computation |
| 41H | MAJOR 6/16 | **Scope restricted to the proved fibre:** kernel closes q = −1 only — the fibre where (−q)^τ = 1 (no cubic content); title/abstract/corollary restricted, "host lives at n ≥ 4" deleted from public surfaces; Theorem B re-billed PROVED-CONDITIONAL (witness binders v/hv/hdep; pigeonhole unformalized); transport binders listed (hq unused); `H2.lean:306`→`:310` | README row updated; det M(q) = −512q(q⁴+6q²+1) independently recomputed (correct) but kept OUT of the article as unformalized |
| 41H3 | MAJOR 9/16 | **Seam fixed:** byline now records the shipped state (git `e4ac8dd`, 2026-11-20); draft footer removed; q = −1 non-traciality attributed to companion Theorem A (H1.lean:436), q = +1 to the new witness; abstract gains closed strings (197 words); §6 table-only; custody disclosure made exact (no archived scripts — stated, not papered over); gate re-run truthfully | README title overclaim fixed ("No TL₄ Generator-Word Dictionary" was the wording the article itself forbids) |
| 42 | MAJOR 10/16 | **Two retractions:** χ column is not "the open core" — zeta23 Thm E is proved unconditional at the donor pin (`Zeta23/ThmE/Final.lean:93`, `Mult.lean:333`), the gap is a port/substrate gap + dyadic→cumulative window adaptation; title claim "Unconditional in the ζ Column" withdrawn (ζ inputs take hntopζ/hfinζ; the imported endpoints stay unconditional); sorry-challenge citations replaced with the proved copies; §0 + self-check removed; §6 rebuilt | README row updated |
| 50 | MINOR 12/16 | shifted last status row split into two proper discharge rows; kind tag → TECHNICAL-RECORD; title re-scoped ("…and Why the Shipped Window-Certificate Engine Cannot Move Its Constants"); §0 removed; skeleton normalized; abstract 198 words with closed strings. **Refute1 written:** reviewer's mathlib locator wrong — `completedLFunction_one_sub` IS at `DirichletContinuation.lean:291` at the project pin ff2494ea; citation kept, now pin-qualified | `refute1/50-…md`; README row updated |
| 52 | MAJOR 11/16 | **ℤ/2 Pauli example verified IMPOSSIBLE** (End ≅ ℤ/2 commutative; exhaustive check) → replaced by the verified (ℤ/2)² failure example; "holds exactly when 2 is not a zero divisor" reduced to the proved forward implication (char ≠ 2 stated over fields); axiom/field counts corrected (five relation fields, not six); §6 table-only; references verified (JW 1928, Bratteli–Robinson, Green 1990, Bożejko–Speicher 1991) | README row updated |
| 71 | MINOR 14/16 | "false here" → "false for the Lean totalized `zetaC`"; "carried verbatim" → "five of its seven lemmas" (diff-verified); Core 2 lemma cite fixed (`Real.exp_eq_exp`); "optimal 1/2" conditioned on A₁ ≠ ∅ (g ≥ 1); openai-math dropped from absence-scope lists (no registered sweep); change logs removed; abstract 190 words | README row updated |
| 72 | MAJOR 13/16 | **Headline narrowed to the proved fence:** `nogo_core` hardcodes c·n² (2D) — "whole d ≥ 2 class" removed everywhere; d ≥ 3 analysis kept only as a marked unformalized remark; N3 rows list every binder (c > 0, C ≥ 0, hKL/hBnd/hArea, hMono); §6 table-only; skeleton normalized | README row updated |
| 75 | MAJOR 10/16 | **Prior-art correction (the corpus's one substantive error):** DLRT (arXiv:1908.04876) covers any abelian K under GRH (Thm 1.1; Cor 1.3(ii),(iii) = 0.2794/0.1127 for n = 3/4) — "first zero-proportion statements for ζ_L outside the quadratic case" was false as written; re-scoped to what survives (multiplicity-counted on-line proportions beyond quadratic; 5/6-class distinct proportions; relative towers K ≠ ℚ; kernel-verified conditional statements); abstract binder summary completed (11 premises); ℚ endpoint relabeled degenerate tower L = K = ℚ; duplicate §0 change logs removed; "Tier" → "Regime"; abstract 198 words | README row updated |
| 78 | MAJOR 9/16 | **A2′ WITHDRAWN** (homogeneity artifact: the witness is a translate of any feasible point; says nothing instance-specific; kernel theorem stays unclaimed in the pilot, documented §7.1); **A1 relabeled a model lemma**, the fidelity bridge stated as explicit PAPER-ONLY Assumption F; OAI citations moved to the proved copy (`TruffetCounterexample.lean:126`, challenge copy disambiguated); change log + shipping-gate self-audit removed; abstract 196 words | README row updated; coordination needed in REPORT.md / INDEX.md / candidates/78 / qa records which still assert A2′ |

## Refutation notes written (`article-review-docs/refute1/`)

- `30-boson-operators-second-difference-closed-form.md` — findings 5 & 8 accepted in
  conclusion, rationale/fix refuted with kernel and dossier evidence.
- `50-zero-free-regions-cannot-move-certificate-constants.md` — reviewer's mathlib
  locator (`:283`) refuted against the project-pin checkout (`:291` exact).

Everything else in the 17 reports + corpus review survived verification and was applied.

## Follow-ups (status as of the 2026-11-21 commit)

1. **78 coordination — DONE:** the A2′ retraction is propagated to `research/REPORT.md`
   (§I4.2 row), `research/INDEX.md` (pilot-78 + article-78 rows), the dossier
   (`candidates/78-…` retraction note (b) + kernel-upgrade note (c)), the qa audit
   records (`a9-claims-audit-iter4.md`, `r3-verification-tables.md` — dated cross-notes;
   their rows stand as artifact-audit history), and `RESUME-BRIEF-ITER4.md`.
2. **Ledger entries — DONE:** `research/feasibility/VERIFICATION-LEDGER.md` §12 carries
   the five dispositions the referees asked moved out of the articles (10 log-truncation,
   52 reverify-cause, 71 transfer fact, 78 A2′ artifact + propagation map, 41H
   determinant record) plus the 41H3 custody state (settled at 2ea25a9, item 5).
3. **41H3 custody — SETTLED 2026-11-21 (orchestrator option (a)):** the pre-solve
   scan re-run with a persisted generator/checker at `pilots/41/presolve/`
   (deterministic seed, numpy-only, no Modal; 782 s wall on 4 cores). Reproductions:
   S1 census exact (24/13, 37/14), |det| = 8⁴ both fibers, plants 20/20/fiber at
   ~1e-13, far ±1-tables ~7.1 (the record's figure), **0 survivors in ~2.97×10⁸
   systems**; per-fiber split explicit (canonical 51.9M/fiber; natural 82.6M/fiber;
   random 14.1M/14.0M) and the record's combined counts reconciled (rows 2–3 were
   one-fiber figures; row 1 short by 7 subsets/fiber — re-run covers the full space
   and strengthens the negative). Article 41H3 §3/status table/§6/abstract, README
   row, ledger §12 item 5, and the record note all updated to the archived state.
   Remaining custody item: the H3.lean print-coverage rider (16 unprinted helpers
   at the next H3.lean edit) — unchanged, still binding.
4. **Possible kernel upgrades flagged by the reviews** (each needs a new pilot run, not
   an article edit; recorded at dossier-41's follow-ups block and dossier-78 note (c)):
   41H det M(q) ≠ 0 at generic q (would restore the general real-fibre no-go);
   78's A2 back-substitution conjuncts (they hold numerically in P0's identical
   definition layer); 41H3 per-fiber scan-count split.
5. **External sweeps that remain unregistered** (the articles now say so correctly):
   openai-math function-field absence sweep (71); #SAT classical-literature round-2
   queries (10).
