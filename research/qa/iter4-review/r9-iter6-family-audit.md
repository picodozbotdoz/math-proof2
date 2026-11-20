# R9 — Iteration-6 instrument-family consistency audit (the opening instruments as a SET)

Lane R9 (worktree agent-09), 2026-11-20, the final hardening pass. Scope: the five
opening instruments read as a set, read-only pass + assertion-guarded in-place fixes
to R9's own files only. Read basis: worktree agent-09 (the four R9 files) + the
external targets worktree-read; main @ `884099a` (batch HH landed the FB-2 precharter
+ charter v4 mid-audit — the worktree bytes ARE the landed bytes for those two at
audit start).

## The set (pre-fix → post-fix shas; all sha256(16), worktree-read)

| instrument | pre-audit | post-fix | fixes applied |
|---|---|---|---|
| census `novelty/iter6-seed-census.md` | `a69ee201f8eddcc8` | **`e8efb8876b0cc4c8`** | 4 (F3, F4×2, F5×2 — see rows) |
| charter `qa/iter4-review/r9-iter6-charter-draft.md` | `10ff9b96b9cd7c17` (v4, landed batch HH) | **`d16ad6e517ead976`** (v5) | 8 (F1, F4×2, F6×3, F7, F8) |
| quota `qa/iter4-review/r9-quota-disposition-draft.md` | `ddec408990bca1de` | **`6f90b2a283def10a`** | 2 (F1, F2) |
| FB-2 `candidates/fb2-pntap-precharter.md` | `3760595f4bfd0755` (landed batch HH) | **`4cf78ce19992353f`** | 1 (F8) |
| battery `novelty/round7-h3-battery.md` (+§M-PRE) | `5f0b57cc99556d4d` | **`5f0b57cc99556d4d`** (UNCHANGED) | 0 — all its cites were current |

External targets verified current at audit time (worktree-read):
H3-precharter `60278bd4b6e824bf` (agent-08); R2's re-based stop-note
`db872dc5fe076358` (agent-03; H landing pending); R1's r3-verification-tables
**`fb86e3e29743a527`** (agent-02 — MOVED from `4e705f510a8c01f9` by batch GG's
re-base; the "72-M1 L3 — v16 CLOSING STATE" correction block intact at :2539 —
verified before re-citing); R3's 12-core note `5f8facd4544f92a9` (agent-07; landed
batch FF); R2's dry-run `4e5b4854` (landed batch T, static).

## (1) Cross-sha coherence — 4 findings, all FIXED

| # | finding | fix |
|---|---|---|
| F1 | R1's tables moved `4e705f51` → `fb86e3e2` (batch GG) — cited at 3 spots (census correction block; charter slot 5; charter DECISION-4) | re-cited `fb86e3e29743a527` + the delta note (re-base added §11.CENSUS + the H3 fold row; block intact :2539) — applied ×3 |
| F2 | quota cited the census at v1's landed `e202244b` (superseded) | re-cited the census's post-fix sha + the "rows #6/#7 unchanged by the correction" note |
| F3 | census's stop-note state read "re-basis IN PROGRESS" — it has LANDED worktree-side (`db872dc5`) | updated ×2 (correction block + row 5 + §2(b)) with the landed sha + the do-not-consume-`d562b2b4` rider kept |
| F4 | the H3 precharter chain advanced to `60278bd4` (426 lines, the spin redesign) — census (2 spots) + charter (3 spots) still read `b9e911cd`/`7b76e8ce` | all 5 spots re-cited `60278bd4b6e824bf` with the full chain `726e3d69`→`b9e911cd`→`7b76e8ce`→`60278bd4` delta-noted |

Also upgraded to explicit current-sha citations (coherence convention): the charter's
census cite (header + §7 → the post-fix census sha) and its battery cite
(`87659f58` landed-base → `5f0b57cc` current + the §M-PRE delta note); the FB-2
§7 census cite. Post-fix grep sweep: zero stale shas outside legitimate delta-notes
(the quota's "(v1 landed `e202244b`)" lineage and the charter's chain arrows).

