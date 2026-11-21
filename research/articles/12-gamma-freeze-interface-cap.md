# A Cap Theorem for the 3SUM/APSP Refutation's One-Call Interface: No Expressed Parametric Savings Beyond n^{3−0.00175}

*kind: NEGATIVE · date: 2026-11-21 · supersedes: none ·
artifacts: `research/pilots/12/N1-cap.lean`, `research/pilots/12/N2-witness.lean`;
logs `research/pilots/12/logs/n1c-runs1-3.log`,
`research/pilots/12/logs/n2w-run4-full-transcript.log`;
composition citations to `research/pilots/12/CORE.lean` @ `940bc9ea`
(`logs/core-run14-axcheck.log`, 14/14 triad); candidate record
`research/pilots/12/M-CLASS-EVALUATION.md` (the evaluation of record);
precharter `research/candidates/gamma-freeze-precharter.md`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 `savings_cap_frozen` (the cap as the interface's discharge boundary) | PROVED-UNCONDITIONAL | none beyond the definitions of the subject (an `EpsData` ε-fiber and a `BandWord` band point, §2) | `pilots/12/logs/n1c-runs1-3.log:25` — [propext, Classical.choice, Quot.sound] |
| Thm 2 `two_term_balance` (the two-term balance bound) | PROVED-UNCONDITIONAL | none (D ≥ 2, γ, η free parameters) | `pilots/12/logs/n1c-runs1-3.log:26` — [propext, Classical.choice, Quot.sound] |
| Thm 3 `cap_constant_exact` (the cap-constant arithmetic) | PROVED-UNCONDITIONAL | none | `pilots/12/logs/n1c-runs1-3.log:27` — [propext, Classical.choice, Quot.sound] |
| Thm 4 `fiber_cap_blocked_regime` (the blockade witness) | PROVED-UNCONDITIONAL | none beyond the definitions of the subject (as Thm 1) | `pilots/12/logs/n2w-run4-full-transcript.log:17` — [propext, Classical.choice, Quot.sound] |

## Abstract

The parametric-savings question of the 3SUM/APSP refutation corpus's flagship program
terminates inside that corpus. The corpus's one-call interface is frozen at the
0.437/0.063 exponent split — γ = 0.063 of D-savings per query call — and we prove the
cap this freezing imposes. Theorem 1: within the band 2 < ω_b ≤ 2.9, the ε-fiber cap
0.00175 is exactly the interface's discharge boundary — savings discharge if and only
if ω_b ≥ log₂ 7. Theorem 4: every band word with ω_b ≤ 9/4 + 1/4 — the
better-matrix-multiplication regime the corpus itself can produce — is blocked
strictly below the fiber. Theorems 2–3: the two-term cost profile of the corpus's cost
model is bounded below by its balanced value D^{−γ/2} (attained at η = γ/2, where both
terms coincide), and the cap constant is exactly γ/(2·18) =
0.00175. All four theorems are PROVED-UNCONDITIONAL (Lean kernel, triad-only). Composing
with the corpus's landed 14/14 chain, no (D, g, η) the frozen
interface can express delivers total savings beyond n^{3−0.00175}. The claim is an
interface-expressibility cap, never a lower bound. Nearest prior work: the donor's
own Remark 20 — the informal balance note, kernel-proved here where the donor stated
it as a challenge.

## 1. Introduction

The 3SUM/APSP refutation corpus proves subcubic refutation-shaped bounds through a
chain of certified time claims; its flagship target (the parametric-savings program
this project pre-registered on it) hoped that a better matrix-multiplication
exponent ω_b would buy additional parametric savings through the chain's interface.
The corpus's own evaluation of that hope
(`research/pilots/12/M-CLASS-EVALUATION.md`) found it frozen: the one-call instance
cost is pinned at the 0.437/0.063 split, the balance point is fixed, and the corpus's
flagship statement is blocked as stubbed in exactly the regime a better ω_b would
produce. This article banks that finding as a theorem set, in the project's
negative-results register: the negated hope is the project's own pre-registered
flagship — no external claim is refuted — and the proof content is elementary while
the closure it certifies is not ("elementary certificates, nonelementary closure").

## 2. Setting and notation

**The frozen interface.** The donor's one-call query cost is frozen at the
0.437/0.063 exponent split (`wantedBound`, donor
`ThreeSumApsp/TimeClaims/Sec3/Definitions.lean:114`; the literals visible in the
donor's Corollary-26 statement, `PaperStatements.lean:2432–2439`): with |W| ≤ n²/√D
query pairs at D^{0.437} each plus reading, one call costs n²/D^{0.063} — write
**γ = 0.063** for the frozen D-savings exponent. A deployment of the interface
chooses a D-exponent allocation η and pays the corpus's two-term cost model:
instances n³·D^{η−γ} and scans n³·D^{−η}. The D-to-n transfer is D = n^{1/18}: the
landed chain of the corpus pins it (`route16_MMgeneral_frozen`, `CORE.lean:911`,
consumed here by citation, never re-proved), so the balanced total exponent is
3 − γ/(2·18) = 3 − 0.00175.

**The band and the ε-fiber.** The word-RAM data of the corpus carries a band
parameter ω_b with 2 < ω_b ≤ 2.9 (`WordRamMMData`, `CORE.lean:220`); a **band word**
is a point of that band (`BandWord`, §2 of the artifact: the fields `2 < ωb`,
`ωb ≤ 2.9`). The **ε-fiber** (`EpsData`, stated verbatim from `CORE.lean:235–241`)
is a function ε on the band, frozen at the log₂-7 fiber (ε(log₂ 7) = 0.00175),
strictly antitone on the band, and vanishing at the band's right edge. MM-independence,
stated exactly: the balanced **total** above is independent of ω_b; the **discharge
band** — where the ε-fiber's savings apply — is not.

## 3. Main results

**Theorem 1 (the cap as the discharge boundary; `savings_cap_frozen`,
`N1-cap.lean:106`).** For every ε-fiber E and band word W:
E.ε W.ωb ≤ 0.00175 **if and only if** log₂ 7 ≤ W.ωb.
The ε-fiber cap is exactly the interface's discharge boundary.

**Theorem 2 (the two-term balance bound; `two_term_balance`, `N1-cap.lean:131`).**
For every D ≥ 2 and all γ, η:
D^{−γ/2} ≤ max(D^{η−γ}, D^{−η}).
The balanced value D^{−γ/2} lower-bounds the **balanced two-term total of the corpus's
cost model** (instances against scans) at every η; the balanced point η = γ/2 attains
the bound, both terms coinciding there. No uniqueness of the minimizer is claimed, and
this theorem says nothing about any algorithm's cost.

**Theorem 3 (the frozen arithmetic; `cap_constant_exact`, `N1-cap.lean:147`).**
0.063/(2·18) = 0.00175, and 0.0315/18 = 0.00175, and 0.063 = 2·0.0315 — the cap
constant is exactly γ/(2·18) at the donor's frozen literal.

**Theorem 4 (the blockade witness; `fiber_cap_blocked_regime`, `N2-witness.lean:99`).**
For every ε-fiber E and band word W with ωb ≤ 9/4 + 1/4:
0.00175 < E.ε W.ωb.
The regime a better matrix multiplication produces — the corpus's own blocked-regime
hypothesis quantifies it at ω_b ≤ 9/4 + ε′ (`CORE.lean:392`); ε′ = 1/4 here, one
member of that class — sits strictly below the fiber: the decreasing ε exceeds the
cap everywhere on it.

**The closure (composition over the landed chain; not a new kernel row).** Composing
Theorems 1 and 4 with the corpus's landed 14/14-triad chain
(`MMgeneral_total_sum`, `CORE.lean:503`, and `route16_MMgeneral_frozen`, `:911`;
audit `logs/core-run14-axcheck.log`): within the frozen interface, the dischargeable
half-band is exactly ω_b ≥ log₂ 7, the regime the corpus itself can produce
(ω_b ≤ 9/4 + ε′) is excluded exactly, and no (D, g, η) the interface can express
delivers total savings beyond n^{3−0.00175}. The parametric-savings question of the
flagship program terminates at the frozen cap. Not claimed here: the corpus's
flagship statement's second conjunct (the explicit-refutation half at the larger ε)
— that half stays blocked as stubbed.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| the donor's **Remark 20** (the informal balance note in-paper; in the donor corpus formalized only as the unproved challenge statement `remark_20_balance`, `Challenge/PaperStatements.lean:47`) | observes the instances/scans balance at η = γ/2 informally, as a paper remark left as a challenge | **kernel-proved where the donor stated-as-challenge**; and read as a cap: Theorems 1–4 state the interface-expressibility cap (the discharge boundary, every band word, the balanced-value bound, the MM-independent total), the blockade witness, and the tier closure — none stated or proved in the donor |
| Strassen 1969; LeGall 2014 (the ω-landscape: ω = log₂ 7 as the classical rank barrier; ω < 2.3728637) | the matrix-multiplication exponent program — lower-bound context and upper-bound progress | not an expressibility cap of any interface; our theorems say nothing about algorithms or ω itself — they fix what one frozen interface can express (the cap-not-lower-bound lock, §7) |
| the fine-grained no-go genre (conditional lower bounds: SETH/Presburger-shaped, incl. the donor corpus's own hypothesis framing) | hardness of algorithm classes under conditionals | different objects: no frozen-interface cap shape; our claim is expressibility of a fixed interface, not hardness |

Scope statement: the "no (D, g, η) the interface can express" claim is scoped to the
donor corpus's frozen interface as stated in §2 (the 0.437/0.063 split and the
landed chain); no claim is made about any other interface, algorithm, or cost model.

## 5. Proofs

**Theorem 1.** Both directions by the strict antitonicity of ε on the band and the
frozen-fiber value: if ω_b < log₂ 7 then ε(log₂ 7) < ε(ω_b), i.e. 0.00175 < ε(ω_b) —
contradicting the cap; conversely if log₂ 7 ≤ ω_b then ε(ω_b) ≤ ε(log₂ 7) = 0.00175
(strictly below by antitonicity, at equality by the frozen value). The numeric band
membership 2 < log₂ 7 ≤ 2.9 is discharged in-file by exact-rational arithmetic
(2² < 7 and 7¹⁰ ≤ 2²⁹, the squaring/tenth-root comparisons — no floating point).

**Theorem 2.** Case split at η = γ/2: if η < γ/2 the scan exponent −η exceeds −γ/2,
so D^{−γ/2} ≤ D^{−η} ≤ max; if η ≥ γ/2 the instance exponent η − γ ≥ −γ/2, so
D^{−γ/2} ≤ D^{η−γ} ≤ max. Monotonicity of x ↦ D^x on D ≥ 2 throughout
(`Real.rpow_le_rpow_of_exponent_le`, the corpus's own API at `CORE.lean:440`).

**Theorem 3.** Exact-rational arithmetic (`norm_num`).

**Theorem 4.** 9/4 + 1/4 = 5/2 < log₂ 7 (2⁵ = 32 < 49 = 7², squared-comparison),
both points in the band, so strict antitonicity gives ε(log₂ 7) < ε(ω_b); rewrite
the frozen value. ∎

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1 | `savings_cap_frozen` | `research/pilots/12/N1-cap.lean:106` | [propext, Classical.choice, Quot.sound] | `research/pilots/12/logs/n1c-runs1-3.log:25` |
| Thm 2 | `two_term_balance` | `research/pilots/12/N1-cap.lean:131` | [propext, Classical.choice, Quot.sound] | `research/pilots/12/logs/n1c-runs1-3.log:26` |
| Thm 3 | `cap_constant_exact` | `research/pilots/12/N1-cap.lean:147` | [propext, Classical.choice, Quot.sound] | `research/pilots/12/logs/n1c-runs1-3.log:27` |
| Thm 4 | `fiber_cap_blocked_regime` | `research/pilots/12/N2-witness.lean:99` | [propext, Classical.choice, Quot.sound] | `research/pilots/12/logs/n2w-run4-full-transcript.log:17` |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; no `sorry`, no `native_decide`, no
external CAS. The composition citations of §3 elaborate on the same pin
(`CORE.lean` @ `940bc9ea`; its audit `core-run14-axcheck.log`, 14/14 prints triad).

## 7. Limitations and open problems

1. **The load-bearing wording lock (binds every sentence of this article).** The
   theorem is an **INTERFACE-EXPRESSIBILITY CAP, never a lower bound** — never "no
   algorithm beats n^{3−0.00175}" (a far stronger claim the proof does not support);
   "in-corpus"/"this interface" scoping everywhere; MM-independence claimed exactly
   (the TOTAL is ω_b-independent; the DISCHARGE band is not).
2. The D-to-n /18 transfer is the landed chain's content (`route16_MMgeneral_frozen`),
   consumed by citation; Theorems 1–4 are self-contained of it (the /18 enters only
   the closure paragraph's composed statement).
3. Theorem 4 fixes ε′ = 1/4, one member of the corpus's ∀ε′-blocked class; the
   ε′-parameterized generalization is unformalized (a statement-layer splice-time
   generalization, priced in the precharter).
4. The binder-ride alternative — restating the corpus's flagship shape on a re-split
   one-call-cost binder (a Corollary-16′-shape at a hypothesis-explicit exponent
   pair) — is the standing open door: if such a re-split interface ever lands, the
   flagship composes through it. Recorded; not this article's path.
5. The corpus's flagship statement's second conjunct (the explicit-refutation half
   at the larger ε) remains blocked as stubbed; nothing here claims it.

## 8. Prior work and references

**(a) Literature.**

- Alman–Vassilevska Williams, the 3SUM/APSP refutation (the donor; arXiv:2610.06783)
  — the frozen interface's source (Remark 20 the balance note;
  `wantedBound` the one-call cost).
- V. Strassen, *Gaussian elimination is not optimal*, Numer. Math. 13 (1969) — the
  log₂ 7 rank barrier (band context).
- F. Le Gall, *Powers of tensors and fast matrix multiplication*, ISSAC 2014 — the
  ω-landscape's current upper bound (context row of §4).

**(b) Project artifacts.**

- Statement/proof files: `research/pilots/12/N1-cap.lean`;
  `research/pilots/12/N2-witness.lean` (self-contained; `EpsData` restated
  verbatim-marked from `CORE.lean:235–241`).
- Logs: `research/pilots/12/logs/n1c-runs1-3.log`;
  `research/pilots/12/logs/n2w-run4-full-transcript.log`.
- Composition chain: `research/pilots/12/CORE.lean` @ `940bc9ea`
  (`MMgeneral_total_sum` :503; `route16_MMgeneral_frozen` :911; the blocked-regime
  hypothesis :392) + `research/pilots/12/logs/core-run14-axcheck.log`.
- Records: `research/pilots/12/M-CLASS-EVALUATION.md` (the evaluation of record);
  `research/candidates/gamma-freeze-precharter.md` (the precharter incl. §2's
  statement shapes and §6's payload plan); the seed-census row
  (`research/novelty/iter7-seed-census-DRAFT.md`, WATCH-class row 8).

## 9. Shipping gate (self-audit; re-run at this revision after R2's S1–S4 pass)

| # | rule | state |
|---|---|---|
| 1 | kind is a §0 article kind; quota-free | PASS — NEGATIVE (the closure of the project's own pre-registered flagship hope, the 41H3 register); **quota-free per the 78/41H/41H3 lineage — nothing consumed; the only count motion is the ship itself (+1 article row, +1 discovery-grade numerator)** |
| 2 | title free of project-internal tokens | PASS — mathematical content only ("One-Call Interface", "No Expressed Parametric Savings", the explicit bound); the donor is named with its content; an earlier draft's "Frozen-γ" title token was caught by this rule and removed |
| 3 | status rows, closed vocabulary, binders listed | PASS — 4 rows, all PROVED-UNCONDITIONAL, hypothesis cells = definition-of-subject only (the `EpsData`/`BandWord` structures of §2, fields explicit there); no banned status nouns |
| 4 | abstract ≤ 200 words, all five elements | PASS — 200 words (re-counted at this revision); question, Theorems 1–4 with hypotheses, PROVED-UNCONDITIONAL in-sentence, the scoped cap claim, Remark 20 as nearest prior work |
| 5 | novelty table ≥ 2 rows, scoped "first" | PASS — 3 rows; no unscoped "first" anywhere (the closure sentence carries "within the frozen interface" / "the interface can express"); the §4 scope statement names the donor corpus |
| 6 | no bracketed errata | PASS — corrections are written into the correct sentences (the Thm 2 uniqueness phrasing was struck at this revision, not erratum-flagged) |
| 7 | no section contradicts another | PASS — §3's closure paragraph, §6's rows, and §7's items agree on what is kernel (Thms 1–4), what is citation (the landed /18 chain), and what is not claimed (the flagship's second conjunct; any algorithm lower bound) |
| 8 | formal record table-only, no infra narration | PASS — the §6 table + substrate lines; run histories live in the logs (`n1c-runs1-3.log`, `n2w-run4-full-transcript.log`) |
| 9 | internal vocabulary ≤ 3 glosses | PASS — one glossed internal term ("flagship target", glossed at first use in §1); the ε-fiber/band-word objects are defined in §2, not glossed |
| 10 | citations spot-checked (5+) | PASS — verified this session against the trees: `wantedBound` (`Definitions.lean:114`), the Corollary-26 literals (`PaperStatements.lean:2432–2439`), the Remark-20 challenge stub (`Challenge/PaperStatements.lean:47`), every §6 decl:line (`N1-cap.lean:106/:131/:147`, `N2-witness.lean:99`), every cited log line (:25–:27, :17), and the CORE locators (:220/:235–241/:392/:503/:911) |
| 11 | README row updated in the same commit | ARMED — rides the ship commit (one landing family: article + README row + the count update 9→10 of 18 + the companion, per the splice discipline) |
| 12 | superseded files marked | PASS — supersedes none |

— Drafted 2026-11-21 (lane R7); R2's S1–S4 gate PASS with two blocking conditions,
both applied at this revision (the §9 table appended; the Thm 2 phrasing struck to
match its kernel row exactly). Ship decision pending on these bytes.
