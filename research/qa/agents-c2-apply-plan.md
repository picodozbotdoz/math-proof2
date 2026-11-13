# AGENTS-C2-DRAFT application plan — dry-run against the 2026-11-14 repo state (H)

Written 2026-11-14 (H, orchestrator queue items 1–2). **Plan only — nothing applied.**
Trigger: orchestrator's cycle-close signal (standing authorization, RESUME-BRIEF-C2 /
STATUS QA-routing note). One safe pass = the 7 edits below, in order, then the wrap-up
steps. Line numbers refer to current AGENTS.md; re-anchor by quoted text if drifted.

Verified this session: draft facts vs `feasibility/axiommath-donor-probes.md`,
`novelty/liu1-hygiene-sweep.md`, liu-zerofree README (0.874957069799), runner app names
on disk, commits 5aada35/2dc7963 (post-draft A1 landings). Draft is sound in substance;
**three structural conflicts and four stale spots** are resolved below.

## Edit sequence

**E1 — replace the nested `axiommath/` list (AGENTS.md:34–49)** with the draft Block 1
consolidated `axiommath/` bullet, verbatim. No conflict (draft is strictly newer than the
per-repo clone-hash bullets; G1b "62 errors/11 modules" and G2 "8262 jobs" match the landed
probe doc). *Apply-time:* if G5a/G6a verdicts have landed by close, refresh the
`AreaLaw2D`/`Weil` parentheticals accordingly.

**E2 — `liu-zerofree/` bullet (AGENTS.md:50–70): DO NOT apply the draft's duplicate.**
The draft (written pre-hygiene-sweep) also carries a `liu-zerofree/` bullet; AGENTS.md
already has the post-sweep one (resolved constant story, precise cites
`CombinedPaperVerification.lean:19/:44/:103`, replay prerequisite). Verbatim application
⇒ two contradictory bullets. Resolution: **keep the current bullet as base**; fold in from
the draft the one sentence it lacks — "DO-NOT-CONSUME as a build dependency —
statement-level citation only (`novelty/liu1-as-donor.md` §5, confirmed at full-tree
scale)." — merged with (not replacing) "Treat as statement-level only until probed on our
pin (A7/G7)". *Apply-time:* if G7b has landed GREEN, replace both clauses with the
probe-verified phrasing + verdict cite; if FAIL/compromised, keep DO-NOT-CONSUME and cite
the verdict.
**Drive-by typo fix (pre-approved here):** AGENTS.md:54 "B_new = 0.874957019…" →
"B_new = 0.8749570698…" (README = 0.874957069799; verified against the clone this
session; the draft's own 0.8749570700 is the correct rounding).

**E3 — insert the draft's `PrimeNumberTheoremAnd` upstream DEFER-watchlist bullet** after
the liu-zerofree bullet (before "Never edit or commit…", :72). New content, no conflict.
*Apply-time:* re-verify HEAD `938912bb` still current and no T1–T3 trigger fired (none
expected; `novelty/pntplus-glue-as-donor.md` §c).

**E4 — append the substrate note to "Lean verification via Modal" (after :135).**
CONFLICT: the existing CLI bullet (:98–102) says "run as the `xyz` user … scripts use
xyz's" — the draft note contradicts it without editing it. Resolution: append the draft
note (dated, as written) AND mark the stale clause in :98–102: "scripts use xyz's" →
"scripts used xyz's through 2026-11-13 — superseded by the substrate note below".
*Apply-time update (post-draft landing, commit 5aada35):* the note must also record that
`run_axcheck.sh` now DEFAULTS to `MODAL_USER=doz`, and cite RESUME-BRIEF-C2 §Protocol 3
as the canonical protocol statement.

**E5 — append the Cycle-2 ephemeral-apps bullet. STALE (pre-relaunch list).** Draft's
four apps all still valid (`crossmath-axbump`, `crossmath-gprobe`, `crossmath-pilot-71`,
`crossmath-pilot-42-m4`), but three landed after the draft — add:
`crossmath-pilot-42-m4b2` (`pilots/42/run_m4b2.py:23`), `crossmath-pilot-72`
(`pilots/72/run_pilot.py:17`), and the pilot-11 revival which **reuses `crossmath-probe`**
(`pilots/11/pilot11_probe.py:19`).

**E6 — append the full-coverage axcheck bullet**, verbatim. Optional one-clause addition
at apply time: first executed instance = `pilots/42/logs/m4b-axcheck-run1.log`
(AxPilot42_M4b_full, GREEN triad-only, 0 sorryAx).

**E7 — insert `## Cycle-2 conventions` section** (draft Block 3, 4 bullets) between
"Conventions" (:84–89) and "## Lean verification via Modal" (:91). All four bullets still
accurate. Touch-ups: (i) donor-hygiene bullet may add the m4b axcheck as executed
instance; (ii) queue-protocol bullet gains the cross-ref "protocol recorded at
`research/RESUME-BRIEF-C2.md` §Protocol"; (iii) G-series bullet unchanged — log naming
now includes the outage re-runs (run19–21), covered by the existing wording.

## Wrap-up (same pass)

1. Mark `research/AGENTS-C2-DRAFT.md` header: "APPLIED 2026-11-… (commit …) per
   qa/agents-c2-apply-plan.md" — keep the file (provenance).
2. Commit: `Cycle 2 close: apply AGENTS-C2 addendum (AGENTS.md) per qa/agents-c2-apply-plan.md`.
3. INDEX row for the draft flips "held UNAPPLIED until cycle close" → applied (+commit);
   STATUS commit-log entry.

## Apply-time decision checklist (re-check before the pass)

- G7b verdict (run19) → E2 phrasing; G5a (run20-retry)/G6a (run21) → E1 parentheticals.
- Pilot outcomes (71-P2, 10-L2, 11-M2, 72-C-neg, 42-M4b-upgrade) — affect only E5/E6
  example cites, never structure; ledger §9 is the canonical status, AGENTS.md carries no
  per-pilot state.
- Upstream PNT+ HEAD unchanged; no registration trigger fired.

## Tail — STATUS slot-2/3 normalization wording (orchestrator applies at typeset)

Three exact edits (STATUS §Cycle-2 pilots pipeline + decision block):

1. Row 11 note cell → "Cycle-2 pilot-decision **slot 2** (relaunch normalization
   2026-11-14; authorized A8-3)".
2. Row 72 note cell: "Cycle-2 pilot-decision slot 2 (see decision block below)" →
   "Cycle-2 pilot-decision **slot 3** — after 11-M2 (numbering normalized 2026-11-14;
   was mislabeled slot 2)".
3. Decision block: "slots = **71-P2 + 73-C skeleton (A2, executing)** and **72-M1 Tier-C
   (A8, after 11-M2)**" → "slots = **1: 71-P2 + 73-C (A2, executing); 2: 11-M2 (A8);
   3: 72-M1 Tier-C (A8, after 11-M2)**".