## (2) Parameterization completeness — PASS, no fix

Charter slots 1/3/4 carry [IF-GREEN]/[IF-NOT] branches; slot 5 is RESOLVED (not
pending — the re-base landed); the 12-core bench-annex carries [IF-GO]/[IF-NOT-GO];
the FB-2 §7 informs-never-spends ([DECISION-Q] is the orchestrator's); the census's
"expected 17/17 / 11/11" cells are owner-recorded EXPECTATIONS inside parameterized
branches, not hard-coded verdicts; the quota's "no member of the re-fired set can
produce an article" cell cites R2's dry-run (claim-of-record, cited). No
verdict-dependent cell hard-codes a pending outcome.

## (3) Discovery-bar arithmetic — 1 finding, FIXED

| # | finding | fix |
|---|---|---|
| F5 | the quota draft's §2 read "[QUOTA-OUTCOME] = **third** consecutive unspent cycle" while listing two instances (iter-4, iter-5) — the two-strike FINAL rule was MINTED at Iteration 4 (`RESEARCH.md` §Iteration-5 opening recap), so iter-5's close is the **second** consecutive unspent cycle under the rule | corrected to "second consecutive unspent cycle under the two-strike FINAL rule (minted at Iteration 4: iter-4 unspent on 78's NEGATIVE-kind quota-free billing; iter-5 unspent on two quota-free shipments)… an Iteration-6 unspent cycle would be the THIRD and is itself a signal" |

Consistency verified across the set: 8/16 = exactly 50% (≥half passes at equality) —
quota §1.4 ✓, charter §0 ✓, census §0 ✓; N=1 UNSPENT + spend-only-if-executed — all
four ✓; the census §3's "third unspent cycle would itself be a signal" was ALREADY
the correct future-conditional (iter-6 as third) — stands, now consistent with the
fixed quota wording.

## (4) Seed carriers vs actual lane assignments — 1 finding, FIXED

Verified: census #1 → R6/agent-06 ✓; #2 → R4/agent-08 ✓; #3 → R8/agent-05 ✓; #4 →
R5/agent-04 ✓; #5 → R2/agent-03 ✓ (one-writer rule marked, R2's funnel); #6/#7 →
quota slot, any drained lane ✓; charter slots 1–5 match the same carriers ✓.

| # | finding | fix |
|---|---|---|
| F6 | the charter's 12-core bench-annex named R3's input but NO carrier lane | added "Carrier: R3 (agent-07), the P0's owner (A6 lineage)" |

## (5) Superseded-sha discipline — PASS after F1–F4

Every superseded sha surviving in the set is inside an explicit delta-note (the
quota's v1 lineage; the charter's precharter chain arrows; the census's
contradicted-claims citations `bc26418c`/`d562b2b4`, which are HISTORICAL references
to the retracted versions — correct usage). The battery's §M-PRE precharter cite was
already current (`60278bd4` + chain). Post-fix sweep clean.

## Residual notes (no action)

- The charter's battery/census cites point at the POST-fix worktree shas; if H lands
  them in separate batches, the landed-commit lineage (batch V `87659f58` base +
  e202244b census v1) remains the historical trail — the audit's delta notes carry it.
- The quota draft's §1 cell cites R2's dry-run at its landed `4e5b4854` (static
  landed bytes — no staleness possible).
- The M-GO ride-in (R4's candidates + re-price updating the charter's H3 slot) is
  EXPECTED to move the charter again — this audit's H3-slot cites (precharter chain +
  battery sha) are the cells to re-check on that landing.

— audit by lane R9 (worktree agent-09), 2026-11-20. Read-only pass + 12 guarded fixes
(F1×3, F2, F3×3, F4×5, F5, F6 — counted per application site) to R9's own four
files; the battery untouched; no commits (H re-lands the refreshed set). STANDBY for
the M-GO ride-in.
