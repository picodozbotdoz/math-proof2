# 72-M1 L3 RE-CHARTER (re-based, derivation-class) — D6 draft + gate evaluation

*Lane R4 (worktree agent-08), 2026-11-21. **CHARTER-GRADE ONLY, NO FIRES** — D6
(`RESEARCH.md` §Iteration 6) binds: 72-M1 L3 stays PARKED; fires only on the
orchestrator's adoption of a re-based charter. Authority chain: ruling D6 ←
the re-based stop-note `logs/l3bd-stop-note.md` §PRINT-LEVEL RE-BASE
(sha256-16 `db872dc5`, landed `8fc848d`) ← `L3-record.md` re-base amendment
(`b846290e`) + `L3-spec.md` (`268d4fff`, statement authority §2–§6; its §7
budget clauses superseded here) ← the 2026-11-21 external referee pass on
article-72 (MAJOR 13/16; revisions landed `2bfe771`,
`qa/article-revisions-2026-11-21.md` row 72) ← the post-revision article
bytes (`articles/72-renyi-monotonicity-nogo-gate.md`). Everything below is
priced against the POST-revision scope and the print-level park evidence —
never the retracted pre-re-base narrative.*

## §0 What this charter governs (post-revision scope)

**The single deliverable** = link 4 + the interface theorem of article-72
Part II, i.e. the four never-certified declarations of `P72M1T3.lean`
(v16 park state, sha256-16 `aed63101`, 1,049 LoC, zero sorry tokens):

| # | decl (L3-spec section) | print-verified state (db872dc5 matrix) |
|---|---|---|
| 1 | `hasGlobalGap_of_fullSystemGap` (L3c, §4) | NEVER certified — sorryAx runs 4–16 |
| 2 | `isAdmissible_ΦL` (L3d, §5) | NEVER certified — sorryAx ALL 16 runs |
| 3 | `hamiltonian_gridDom_eq` (L3d, §5) | NEVER certified — sorryAx ALL 16 runs |
| 4 | `interface_areaLaw_uniformAreaLaw` (§6) | current form NEVER certified (runs 2–3 early forms only) |

