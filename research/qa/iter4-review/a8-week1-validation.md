# A8 — WEEK-1 GREEN VALIDATION (row 8) + runner configs + row-5 infra tail

Lane A8 (R8-successor), 2026-11-17. Scope per week1-agenda rows 8 + 5: R8 validation
pass over the recorded Iteration-4 GREENs (r3-verification-tables.md §10.1–10.6 + the
72-M1 L3a GREEN recorded at RESUME-BRIEF-ITER4.md:168), runner-config validation for the
two in-flight pilots (zzv2-lam, zeta23E — CONFIGS ONLY, no in-flight results touched),
and the row-5 infra tail (LP-P0 cache-ping disposition + g11 build-class sizing method).
Method: evidence-based, reading + local script checks only (rg / diff / sha256sum);
**no Modal runs were launched**. Worktree @ 53c1548 (session-end snapshot); all cites
below read in this worktree.

Checks per record: (a) log persisted with provenance header; (b) recorded theorem list
matches the .lean file's top-level theorems (rg-level); (c) recorded axiom prints appear
in the log text, triad-only (`[propext, Classical.choice, Quot.sound]`, subsets allowed),
0 sorryAx; (d) runner spec compliance (SPEC cpu/mem + `@telemetered` +
`LEAN_NUM_THREADS=2` in the app file); (e) telemetry lines present (`[tele] start` +
`[tele] SUMMARY`; interval samples where wall > interval).

## 1. Validation table

