# R1 cross-review of R2's rewrites (20-split, 72-refocus) — TEMPLATE-iter4 §12-rule pass

Lane R1, 2026-11-16. Mandate: run the same shipping-gate self-check I ran on
`r1-rewrite-42v2.md`/`r1-rewrite-50v2.md` over R2's `r2-rewrite-20.md` and
`r2-rewrite-72.md`, review the live state (72's Kuwahara fold IS present in the file —
header "Folded 2026-11-16 (R7 external read…)"), and route failures/divergences for
relay. R2's files untouched; this file is the record. Facts checked against
`r3-verification-tables.md` §3/§4, `r3-verification-integrity.md`,
`novelty/iter4-external-priorart.md` (on disk), and my audit.

Verdicts: **20-split — PASSES WITH SPLICE CONDITIONS** (no substantive failure; format
conversions needed at splice). **72-refocus — TWO RULE FAILURES + one lane divergence**
(title token; abstract 306 words; status dialect), all fixable at splice; content and
attribution architecture are excellent.

Note on form: both R2 files are splice proposals ("[Current §X verbatim]" placeholders),
not full texts — so rules are assessed against what is written plus what the splice must
preserve. R2's `[R3-FILL]` cells are already answerable: `r3-verification-tables.md`
landed with §4 (20-split) and §3 (72) rows.

## A. r2-rewrite-20.md — per-rule results

| # | rule | verdict |
|---|---|---|
| 1 | article kind | PASS WITH ENABLING FIX — the split's article is an interface/technical record; the template's four kinds don't name that billing. Fix applied my side: TEMPLATE-iter4 §0 now carries a fifth kind `TECHNICAL-RECORD` (capped by R9's two-strike rule). R2's byline says "technical record"; carry the tag in front matter at splice. |
| 2 | title clean | PASS — "An Interface Theorem for Zero-Proportion Engines: the zeta23 Card, λ-Families, and Multiplicity Merging" (zeta23 = corpus name, acceptable). Filename change to `20-engine-seam-interface.md` is fine; requires the S–M sweep R2 already lists. |
| 3 | per-theorem status rows, closed vocabulary | **FAIL AT SPLICE (format)** — prose status block "Status: PROVED (conditional interface), kernel-verified…" is not the closed vocabulary and not per-theorem. Convert using R3 tables §4: `instantiate_family_A/B/C` + `assemble_eps`/`family_merge` PROVED-CONDITIONAL (Card20/TracesFamily/EngineStep; hz/hw; hfamz/hfamw), `merged_mult_of_common` PROVED-UNCONDITIONAL (configurational binders only). |
| 4 | abstract ≤ 200 w, theorem+hypotheses+status+scoped novelty+nearest | PASS (177 words); add one closed-vocabulary status clause ("Thms 1–3 PROVED-CONDITIONAL on the card/step binders; Thm 4 PROVED-UNCONDITIONAL") at splice. |
| 5 | nearest-miss table ≥ 2 rows | **FAIL AT SPLICE (format)** — §6 is a bullet list; convert zeta23 / Alpöge–Furman / internal consumers into the ≥2-row table. |
| 6 | no bracketed errata | PASS. |
| 7 | no section contradicts another | PASS — with one stale count: status block says "All 27 theorems"; disk/sweep say **28 public / 582 LoC** (R3 F4 + tables §4). Fix at splice. |
| 8 | table-only formal record | PASS WITH NOTE — §5 table's `[R3-FILL]` cell tempts to carry "9 Modal cycles" (run history = banned narration). Fill from R3 tables §4 (`axcheck-cycle2.log:51,56,63` etc.), no cycles/descents. |
| 9 | internal vocabulary | PASS ("dossier-grade" once, glossed; byline pointers permitted). |
| 10 | citations spot-checked | PASS — carried v1 citations were verified in my audit (thmA₀_N0 `Final.lean:356`, `trivial_chain` `Statement.lean:157`). |
| 11 | README row same commit | **DIVERGENCE — reconciled my side**: R2's Part 3 targets the OLD two-table README; the live README is being replaced by v2 (runbook STEP 7). I updated `r1-readme-v2.md` §B row 20 to the split form (new title/file + seam-note pointer + R3 status wording). |
| 12 | superseded files marked | PASS WITH NOTE — if the old filename is kept instead of renamed, mark the 2026-11-09 edition superseded at top. |

**Splice must preserve (20):** (i) Theorem 5 stays OUT of the article — the R1-audit
MAJOR (Thm 5 asserted in abstract, unformalized) is resolved only by the split; the note
carries the PAPER-ONLY billing; (ii) `SharedMass`/`CommonZeroControl` definitions move
WITH Thm 5 to the note — the article's §2 must drop them (else undefined references);
(iii) count correction 28/582; (iv) status rows per R3 tables §4.

## B. r2-rewrite-72.md — per-rule results

