# R2 — article-41 S1–S4 eligibility pass (the four-point strength bar; lane R2, 2026-11-19)

Instrument: the strength bar as adopted at `RESEARCH.md:84` with the operative
definitions at `qa/iter4-review/r2-discovery-strength.md` §"A candidate earns a research
article only if all four hold" (S1–S4, verbatim forms :136–165). Input consumed:
R9's `novelty/round6-41-battery.md` §LANDING L1–L3 (FINAL, sha256(16)
`c24b62e520133724`, verified before this pass) against the LANDED 41-core evidence
(`pilots/41/Core.lean` + `Core-record.md` GREEN, R4 2026-11-19; `import Mathlib` only —
"No eth theorem imported" in-file). This is the quality gate's article-eligibility
check; it rides the article-41 ship gate with R7's draft-final. NOT a template-§9 pass
(that is R7's surface) and NOT the quota ruling (billing was ruled DISCOVERY,
quota-free, at the gate — consistent with the iter-4 close's DECISION-1 record:
discovery-kind never consumes the N=1 slot).

## Independent verifications run by R2 this pass (not read-backs)

1. **Citation spot-checks at source, all CONFIRMED**: eth
   `proof/networks/Eight/SecCrossing_Identity.lean:261` = `theorem signs : Signs`;
   `proof/statements/EightSquareStatement.lean:53` = the `Signs` ∀-form (Graves
   alternation over `Block`s with the parallelogram hypothesis — the (B) q=1 fiber
   exactly as the battery's row 2 bills it); tauceti
   `GroupTheory/GroupExtension/Of/FactorSet.lean:571–576` = the bilinear-sign-cocycle
   doc/`ofBimultiplicative` (row 4's in-corpus kin); Benkart–Pérez-Izquierdo
   arXiv:math/9801141 carried at `novelty/round-3.md:58` (row 1's object-level
   collision, round-3 graded, unchanged).
2. **Donor-discipline check on the landed bytes**: `pilots/41/Core.lean` imports
   `Mathlib` only (no eth/tauceti import of any theorem); KERNEL-ONLY header present;
   zero `native_decide` occurrences (grep-verified); the battery's §LANDING F1–F4
   (mainCor / mainStratum decide-certified / qRigid / the F1+F4 refutations) are the
   record R9's convergence enumeration cross-checked (two independent methods, one
   theorem).

## The pass (per the four definitions)

**S1 — statement-level novelty with a named nearest-miss: PASS.** The landed statement
family — the universal `(1−q)`-factorization `A+B = (1−q)·aeval(GqGen)` at EVERY
parallelogram quadruple, the antipodal stratification `{p′ = ¬p}` (decide-certified),
off-stratum q-rigidity, and the N′ refutation — is absent from all five corpora and
the external sweeps at the 2026-11-19 evidence state (battery §1 negatives +
§LANDING L1 rows 1–8, each with paper+theorem or file:decl granularity and a
one-sentence delta). The class row ("defect/skein identities at parallelogram quads")
was checked EMPTY against the landed statement — the class-level negative is on record.
NOT corollary-grade: the refutation-laden history (F1's false universals with a
reproduced `0 = 2` witness; F4's false N′; two display errata; the min-side sign
subtlety) is direct evidence the corrected form is not folklore-adjacent —
corollary-level lemmas do not accumulate false first-guesses of this shape. Direct-source
`rg` queries are recorded in the battery §1 (the decl-index caveat honored — no TSV
claims anywhere).

**S2 — essential multi-corpus bridge: PASS (definitional-bridge reading, recorded).**
eth's mathematics enters essentially: the σ_q family lives ON eth's `Block`/sign
structure, and the classical fiber is eth's own `Eight.signs` (now sharpened: it is
exactly the q = 1 fiber on the antipodal stratum — a fact eth does not know); the
polynomial/decide substrate is mathlib's. Neither corpus alone can state mainCor (eth
has no deformation/polynomial layer over its sign family; mathlib has no sign family).
This is NOT the pure-schema anti-case (real eth content is consumed) and NOT a port
(the deformation is new mathematics, not a relocation). The (H) tauceti/Jones bridge
would strengthen S2 further at article time (host machinery verified corpus-complete
by R9 §1) but is NOT needed for eligibility. Reading recorded for the audit trail:
definition-level consumption (verbatim-marked probe copies, no eth theorem import)
satisfies "uses content from ≥ 2 corpora" where the consumed definitions are the
mathematical object's carrier — as here.

**S3 — non-trivial proof content OR surprising statement: PASS via (b), with the
honesty note REQUIRED in the article.** Branch (a) does not carry the pass (the
machinery is polynomial algebra + kernel decide at 8⁴ scale — elementary); branch (b)
does: the statement is itself the discovery — an exact structural identity class
member (the Graves–Cayley alternation as the q = 1 fiber of an explicit deformation,
stratified antipodally, rigid off-stratum, with the naive extension refuted). Per the
S3 rule "elementarity is acceptable only in case (b)", the article MUST carry the
honest comparison sentence (R9's wording, adopted): **"elementary proof, nonelementary
statement."** The G5/§9 self-audit should check this sentence survives the final edit.

**S4 — binder/donor discharge discipline: PASS (vacuous-binder + clean-donor form).**
The landed theorems are UNCONDITIONAL (decide-certified; no Hyp-binders anywhere in
mainCor/mainStratum/qRigid), so the conditional-clauses (a)/(b) are vacuously
satisfied; clause (c)'s anti-silent-donor holds — no binder is a donor theorem, no eth
theorem is imported (verified on the landed bytes above), and the eth consumption is
billed at definition level in the record. Kernel-only discipline verified (no
`native_decide`, no external CAS).

## Verdict

**Article-41 is S1–S4 ELIGIBLE: 4/4 PASS** (S3 via branch (b) with the mandatory
honesty sentence; S2 on the recorded definitional-bridge reading). Conditions riding
the ship gate: (i) the locked headline wordings ("first sign-rule/
parallelogram-defect deformation"; NEVER "first q-deformation of a composition
algebra"; never any TL/Jones-formalization-first claim); (ii) the S3 honesty sentence
in the final text; (iii) the novelty table sources from battery §LANDING L1 (8 rows
incl. the class row) with the two tauceti-citation-surface extensions noted there
(report-only). Billing DISCOVERY, quota-free — consistent with DECISION-1 (iter-4
close record): no N=1 consumption.

— lane R2 (quality-gate eligibility), 2026-11-19. No commits (hold for H).
Inputs: `novelty/round6-41-battery.md` @ `c24b62e520133724`; `pilots/41/Core.lean`,
`Core-record.md`; `r2-discovery-strength.md` §S1–S4; `RESEARCH.md:84`.
