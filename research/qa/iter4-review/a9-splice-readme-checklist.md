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

---

# WAVE-3 ADDENDUM — PENDING-CLOSE pre-stage (A9, 2026-11-18; ready-to-apply blocks)

Written at wave-3 re-task against the CURRENT main tree (`2f90dcc`, verified clean for
`research/articles/` this session). Supersedes the A-section *framing* of items 1–3
below per D.0; items 4–7 and the C watch stand as written, now with copy-paste-exact
content. H applies everything in this addendum at the close commit (one commit, box-11
rule); A9 remains the writer of record for any article/README edit that D.2 or D.5
activates, delivered into the agent-10 worktree for H to pull.

## D.0 State correction — what the 2026-11-17 items already discharged (verified on main @ 2f90dcc)

- **Item 1 (row 10) — LANDED at `37a2637`, then found ONE-TRANCHE STALE by A2's close
  rehearsal (defect D5, 2026-11-18)**: the `37a2637` wording ("D2–D6 carried") predates
  the D2 FINAL + D3 landings (`9dc6684`, 2026-11-17). The close-time edit is now
  **D.1-bis** below (A2's staged D1–D3 wording, ratified by A9 against the records:
  `d2-run4.log` / `d3-run1.log` verified on main this session). Article-10's header
  table carries the D2/D3 rows as of the A9 worktree (2026-11-18 relay fold), so row
  and article agree again at the D1–D3 state. D1's article rows landed earlier
  (`2345a3a`/`53d4cc0` lineage), i.e. the row followed the article by a later commit
  the same day; that ordering is the drift the dry-run flagged and its closure is
  recorded here, honestly.
- **Item 2 (row 75 two-tier wording) — LANDED at `37a2637`** (one commit after the
  `a6c7b13` article v2 landing; same honest note). The cell is byte-verified against
  the article's own header table this session. What REMAINS for row 75 at close is
  only D.1 (counts line), D.2 (N2-conditional, branch-gated), and nothing else.
- **Item 3 (row 78) — HALF-LANDED**: the §A row landed with the article at `b98f8bc`
  (same-commit, box-11 satisfied at landing; counts re-ratified by H vs disk, as the
  cell records). The trailing draft marker still stands in the cell; D.3 is the
  remaining exact edit.

## D.1 Header counts line (item 4) — exact splice, `research/articles/README.md:3–5`

Current exact text (3 lines, verified):

```
Honest counts — **FINAL, orchestrator-ratified 2026-11-16**: **5 discovery-grade** ·
**7 technical records & formalizations** · **4 notes/certificates (1 pending a branch
decision)** + 3 relocated notes — down from 17 article files for both cycles.
```

Replace with (close date = the close commit's date; `<close-date>` is H's fill):

```
Honest counts — **FINAL, orchestrator-ratified <close-date>**: **6 discovery-grade**
(01, 30, 32, 42, 75, 78 — 75 conditional, 78 NEGATIVE-kind per the orchestrator
ruling) · **7 technical records & formalizations** · **4 notes/certificates (1 pending
a branch decision)** + 3 relocated notes — down from 17 article files for both cycles.
```

**D6 ruling folded (orchestrator, relayed 2026-11-18):** the "(1 pending a branch
decision)" qualifier resolves with A5's landing — **branch-landed** (M2/M3 land the N2
conditions) ⇒ DROP the qualifier and adjust counts per D.2's branch-landed wording
(the replacement line then reads `**4 notes/certificates**`; re-count from the
`a9-corpus-compliance.md` roll-up if the landing moves any row between sections);
**branch-carried** ⇒ KEEP the qualifier verbatim (A2's rehearsal copy kept it — correct
pre-landing behavior). No third branch.

## D.1-bis Row 10 D1–D3 wording (supersedes the landed `37a2637` cell per A2's
rehearsal defect D5) — `README.md:45`, §C row 10

Current exact status cell (verified at `2f90dcc`):

