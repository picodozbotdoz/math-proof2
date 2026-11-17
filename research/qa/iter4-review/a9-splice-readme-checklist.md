# A9 — splice-time box-11 README same-commit checklist (final prep; 2026-11-17)

Lane A9. The single checklist of every edit that must ride the CLOSE COMMIT (the
template's §9 box 11 — README row in the same commit as the article — plus the
PENDING-CLOSE sweep fields the articles themselves name). Everything here is H-owned;
A9's worktree state is the source where named. The G5 dry-run
(`qa/iter4-review/a9-g5-dryrun.md`) is the companion record: all in-file rules already
PASS 14/14; the two drift rows below are its findings.

## A. README edits (articles/README.md) — same commit as the article files

| # | item | exact row/cell | source of truth | owner |
|---|---|---|---|---|
| 1 | **Row 10 drift fix** (D1 landed) | §C row 10, status cell: replace "assembly tranche D1–D6 carried to Iteration 4" with the D1-landed wording, e.g. "M1/L1/L2 + tranche D1 PROVED-UNCONDITIONAL as layers (D1 = the counter padding machine, plumbing billing, landed 2026-11-17); **headline OPEN**; D2–D6 carried" | article 10's header status table (the D1 row, `d1-run1.log:25–30`); the G5 dry-run's sweep table | H |
| 2 | **Row 75 v2 wording** (flagged since the 75 v2 self-audit) | §A row 75, status cell: move from the v1 one-tier wording to the two-tier wording — Thms A–B PROVED-CONDITIONAL (tier 1; component proportions the open core); 5/6 strip-distinct arm PROVED-CONDITIONAL (tier 2; hCZStripFam conjecture-grade); Dirichlet-column discharge AUDITED at the zeta23 donor pin (thmE_A₀ PROVED-UNCONDITIONAL — at donor pin); N2 (unconditional at ℚ) carried | article 75's header status table (8 rows) | H |
| 3 | **Row 78 landed** | §A: land the drafted row (in A9's worktree README, marked "(row drafted 2026-11-17, lane A9; H lands with the counts re-ratified)") — drop the draft marker | article 78's header status table (3 rows, binder inventory empty) | H |
| 4 | **Header counts line finalized** | `README.md:3` — "5 discovery-grade · 7 technical records & formalizations · 4 notes/certificates…" → "**6 discovery-grade** (01, 30, 32, 42, 75, 78 — 75 conditional, 78 NEGATIVE-kind per the orchestrator ruling) · 7 technical records & formalizations · notes/certificates unchanged (+ 3 relocated)"; re-date the ratification line to the close commit | `qa/iter4-review/a9-corpus-compliance.md` close-out roll-up (flow/stock lines) | H |
| 5 | *Conditional:* reading-order/count prose | if the close summary's prose names the discovery ordering (the "ordering above is by how new the mathematics is" sentence, where present in H's tree), add 78 to it; no other prose line changes | the close summary as typeset by H | H |

## B. Sweep sha stamps (the articles' PENDING-CLOSE fields — same close commit)

| # | item | exact cell | source of truth | owner |
|---|---|---|---|---|
| 6 | **Article 75 sha stamps + LoC re-measure** | §6 preamble (`75-…md:383`): replace "sha256 at the final sweep … PENDING-CLOSE — owner H; `Pa.lean`/`P0.lean` likewise" with the sweep-stamped shas of `Pa.lean`, `Pb.lean` (expected = the closure bytes `da05c60ceb78755b` unless the sweep re-stages), `P0.lean`, and the final LoC re-measure (current: 2,302 LoC header / 2,303 by `wc`, final-newline convention). The self-audit tail (`:551` box 11, `:554` PENDING-CLOSE line) flips to satisfied in the same edit | the final sweep's Step-B staging + `pilots/75/logs/axcheck-full-run1.log` (the closure record) | H |
| 7 | **Article 78 sha stamp** | A1 verification block (`78-…md:201`) + tail (`:312`): replace "the final sweep re-stamps — PENDING-CLOSE" with the sweep-stamped sha of `pilots/78/P0.lean` (run-4 bytes `d94d115e3d8d08d7` recorded in-file; the sweep sha supersedes if bytes moved). Box-11 row `:309` flips when item 3 lands | the final sweep's staging of P0.lean (companion: P0.lean's TARGETS registration if the sweep plan lacks it — sweep-side, owner H/A1) | H |

## C. Status-vocabulary flips gated on close-time verdicts — VERIFIED: none touch articles

Checked against the still-in-flight set (`qa/REPORT-INPUTS-ITER4.md` §1/§2 OPEN rows):
AL-3D-2, ZZV2-λ, 72-M1 L3b–d, 73-Q4 (gate memo GO, pilot pending), 22-T2a,
74-T3, 10-tranche D2+ — every one is an engineering/dossier/technical-record
deliverable with **no article status row** (72's link 4 + interface theorem are
explicitly not-article-claims; 32's crossing already landed and is folded; 10's D1
already folded). **One conditional**: 75-N2 is OPEN and *chartered as carried* — a
surprise landing before close would add tier-1 supersession rows to article 75 and
re-touch README row 75 (item 2 would then carry them); gated on the slot ledger, not
expected. No other close-time verdict can reach an article status row.

## Item count and cross-references

9 items total: 7 mandatory (A1–A4, B6–B7, and the C verification itself is a
clearance, not an edit) + 1 conditional prose line (A5) + 1 conditional landing watch
(C). All mandatory items are H-owned and ride ONE close commit with the article files
(box 11 + the close-out protocol's gate-run persistence rule). Companion records:
`a9-g5-dryrun.md` (the 14/14 dry-run + the drift findings), `a9-corpus-compliance.md`
(the close-out roll-up numbers), `a9-quota-casualties.md` (row 9's quota ruling).

— Lane A9, 2026-11-17. This is the last A9 artifact before close; no article files
changed in this pass. No commits (H commits). Close-support standby begins here.
