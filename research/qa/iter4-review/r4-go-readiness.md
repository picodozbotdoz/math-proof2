# GO-READINESS — Iteration-4 launch gate table (R4-maintained; orchestrator reads at each drain)

Header-dated 2026-11-16, lane R4. Live state re-verified against disk + git at each
orchestrator signal; states below are as of this writing (HEAD `f2bbc17` + worktree).
GO = orchestrator fires L2 (the splice commit, mechanics in
`r4-process-completeness.md` §13). **Blocking set is exactly three rows: R9-final,
R7, L1** — everything else rides post-GO by design.

| # | Item | Owner | State (2026-11-16) | Blocking GO? |
|---|---|---|---|---|
| 1 | R9 final splice block — integration pass landed (`3c95134`); **R7 fold in flight with R9** (r9 modified in worktree); outstanding = fold completion + final touch-up → the block's emission | R9 (orchestrator typesets) | **in flight (fold + emission)** | **YES** |
| 2 | R7 prior-art audit — **LANDED & CLEARED** (`1496c9a`: `novelty/iter4-external-priorart.md`, 362 ln, INDEX row added; 7/7 verdict rows cited, ZERO retracts — QR-D gap = cheap win, AL-3D α=1 validated, PNT+ T3 not fired; `r7-bib-cards.md` follow-up noted in digest, commits on report). The fold leg lives in row 1 | R7 | **landed — cleared** | ~~YES~~ no (fold tracked in row 1) |
| 3 | R6 fresh-bridge probes/dossiers + G11/G12 runner modes — `novelty/iter4-fresh-bridges.md` mid-flight (untracked); `ProbeG11_OAI_SiegelZeros.lean` + `ProbeG12_OAI_PiExponent.lean` staged untracked; `gprobe.py`/`run_gprobe.sh` modified (runner modes in flight) | R6 (runners w/ R8-H) | in flight | no — rides post-GO (merges per standing protocol; blocks article shipping, not launch) |
| 4 | R8 approval packet + AGENTS-ITER4 draft — v1 drain landed (`1a49063`); **§9 run-log review checklist landed** (`4f561bb`, digest-corrected `2864cbf`; LP runner validated PASS; al3d/zzv2-lam/zeta23E boxes pending landings); `AGENTS-ITER4-DRAFT.md` untracked (rides L1 or its own commit) | R8 | v1 + §9 landed; AGENTS draft uncommitted | no — rides post-GO |
| 5 | R1 article-50 v2 + swap-in runbook — **LANDED** (`e558674`: `r1-rewrite-50v2.md` 196 ln + resolutions; `r1-readme-v2.md` refreshed) | R1 | **landed** | no — rides post-GO |
| 6 | R2 seed re-grade + completion specs — **LANDED** (`a0d9373`: sections 11–13 re-grades + completion mini-specs; `r2-rewrite-20/72.md` drafts) | R2 | **landed** (§10.7 slot-worthiness = week-1 drain item) | no — rides post-GO |
| 7 | R3 `axcheck_iter4.py` implementation (private+lemma full coverage, wrapped-line joining, counter regex — FINAL-SWEEP-PLAN-ITER4 §2 defaults) — **implemented on disk, UNCOMMITTED** (must ride L1 for the extractor-authority leg of the pass-2 sequencing); `r3-verification-tables.md` landed (`2b3e121`) | R3 | implemented, uncommitted | no — rides post-GO (hard-required before close sweep, not launch) |
| 8 | H applications — **R2's 29 relabels: DONE + R4-VERIFIED** (`20af866`; 32/32 byte-exact; rename + cite-sweep; dated markers on frozen records). **R3 pass-2 batch-1: DONE + R4-VERIFIED** (`683fdaf`; article 20/71/21/50M2 + ledger tally-only note + dated log corrections — see r4 §15, incl. one sequencing note routed to H: commit the extractor with L1). Remaining: pass-2 count remainder (75 66→68, 42-M4b 68→70, 11-add. 88→110, 10-L1 25→27, ledger M4a 52→54 + §8 20: 26→28, INDEX B-rows) — single home = close-time STEP 5 | H | batch-1 done; remainder registered for close | no — rides post-GO |
| 9 | L1 review-closure commit (mechanics: r4 §13 L1 — the qa/iter4-review set, gate-run reconstruction, REPORT-INPUTS-ITER4, both ITER4 plans, article template, R8 kit) | H | **pending** (file set on disk, uncommitted) | **YES** |
| 10 | L2 splice commit (RESEARCH §Iteration 4 from R9 §8 + batch C1/C2/C4; STATUS opened block from R5 §16; tracker re-key; INDEX rows — 7 verification greps in r4 §13) | orchestrator (H commits) | pending — this IS the GO act; fires after rows 1, 2, 9 green | no (it is the launch) |

**Standing R4 verifications on signal:** (a) R3 pass-2 count batch — byte-exact vs its
authored list + extractor-generated counts (close-time, STEP 5); (b) at GO — the L2
splice commit's seven greps + L1 closure verification, per r4 §13; (c) any divergence
H reports in an application ⇒ R4 verifies the fix commit too before the row above goes
green (queue rule).

**Residues R4 is tracking (not rows — carried):** REPORT §C2.6 "discovery-grade core"
residue → **C5 APPROVED 2026-11-16 (orchestrator): exact text as drafted, dated marker
included; rides L2 with C1/C2/C4; grep #8 adopted.** `novelty/iter4-fresh-bridges.md`
excluded from L1 by design (R6 mid-flight). `axcheck_iter4.py` riding L1 **confirmed by
the orchestrator** (also in the GO instruction to H, belt-and-braces).

**Blocking set now: {row 1 R9-final (fold + emission), row 9 L1}.** Row 2 cleared per
orchestrator note (R7 landed; fold leg lives in row 1). Remaining pre-GO updates: R9's
final block emission, H's L1 execution. At GO: R4 runs L1 closure verification + the
L2 eight-grep set (r4 §13 + Part 7 §14 grep #8).

— R4, 2026-11-16 (updated same day, batch 3: rows 1/2/4/5/6 refreshed; C5 approval
recorded; blocking set narrowed to {R9-final, L1}). Next update on orchestrator signal.