```
M1/L1/L2 + tranche D1 PROVED-UNCONDITIONAL as layers (D1 plumbing, landed 2026-11-17); **headline OPEN**; D2–D6 carried
```

Replace with (A2's staged rehearsal wording, `agent-03 …/rehearsal/apply_rehearsal.py:93`,
record-ratified by A9 — `d2-run4.log:110/:141` triad at closure run 2, sha `4ae0d643…`;
`d3-run1.log:44–45` triad first-run, sha `da398f21…`):

```
M1/L1/L2 + tranche D1–D3 PROVED-UNCONDITIONAL as layers (D1 = the counter padding machine, `d1-run1.log:25–30`; D2 FINAL via `padM'_isPolyT`, `d2-run4.log` sha `4ae0d643…`, ruling out the §10.20 budget-stop; D3 first-run GREEN, `d3-run1.log` — plumbing billing, landed 2026-11-17; **headline OPEN**; D4–D6 carried (D4 → Iteration 5 by orchestrator ruling))
```

Source of truth: `a9-corpus-compliance.md` close-out roll-up (stock line: 6 of 14
live; flow line: quota N=1 UNSPENT). No other token of the sentence changes.

## D.2 Row 75 N2-conditional — BOTH BRANCHES pre-written (pick-one on A5's landing report; 2026-11-18)

Current exact status-cell tail (`README.md:22`, verified at `2f90dcc`):

```
…binder swap cleared); ℚ-instantiation (N2) IN FLIGHT (P0 + P1-core GREEN) |
```

Article-75 anchor points (byte-verified at `2f90dcc`; the ONLY article sites that
track N2 state — abstract sentence, §3.3 piece-(i) paragraph, §7.2 item):

- Abstract (`75-…md:68–71`): `…named glue remains before\nζ_L itself is unconditional at ℚ.`
- §3.3 (`75-…md:261–270`): the "**What remains for an unconditional ζ_L ≥ 2/3 at ℚ
  (not proved here).** Two named pieces: (i) … absent from every surveyed corpus;
  (ii) …" paragraph.
- §7.2 (`75-…md:472–477`): "The unconditional-at-ℚ theorem is not proved here. … Until
  that glue lands, Theorem B over ℚ keeps its binders; …"

Slot convention: `[S1]`…`[S4]` are transcription slots filled VERBATIM from A5's
landing report (its one-line verdict block) — picking a branch and copying the slots
is the entire close-time action; nothing is drafted.

### Branch CARRIED (M2/M3 unlanded at close — the expected branch per the slot ledger)

1. README cell — replace the tail with:

   ```
   …binder swap cleared); ℚ-instantiation (N2) carried to Iteration 5 (P0 15/15 +
   P1-core GREEN-triad; [S1: A5's final P1 state sentence, verbatim from its closeout
   report, or "packaging closure not run"] — M2/M3 unlanded at close) |
   ```

2. Article-75: **NO edit** (all three anchors stay true: the glue is named, not
   claimed; "absent from every surveyed corpus" is an external-corpus claim and the
   in-flight N2 build does not falsify it; the pre-shipping 3×NOVEL sweep's two
   mandatory nearest-miss adds live in the N2 dossier `candidates/75-N2-…md`, not in
   this article).
3. D.1 counts line: KEEP the "(1 pending a branch decision)" qualifier verbatim (D6).

### Branch LANDED (A5's M2/M3 land the N2 conditions)

1. README cell — replace the tail with:

   ```
   …binder swap cleared); ℚ-instantiation (N2) P1 COMPLETE — the ℚ ray-class ↔
   Dirichlet dictionary kernel-verified in-repo ([S2: dictionary/L-series theorem
   names], [S3: n/n triad + run-log cites from the closure run]); remaining glue to an
   unconditional ζ_L at ℚ: the hEχ port + the V2 ζ-column landing |
   ```

   (If A5's report also lands P2/P3 — full unconditional-at-ℚ — use instead:
   `…ℚ-instantiation (N2) LANDED: ζ_L ≥ 2/3 unconditional at ℚ ([S2], [S3], landing
   theorem [S4: name + log cite]) |`, and see edit 5.)

2. Article-75 §3.3, piece (i) — replace the paragraph's opening through "absent from
   every surveyed corpus;" with:

   ```
   **What remains for an unconditional ζ_L ≥ 2/3 at ℚ (not proved here).** Two named
   pieces: (i) the ℚ ray-class ↔ Dirichlet-character dictionary with L-series
   identification (including imprimitivity) — kernel-verified in-repo this cycle
   (75-N2 P1 complete: [S2], evidence [S3]; external corpora remain without it);
   ```

   (the "(ii) hAbFac …" sentence and the paragraph's closing sentences stand).

3. Article-75 §7.2 — replace "the ℚ ray-class ↔
   Dirichlet dictionary with L-series identification and imprimitivity handling
   (absent from every surveyed corpus), and the factorization binder for K = ℚ." with:

   ```
   the ℚ ray-class ↔
   Dirichlet dictionary with L-series identification and imprimitivity handling
   (kernel-verified in-repo this cycle: 75-N2 P1, [S2]/[S3]), and the factorization
   binder for K = ℚ plus the port/landing glue.
   ```

4. Article-75 abstract — replace "named glue remains before
   ζ_L itself is unconditional at ℚ." with:

   ```
   the dictionary glue is now kernel-verified (75-N2), and the remaining named glue is
   the factorization binder and the port to an unconditional ζ_L at ℚ.
   ```

5. **Conditional (P2/P3 also landed — full unconditional):** article-75's header
   status table gains one row (insert after the Dirichlet-column row, same shape):

   ```
   | ℚ-instantiation landing [S4: theorem name] (`[S2 file:line]`) | PROVED-UNCONDITIONAL | [S4: structural binders per the landing statement, verbatim] | [S3: triad print log:line] |
   ```

   and the README §A row-75 kind cell gains "tier-1 ℚ landing 2026-11-<dd>" — a
   one-clause append, nothing else. D.1's qualifier drops (D6).

6. Branch-landed rides ONE commit with D.3/D.4 (box 11); A9 stages the article-75
   edits in the agent-10 worktree on A5's report and H pulls — same mechanism as this
   addendum's other blocks.

**Slot registry (from A5's landing report):** [S1] final P1-state sentence; [S2]
dictionary/L-series theorem names (+file:line if the landing names them); [S3] the
closure run's triad count + log-path:line; [S4] landing-theorem name + log cite
(full-landing case only).

## D.3 Row 78 draft-marker drop (completes item 3) — `README.md:23`

Current exact status-cell tail (verified):

```
…the model-level predecessor is the openai-math corpus's, the procedure-level
promotion is ours) — row drafted 2026-11-17 lane A9, landed by H |
```

Exact edit: delete ` — row drafted 2026-11-17 lane A9, landed by H` so the cell ends
at `…promotion is ours)`. Nothing else in the row changes (counts already re-ratified).

## D.4 Sweep-sha stamps (items 6–7) — which shas, from which logs, into which cells

Rule of record: `feasibility/probe/FINAL-SWEEP-PLAN-ITER4.md` §2 rule 4 (every
Step-B stage's log header carries the source sha256; sweep-time staging is the bytes
of record) + §7b card 3 (quote sweep-time counts over standing-log counts only when
bytes moved). **Disambiguation (resolved this session): article 75's `P0.lean` =
`research/pilots/zeta23e/P0.lean`** (the hEχ binder-port probe file cited at
`75-…md:7–8/:244/:452–453/:524`), NOT a pilots/75 file — no `pilots/75/P0.lean`
exists; the pilots/75 P-class files are `Pa.lean`/`Pb.lean` (+ A5's `N2-P0.lean`/
`N2-P1.lean`, which belong to the in-flight N2 unit, not to this stamp set).

Measured at main @ `2f90dcc` (2026-11-18, this pass; `sha256sum | cut -c1-16`, `wc -l`):

| file | sha256(16) | LoC | standing stamp | sweep action |
|---|---|---|---|---|
| `research/pilots/75/Pa.lean` | `d61eb0485a6ff672` | 1,557 | C2-swept; `AxPilot75_Pa` TARGETS row present (`make_axcheck.py:58`) | drift-check re-stage; stamp the stage-header sha |
| `research/pilots/75/Pb.lean` | `da05c60ceb78755b` | 2,303 | `pilots/75/logs/axcheck-full-run1.log` header (line 2: "2,303 lines; sha256(16) da05c60ceb78755b") — UNCHANGED vs disk | drift-check only; if sha unchanged, cite the standing closure log (89/89 triad @ `da05c60ceb78755b`); do NOT re-run the custody stage |
| `research/pilots/zeta23e/P0.lean` | `986f1ce879786f33` | 59 | `pilots/zeta23e/logs/zeta23e-p0-run1.log` header ("sha256(16): P0 986f1ce879786f33") — UNCHANGED vs disk | probe-convention file: NEVER a Step-B stage (§7a zzv2-P0 ruling class; §7c names Zeta23e Step-A scope); sha of record = the log/disk stamp |
| `research/pilots/78/P0.lean` | `d94d115e3d8d08d7` | 444 | in-file run-4 bytes (`78-…md:199–201`, `:312–313`) — UNCHANGED vs disk | NO `AxPilot78_P0` row in `make_axcheck.py` TARGETS today (§7a: "deferred with the Stage-B family"); if the sweep registers the row / `axcheck_iter4.py gen` custody stage (census 3 public + 23 private), stamp the stage-header sha; else the disk sha stands |

**Bytes-unchanged branch — the three exact article-side edits, pre-written verbatim:**

1. `75-…md:382–383` — current exact text:

   ```
   pointers. sha256 at the final sweep [the close-out re-verification pass that
   hash-stamps the staged files]: PENDING-CLOSE — owner H; `Pa.lean`/`P0.lean` likewise.
   ```

   Replace with:

   ```
   pointers. sha256-at-sweep (final sweep, <close-date>): `Pa.lean` `d61eb0485a6ff672`
   (1,557 LoC; `AxPilot75_Pa` drift-check re-stage); `Pb.lean` `da05c60ceb78755b`
   (2,303 LoC; = the closure bytes above — standing log `axcheck-full-run1.log` cited,
   not re-run); `P0.lean` (zeta23e) `986f1ce879786f33` (59 LoC; probe-convention file,
   log-header stamp, never a Step-B stage).
   ```

2. `75-…md:551` (box-11 row) — replace

   ```
   | 11 | README row updated in the same commit | **PENDING — owner H**: the `articles/README.md` row 75 must move to the v2 wording (two tiers; Dirichlet-column discharge audited; N2 still carried) in the splice commit |
   ```

   with

   ```
   | 11 | README row updated in the same commit | SATISFIED — row 75 moved to the v2 two-tier wording at `37a2637` (2026-11-17, H; one commit after the `a6c7b13` article landing, the drift the G5 dry-run flagged, closed same-day); the close commit adds the counts line and the N2-conditional refresh if branch-landed fires |
   ```

   and `75-…md:554–556` (PENDING-CLOSE tail, first sentence) — current exact text:

   ```
   PENDING-CLOSE fields (owner named per the task convention): sha256-at-sweep and final
   LoC re-measure of `Pa.lean`/`Pb.lean`/`P0.lean` (§6 preamble) — **owner H** at the
   final sweep; any G-class evidence
   ```

   Replace those three lines' opening sentence with:

   ```
   Closed at the final sweep (<close-date>): sha256-at-sweep and final LoC re-measure
   of `Pa.lean`/`Pb.lean`/`P0.lean` STAMPED (§6 preamble); any G-class evidence
   ```

   (line 4 of the tail — `… (none needed by this draft's claims) — **owner A1** for
   ledger rows.` — and the rubric-floor sentence stay unchanged).

3. `78-…md:199–201` — replace

   ```
   - file: `research/pilots/78/P0.lean:365–380` (444 lines; sha256(16) of the run-4
     bytes `d94d115e3d8d08d7`, measured 2026-11-17; the final sweep re-stamps —
     PENDING-CLOSE, owner H)
   ```

   with

   ```
   - file: `research/pilots/78/P0.lean:365–380` (444 lines; sha256(16)
     `d94d115e3d8d08d7` — run-4 bytes, sweep-stamped unchanged at the final sweep,
     <close-date>)
   ```

   `78-…md:309` (box-11 row) — replace

   ```
   | 11 | README row updated in the same commit | **PENDING — owner H**: the §A row is drafted in `articles/README.md` this session; counts re-ratify at splice |
   ```

   with

   ```
   | 11 | README row updated in the same commit | SATISFIED — the §A row landed with the article at `b98f8bc` (same commit, box-11 satisfied at landing; counts re-ratified by H vs disk); the draft marker drops in the close commit |
   ```

   `78-…md:312–313` — replace

   ```
   PENDING-CLOSE: sha256-at-sweep of `P0.lean` (run-4 bytes `d94d115e3d8d08d7` recorded
   above) — owner H at the final sweep.
   ```

   with

   ```
   sha256-at-sweep of `P0.lean`: `d94d115e3d8d08d7` (run-4 bytes; unchanged at the
   final sweep, <close-date>).
   ```

**Bytes-moved branch (any of the four shas differs at sweep time):** the sweep-time
stage-header sha supersedes every value above; quote it in the same cell shapes, and
for `Pb.lean` additionally re-run the full-coverage custody stage (`axcheck_run75.py`
class) per §7a's 75-Pb row before stamping.

## D.5 In-flight exposure map (wave-3 units vs the article corpus — checked 2026-11-18)

- **No article-74 and no article-77 exist** (corpus = 14 live articles; README §C:
  "dossier-only items 02, 03, 12, 31, 40, 41, 51, 60, 74 remain proposals without
  articles"; 77's Truffet work lives in dossiers/pilots). A8's 74-FINDS and A7's
  77-corrections therefore CANNOT touch an article file directly.
- **A7 (agent-08)** is the one live edge: dossier-77 fold + T1-completion + T2.
  Article-78 cites dossier/scoping claims ("dossier/scoping cites traced to the
  input package", `78-…md:308`); if A7's corrections move any Truffet scoping claim
  the article cites, article-78 needs an editorial sync — A9 executes it on A7's
  landing report (worktree edit, H pulls; box-11 same-commit via D.3's commit).
- **A5 (agent-06)**: N2 landing activates D.2 branch-landed (README row 75 + article
  75 tier rows; A9 is the writer, files staged in agent-10).
- **A3/A4/A8 residue**: no article exposure (FF-EZ2/AL-P2/74-P1 are engineering
  deliverables; the checklist C-section clearance of 2026-11-17 stands).

— Lane A9 (wave 3), 2026-11-18. Files changed this pass: this addendum (checklist
only) + the agent-10 worktree `articles/README.md` synced to main `2f90dcc` content
(rows 10/75/78 landed state; was stale at the 53c1548 base). Corpus verified
14/14 unchanged since the G5 dry-run (`git diff 37a2637 2f90dcc -- research/articles/`
empty; mechanical re-check re-measured this session). No commits (H commits).
Close-support standby continues.

*Second pass, 2026-11-18 (claims-audit re-task + A2/orchestrator relay):* D.0's
row-10 bullet corrected for the rehearsal D5 one-tranche staleness; D.1 gained the
D6 branch rule; D.1-bis added (A2's staged D1–D3 row-10 wording, record-ratified);
D.2 completed both-branch (slot-registry form). Worktree article edits this pass:
`articles/10-…md` (D2/D3 relay fold), `articles/30-…md` (:69), `articles/42-…md`
(:820/:837), `articles/78-…md` (:118 ×3) — see `a9-claims-audit-iter4.md` for the
per-defect evidence. The 75/78 close-time cells of D.4 were NOT double-applied
(PENDING-CLOSE stands). No commits (H commits).
