# R2 — article-75 v3 S1–S4 DRY-PASS (prospective, against R6's v2-candidacy dossier; iteration-6 day-1 editorial unit D3)

Instrument: the four-point strength bar verbatim (`qa/iter4-review/r2-discovery-strength.md`
§4 :136–165 — the same battery as the 41/41H passes). Basis: the dossier
`pilots/75/v2-candidacy-dossier.md` @ `12219e48` (R6 unit 12, planning-only) + the
LANDED article-75 v2 bytes (title/abstract/§3.3/§7 read this session) + the evidence
base verified at byte level (below). **Scope: DRY-PASS on the revision AS SCOPED —
the actual S1–S4 PASS against LANDED v3 bytes still gates the splice; this pass
de-risks it.** No edits, no fires.

## Evidence verification run by R2 this pass (not read-backs)

1. **Audit logs (the dossier §(c) claims, byte-verified):**
   `logs/axcheck-n3-run1.log` — "TOTAL 358 records, 0 sorryAx, 0 errors" in-log
   (:615), composition Pa 170 / N2P0 32 / N2P1 92 / N2P3 12 / N2P2c 44 / N2-P3e 8;
   the only "sorryAx" strings in the file are the zero-count verdict lines (12/615).
   `logs/axcheck-n3v2-run1.log` — "48 axiom print lines, ALL exactly [propext,
   Classical.choice, Quot.sound], 0 sorryAx" (:228) + the closing "N3 CLOSED: plain
   358 records + V2 48 lines" (:232). Both stand.
2. **Per-theorem logs present on main:** n2-p1-run19 (14/14), n2-p1-run26 (15/15),
   n2-p2c-run8 (11/11 ×2 in-log), n2-p2d-run2 (6/6 ×2), n2-p3v2-run4 (6/6 + triad),
   n2-p3e-run1 — all in `pilots/75/logs/`.
3. **File shas vs the dossier's provenance header:** Pa `d61eb048` ✓, N2-P0
   `1cf5cbe2` ✓, N2-P2c `2cca447d` ✓, N2-P3 `f9bd28c5` ✓, N2-P3e `6f6beb20` ✓,
   N2-P3V2 `2613cfd2` ✓, N2-P2d `4f978b44` ✓ — **EXCEPT `N2-P1.lean`: main carries
   `ce6719c8` (the run-26 state), the dossier cites `396d8710` (run-31 verified,
   worktree agent-06 — confirmed there, together with `n2-p1-run31.log` which is
   NOT on main).** See finding F1.
4. **Article baseline bytes:** title carries "Two Tiers, Conditional on Component
   Proportions" ✓; §3.3's "(not proved here)" list = exactly the two glue pieces
   (i) dictionary+imprimitivity, (ii) hAbFac-as-DZDF-statement-binder, closing
   "This is the article's carried completion, not a claim" ✓; the abstract's
   "named glue remains before ζ_L itself is unconditional at ℚ" sentence ✓; §7
   row 2 ("not proved here") + the structural-set framing ✓.

## S1 — statement-delta review (the J1–J10 joins): **PASS (dry)**