| # | rule | verdict |
|---|---|---|
| 1 | article kind | PASS WITH ENABLING FIX — same `TECHNICAL-RECORD` kind (fence + interface). |
| 2 | title clean | **FAIL — lane divergence to relay.** Title still carries "(with the Family-265 Interface Layer)" (`r2-rewrite-72.md:23`) — "Family-265" is an openai-math internal index, flagged MAJOR in my audit (72 §3). R2 kept it; R1 recommends dropping it from the title (body §5 may keep it with a one-line gloss), or adopting R2's own alternative filename `72-renyi-fence-kuwahara.md` and a title suffix "(with the PEPS Interface Layer)". |
| 3 | per-theorem status rows, closed vocabulary | **FAIL AT SPLICE (format + dialect)** — "Status: PROVED, FINAL — fence, not refutation." repeats the exact "PROVED, FINAL"-over-conditional pattern my audit flagged on 42-M4:11 (N3a/b are hKL-conditional). Convert using R3 tables §3: N1/N2a/N2b PROVED-UNCONDITIONAL (well-formedness binders listed); N3a/b PROVED-CONDITIONAL (hKL + hBnd + hArea; conclusion `False`); private helpers C1-covered; M1 links 1–3 PROVED-UNCONDITIONAL; link 4 + interface theorem NOT an article claim (carried — no status row). |
| 4 | abstract ≤ 200 w | **FAIL — 306 words** (measured). Trim ~110: the Kuwahara rank–error trade-off detail (exp[Õ((A log ε⁻¹)^{2/3})] clause) is repeated verbatim in §7 — keep it there, compress the abstract to the distinction ("his rank statement is a positive approximate-projector trade-off, not a boundary-linear no-go"). Content itself is exemplary: exact attribution, hypotheses, status, scoped novelty all present. |
| 5 | nearest-miss table ≥ 2 rows | **FAIL AT SPLICE (format only)** — §7's attribution architecture is the best in the corpus; convert Kuwahara / Rényi 1961 / Beck–Schlögl 1993 (+ AHS/AAG/Abrahamsen) into the table columns. Content ≥ 2 rows easily. |
| 6 | no bracketed errata | PASS. |
| 7 | no section contradicts another | PASS — the fold is internally consistent (d ≥ 2 in status/abstract/§1/§7; "not stated in his paper" consistent with §7's precise contrast). |
| 8 | table-only formal record | PASS WITH NOTE — §6's carry-over cells embed descent trajectories ("descent 20→…→0", "24→10→1→0") = banned narration; drop at splice. All `[R3-FILL]`s answerable now from R3 tables §3 (`axcheck-run1.log:24–28` public + `:34+` private; `m1-axcheck-final.log:82–83`; sweep rows). |
| 9 | internal vocabulary | PASS WITH NOTE — "family-265" in title (rule 2); body §5 keeps it with context — acceptable there with a gloss. |
| 10 | citations spot-checked | PASS — Kuwahara arXiv:2610.15199 scope verified by R2's fetch + my audit's abstract check; AreaLaw2D/PEPS line cites carried from v1 (pattern verified). `[R7-CITE]` slots open pending `r7-bib-cards.md` (still not on disk 2026-11-16). |
| 11 | README row same commit | **DIVERGENCE — reconciled my side**: R2's new row keeps v1 status dialect ("gate unconditional given the `hKL` family"); R3 tables say N1/N2 unconditional, N3 conditional. I updated `r1-readme-v2.md` §B row 72: R2's new title (with "Family-265" dropped per rule 2) + R3-precise status. |
| 12 | supersession marked | PASS (filename may stay; rename optional with sweep). |

**What any further Kuwahara-fold must preserve (72):** the live fold is present and
good; if R2 folds more of the R7 read, these are load-bearing and must survive verbatim
or stronger: (i) the **d ≥ 2 scope correction** everywhere (the v1 article said "2D" —
the current/filename slug still says nothing dimensional, but any reverted "2D" wording
would understate Kuwahara and mis-scope the fence); (ii) the **approximate-projector vs
boundary-linear-no-go distinction** — this is the entire novelty boundary; if it weakens
to "Kuwahara nearly stated it", the article's contribution collapses to a `norm_num`;
(iii) the attribution sentence "**The refutation is his; the fence, and the
no-go-as-a-theorem, are ours**" (abstract) — keep verbatim; (iv) `hKL` stays a named
binder in every N3 status row (never folded into prose); (v) `[R7-CITE]` slots stay
fillable without touching attribution logic; (vi) the safe-direction α-range note
(`_hα`/`_hα1` unused ⇒ N3 holds for all α, R3 §1.5) may be kept.

## C. Divergences and failures routed to the orchestrator

1. **72 title token "Family-265"** — R1 audit MAJOR vs R2's kept title. Recommendation:
   drop from title (keep in §5 body, glossed). Decision needed before R4's title rule
   check.
2. **Template kind gap (both files)** — four kinds don't cover technical-record billing
   for kept articles (11, 20, 50, 52, 72 all live in README-v2 §B). Fix applied my side:
   `TECHNICAL-RECORD` added to TEMPLATE-iter4 §0 (capped by R9's two-strike rule).
   Confirm adoption.
3. **72 abstract 306 words** — splice-time trim required (rule 4); suggest the §7-duplication
   cut above.
4. **Both files' status blocks** — convert to per-theorem closed-vocabulary rows at
   splice; rows are ready in R3 tables §3/§4.
5. **Runbook gap** — my swap-in runbook had no step for the adopted 20-split (R2 §8
   REWRITE-FULL). Fix applied my side: STEP 4c added (new article + seam note + retire
   old file + cross-ref sweep incl. 42v2's §5 seam pointer retarget).
6. **README-v2 rows 20/72 reconciled my side** (see A-11/B-11); confirm with R2.

No R2 file was edited. R1 side-changes from this review: TEMPLATE-iter4 §0 (fifth
kind), r1-readme-v2.md §B rows 20/72, r1-swapin-runbook.md STEP 4c.