riding the certified base: `toGrid_star_dotProduct_self` (L3b, triad since
run 6), `eig_toGrid` (run 5), `edgeBoundary_le_boundaryCard` (run 9), the
T1/T2/L3a regression set (every run), with `submatrix_mulVec_ec` in the
print-gap class (record-only, db872dc5's §10.9 precedent).

**Payoff shape, POST-referee (binding):** a dated REVISE-IN-PLACE of
article-72 — link 4 + the interface theorem move from "not article claims /
open for future work" to PROVED rows in the claims table, per the central
revision-record convention (`qa/article-revisions-*.md`) and the 75-v3/D3
precedent (revise-in-place, adds no ship, NOT-A-SHIP standing box, v-naming
caution). **NO new article, NO new headline.** Explicitly OUT of scope,
permanently:

- any "whole d ≥ 2 class" claim — the referee withdrew it (finding 1: the
  fence is the 2D instantiation; `nogo_core` hardcodes c·n²; d ≥ 3 stays a
  marked unformalized remark). Interface-layer work is encoding-level and
  "dimension-generic" only in the Lean sense; it claims nothing about
  Kuwahara's scope.
- any headline strengthening around openai's `MainStatement` beyond the
  article's own conditional-consequence wording ("would make openai's
  MainStatement unconditional in that hypothesis").
- any new fence/Rényi content (Part I is referee-settled; untouched).

**Knowledge-level classification:** this is FORMALIZATION-FIRST-class
interface engineering at best — never a discovery headline. It *informs*
the D1-style quota contest, never spends it; if executed, the revise-in-place
adds no ship and displaces no discovery lead.

## §1 The honest park basis (binding price inputs)

1. **16 runs / 4 grant rounds (8 + 3 + 2 + 3) produced ZERO certifications of
   the four contested decls.** The original stop-note estimate ("1–2
   additional fix rounds") is RETRACTED by db872dc5; the honest price is
   "3+ rounds with re-derivation risk" — none of the four has ever elaborated
   clean end-to-end.
2. **The residue was UNDERSTATED.** Run 16's five displayed error-sites (hz
   :374/:379/:387, hFe :848, attach-bridge :924) are the visible tail of that
   one run only (errors = 35 incl. cascades; 616 elided lines never
   itemized). Nothing establishes their exhaustiveness; the "3-item
   mechanical tail" framing is dead.
3. **The overreach history is itself a cost input.** Two flip-claim
   retractions (mechanism: tactic-level site-closures read as certifications;
   the sorryAx evidence sat in every log's AXIOMS block); the parse-trap
   lesson (naive multiline bracket-joining manufactured FALSE triads). Every
   certification rule in §4 exists because a specific failure already
   happened here.
4. **What the 16 runs DID establish (reusable, not to be re-paid):** zero
   mathematical defects in every run; every mathematical route in the tranche
   verified through at the tactic level (transports, EᴴAE compression-norm
   identity, sum-splits, the reality argument, the cast algebra); the T2-trap
   ledger (L3-record "v4.36 substrate finds"); the statement-shape notes
   (L3c's `hH : H.IsHermitian` binder; L3d's injection-compression `ΦL` +
   `opNorm_submatrix_le` route; `[NeZero q]`; the hV/hE SupportedOn-witness
   binders) — L3-spec §2–§6 remains the statement authority.

## §2 Stage 0 — the mechanical prefix (necessary, NOT sufficient)

The three form-level candidate families that survived the print-level re-base
(db872dc5 §PRINT-LEVEL RE-BASE, derived against run-16's own displays;
sufficiency UNVERIFIED):

- (a) hz h1/h2/h3 — `Fintype.sum_prod_type'` orientation (h1: rewrite the
  RHS pair-sum to iterated via ←, then `star_sum` + per-side
  `Finset.sum_congr rfl`; h3: `exact (Fintype.sum_prod_type' …).symm`), h2's
  prodComm projections reduced by rfl-`show`s then `ring`;
- (b) hFe — mirror the passing hFv canonical-show (the `rw [ΦL_edge, ← ha, …]`
  chain diverged: ΦL_edge's RHS already carries `hermPart (he e)`);
- (c) the attach-bridge fourth form (`Finset.sum_attach (s := …)` explicit /
  restate `key`'s U/F over the attach-type directly).

**Stage 0's deliverable is NOT a GREEN claim.** It is the first honest SITE
INVENTORY: the exhaustive itemization of distinct error classes across the
four contested decls that 16 runs never produced. Runner requirements:
complete error output (no elided lines — the 616-elided lesson), per-decl
error attribution, and the T1/T2 regression leg in the same run.

**Budget: ≤ 2 fires. Expected verdict: NOT GREEN** (additional sites beyond
the displayed five are expected to surface — that is the point of the stage).

## §3 Stage 1 — the re-derivation rounds (the D6-mandated class)

Priced as RE-DERIVATION, per db872dc5: each contested decl's first clean
end-to-end elaboration is expected to surface sites no displayed error
currently shows. Round structure: apply-the-inventory round, then fix rounds.

- **Budget: 3–4 fires. Hard cap for the whole charter: 6 fires**
  (Stage 0 + Stage 1 together; no continuation grants — the 8+3+2+3 grant
  escalation pattern is prohibited; a cap breach parks, it does not
  re-charter in-flight).
- Descent discipline (L3-spec §7, carried): enforced descent of DISTINCT
  ERROR CLASSES, not raw error counts; **no fix round without a written
  error-class hypothesis first**.
- Honest-park at cap per D7: named residual classes + priced continuation;
  NOT-GREEN-at-cap is a first-class outcome, recorded in this file's lineage
  (stop-note convention).
- Mathematical-defect rule (zero-defect record carried): any run that
  surfaces a genuine mathematical defect (not a name/shape/elaboration-form
  issue) ABORTS the charter immediately — the 16-run zero-math-defect
  baseline is a premise of this pricing, and its failure re-prices
  everything.

## §4 Certification plan (triad print ONLY)

1. **A decl is CLEAN iff its own triad (or zero-axiom) print appears in a run
   whose T1/T2 regression leg also holds** (db872dc5's standing rule, minted
   lane-wide by D6). Site-closure is not certification; error-descent is not
   certification.
2. **Narrative flip claims are prohibited.** Every clean claim cites run
   number + log line of its own print. The axcheck joins are token-validated
   (bracket-tracking with interleaved-text rejection — the parse-trap
   lesson); unvalidated multiline joins are inadmissible.
3. **Landing sweep on GREEN:** full-coverage axiom audit —
   `make_axcheck72m1.py` TARGETS + the T3 stage re-staged at the new sha,
   PLUS the pilot-10 `axcheck_full.py` pattern (dotted names, `@[simp]`
   theorems, dependency-order oleans) over the L3-record sweep-notes decl
   list (`toGrid_eq_ofLp` … `submatrix_mulVec_ec`, `eig_toGrid` + the six
   spec-named); T1/T2 recompile GREEN in the same run; sorry-token
   classifier pass (FINAL-SWEEP-PLAN convention).
4. **Acceptance = L3-spec §6 (1)–(5) with the print-level reading of (3):**
   `interface_areaLaw_uniformAreaLaw` + the three link-4 decls print exactly
   [propext, Classical.choice, Quot.sound], regression legs hold, zero
   `sorry`/`native_decide`, logs persisted with provenance headers.

## §5 Fire budget + Modal SPEC (summary)

≤ 6 fires total; warm ≈ 2.5 min/fire at SPEC cpu=2.0 / mem=4096,
`LEAN_NUM_THREADS=2`, telemetry in-log, doz CLI
(`/home/doz/dozenv/bin/modal`), logs to `pilots/72-M1/logs/` with provenance
headers (heredoc-quoted — standing lesson #4). Machine-time is minor
(≤ ~15 min warm); the true cost is lane-time + re-derivation risk, whose
probability-weighted price is dominated by the NOT-GREEN-at-cap tail (the
empirical base rate: 16 prior runs → 0 contested certifications). Runner
hygiene binding on any fire: the sorry-filter backtick-message fix
(`run_p0.py` `a3976f96` template, D4's lane-wide rider).

## §6 GATE EVALUATION (Deliverable 2) — verdict: **BANK** (valid charter, L3 stays parked)

**Does the re-charter pass its own D6 gate?** YES — on form. This document
is precisely what db872dc5 §PRINT-LEVEL RE-BASE ordered: derivation-class
with a mechanical prefix (§2), 3+ rounds priced with re-derivation risk
(§3), certified ONLY by triad print with the site-closure rule folded into
the certification plan (§4), honestly priced against the retracted narrative
(§1) and the post-revision article scope (§0). If the orchestrator ever
adopts an L3 re-attempt, adopting THIS charter (or a delta on it) is
justified.

**Would adopting it THIS iteration be justified? NO. Verdict: BANK** —
the charter is valid and banked for a future cycle; L3 stays PARKED per D6.
Weighing:

1. **Discovery-first posture (§Iteration 6):** every launch slot carries a
   named NEW-statement target, a pre-certified lead, or a ruled editorial
   decision. L3 offers none of the three — its payoff is a revise-in-place
   of an existing TECHNICAL-RECORD, i.e. pure interface engineering.
2. **D1's contest is FB-2 vs FB-4 vs unspent.** L3 is not a contestant;
   adding it ad hoc would dilute the quota frame the disposition record
   tracks (a third consecutive unspent cycle is itself a tracked signal —
   burning fires on a non-contestant knowledge-level item muddies exactly
   that signal).
3. **The referee pass moved the payoff DOWN while the re-base moved the
   price UP.** Post-revision, link 4 + the interface theorem are expressly
   future-work rows of a fence whose headline was just narrowed (the
   article was revised precisely to claim less); the re-based price is 3+
   re-derivation rounds after 16 runs produced zero contested
   certifications, with a documented understated-residue and
   overclaim-history. This is the worst price/payoff ratio in the wave-2
   queue.
4. **The queue's alternatives dominate:** M3 variant-1 re-scope (one scoped
   fire at a pre-applied sha), the H3.lean custody-rider audit tail
   (binding rider from README row-41H3), and the FB-2 precharter follow-on
   all have strictly better claims on the remaining fire budget — two of
   them close verification-integrity or ladder-completion obligations
   rather than opening a re-derivation front.
5. **L3 is a knowledge-level contestant at best** (§0) — under the
   iteration's own rules it must not displace discovery work; nothing in
   the iteration's discovery pipeline depends on it (no consumer: no
   candidate, dossier, or pilot cites the interface theorem or openai's
   MainStatement-unconditionality as a dependency).

**Re-adoption triggers (any ONE suffices for a future cycle; a trigger
fires → the orchestrator re-runs THIS section, not the whole unit):**

- **T1 (consumer appears):** a discovery lead needs the interface as a
  hypothesis supplier (openai `MainStatement` unconditional-in-hypothesis,
  or the AreaLaw2D↔PEPS bridge) — L3 becomes load-bearing.
- **T2 (drained + contested):** a cycle whose discovery queue is drained
  AND the knowledge-level slot is genuinely contested with budget left —
  L3 enters that cycle's D1-style contest as a named contestant, priced
  per §2–§5.
- **T3 (re-price mode):** a future orchestrator wants fresh evidence before
  ruling — a single Stage-0 fire (the site-inventory deliverable, §2),
  explicitly diagnostic, 1 fire, no Stage 1 claim attached.
- **T4 (substrate movement):** a mathlib pin bump lands
  sum-manipulation/attach API changes that plausibly shrink the
  re-derivation surface (low prior; would re-open §3's pricing downward).

Until a trigger fires: the D6 park stands; the certified set (L3b, eig_toGrid,
edgeBoundary, T1/T2/L3a) and the v16 park state (`aed63101`) are the
custody-of-record; article-72 stays at its post-referee bytes.

## §7 What H lands if this report is accepted (no fires, no article edits)

1. This file + its INDEX row (the 72-M1 family block).
2. Optional one-liners: RESUME-BRIEF-ITER6 §SESSION END (c)5 wave-2 item
   "L3 re-charter" → resolved ("charter drafted, verdict BANK —
   `pilots/72-M1/L3-recharter.md`"); ORCHESTRATION-ITER6 R4 row.
3. Nothing else: no ORCHESTRATION change of D6, no article-72 edit, no
   make_axcheck/TARGETS change (the landing sweep fires only on a future
   adopted execution).

— lane R4 (agent-08), 2026-11-21. No fires this unit; no files outside this
worktree touched; article-41H3 not re-opened.