The J-joins add NO new statement class. J9 (`zetaL_two_thirds_landed_of_DZDF`) and
J10 (the ℚ endpoint) are the article's OWN §3.3-carried completion — stated in v2 as
"not proved here … the article's carried completion, not a claim" — now carrying
PROVED-CONDITIONAL status rows with the exact binder inventory §3.3 already named.
J1–J8 are the two glue pieces themselves plus composition infrastructure, all
previewed in §3.3's own list; §A.1 correctly freezes Thms A–E′ and the donor rows.
The §4 nearest-miss table (5 rows) is untouched; the scoped novelty sentence ("first
among the corpora surveyed … outside the quadratic case") stays verbatim. The delta
is DEPTH (completion rows), not BREADTH (no new claim class).

**Bite (guarded):** any sentence drift toward "first unconditional" — that would be
a NEW claim requiring a fresh novelty survey. The guard is structural: every new row
is PROVED-CONDITIONAL with hfac explicitly billed "donor statement-binder,
G1-permanent" — the flip is "not proved here" → "proved down to the named binders",
never "unconditional".

## S2 — verification chain (the 358+48 audits + per-theorem logs): **PASS (dry)**

Verified at byte level (§Evidence above): the plain-side 358-record and V2-side
48-line full-coverage audits are real, 0 sorryAx, every record ⊆ triad; the
per-theorem logs exist with the claimed counts. The bridge strengthens passively:
DZDF (statement-binder) × zeta23 (thmE chain, donor-pin audited) × ZetaZerosV2
(d4 consumed by import, re-printed triad) × mathlib ff2494ea × the in-repo stack —
now VERIFIED CONSUMPTION chains rather than quoted adjacency. No corpus alone
produces the composed statement; the joins are the article's own glue.

**Flag F1 (pre-splice landing dependency, owner R6→H):** the dossier's J1–J5 rows
cite `N2-P1.lean` @ `396d8710` (run-31 verified) + `n2-p1-run31.log` — both
confirmed in worktree agent-06, BOTH NOT ON MAIN (main = `ce6719c8`, the run-26
state; the close's G2 already recorded the N2P1 override-stale trio as
OVERRIDDEN-with-follow-up). The v3 §6 rows must cite LANDED bytes: H lands R6's
run-31 set BEFORE the splice, or the rows cite the landed sha with the run-31 log as
verdict-of-record (one mechanical follow-up already carried by R1).

## S3 — corpus/novelty consistency (two-tier conditionality + DONOR-binder honesty): **PASS (dry)**

- No corpus subset produces N2-d; the real decisions are in-repo (the c-trick count
  identifications, the dictionary, the immunity transport) — unchanged from v2's
  S3 basis, now with the consumption chains verified.
- Two-tier conditionality unchanged in kind: Tier 1/2 rows frozen (§A.1); the
  distinct tier's limitation rows stand verbatim — the dossier correctly does NOT
  claim the 5/6 arm over ℚ (thmE_C₀'s 3/4 < the 5/6 slot; only the 2/3
  with-multiplicity tier gains the composition).
- DONOR-binder honesty: hfac named as donor statement-binder billed as donor
  consumption (S4(c) class-iii compliance — no silent donor theorem); thmE_A₀'s
  role-growth explicit ("consumed by name through ThmEDyadic"); the dictionary row
  (R6) correctly does NOT upgrade its FORMALIZATION-novel-glue billing.

**Bite (guarded):** the "landed" declaration-name vocabulary (J9/J10) stays in the
Lean-declaration column only (v2 precedent `zetaL_assembly_landed`) — banned in
status cells and prose titles.

## S4 — template gates incl. S4(b) titling: **PASS (dry)** — the three named bites are the splice checklist

Checked against the dossier's own (b) row-drafts and (d) analysis:

(i) **Title-phrase removal — GUARDED.** The title "… Two Tiers, Conditional on
Component Proportions" (byte-verified in the landed title) REMAINS ACCURATE: the
composed row keeps the DZDF statement-binder (G1-permanent) + per-primitive binders;
the ℚ endpoint keeps hfinζ/hntopζ. Components are "discharged" only at the donor
pin + classical binders — removing the phrase would misrepresent. The dossier's
Do-NOT list already forbids the title/kind change ✓.
(ii) **"unconditional-at-ℚ" leak — GUARDED.** The R2 row is drafted
PROVED-CONDITIONAL(hfinζ, hntopζ) with the correct substrate qualifier "on the
V2-import substrate" (donor import ≠ donor pin — the 42-v2 precedent; better than
bare "at donor pin"); the workbench phrase must not escape into title/status cells.
The abstract flip-sentence as drafted ("proved down to the donor statement-binder,
the two per-primitive classical binders, and the structural set") is binder-ledger
language — no "unconditional" word ✓.
(iii) **"landed" in status cells/prose — GUARDED** in the drafts ✓ (declaration
column only).

Template §9 rules touched, all pre-mapped: rule 3 (complete binder lists — the (b)
drafts are verbatim-eligible), rule 7 (§3.3/§7/abstract rewritten together — A.2.2/
A.2.3/A.2.5 agree on the new remainder), rule 10 (log:line cites re-verified at
splice), rule 11 (README row 75's counts line in the same commit — H's checklist).
The §7 row-6 narrowing is honest (Dirichlet window-finiteness discharged on-pin at
run 26; the ζ-side stays). **The NOT-A-SHIP box is charter-correct** (revise-in-place,
second application; engineering deliverables never re-billed; KPI 8/16 and quota
UNSPENT second-consecutive both unaffected — consistent with the just-closed
iteration-5 record).

## Independent findings beyond the dossier

- **F1** (above): the N2-P1 `ce6719c8`-vs-`396d8710` gap + run31-log-not-on-main —
  the ONE hard pre-splice dependency.
- **F2 — the NOT-YET-STATED final composition: concur with the default (leave OUT
  of v3).** Never splice an unverified row; R1+R2 with their binder ledgers already
  give the complete honest accounting. If iteration-6 wants it later: one
  `exact`-chain fire at the pinned shas, then a supersession row per §3.3's own
  on-pin-consumers rule.
- **F3 — naming: concur** (file-internal v3 + "the charter's revise-in-place rule,
  second application" in the decision text; the §0 change log carries v3 AND the
  NOT-A-SHIP line — avoids a second "v2" label on one file).

## GO/NO-GO recommendation

**GO (dry)** — execute the revision at iteration-6 open per the dossier's decision
block (flip the §3.3/abstract accounting, join R1–R7, add the (c) audit paragraph,
narrow §7 rows 2/6, re-run §9), WITH three splice-time conditions: (1) F1 lands
first (R6's run-31 set on main — §6 cites landed bytes only); (2) the three S4(b)
bite-guards ride the splice checklist verbatim; (3) the ACTUAL S1–S4 PASS runs
against the landed v3 bytes before the splice executes (this dry-pass de-risks, it
does not replace). Do NOT: change title/kind, add the final composition without a
fresh verified run, re-grade the dictionary, or let "unconditional" language escape
the R2 binder ledger — the dossier's own Do-NOT list, endorsed here.

— dry-pass by lane R2 (quality-gate eligibility), 2026-11-20, main read @
`6306dbe` + worktree agent-06 read-only (the run-31 evidence), worktree agent-03.
Prospective only: no edits, no fires, no splice executed. H pulls at convenience;
no commit (lanes never commit).