| Record (GREEN) | (a) custody+header | (b) decls match file | (c) axiom prints in log | (d) runner spec | (e) telemetry | Verdict |
|---|---|---|---|---|---|---|
| **75-Pb** run-11 (`§10.4`) | PASS — `pilots/75/logs/pb-run11-final.log:1–7` (date, file+LoC, command, verdict, run URL :8–9) | PASS — Pb-1/2/3/3-D at `Pb.lean:2144/:2191/:2229/:2255`; E1 `:1652+`(def)+`:1669`, E2b/E2/E3 `:1631/:1730/:1763`, E4 `:1910`, E5 `:1706/:2006`, E6-core `:2064`; helpers `:1678/:1797/:1873`; 89 theorems on disk (82 pub + 7 priv incl. 2 `@[simp]`) = census 89 (79+10 at fold, pre-exposure) | PARTIAL at run-11 — 32/89 direct prints (`pb-run11-final.log:21–53`; table cites :45/:49/:50–53 all verified, all triad, wrapped joins complete :76–84); 57 decls no direct print — **CLOSED by run-12** (below) | PASS — `pilots/75/run_pilot.py:21–22,53–54` (SPEC via `modal_telemetry.py:30` = cpu 2.0/mem 4096; CAP threads=2) | PASS — `pb-run11-final.log:15` (start, spec stated) + `:88` (SUMMARY wall=51s OVER=0; samples=0 expected, wall < 60 s interval) | **PASS** (with run-12 closure + F3 note) |
| **75-Pb** run-12 auditfix | PASS — `pilots/75/logs/pb-run12-auditfix.log:1–6` (trigger, fix, LoC-drift note; run URL :7–8) | PASS — the 3 exposed helpers now public at `Pb.lean:1678/:1797/:1873`; P-b audit tail `Pb.lean:2281–2302` prints 18 P-b-layer decls; heritage tail `Pb.lean:1558–1572` (14) + in-region prints (`:1211–1212`) = 17 heritage | PASS — `pb-run12-auditfix.log:38–40` (le_sum_mem / offDiag_cons_ge / bonferroni_union_le, triad) + full P-b block :21–55, repeats :63–86; 0 sorryAx; "complete direct-print audit over the whole P-b layer" is now literally supported for the P-b layer | PASS (same runner) | PASS — `:14` + `:90` (wall=25s OVER=0) | **PASS** — the §10.4 coverage finding is discharged |
| **LP-P0** (`§10.1` P0 block) | PASS — `pilots/lp/logs/lp-p0-run1.log:1–6` (produced-by/substrate/command; verdict line; **ping verdict in header :1**, see §4) | PASS — 4 decls `P0.lean:37/:48/:88/:119`; exactly 3 stubs `:44/:55/:97`; run-4 warnings at decl lines :37/:48/:88 (`lp-p0-run4.log` per §10.1; run-1 `:29` shows the port-delta discovery) | PASS (probe class) — 3 `declaration uses sorry` warnings only, never a result; no axiom claims made (no status rows, correct per §10 conventions) | PASS — `pilots/lp/run_pilot.py:39–40,71–72`; `run_pilot.sh:15–16` doz default | PASS — `lp-p0-run1.log:14` (+ SUMMARY in later runs; run-1 FAIL-class body kept verbatim) | **PASS** |
| **LP-P1** L1 (`§10.1`) | PASS — `pilots/lp/logs/lp-l1-run2.log:1–6` (verdict + guards in header) | PASS — `L1.lean:41` `lp_weak_duality`, `:73` `lp_weak_duality_symm` (file's only 2 theorems); in-file tail `L1.lean:89–90` | PASS — `lp-l1-run2.log:21–22` (repeat :24–25) — triad, exactly as §10.1 cites (the §10.2 citation correction was about the L2 log, verified separately) | PASS (LP runner) | PASS — `lp-l1-run2.log:14` + `:55` (wall=59s, samples=0 < interval, OVER=0) | **PASS** |
| **LP-P2** L2 (`§10.2`) | PASS — `pilots/lp/logs/lp-l2-run6.log:1–14` — **sha256(16) stamps for all three files at :7**, verified against disk: P0 `d14aabda5d3a69f0` ✓, L1 `0d200325f3f105cb` ✓, L2 `282c9c05711dc54c` ✓; +1 authorization block :8–11 | PASS — `L2.lean:79` `bw2_ceiling_of_dual`, `:59` private `sum_uGG` (file's only 2 decls); tail `L2.lean:126–127` | PASS — `lp-l2-run6.log:38–39` (repeats :62–63) — triad incl. the `_private.L2.0.sum_uGG` name shape; §10.2's citation correction (:38–39, not :24–25) verified EXACT; 0 sorryAx; L1 regression re-verified :27–33 | PASS (LP runner; dependency-order olean emission at `run_pilot.py:101–107`) | PASS — `:22` + interval sample `:66` (cpu=0.86 mem=3982MB anon=0) + SUMMARY `:95` (wall=67s samples=1 OVER=0; mem 3982 ≤ 4096 spec) | **PASS** |
| **AL-P0** (run-2 + run-3 amendment; `§10.3` P0 block, `§10.6` amendment) | PASS — `pilots/al3d/logs/alp0-run2.log` (header + verdict) and `alp0-run3.log:1–6` (amendment provenance: find #3, command) + appended re-run block :27–33 | **PARTIAL** — stub-count match (3) holds everywhere, but the LINE ENUMERATION drifts: logs show stubs at `P0.lean:73/:111/:116` (`alp0-run2.log:25–27`, `alp0-run3.log:16–18`) while `§10.3` records ":75,113,118" and `§10.6` says "was :75,113,118" — neither enumeration ever matches a persisted log; current disk has `:85/:123/:128` (matches §10.6's "now") but **no persisted log shows those lines** (post-run-3 edit, unstamped — finding F2) | PASS (probe class) — 3 sorry-warnings only; shape checks sorry-free (`P0.lean:471+`); groupStrength def at `P0.lean:451` with the §10.6 instantiation at `:461` | PASS — `pilots/al3d/run_pilot.py:39–40,71–72`; `run_pilot.sh:16–17` doz | PASS — `alp0-run3.log:9` + `:22` (wall=19s OVER=0) | **PARTIAL** (record defect F2; evidence itself sound) |
| **AL-P1** A1 (`§10.3`) | PASS — `pilots/al3d/logs/alp1-final.log:1–26` (verdict :3, 16-round descent ledger :7–20, statement-level record :21–23, command :24) | PASS — 22 theorems on disk (rg incl. `@[simp]`); all 20 §10.3 file:line cites verified (`A1.lean:63/:121/:124/:129/:134/:144/:166/:178/:188/:202/:234/:247/:268/:274/:282/:300/:309/:349/:363/:372/:380/:394`) | PARTIAL at alp1-final — 20/22 printed (`alp1-final.log:41–60`, all triad; `walk_induce_length` :51 = `[propext, Quot.sound]`, subset-of-triad, correctly noted); 2 dite helpers unprinted — **recorded as the §10.3 coverage finding and CLOSED by the lane**: `A1.lean:415–416` added, both triad in-log at `alp2-run7-m1green.log:50–51` | PASS (al3d runner) | PASS — `alp1-final.log:34` + `:95` (wall=24s OVER=0) | **PASS** (gap documented + closed in-record) |
| **AL-P2 m1** A2 (`§10.6`) | PASS — `pilots/al3d/logs/alp2-run7-m1green.log:1–28` (provenance incl. mechanism note :2–6, verdict :7–8, content :9–15, run history :16–22, command :27, URL :28) | PASS on decls — `A2.lean:50` `colCard_eq_card`, `:100` `colCard_le_h` (only 2 theorems); defs `:43/:47/:57/:75(noncomputable)/:93` — all §10.6 cites verify. **PARTIAL on the sha stamps — transposed (F1)**: §10.6 records A1 = `91b4fba741d05771…` / A2 = `3e88be59d8625fdc6…`, but disk has **A1 = `3e88be59d8625fdc`, A2 = `91b4fba741d05771`** (content attributions are correct — A1 is the 426-LoC/22-theorem file, A2 the 109-LoC/2-theorem file — so the two shas are swapped in the record) | PASS — `alp2-run7-m1green.log:117–118` (repeats :119/:128/:136) triad; A1 re-OK 22/22 in same run (:38–59) | PASS (al3d runner; multi-file sibling-import mechanism, IMAGE BLOCK UNTOUCHED per header :5–6) | PASS — `:30` + SUMMARY (wall/sample lines present, OVER=0) | **PASS** with record defect F1 |
| **72-M1 L3a** (`RESUME-BRIEF-ITER4.md:168`; §10 row still owed — F6) | PASS — `pilots/72-M1/logs/l3a-run6-GREEN.log:1` (timestamped header: runner, substrate, source sha `fe57d30b19d9` — **disk P72M1T3.lean sha matches exactly**, descent, verdict; URL :3) | PARTIAL — the four L3a headline theorems verified (`P72M1T3.lean:70 hermPart_isHermitian, :78 opNorm_hermPart_le, :91 supportedOn_hermPart, :128 hamiltonian_hermPart`; in-file tail :138–141), but the file has **9** top-level theorems; the 5 hermPart algebra helpers (`:40/:43/:51/:57/:60`) have **no direct print anywhere** (header's "ALL FOUR L3a theorems" is accurately scoped, but full coverage awaits Step-B / `axcheck_iter4`) | PARTIAL (same 5-decl coverage gap; elimination argument holds: T3 OK rc=0, 0 sorry-warnings, `l3a-run6-GREEN.log:58`; T1/T2 prints :16–20/:49–51 all triad) | PASS — `pilots/72-M1/pilot72m1_probe.py:22–23,54–55` (app `crossmath-probe` warm-image reuse :27); `run_pilot72m1.sh:13` doz | PASS — `:9` + interval sample `:47` + SUMMARY (wall=73s max_cpu=0.88 samples=1 OVER=0) | **PARTIAL** (coverage + F6 tables debt) |
| **hEχ / zeta23E** (`§10.5`) | PASS — `pilots/zeta23e/logs/zeta23e-p0-run1.log:1–25` (substrate incl. donor pin v4.33.0-rc2/51e6992e :4–8, sha256(16) `986f1ce879786f33` at :10 — **disk P0.lean matches**, verdict, gate-PASS block :15–18, OVER investigation :19–25) | PASS — single decl `hex_two_thirds_binder_port` at `P0.lean:54`, verbatim hEχ binder + True carrier (file :48–59); the 3 `sorry` strings in P0.lean are prose (:5/:16/:38); the 5 donor `#check`s + 5 `#print axioms` in-file (:15–20, :34–42) | PASS — donor prints at `zeta23e-p0-run1.log:190–194` (repeats :203–207), all five triad; §10.5's citation correction verified EXACT (header self-cite "lines 165-169" at :17 is indeed wrong); the log's single "sorryAx" string is header prose (:17); 0 actual sorryAx in closure | PASS — `pilots/zeta23e/run_zeta23e.py:49–50,145–146`; `run_zeta23e.sh:15–16` doz | PASS — `:34` start; 13 interval samples `:35–50`; SUMMARY wall=862s max_cpu=8.98 max_mem=1774MB samples=14 **OVER=13** with the guideline-3 investigation recorded in-header :19–25 (lake-build nproc trap; soft-limit burst class; `-j 2` fix noted; no escalation — correct handling per AGENTS §1/§3) | **PASS** |

**Summary: 4 PASS (75-Pb, LP slot-1, AL-P1, hEχ/zeta23E) / 3 PARTIAL (AL-P0, AL-P2-m1,
72-M1 L3a) / 0 FAIL.** Every PARTIAL is a record-hygiene defect (F1/F2) or a
Step-B-owed coverage/table debt (L3a), not a failed verification: all landed prints in
all ten logs are triad-only and every persisted log shows rc=0 with the sorry posture
claimed by its record.

## 2. 75-Pb deep check (top-billed milestone) + article-gate read

**5/6-arm four landings — all verified at log, file, and table level:** heritage
`zetaK_distinct_five_sixths_strip_landed` (`Pb.lean:1142`; printed
`pb-run11-final.log:23` / `pb-run12-auditfix.log:22`) and `…_of_negligible`
(`Pb.lean:1182`; :24 / :23); new `zetaL_distinct_five_sixths_strip_conditional`
(`Pb.lean:2229`; :52 / :54) and `…_of_negligible` (`Pb.lean:2255`; :53 / :55). All four
print exactly the triad. **Zero donor imports — verified:** `grep '^import' Pb.lean` =
one line, `import Mathlib` (`Pb.lean:51`); the G1-dead DZDF mirror is statement-quoted
only (`hAbFac` posture, header :35+, `AbelianRayCharacterFactorization.lean:62` cited,
never imported). **Heritage carry:** `Pb.lean:50–1557` ≡ `Pa.lean:35–1542` byte-identical
(diff shows only the rewritten header `2,34c2,49` and the relocated audit tail
`1543,1557d1557` → `Pb.lean:1558+`); §10.4's "(= Pa.lean)" is content-true, not
byte-true — precision note only. **Acceptance (Pb-design §5):** criteria 1–3 met
post-run-12 (criterion 2's "incl. privates" is what run-12 discharged by exposing the
three helpers); criterion 4 (dossier/ledger/commit fills) is downstream lane work, with
REPORT-INPUTS-ITER4 §3 already carrying the FINAL-GREEN line.

**Article-gate read (gate spec = verification-status table + nearest-miss cites +
limitations, r9-iteration-plan-draft.md:36):**
- *Verification-status table*: READY — §10.4 is complete with per-decl file:line and
  log:line evidence, PROVED-CONDITIONAL/UNCONDITIONAL labels, and the coverage finding
  recorded and then discharged (run-12). Residual record-only items: the table's axiom
  cites still point at run-11 lines while the operative complete audit is run-12 (the
  file's own dated correction note at `Pb.lean:2282–2284` covers this; fold at next
  touch per R3 convention), the post-run-12 disk sha is unstamped (F3), and the LoC
  drift chain 2,289→2,296→2,302 vs disk 2,303 is F5-class noted.
- *Nearest-miss cites*: PRESENT in the record chain — dossier
  `candidates/75-abelian-assembly-zetaL-proportions.md` carries the gating nearest miss
  (DLRT arXiv:1908.04876, :172), the zeta23/V2 corpus-comparison rows (:158–164,
  :208–213), and the binder-posture precision (:129–131); `Pb.lean` cites zeta23
  `Challenge.lean:131/163/191/205/212` statement shapes and the Knausgård 839 ≥ 5/6
  certificate slot (`five_sixths_le_839`, `Pb.lean:919`, consumed at :1160/:2251).
- *Limitations*: STATED — the open cores are named as open (`hAKd`/`hAFd` "the named
  OPEN CORE nobody has"; `hCZStripFam` binder BY DESIGN per 20-hCZ-NOTE's
  not-provable-today verdict; header :69–78), every headline row is honestly
  PROVED-CONDITIONAL, and the M1 design-erratum (monotonicity alone does not close the
  E4 cons-step) is recorded in both the log header (`pb-run11-final.log:6`) and the
  in-file P-b banner (`Pb.lean:1571–1581` region).
Verdict: **75-Pb is gate-ready as the cycle's discovery-grade lead** (matching
REPORT-INPUTS-ITER4 §3's posture); the F3 sha stamp should land at the next run or at
Step-B sweep, which stamps the bytes of record regardless.

## 3. Runner-config validation (zzv2-lam + zeta23E — configs only, pilots in flight)

Both runners checked against the R8 §5/§9 checklist (resources, telemetry,
LEAN_NUM_THREADS, layer-cache-compatible run_commands, provenance-header pattern):

| Item | `pilots/zzv2-lam/run_zzv2.py` | `pilots/zeta23e/run_zeta23e.py` |
|---|---|---|
| SPEC resources | PASS — `**SPEC` at :89 (SPEC = cpu 2.0/mem 4096, `modal_telemetry.py:30`) | PASS — `**SPEC` at :145 |
| Telemetry | PASS — `@telemetered` :90; module uploaded :86 | PASS — `@telemetered` :146; uploaded :142 |
| LEAN_NUM_THREADS | PASS — CAP secret :39, `secrets=CAP` :89 | PASS — CAP :50, :145 |
| Layer-cache compatibility | PASS — image block :48–65 **byte-identical to `pilots/42/run_m4b2.py`** (diff-verified this session) | PASS — image block :64–81 **byte-identical to `pilots/50/run_r1.py`** (diff-verified); donor pin v4.33.0-rc2 installed per-run :150–151 (g7 pattern) exactly as card 9 specifies |
| Provenance-header pattern | PASS — `run_zzv2.sh` (doz CLI :15–16, world-readable stage, logs-with-headers docstring) | PASS — `run_zeta23e.sh` (doz :15–16); the run-1 log's header block is the exemplar |
| §8 divergence d2 (sorry-strict) | **FIXED in-file** — probe exemption `run_zzv2.py:154–164` (P0*-prefixed files get "OK (probe, sorry allowed)"; comment cites the R8 d2 fix, 2026-11-16) | n/a (sorry-strict is correct here; the G11-style #check/#print-only P0 passes it — run 1 proved this) |

**Fix-list (record-only — do NOT edit while lanes are running; none blocking):**
1. **`-j 2` for lake build phases (both runners).** `run_zzv2.py:127` (`lake build
   ZetaZeros`) and `run_zeta23e.py:169` (`lake build Zeta23.ThmE.Final`) pass no `-j`;
   lake sizes job parallelism from `nproc=18`, producing the CPU-burst OVER noise
   already measured twice (zeta23e run 1: OVER=13, max_cpu 8.98; g11 run35: OVER=12,
   max_cpu 2.54). Soft-limit-burst class (AGENTS §1) — legal, but the zeta23e header's
   own recommendation ("future build-phase runs pass `-j 2`") should be applied at each
   runner's next touch.
2. **Cache-retry budget**: both implement 2 in-run attempts (`run_zzv2.py:108–109`,
   `run_zeta23e.py:159`) — within the §5b ≤4 protocol; `_seed_mathlib` fallback is not
   wired (abort path = defer per the card abort lines). Acceptable; note for the record.
3. **Cosmetic**: both runners' `_sys.path.insert` (:37 / :48) pins the absolute
   main-repo probe path for the local import — same harmless class as §5a gap 2
   (`add_local_python_source` makes the remote copy self-contained).

## 4. Row-5 infra tail

**LP-P0 cache-ping — verdict LANDED; no action taken (none needed).** Two on-record
locations: (i) the log header itself — `pilots/lp/logs/lp-p0-run1.log:1`: "PING ITSELF
GREEN (service healthy, warm layers, elaboration completed, telemetry line present, no
cache-fetch failure)"; (ii) the plan — `feasibility/iter4-donor-unblock-plan.md:409–411`
(§8 standing-rules block): "[PING VERDICT 2026-11-16, R8 per §9-D: GREEN — cards 8–9
RELEASED (ZZV2-P0 → R2, hEχ → R5); rider: the lp image cache-get layer was a warm hit,
so cards 8–9's own in-run update+cache steps (≤4-retry + seed fallback) are the
live-service test.]" The agenda's "imminent" flag is stale: the verdict predates the
week-1 review, and both gated cards have since executed (zeta23e run 1 GREEN; zzv2-lam
in flight). VERIFICATION-LEDGER.md carries no ping row — not required; the agenda's
disjunct ("research/feasibility/ or the ledger") is satisfied by the plan location.

**g11 donor-pin build-class sizing (row 5 input b — method; G11 itself already ran).**
G11/G12 executed as `run35-g11-fix.log` (build OK, both probes OK sorry-warnings=0;
wall 1713 s ≈ 28.6 min at SPEC; max_mem 1600 MB; OVER=12 = the lake-build burst class)
— the sizing question is moot for G11, but the method for FUTURE donor pins, recorded:
(1) *closure census (local, free)* — BFS the endpoint's import closure in the donor
tree (`feasibility/probe/oai_closure.py` for OAI-prefix trees; the
`donor_closure_tarball()` builder at `run_zeta23e.py:102–139` generalizes: file count +
LoC + prefix classes donor/mathlib/other); (2) *job estimate* — donor files + residual
unbuilt modules after the donor's own `lake exe cache get` (measured: zeta23e's
144-file pruned closure → 3,698 lake jobs; the cache-get covers the donor-pin mathlib,
so residual ≈ donor tree + gaps); (3) *rate calibration at SPEC* — zeta23e measured
≈4.3 jobs/s at 2cpu (3.7k jobs + probe in 862 s); G11-class whole-donor-tree build
≈ 29 min; §5b's V2-class anchor is 8,262 jobs ≈ 1–2 h at SPEC; (4) *class → recipe per
§5b thresholds* — < 1 h: plain SPEC function, 3-h timeout (both G11 and zeta23e landed
here); 1–2 h: same, `--detach` optional; > 2 h or preemptible: `g7_layers` chunk
campaign, fresh user approval if any chunk needs > 4 GB; (5) *pre-flag the build-phase
CPU burst* — either launch with `lake build -j 2` from the start or pre-record the
burst note (both existing OVER events are this one class). Memory is not the binding
constraint at this scale (1.6–1.8 GB peaks measured on both donor builds; the 5–6 GB
`mem` readings are the inherent mmapped-olen class, `anon` the signal).

## 5. Findings register (defects + debts found by this pass)

- **F1 (record defect, §10.6)**: A1/A2 sha256 attributions transposed vs disk
  (A1 disk `3e88be59d8625fdc` / A2 disk `91b4fba741d05771`; record says the reverse).
  Content attributions correct; fix = swap the two shas at next table touch.
- **F2 (record defect, §10.3+§10.6)**: AL-P0 stub-line enumeration — both persisted
  logs (`alp0-run2.log:25–27`, `alp0-run3.log:16–18`) say `:73/:111/:116`; the recorded
  "was :75,113,118" matches no log; the "now :85,123,128" matches disk but no log
  stamps those lines (post-run-3 edit, unstamped). Fix = correct the "was" line at next
  touch + stamp P0's sha at next AL run (§10.6's `db5e1cc8307a1a7e` DOES match current
  disk, verified — the disk/sha pair is consistent; only the line-enumeration chain is
  broken).
- **F3 (custody gap, run-12)**: `pb-run12-auditfix.log` header lacks the sha256 stamp
  (Iteration-4 default #4); current `Pb.lean` sha `da05c60ceb78755b` is unstamped in
  any log (§10.4's `b9ad881689927936` was pre-auditfix). Step-B stamps the bytes of
  record regardless (plan §2.4).
- **F4 (coverage, resolved)**: 75-Pb run-11 32/89 direct prints — discharged by run-12
  exposure + complete P-b-layer prints.
- **F5 (coverage, open until Step-B)**: 72-M1 T3 — 5 of 9 theorems (hermPart algebra
  helpers `P72M1T3.lean:40/:43/:51/:57/:60`) lack direct prints; elimination argument
  holds (rc=0, 0 sorry-warnings); `axcheck_iter4`/Step-B closes it.
- **F6 (tables debt)**: 72-M1 L3a's §10 row still owed — §10's preamble promises
  "rows on landing"; the GREEN is recorded only at `RESUME-BRIEF-ITER4.md:168` +
  the log. R3 to append.
- **F7 (LoC drift, F5-class, noted in-table already)**: Pb 2,289→2,296→2,302 vs disk
  2,303; A2 "~150" vs 109.
- Telemetry degenerate `samples=0` on sub-minute runs (75/L1/alp0/alp1) is expected
  (60 s interval); the §9-B4 cadence rule ("≥1 sample per ~10 min") is satisfied by
  every run.

— lane A8, 2026-11-17. No files outside this validation file were modified; no Modal
runs launched; siblings untouched; main checkout untouched.
