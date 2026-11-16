# R2 — Discovery-strength audit (both cycles), Iteration-4 review

Lane R2, 2026-11-16. Scope: judge, coldly, which claimed discoveries are genuinely new
mathematics and which are recombination / transfer / donor-swap / formalization-first /
knowledge-level records dressed as discoveries. Inputs read: all 18 articles under
`research/articles/`, `research/articles/README.md`, `research/TRIAGE.md` (main-run
matrix + Cycle-2 addendum), `research/TRIAGE-C2-ROWS.md`, `research/novelty/VERDICTS.md`
(main-run table + Cycle-2 addendum), dossier 75's honesty header, the AGENTS.md
decl-index caveat (honored: every corpus-absence claim below was re-queried by direct
`rg` in the sibling trees this session; queries recorded in §5).

Classification key (from the queue):
- **(i) NEW THEOREM** — mathematical statement absent from all corpora AND classical
  literature, with non-trivial content.
- **(ii) FORMALIZATION** — new formal statement of known mathematics.
- **(iii) DONOR-SWAP/UPGRADE** — re-basing or strengthening our own earlier result by
  consuming a donor (or discharging a binder) without new mathematics.
- **(iv) GLUE/INTERFACE** — machinery, dictionary, or realization layer.
- **(v) KNOWLEDGE-LEVEL** — recorded facts about corpora/literature/races.

---

## 1. Cycle-2 classification table

| # | item | verdict | class | nearest prior art (named) | what is actually new |
|---|---|---|---|---|---|
| 75 | abelian assembly, ζ_L proportions | **statement class genuinely unclaimed; math is an elementary schema lemma; the load-bearing inputs are open binders** | (i)-lite: new statement class + (iv) assembly glue | DLRT arXiv:1908.04876 Thm 1.1 / Cor 1.3(i) (fixed abelian/quadratic K, GRH, T→∞, *distinct* zeros — A5 P2-3 scope flip, confirmed); Bansal–Maji arXiv:2507.18121 (Hardy-type *infinitude* on the line for any number field — nearby, weaker shape); our own article 42 (the n = 2 case) | the n+1-factor statement class and the binder schema; the ℕ∞ partial-product derivation is a real but small technical improvement |
| 42-M4 | ζ_K proportions, unconditional ζ-column | **no new mathematics (article says so itself); ecosystem upgrade of our own #1 pilot** | (iii) | our own article 42; ZetaZerosV2 `simple_proportion_d4`/`distinct_proportion_d5` (`axiommath/ZetaZerosV2/ZetaZeros/Main.lean:130,149` — verified this session: ζ-only proportions); DLRT as above | first ζ_K proportion statements whose ζ-column is unconditional *inside Lean*; the M4a strip-distinct vocabulary; the donor-identification glue |
| 71 | s-plane zeta of a curve over 𝔽_q | **classical math (Weil 1948); formalization-first with one genuine forced fix** | (ii) | Weil 1948; Rosen GTM 210 ch. 5; Stichtenoth Thm 5.1.1; AxiomMath `Weil` (T-variable, verified); tauceti `Frobenius/Zeta.lean`, `HasseBound.lean:44` (T-variable/elliptic) | the s-plane dictionary itself (no corpus has it — verified); the pole-family exclusion correction (draft W1 was false in Lean) |
| 73 | Hecke L-series over 𝔽_q[T], Tier C | **statement-layer transplant of textbook math; both analytic theorems are one-step consequences of 71's Core 1** | (ii) | Tate thesis 1950; Weil *Basic Number Theory* ch. VII; Rosen GTM 210 chs. 4, 9; DZDF `RayClassCharacter` (transplant source, number-field — verified); WenrongZou/TateThesis (number-field, nearest formal neighbor) | first formal FF ray-class character + L-series vocabulary; nothing analytic |
| 72 | Rényi monotonicity no-go gate | **the mathematical content of the no-go is Kuwahara's published theorem; our layer is textbook inequalities plus a one-line corollary** *(R7 precision, 2026-11-16: scope all d ≥ 2, not 2D; his rank statement is a positive approximate-projector trade-off, NOT the stated log-rank no-go — the stated no-go + S₀ ≥ S_α bridge are our increment; textbook nearest-misses Rényi 1961 + Beck–Schlögl 1993; folded in r2-rewrite-72.md)* | (v) + (iv): knowledge-level fence + glue | **Kuwahara arXiv:2610.15199 — the paper's own title/abstract is the no-go ("The Rényi area law conjecture is false below α = 1"); log-rank failure follows in one line from S₀ ≥ S_α** (abstract checked 2026-11-16: he even proves rank-error trade-offs himself); Rényi monotonicity and S_α ≤ log rank are textbook | kernel-verified fenceposts N1–N3 + the M1 cross-encoding interface layer (links 1–3) |
| 50-M2 | unconditional strip confinement [1/8, 7/8] | **discharge of our own binder-shell; the statement is printed in the donor's own preprint (Cor. 1.2)** | (iii) | openai preprint *The Quasi-Riemann Hypothesis*, proof of Cor. 1.2 (article 50 admits this); `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19/:29` (verified verbatim this session); classical reflection via functional equation (Titchmarsh ch. II) | the audited consumption route (G7b) and the donor-pin substrate pattern; zero mathematics |
| 10-layers | uniform poly-space ETH refutation layers | **headline OPEN; the three proved layers are formalization of classical machine-model constructions; the only discovery-grade object (the conjunction) is not proved** | (iv) (+ open (i) target) | anthropics `eth` (uniform machine + time, no space — verified: no space-complexity statement anywhere in `eth/`); openai `SqrtLogSpace` ("one fixed primitive machine" per k — verified) | the value-time/word-space countdown mechanism (L2) as a *formal shape*; the un-pre-empted conjunction target; certified progress toward it |
| 11-B(ii) | TM2 realization of the Red calculus | **realization glue of our own calculus; the content is classical subroutine simulation; three eth interface hypotheses carried** | (iv) | folklore composition accounting (Vassilevska Williams surveys; Williams–Williams 2010); eth's own `exists_tm` host layer (`Machine/Host.lean:305–309`) | one-composed-machine theorem `tm2_realized_composed`; no new mathematics |

**Cycle-2 ranking (strongest → weakest discovery strength):**

1. **75** — the only Cycle-2 item whose *statement class* is new mathematics-adjacent
   output (ζ_L proportions, no formal or informal prior — §5 queries 1–2). Capped hard:
   the proof is an elementary schema lemma, and every analytic input is an open binder.
2. **42-M4** — donor-swap, but of the project's flagship statement class; the landed
   theorems are strictly better artifacts (unconditional ζ-column). No math.
3. **10-layers** — nothing discovery-grade proved; the unclaimed conjunction (verified
   absent from both donor corpora) plus the L2 mechanism give it the highest *option*
   value of the remaining items; honest article.
4. **71** — honest formalization-first; the dictionary fills a real corpus gap and the
   pole-family fix is a genuine formalization-forced correction. Note: W1 as landed is a
   one-line repackaging of W2 plus `div_eq_zero_iff` — the "zero-free half-plane"
   framing dresses a corollary.
5. **72** — the refutation being fenced is someone else's 2026 preprint, whose abstract
   already states the no-go; our content is Hölder + contrapositive. Useful fence, weak
   discovery.
6. **73** — vocabulary transplant; Theorems 1–2 are immediate from 71's Core 1 under
   hRat/hPur binders that are never discharged. "First formal Tate-type (FF scope)" is
   supported but is a dictionary claim.
7. **11-B(ii)** — machine realization of our own calculus on classical simulation
   content; interface hypotheses unresolved.
8. **50-M2** — binder discharge of our own shell of a corollary printed in the donor's
   preprint; the article is honest ("no first", "no new analytic mathematics"), which is
   exactly why it should not have had research-article billing.

---

## 2. Main-run sanity pass

| # | README kind | R2 verdict | class | nearest prior art | flag |
|---|---|---|---|---|---|
| 01 | "new theorem (linear algebra)" | **genuine — the strongest result in the project** | (i) | AF v2 Lemma 3.2 + §7.2(b) (equality case only); Knausgård's overlap-correction move (Thm 2); no defect decomposition anywhere in zeta23 (§5 q6) | keep; no flag |
| 30 | "refutation + new closed form" | genuine but self-referential: it refutes *our own* conjecture; the closed form is a real new theorem about a corpus-internal operator family | (i), moderate | Jing 1991 / Macdonald I §5 / Kac–Raina (boson modes — the classical layer); eth has no closed form (§5 q7) | keep; the "refutation" framing should say *whose* conjecture |
| 52 | "new formal theorem (algebra)" | axiomatization of classical CCR/CAR; the ε-universal dual-family lemma is new-as-stated but elementary; the sign layer now has a physlib nearest neighbor (`ExchangeSign`, 2026-11-13) | (ii)/(iv) | Greenberg quons; Bożejko–Speicher; physlib `ExchangeSign` (dated nearest neighbor, recorded in the article's own addendum); no OccupationPair anywhere (§5 q8) | README kind overstates: "new formal theorem" → "axiomatization + universal lemma" |
| 32 | "new theorem (complexity/analysis)" | genuine: frontier function Γ(ε) + unique crossing + phase transition is new (nobody states a frontier *function*; verified no frontier/crossing in the donor — §5 q9), but the proof is calculus-level and the object is a certificate class already numerically superseded | (i), moderate | Majdoddin arXiv:2610.17420 (D ≤ N^0.172, own Lean repo); arXiv:2610.20297; donor Corollary 31 | keep with the "superseded-at-birth" caveat the article already carries |
| 42 | "first formal ζ_K zero-density theorems" | corollarical assembly (its own word), first *formal* ζ_K statements; math content = multiplicity additivity + inclusion–exclusion | (ii)+ (statement-class first) | DLRT (nearest informal; GRH/fixed-K/distinct — erratum applied); no Levinson-type ζ_K proportion in literature (§5 q2) | **terminology mislabel: "zero-density" means N(σ,T)-style bounds in the literature; these are on-line *proportion* lower bounds. Rename.** |
| 20 | "structural theorem + obstruction analysis" | engine seam is an interface (Thms 1–3 conditional glue); the seam analysis (Thms 4–5 + hCZ discussion) is knowledge-level; nothing analytic proved | (iv)+(v) | zeta23's own engine; classical common-zero questions (Li 2012, Garunkštis–Kalpokas); Ingham/Huxley density estimates | demote framing from "structural theorem" to "conditional interface + knowledge-level obstruction analysis" |
| 11 | "new formal framework" | the calculus formalizes folklore composition ("calls multiply, extras add" — article admits folklore); M1 acceptance test is fine engineering; B(ii) (Cycle 2) is realization glue | (iv) | Vassilevska Williams surveys; Williams–Williams 2010; AFP Cook_Levin `Composing.thy` (nearest formal, different shape); no composition calculus in the donor (§5 q10) | soften "new formal framework" → "formal calculus for folklore composition" |
| 50 | "negative result + formal corollary" | Part I is a source-reading observation about the *donor's proof architecture* ("no statement of form X exists within the engine") — knowledge-level, not a theorem of mathematics; Part II formalizes the donor preprint's printed Cor. 1.2 | (v)+(iii) | openai preprint Cor. 1.2; A–F/Montgomery–Taylor structure | Part I never deserved "theorem" billing; it is a (correct and useful) reading |
| 21 | "negative result" | certified numerics (not kernel-verified), negative, consistent with the literature's optimality view; TRIAGE already scored it 1.5 | (v) | CCLM17 Cor. 14; A–F §1.4; Knausgård §7.6 (A2-form proved formally by him) | should not be a standalone article; fold into dossier 02 as a case study (TRIAGE's own decision) |
| 22 | "formalization (classical theorem) — not new mathematics" | honest and correct; the Cycle-2 closure note (T2b closed by upstream) is knowledge-level bookkeeping, correctly labeled | (ii)+(v) | Hadamard–dVV; Ikehara; Eberl–Paulson (Isabelle); upstream PrimeNumberTheoremAnd `StrongPNT` | none — this article is the honesty template the others should follow |

**Main-run ranking by discovery strength:** 01 > 30 > 32 > 52 > 42 > 11 > 20 > 50 > 21 ≈ 22.

---

## 3. Named weak spots that most plausibly drove the bad feedback

1. **Article-count inflation vs. genuine-discovery count.** 18 article files for a
   project whose genuinely-new-mathematics count is ~4–5 items (01, 30, 32, arguably 75's
   statement class and 52's universal lemma). Donor-swaps (42-M4), binder discharges
   (50-M2), vocabulary layers (73), and certified numerics (21) each received
   standalone, equal-format articles. A cold reader flipping the README sees 18
   "discoveries" and then discovers that most of them say "not new mathematics" in their
   own honesty sections. The packaging invited the verdict it got.

2. **Conditional-on-open-core shells marketed as discoveries.** Nearly every Cycle-2
   theorem carries the mathematical load as a hypothesis binder: 75's component
   proportions (open for every Hecke L), 42/42-M4's χ-column (zeta23 Theorem E, a
   hypothesis forever so far), 73's hRat + hPur (Weil RH as binder), 71's WeilData, 72's
   hKL (Kuwahara as binder), 11-B(ii)'s three eth interfaces, 10's unproved assembly.
   The decision text still calls 75 "the cycle's discovery-grade core" — but Theorem B
   of 75 is *exactly as strong as* "every Hecke component has 2/3 on-line", which nobody
   can discharge. To an outside reader this reads as: theorems about hypotheses.

3. **The Cycle-2 "discovery headline" was an ecosystem upgrade.** TRIAGE's Cycle-2
   decision: "The discovery headline is … the 42→42-M4 line … and its abelian-tower
   generalization (75)". 42-M4's own article states "There is no new analytic
   mathematics." Headlining a donor-swap as the cycle's discovery is the single most
   likely trigger of the bad feedback.

4. **Formalization-first items consumed discovery-grade billing.** 71 and 73 are honest
   internally, but the triage score (71: rank 5.8) and article billing treat
   "first formal statement of textbook mathematics" as a discovery. The 2026 cluster
   (Liu-1/2, tracker, Kontorovich) is industrializing this territory; being first-formal
   at a weaker constant is a race we already documented as lost.

5. **External refutations relabeled as our negative results.** Article 72's "no-go gate"
   fences Kuwahara's refutation; the mathematical content of the no-go is his theorem,
   and his abstract already announces it (he even proves his own rank-error trade-offs).
   Articles 30/50 (the claimed lineage) are different in kind: 30 refuted *our own*
   conjecture and 50 Part I read *our target engine*. Calling 72 the same kind of
   result inflates it.

6. **Terminology mislabels.** Article 42's README kind "first formal ζ_K zero-density
   theorems": in the literature "zero-density" denotes N(σ,T) upper bounds; what was
   proved are on-line *proportion lower bounds* (the article's own title is correct —
   the README kind column is not). Same family: article 10's slug
   "10-uniform-poly-space-eth-refutation" for an article whose headline is OPEN; article
   11's "new formal framework" for a formalized folklore calculus.

7. **Constants stale on arrival, repeatedly.** 50-M2 lands 7/8 after the tracker already
   sits at 0.8733458561; 42's constants two generations stale. The articles are honest
   about it; the billing was not always.

---

## 4. The STRENGTH BAR (proposed for Iteration 4)

A candidate earns a research article only if **all four** hold:

**S1. Statement-level novelty with a named nearest-miss.** The *mathematical* statement
(not the formalization, not the constant) is absent from all corpora and from the
informal literature; the nearest prior art is named at paper+theorem (or corpus
file:decl) granularity; the delta over it is stateable in one sentence. Required
evidence recorded in the dossier: the direct-source `rg` queries run (per the AGENTS.md
decl-index caveat, a TSV hit or miss proves nothing), and the literature sweep.
*Corollary-level lemmas do not pass S1 even when unclaimed — "nobody stated that sums of
asymptotic inequalities are asymptotic inequalities" is true and worthless.*

**S2. Essential multi-corpus bridge.** The result must use content from ≥ 2 corpora in a
way that neither could produce alone (e.g. zeta23's method + tauceti's factorization;
eth's machine + openai's space monitor). A statement one corpus could prove alone is a
port. A statement *no* corpus's mathematics enters — pure schema lemmas over binders —
is not a bridge; it is bookkeeping about hypothetical inputs.

**S3. Non-trivial proof content OR a surprising statement.** Either (a) the proof
contains a mathematical step beyond binder-passthrough, finite-sum bookkeeping,
monotonicity + `norm_num`, and identity-principle extension; or (b) the statement is
itself the discovery — an exact identity (article 01), a refutation of a stated
conjecture (article 30's B2), a phase transition (article 32's ε*). Elementarity is
acceptable only in case (b).

**S4. Discharge discipline for conditional results.** A conditional theorem is
article-eligible only if (a) every binder is a *named open problem with a citation*, not
a restatement of the conclusion; (b) at least one previously-open binder is discharged
in the same article, or the schema itself is the discovery and the article title carries
the conditionality; (c) no binder is silently the donor's theorem (that is class (iii),
an upgrade, and is billed as such).

**Demotions (everything else):** formalization-first layers, donor swaps, binder
discharges, interface/vendor layers, certified numerics, race/tracker bookkeeping →
dossier entries, pilot notes, ledger rows, or (at most) technical notes. They stay
first-class *engineering* deliverables with their own verification records; they stop
being "discoveries" with articles.

### Items to DEMOTE or RETRACT-AND-RELABEL as they stand

1. **50-M2** — retract as a research article; relabel "donor-consumption substrate
   note" (or fold into article 50 as a Part II addendum). Statement = donor preprint's
   Cor. 1.2; zero math; the article's own honesty section is the demotion argument.
2. **21** — retract as a standalone article; fold into dossier 02 as a certified
   numerical case study (TRIAGE already demoted it to rank 1.5; the article outlived the
   decision).
3. **73** — demote to dossier/pilot record until Q4 (hRat discharge) lands; even then it
   stays formalization-first. Keep the verified statement layer as an artifact.
4. **42-M4 + Cycle-2 decision text** — keep the article (it is scrupulously honest) but
   relabel the cycle headline: 42→42-M4 is an *ecosystem/donor-swap upgrade*, not "the
   discovery headline"; README kind column already says donor-swap — make the triage
   typeset say the same.
5. **11** — relabel kind: "formal calculus for folklore composition (acceptance-tested
   on donor Theorem 19)"; not "new formal framework".
6. **42 README kind** — fix "zero-density" → "on-line zero-proportion (lower-bound)
   statements" in `research/articles/README.md`.
7. **10** — slug/filename overclaim: article title is honest, filename
   `10-uniform-poly-space-eth-refutation.md` is not (headline OPEN). Rename file or add
   a "layers toward" banner at the top of the README table entry.
8. **72** — headline softening in README kind: "negative result" → "formal fence around
   Kuwahara's refutation (external content) + interface layer".
9. **20** — kind → "conditional interface + knowledge-level obstruction analysis".
10. **52** — kind → "axiomatization + ε-universal dual-family lemma (formal)".
11. **50 Part I** — kind → "source-verified structural observation (knowledge-level)";
    it is not a theorem about mathematics, and the article should stop calling its
    Proposition 1 a result of the same rank as its Part II theorems.

Items that pass the bar as they stand: **01** (unconditional identity, clean), **30**
(closed form; with the "own conjecture" caveat), **32** (frontier function; with the
superseded-constants caveat), **75** (statement class + schema, *if* titled and
abstracted as conditional — S4(b) applies: the schema is the discovery), and arguably
**22** as the honesty exemplar of class (ii). 42 passes S1/S2 at formal-first grade
only; it should be billed as such.

---

## 5. Direct-source queries run this session (the AGENTS.md caveat honored)

Every query below was run 2026-11-16 in the sibling trees (read-only). Hit/miss
recorded; "miss" = no match in the named scope.

1. **ζ_K/ζ_L zero-proportion absence (75, 42):**
   - `rg -il "proportion|EpsLower|onLine|on_line|critical.?line" tauceti/TauCeti/NumberTheory/LFunctions/` → 1 hit, `Zeros/Completion/RiemannZeta.lean`, which contains only a doc comment on reflection symmetry (no proportion statement). **tauceti: no proportion content.**
   - `rg -n "proportion|Dedekind|hecke|Hecke" axiommath/ZetaZerosV2/ZetaZeros/Main.lean` → proportions are ζ-only (`simple_proportion_lower/d4`, `distinct_proportion_lower/d5`). **V2: ζ-only.**
   - `rg -il "proportion|zeroCount|count.*zero" axiommath/DedekindZetaZeroFree/` → hits are Poisson/moment-bound files; no zero-proportion theorems. **DZDF: zero-free only, no counting.**
   - zeta23 `Zeta23/Assembly.lean` read at head: it is the ζ counting-inequality assembly (Thms A/B/C), not an L-function factorization assembly. **zeta23: ζ/Dirichlet only.**
2. **Literature (informal) Levinson-type ζ_K on-line proportion (75, 42):** arXiv
   full-text search `"Dedekind zeta" "critical line"` (15 results, fetched 2026-11-16) →
   no Levinson-type on-line proportion for ζ_K/ζ_L exists; nearest are DLRT
   arXiv:1908.04876 (45% distinct, GRH, fixed quadratic) and Bansal–Maji arXiv:2507.18121
   (Hardy-type infinitude of on-line zeros, any number field). **75/42's statement-class
   claim SURVIVES; the corollary-level cap is mathematical, not novelty-based.**
3. **s-plane FF zeta absence (71):** `rg` over `encore-mathlib/…/Mathlib`, `tauceti`,
   `axiommath` for `zetaC|q^(-s)|exp(-s*log q)` patterns → no hits beyond unrelated
   number-field continuation files; `Mathlib/NumberTheory/FunctionField.lean` contains
   no "zeta" content (`rg -in "zeta"` → miss). **Absence confirmed.**
4. **FF ray-class characters (73):** `rg -l "RayClass"` over tauceti/mathlib/Weil/V2 →
   all hits number-field (`TauCeti/NumberTheory/NumberField/Global/Orders/RayClass.lean`
   etc.); DZDF `RayClassCharacter` is number-field (Challenge file, as cited); no k[X]
   variant anywhere. **Absence confirmed.**
5. **Rényi/quantum entropy in mathlib (72):** `rg -rl "enyi"` over Mathlib → only
   Erdős–Rényi random graphs; `vonNeumann` hits only ZFC ordinals. **No Rényi entropy,
   no quantum entropy in mathlib — confirmed (the pilot's own definition claim).**
6. **zeta23 defect/identity absence (01):** `rg -in "defect|master" anthropics_formal-math/zeta23/` →
   only `"master"` lake-manifest inputRev strings. **No defect decomposition in the
   donor — confirmed.**
7. **eth Q_s closed form absence (30):** `rg -in "closed|N_|numberOp|secondDiff"
   eth/proof/statements/AppHalfPiecesStatement.lean` → miss. **Donor has LemmaQ only —
   confirmed.**
8. **OccupationPair absence (52):** `rg -rl "OccupationPair|occupation pair"` over all
   sibling trees → only openai `CoulombIonization/Fermionic/OccupationPairDensity.lean`
   (a fermion *density* object, not the CCR axiomatization). **Absence confirmed**
   (consistent with the physlib `ExchangeSign` nearest-neighbor note).
9. **Frontier absence (32):** `rg -in "frontier|crossing" 3sum-apsp/PaperStatements.lean`
   → miss. **Donor states frozen constants only — confirmed.**
10. **Corpus split for 10:** `rg -in "space" eth/MainResults.lean` → no
    space-complexity content (matches only "namespace"); `rg -in "fixed|uniform"`
    `openai-math/…/SubexponentialSAT/SqrtLogSpace/Final.lean` → "One fixed primitive
    machine" (per-k). **Conjunction absence confirmed.**
11. **openai donor statements (50-M2):** `OAI/NumberTheory/DirichletL/Nonvanishing.lean`
    lines 15–33 read verbatim: both 7/8 theorems present exactly as cited.
12. **3sum-apsp composition-calculus absence (11):**
    `rg -in "def Red|compose|structure Red|.comp" 3sum-apsp/…/Sec3/Definitions.lean` →
    miss. **No reduction-composition calculus in the donor — confirmed.**
13. **Kuwahara abstract (72):** arXiv:2610.15199 abstract fetched 2026-11-16 — title
    "The Rényi area law conjecture is false below α = 1 in high dimensions"; abstract
    states the disproof, the von-Neumann-area-law coexistence, *and* the paper's own
    rank-error trade-off theorem. The log-rank no-go is a one-line corollary of his
    volume law via S₀ ≥ S_α. *[R7 precision folded 2026-11-16
    (`novelty/iter4-external-priorart.md` §2.4): dimension scope every d ≥ 2; his
    trade-off concerns approximate projectors (positive sub-boundary log-rank upper
    bounds) and does NOT state the boundary-linear log-rank no-go — the stated no-go
    and the S₀ ≥ S_α bridge are article 72's increment. Applied in
    `r2-rewrite-72.md`.]*

---

## 6. One-paragraph bottom line

The main run produced three genuine pieces of new mathematics (01's five-defect
identity, 30's Q_s closed form + refutation, 32's frontier function) and one genuinely
new statement class (42/75's ζ_K/ζ_L proportion family, corollary-level but unclaimed).
Everything else in the 18-article corpus is, in descending order: honest formalization
of classical mathematics (22, 71, 73, 52), donor-swaps and binder discharges of our own
shells (42-M4, 50-M2), glue/interface/vendor layers (11, 20, 72-M1, 10's layers,
11-B(ii)), external refutations fenced (72-C-neg), and knowledge-level records (50
Part I, 21, 22-T2b, the QR-D race notes). The bad feedback was most plausibly driven by
billing the second and third categories as discoveries — above all the Cycle-2
"discovery headline" being a donor-swap with no new mathematics, and 18 articles
existing at all. Iteration 4 should adopt the four-point strength bar above, demote or
relabel the eleven items listed in §4, and reserve the word "discovery" for what
survives it.

---

# Part B — restructuring package (orchestrator queue, 2026-11-16)

Adopted-bar follow-up: exact relabel/edit proposals (§7), corpus restructuring plan
(§8), completion paths for the genuine core (§9). No files outside this deliverable were
touched; every proposal below is old→new text for H (or the owning lane) to splice.
Line numbers verified against the on-disk files this session.

## 7. Relabel/edit proposals (exact text)

### 7.1 articles/README.md table rows (kind + status columns)

**R1 — README.md:17 (row 42, kind).**
- old: `first formal ζ_K zero-density theorems`
- new: `first formal ζ_K on-line zero-proportion lower bounds (formal-first; "zero-density" = N(σ,T) bounds — wrong term, retired)`
- why: the articles prove on-line proportion *lower bounds*; "zero-density" names a
  different object in the literature and misleads on its face.

**R2 — README.md:39 (row 75, kind).**
- old: `new theorem class (n+1-factor assembly; first ζ_L proportion statements)`
- new: `conditional statement-class first (first ζ_L proportion statements; component-proportion binders = the open core; assembly mathematics is corollary-level)`
- why: driver 2 — keep the first-claim, carry the conditionality and the corollary-level
  cap into the kind cell itself.

**R3 — README.md:40 (row 42-M4, kind).**
- old: `donor-swap upgrade of article 42`
- new: `donor-swap upgrade of article 42 — on-line proportion lower bounds (formal-first); no new mathematics (§1 Honesty)`
- why: driver 3 — the row is honest today only in the article body; make the table cell
  say it.

**R4 — README.md:43 (row 72, kind).**
- old: `negative result + glue`
- new: `formal fence around Kuwahara's refutation (the no-go is his, arXiv:2610.15199; N1–N3 are textbook) + interface layer`
- why: driver 5 — the refutation must be attributed; "negative result" claims it for us.

**R5 — README.md:44 (row 50-M2, kind).**
- old: `binder discharge of article 50's shell`
- new: `binder discharge of article 50's shell — formalizes the openai preprint's own Cor. 1.2 (technical record; no new mathematics)`
- why: priority item — the statement discharged is printed in the donor preprint
  (*The Quasi-Riemann Hypothesis*, proof of Cor. 1.2); the table must not read as a
  fresh theorem.

**R6 — README.md:45 (row 10, link + status).**
- old: `[Toward One Machine for All k: Space-Certified Layers](10-uniform-poly-space-eth-refutation.md) | three proved layers toward a uniform poly-space ETH refutation | **layers proved; headline OPEN** (assembly tranche carried)`
- new: `[Toward One Machine for All k: Space-Certified Layers](10-layers-toward-uniform-poly-space-eth-refutation.md) | certified layers toward an OPEN headline (technical record) | **HEADLINE OPEN** — three layers proved (M1/L1/L2, 151 thms ⊆ triad); assembly tranche carried to Iteration 4`
- why: priority item — the filename itself claims the refutation; status must lead with
  OPEN (paired with the file rename in §7.2.A1).

**R7 — README.md:19 (row 11, kind + status).**
- old: `new formal framework | M1 **proved**; machine realizations open`
- new: `formal calculus for folklore composition (acceptance-tested on donor Thm 19) | M1 **proved**; Theorem B(ii) TM2 realization **proved** (Cycle 2, on three eth interface hypotheses); word-RAM half + M3 open`
- why: kind softening per §2 verdict; the status is also stale (B(ii) landed, "machine
  realizations open" is false as of 2026-11-14).

**R8 — README.md:15 (row 52, kind).**
- old: `new formal theorem (algebra)`
- new: `axiomatization + ε-universal dual-family lemma (formal-first)`
- why: §2 verdict — "new formal theorem" overstates an elementary universal lemma over
  classical CCR/CAR.

**R9 — README.md:18 (row 20, kind).**
- old: `structural theorem + obstruction analysis`
- new: `conditional interface (engine seam) + knowledge-level seam analysis`
- why: §2 verdict — Thms 1–3 are a conditional interface; the seam discussion is
  knowledge-level; "structural theorem" inflates.

**R10 — README.md:20 (row 50, kind).**
- old: `negative result + formal corollary`
- new: `source-verified structural observation (knowledge-level; about the donor's proof architecture) + formal corollary of a donor-printed statement`
- why: §2 verdict — Part I is a reading, not a theorem; Part II formalizes the donor's
  Cor. 1.2-shaped statement.

**R11 — README.md:21 (row 21) — row removed, replaced by pointer.**
- old: `| 21 | [The ξ′-Tuned Quartic Window Does Not Improve the ζ Constant](21-quartic-window-transplant-certified-loss.md) | negative result | **certified numerically** (not kernel-verified) |`
- new: `| 21 | *(moved)* certified numerical comparison → `research/pilots/21-certified-comparison.md` (certificate, not an article per the Iter-4 strength bar) | numerical certificate | **certified numerically** (not kernel-verified); content folded into dossier 02's case study |`
- why: priority item — a certified-numerical negative computation is a certificate, not
  a research article; TRIAGE had already demoted the candidate to rank 1.5.

**R12 — README.md:42 (row 73, kind).**
- old: `formalization-first statement layer`
- new: `formalization-first statement layer (technical record; hRat/hPur never discharged; Q4 pending)`
- why: §1 verdict — both theorems are one-step consequences of 71's Core 1 under
  binders; the kind cell must carry the binder status.

**R13 — README.md:14 (row 30, kind).**
- old: `refutation + new closed form`
- new: `new closed form + refutation of a project-formulated conjecture`
- why: honest ordering — the discovery is the closed form; the refuted conjecture was
  ours, and the cell should say whose.

### 7.2 Article in-file headers/status lines

**A1 — articles/10-uniform-poly-space-eth-refutation.md:1 and :9 (also the filename).**
- file rename: `10-uniform-poly-space-eth-refutation.md` → `10-layers-toward-uniform-poly-space-eth-refutation.md` (paired with R6's link update; cross-reference sweep in TRIAGE/STATUS/ledger — H owns).
- old (:9): `**Status: three layers PROVED; headline theorem OPEN.** M1 (space-annotated host`
- new (:9): `**Status: HEADLINE OPEN (not a theorem of this article). Three layers PROVED.** M1 (space-annotated host`
- why: the status already says OPEN but mid-sentence; the priority asks that OPEN lead.
  The title (line 1) already says "Toward" and can stand.

**A2 — articles/50M2-unconditional-strip-confinement.md:1 (title) and :9 (status).**
- old (:1): `# Unconditional Strip Confinement for ζ in Lean: Discharging the Quasi-RH Hypothesis of Article 50`
- new (:1): `# Discharging Article 50's Strip Shell at the Donor Pin: the openai Preprint's Corollary 1.2, Formalized (Technical Record)`
- old (:9): `**Status: PROVED, FINAL.** \`strip_confinement_seven_eighths\` holds with no hypotheses:`
- new (:9): `**Status: PROVED, FINAL — technical record (class (iii) binder discharge; no new mathematics).** The mathematical statement is the donor preprint's own Cor. 1.2 (*The Quasi-Riemann Hypothesis*, 2026-09-30; see article 50 §Relation). \`strip_confinement_seven_eighths\` holds with no hypotheses:`
- why: priority item — headline must reframe as binder-discharge of a donor-printed
  corollary with the preprint citation in the status line.

**A3 — articles/72-renyi-monotonicity-nogo-gate.md:1 (title), :9 (status), :26–28 (abstract).**
- old (:1): `# The Rényi Monotonicity No-Go Gate for Area-Law Rank Statements (with the Family-265 Interface Layer)`
- new (:1): `# A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws (with the Family-265 Interface Layer)`
- old (:9): `**Status: PROVED, FINAL.**`
- new (:9): `**Status: PROVED, FINAL — fence, not refutation.** The refutation is Kuwahara's theorem (arXiv:2610.15199, hypothesis \`hKL\` here); N1–N2 are textbook; our layer is the kernel-verified gate N3 plus the interface chain.`
- old (:26–28): `A consequence is never stated in the\ncorpora we surveyed, yet it is what any "rank concentration from a spectral gap"\nproposal would run into. The consequence: no bound of the form`
- new (:26–28): `The log-rank consequence — no bound of the form`
- and at :30 after `that log rank = S₀ ≥ S_α.` insert: `It is an immediate corollary of his theorem (his abstract announces the refutation and proves its own rank-error trade-offs); the fence below, not the consequence, is our contribution. We formalize the chain that makes the gate a theorem:`
- why: priority item — attribute the no-go; delete the "never stated in the corpora"
  framing (its mathematical content is one line of Kuwahara + monotonicity, and his
  paper states rank statements of its own).

**A4 — articles/42-quadratic-dedekind-zeta-zero-proportions.md:27–28 (abstract).**
- old: `These are the first formal zero-density statements for a number-field zeta\nfunction, and form (ii) improves the literature's 45%-distinct statement`
- new: `These are the first formal on-line zero-proportion statements for a number-field zeta\nfunction, and form (ii) improves the literature's 45%-distinct statement`
- why: same terminology fix as R1, applied in-file where the phrase actually occurs.

**A5 — articles/42M4-zetaK-proportions-unconditional-zeta-column.md:11 (status).**
- old: `**Status: PROVED, FINAL.** \`M4b.lean\` (1,571 lines, 68 theorems) imports`
- new: `**Status: PROVED, FINAL — technical record (donor-swap of article 42; "There is no new analytic mathematics", §1).** \`M4b.lean\` (1,571 lines, 68 theorems) imports`
- why: the honesty exists at §1 but the status line is where readers (and skimmers)
  stop.

**A6 — articles/20-common-zero-seam-dedekind-zero-density.md:7 (status).**
- old: `**Status: conditional core PROVED, kernel-verified**`
- new: `**Status: conditional interface PROVED, kernel-verified (technical record: engine seam + knowledge-level seam analysis — not a discovery article)**`
- why: R9's in-file anchor.

**A7 — articles/11-call-charged-reduction-calculus.md:7–8 (status lead).**
- old: `**Status: Milestone 1 PROVED, kernel-verified**`
- new: `**Status: Milestone 1 PROVED, kernel-verified (formal calculus for folklore composition — technical record; the acceptance test, not the calculus, is the article's deliverable)**`
- why: R7's in-file anchor; consistent with §6's honesty about folklore.

**A8 — articles/30-boson-operators-second-difference-closed-form.md:1 (title).**
- old: `...Second Differences of Number Operators: Refutation of a Parseval Conjecture and a Closed Form at h = 1`
- new: `...Second Differences of Number Operators: Refutation of a Project-Formulated Parseval Conjecture and a Closed Form at h = 1`
- why: R13's in-file anchor — the conjecture was ours.

**A9 — articles/73-formal-tate-dictionary-function-field.md:8 (status).**
- old: `**Status: PROVED at Tier C, FINAL.**`
- new: `**Status: PROVED at Tier C, FINAL — formalization-first technical record (hRat/hPur never discharged; Theorems 1–2 are one-step consequences of article 71's Core 1).**`
- why: R12's in-file anchor.

**A10 — articles/50-zero-free-regions-cannot-move-certificate-constants.md:30 (Part I heading).**
- old: `## Part I — the structural negative result`
- new: `## Part I — structural observation, source-verified (knowledge-level; a reading of the donor's proof architecture, not a theorem about mathematics)`
- why: R10's in-file anchor; also fix the same phrase in the article's status line
  (:6, "Part I (structural negative result) is a source-verified mathematical argument")
  → "Part I (source-verified structural observation, knowledge-level) is a reading of
  the donor's engine, not a theorem".

**A11 — articles/75-abelian-assembly-zetaL-proportions.md:10 (status).**
- old: `**Status: PROVED (entry milestone), FINAL for Cycle 2.**`
- new: `**Status: PROVED (entry milestone), FINAL for Cycle 2 — discovery-grade at the statement-class level only (strength bar S4(b)); the assembly mathematics is corollary-level and every analytic input is an open binder.**`
- why: R2's in-file anchor; driver 2.

**A12 — articles/52-statistics-universal-occupation-calculus.md:1 (title, softening only if H prefers).**
- optional: append ` (an axiomatization)` after `Calculus` — or leave the title and rely on R8. Recommended: leave the title; R8 suffices.

### 7.3 Weak-spot-driver edits (README prose + one H-owned TRIAGE line)

**D1 (driver 1, article-count inflation) — README.md:24 (main-run ordering note).**
- old: `Ordering above is by how new the mathematics is (01, 30, 52, 32 first), not by triage\nrank.`
- new: `Ordering above is by how new the mathematics is (01, 30, 52, 32 first), not by triage\nrank. Honest counts under the Iter-4 strength bar\n(\`qa/iter4-review/r2-discovery-strength.md\`): **5 discovery-grade articles (01,\n30, 32, 42, 75 — 75 conditional), 9 technical records, 1 numerical certificate moved\nout of articles (21), 2 records merged (42-M4, 50-M2).**`

**D2 (driver 3, Cycle-2 headline was an ecosystem upgrade) — TRIAGE.md:243–247 and TRIAGE-C2-ROWS.md:106–110 (H-owned typeset).**
- old (both files, identical sentence): `The discovery headline is **not a constant and not a\nfirst-formal claim in the hot cluster** — it is the **first formal zero-proportion and\nzero-location statements for Dedekind zeta functions of non-quadratic shape**: the\n42→42-M4 line (quadratic ζ_K proportions, now with an unconditionally discharged\nζ-column) and its abelian-tower generalization (75, executing).`
- new: `The cycle's discovery-grade output is **one conditional statement class** — the first\nformal zero-proportion and zero-location statements for Dedekind zeta functions of\nnon-quadratic shape, generalizing to the abelian tower (75, executing). The 42→42-M4\nline is its **ecosystem/donor-swap completion** (unconditional ζ-column inside Lean; no\nnew mathematics, per the article's own §1) and is billed as a technical record, not a\ndiscovery headline (Iter-4 strength bar).`
- why: the single most damaging sentence in the corpus; both copies must move together.

**D3 (driver 4, formalization-first billing) — README.md:49–53 (Cycle-2 closing note).**
- old: `Ordering is by how new the mathematics is. Knowledge-level records (the Liu-1 constant\nstory, the QR-D race state incl. the QuasiRiemannTracker audit and the formal Dirichlet\nfrontier 0.8733458561) live in article 50-M2 and dossier 70's standing notes rather than\nin separate articles.`
- new: `Ordering is by strength-bar class. Formalization-first items (71, 73, 22) are technical\nrecords of classical mathematics (Weil 1948; Tate/Weil/Rosen; Hadamard–dVV), not\ndiscoveries. Knowledge-level records (the Liu-1 constant story, the QR-D race state\nincl. the QuasiRiemannTracker audit and the formal Dirichlet frontier 0.8733458561)\nlive in dossier 70's standing notes and the verification ledger, not in articles.`
- why: closes the "first formal X = discovery" reading the current text invites; also
  stops routing knowledge records through article 50-M2 (which D2/§8 merges away).

**D4 (driver 6, terminology) — README.md:34 (Cycle-2 intro) — optional.**
- old: `One article per Cycle-2 discovery, each standalone.`
- new: `One article per Cycle-2 deliverable, each standalone; kind column carries the strength-bar class.`
- why: "per Cycle-2 discovery" is false for at least five of the nine rows.

**D5 (driver 2, conditional shells) — no single-line fix; carried by R2, R5, R12, A2, A9, A11.** Recorded here so the mapping driver→edits is complete.

## 8. Corpus restructuring plan (verdict per file)

Sections for the restructured README: **Discovery-grade**, **Technical records**,
**Notes & certificates**. Target counts: **5 / 9 / 3** (down from 17 article files +
1 article-count of implicit parity).

| file | verdict | target section / action | effort | argument |
|---|---|---|---|---|
| 01-inertial-defect-master-identity.md | **KEEP** | Discovery-grade | S (none) | the project's strongest unconditional new theorem (§2) |
| 30-boson-operators-second-difference-closed-form.md | **KEEP** | Discovery-grade (title edit A8) | S | closed form is a new theorem about a corpus-internal family; refutation is of our own conjecture — the edit makes that legible |
| 32-rc-savings-frontier.md | **KEEP** | Discovery-grade | S | frontier function + phase transition, unclaimed (verified §5 q9); caveat text already in place |
| 75-abelian-assembly-zetaL-proportions.md | **KEEP** | Discovery-grade (conditional; edits R2+A11) | S | the one Cycle-2 statement-class first; conditionality must ride the title/status (S4(b)) |
| 42-quadratic-…zero-proportions.md + 42M4-…md | **MERGE** | Discovery-grade (42) + 42-M4 retired to a Cycle-2 addendum §, file moved to `pilots/42/` as the artifact record | **M** | one theorem family, two billing units: 42-M4 supersedes 42's ζ-column and its own article says "no new analytic mathematics". Merge = article 42 gains a §Cycle-2 addendum (the article-11 precedent), 42-M4's unique content (V2 glue, M4a vocabulary, donor-hygiene record) moves to the pilot record + verification ledger. Keeps the frozen-main-run convention intact by *appending*, not editing, 42's main-run sections |
| 50-zero-free-…md + 50M2-…md | **MERGE** | Technical records (50) + 50-M2 folded in as §Part II discharge; G7b audit trail → `feasibility/` ledger | **M** | 50-M2 is the discharge of 50's own Part II binder, and the statement is the donor preprint's Cor. 1.2; a standalone article double-counts one shell. The substrate pattern (28-layer donor build, axiom audit) is verification-ledger material, not article material |
| 21-quartic-window-…md | **DEMOTE-to-dossier** | Notes & certificates: move file to `research/pilots/21-certified-comparison.md`; content folded into dossier 02 as §Case study | **S** | certified numerics ≠ article (ground rules: kernel or certified-math claim; this is a comparison certificate of two known constants); TRIAGE had already demoted the candidate to 1.5 |
| 10-uniform-poly-space-eth-refutation.md | **RELABEL** (+ rename, A1) | Technical records | **S–M** (rename + cross-ref sweep) | layers are formalized classical constructions toward an OPEN headline |
| 11-call-charged-reduction-calculus.md | **RELABEL** | Technical records | S | folklore composition calculus + realization glue |
| 20-common-zero-seam-…md | **REWRITE-FULL** → Technical records | restructure into "Interface theorem (conditional)" + "Seam analysis (knowledge-level)" | **M** | the current single-voice article reads as a structural theorem; the rewrite separates the proved interface from the paper analysis |
| 22-pnt-psi-form-…md | **RELABEL** | Technical records | S | formalization, honestly labeled — the template |
| 52-statistics-universal-…md | **RELABEL** | Technical records | S | axiomatization + universal lemma |
| 71-splane-zeta-curve-dictionary.md | **RELABEL** | Technical records | S | formalization-first of Weil 1948 (its own label; make the section assignment match) |
| 72-renyi-monotonicity-nogo-gate.md | **REWRITE-FULL** → Technical records | title/abstract/status refocus per A3; keep N1–N3 + interface sections | **S–M** | the worst misattribution in the corpus; surgical but deep (title + abstract + status) |
| 73-formal-tate-dictionary-…md | **RELABEL** | Technical records (condition: re-evaluate if Q4 lands) | S | statement-layer transplant; Q4 (hRat discharge) is the only event that would re-open the question |
| README.md | **REWRITE-FULL** | three-section structure, honest counts (D1), D3/D4 prose | **M** | the enabling rewrite; every row edit above lands here |

**Resulting README top-line:** "5 discovery-grade articles (01, 30, 32, 42⁺, 75 — 75
conditional), 9 technical records (10, 11, 20, 22, 50⁺, 52, 71, 72, 73), 1 numerical
certificate moved to pilots (21); 2 files merged away (42-M4 into 42⁺, 50-M2 into 50⁺)."
Total effort for the whole restructure: ≈ 3 M + 8 S (one lane-week).

## 9. Completion paths for the genuine core

**01 → stability/converse theorem (A4-converse).** Single highest-value completion:
prove the *qualitative stability converse* — if the five-defect sum is ≤ ε·scale, then
(P, Q) is O(√ε)-close (Frobenius) to a TightMult-type configuration (integer-weight
on-line atoms + c·I pair blocks). Converts bookkeeping identity → characterization
theorem (the equality case is the ε = 0 endpoint); nobody has any version of this (the
equality-case literature — AF v2 Lemma 3.2, So, Carlen 2010 — stops at single
configurations). Paper-first; Lean the diagonal/block-diagonal restriction first.
**Effort M** (paper M, Lean diagonal case S–M). **Slot-worthy: yes — Iter-4 flagship
continuation** (feeds R5; the identity is the project's strongest unconditional asset).

**30 → Theorem A (the ω-twisted Hall identification).** The dossier's original
discovery-grade claim (pairing a[−h]b = ω-twisted Hall inner product on symmetric
functions, Macdonald I §5), for which the h = 2 sign check is evidence and the closed
form is the h = 1 data point. This is the one completion that connects the eth appendix
to classical symmetric-function theory (Jing 1991 anchors verified by R8) instead of
staying corpus-internal. Generalizing the closed form to all h is messier and lower
value. Paper M (classical manipulations); Lean S–M for the coefficient-level identity.
**Effort M. Slot-worthy: yes, second-tier** (unlocks the 52-M2 weighted layer as a
follow-on).

**32 → discharge the crossing existence.** Prove in Lean that for every ε ∈ (0, ε*)
there *exists* c > 10 with `gammaOf(c, 9/10) > gmax(ε, c)` — IVT on the strictly
monotone difference, with the two explicit tail limits (gammaOf → ∞ as c → ∞ from
`ln((c−1)/9)`; gmax → −∞ via the proved `lnΛ_upper` linear bound; near 10⁺: gammaOf → 0⁺
and gmax(ε, 10) > 0 exactly when ε < ε*, both already available). Turns Theorem 5's
"crossing as parameter" into an unconditional parametric frontier theorem and closes
the article's only §5 gap. **Effort S–M** (the tail bounds are the work; ~300–600 LoC).
**Slot-worthy: yes — cheapest completion of a discovery-grade item.**

**75/42 statement class → discharge hEχ (zeta23 Theorem E) at the donor pin.** The
χ-column is the assembly's only remaining reducible binder, and zeta23's Theorem E is
the *only* 2/3-proportion source for Dirichlet L in any corpus (checked against every
surface this session: ZetaZerosV2 proportions are ζ-only — `axiommath/ZetaZerosV2/ZetaZeros/Main.lean:16–25`; DZDF is zero-free only, no counting — §5 q1; OAI is 7/8
location-only — `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19/:29`). Route: the
50-M2 pattern — build zeta23's own (small, v4.33) tree once at its pin, `#print axioms`
the Theorem-E chain (transitive audit), elaborate a consumer file there; the statement
then ports back as a discharged binder (statement port cost ≈ 0, measured corpus-wide).
Alternative donor: Knausgård's tree, which embeds zeta23 and derives ThmE-shaped
endpoints (TRIAGE row 42: "ThmE from zeta23-in-his-tree"). Payoff is two-tier:
(a) quadratic ζ_K 2/3 lands with **no analytic binders** at all; (b) 75's N2 ℚ-route:
every abelian L/ℚ has Dirichlet components, so ζ_L ≥ 2/3 for *every* abelian extension
of ℚ follows from one corpus theorem uniformly instantiated (plus the Dirichlet↔ray-class
dictionary glue, already specced in `pilots/75/Pb-design.md` context). That is the
cheapest path to a genuinely unconditional theorem in the project's flagship statement
class. **Effort M** (donor build S–M + audit + glue; proof port would be L — avoid).
**Slot-worthy: yes — Iter-4 flagship continuation; feeds R5 (statement-class depth) and
R9 (strength-bar S4(a) discharge-in-article).**

Priority order for Iter-4 slots: **75/42-hEχ (M) > 01-stability (M) > 32-crossing
(S–M) > 30-Theorem A (M)**. The first two are the difference between "conditional
statement class + identity" and "unconditional theorem class + characterization
theorem"; the last two close smaller but real gaps at lower cost.

---

## 10. hEχ-discharge mini-spec (Iter-4 flagship candidate; R5/R9 fold-target)

Objective: discharge the χ-column binder (`hEχ`, zeta23 Theorem E) of the 42/42-M4/75
assembly stack, converting the project's flagship statement class from S4(b)
schema-discovery toward S4(a) discharged-theorem. Two consumer shapes: (i) 42-v2 —
quadratic ζ_K ≥ 2/3 with all *proportion* inputs kernel-discharged; (ii) 75-N2 — ζ_L ≥ 2/3
for every abelian extension L/ℚ.

### 10.1 The donor theorem, verbatim

Core (`anthropics_formal-math/zeta23/Zeta23/ThmE/Final.lean:93–96`):

```
theorem thmE_A₀ (hq : 1 < q) (hprim : χ.IsPrimitive) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (2 / 3 - ε) * (NcountL χ T (2 * T) : ℝ) ≤ N0starL χ T (2 * T) :=
  thmE_A (LSeam_of hq hprim) hprim hq (paperInputsChi_L hq hprim)
```

- **Hypotheses: scope only** — `1 < q` and `χ.IsPrimitive`. No analytic card, no GRH, no
  uniformity caveat: **uniform over every primitive Dirichlet character χ mod q > 1**,
  unconditional within the donor.
- Public wrapper: `dirichlet_two_thirds_on_critical_line`,
  `zeta23/Solution.lean:106–109` (delegates to `thmE_A₀`). Companions: 2/3 simple-on-line
  `dirichlet_two_thirds_simple_on_critical_line` (`Solution.lean:111–114`, via
  `thmE_B₀_mult`), 5/6 distinct `dirichlet_five_sixths_distinct` (`Solution.lean:116–119`,
  via `thmE_C₀_mult`), MT-window 2−1/c₁* forms via `ThmDE.thmE_D₀*`.
- **Counting conventions** (`zeta23/Challenge.lean:92–108`, read verbatim this session):
  `IsNontrivialZeroL χ ρ := χ.LFunction ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1` (:92);
  `zeroMultL ρ := (analyticOrderAt χ.LFunction ρ).toNat` (:95);
  `zerosInL T₁ T₂ := {ρ | IsNontrivialZeroL ∧ T₁ < im ρ ≤ T₂}` (:98);
  `NcountL := ∑ᶠ ρ ∈ zerosInL, zeroMultL` (with-multiplicity denominator, :101);
  `N0starL := (zerosInL ∩ {re = 1/2}).ncard` (**distinct** on-line numerator, :105).
- **ζ column from the same corpus** (route-relevant): `two_thirds_on_critical_line_cumulative`
  (`Solution.lean:56–58` ← `Zeta23.thmA₀_cumulative`, `Zeta23/Final.lean`), and the sharper
  2−1/c₁* ≈ 0.6725 cumulative forms (`thmD₀_*_cumulative`).
- **Two convention deltas vs the pilot binder** (the bridge content, §10.3):
  (a) the donor numerator is *distinct*-on-line, the pilot's `EpsLowerCum` numerator is
  with-multiplicity — safe direction: distinct ≤ with-mult, so the donor bound implies the
  binder a fortiori (article 42 §4 records the argument); (b) the donor theorem is
  *dyadic* (T, 2T], the binder is *cumulative* (0, T] — conversion by summing the same
  inequality over the O(log T) dyadic blocks and absorbing the constant initial segment
  (no growth law needed beyond unboundedness of N(0,T]); zeta23 itself does this for ζ
  (`thmA₀_cumulative`), so the lemma pattern exists in-donor.

### 10.2 Statement-port status (ProbeE-precedent check, as required)

- **ProbeE** (`feasibility/port-probe.md` §8.2, runs 5–6): `Challenge.lean` A–D statement
  bodies transcribed verbatim as `def HypA/HypB_mult/HypC_mult/HypD : Prop` binder types
  at our pin (v4.36, mathlib `ff2494ea`) — **0 errors, 0 warnings**. Precedent: the
  zeta23 statement layer is binder-portable at ≈0 cost.
- **Stronger, already-landed evidence for E specifically:** the cumulative binder
  `hEχ : EpsLowerCum ⟨multOf fχ, hfinχ⟩ (2/3)` is *in the GREEN on-pin stack* —
  `pilots/42/M2b.lean:1067`, elaborated clean in every M2b/M4 green run. The binder-side
  elaboration risk is therefore zero-measured.
- **Residual probe (S):** the *verbatim* donor vocabulary (`NcountL/N0starL/
  IsNontrivialZeroL`, `Challenge.lean:92–108`) as binder Props at our pin — same pattern
  as ProbeE's Challenge.lean:131/145/157/163 bodies, expected ≈0 by the corpus-wide
  measurement; one probe run closes it. (Needed only for the on-pin binder transcription
  of route B; route A works in the donor's own vocabulary.)

### 10.3 Consumer shape (i): 42-v2 — quadratic ζ_K 2/3 with proportion inputs discharged

**Route A (single donor pin — recommended first tranche).** Elaborate inside zeta23's
own tree (v4.33.x at its pin), the G7b/R1 pattern:
1. Build zeta23 at its pin (≈40 modules over a cached pinned mathlib; Modal cost class
   **S** — compare V2's 8,262 jobs and OAI's 2,924 files; zeta23 is tens of files).
2. Hygiene: `#print axioms Zeta23.ThmE.thmE_A₀` + delegation roots (`thmE_A`,
   `LSeam_of`, `paperInputsChi_L` chain) — transitive triad audit, 0 sorryAx check.
3. Bridge glue at the donor pin (S–M, ~150–300 LoC): dyadic→cumulative summation;
   distinct→with-mult numerator dominance; window/multiplicity identification
   (`zerosInL`/`zeroMultL` ↔ `stripWindow`/`multOf` via an `EpsLowerCum_congr`-style
   congruence, `pilots/42/M2b.lean:958` pattern); ζ column from `thmA₀_cumulative`
   (same corpus — **do not cross donor pins**: V2 is v4.36-only, its import is
   impossible here; zeta23's own thmD₀_cumulative gives the 0.6725-grade ζ column if
   wanted).
4. Landing: `zetaK_two_thirds` at the zeta23 pin, **conditional only on the structural
   set** (window finiteness of ζ_K/ζ/L(χ_D), analyticity off s = 1, and the quadratic
   factorization ζ_K = ζ·L(χ_D) on Re s > 1 — the last transcribed as a statement
   binder from tauceti, which proves it at v4.36; statement-port ≈ 0).
Route A effort: **S–M** (build S, glue S–M, audit S). Result: the first ζ_K
zero-proportion theorem whose *analytic* inputs are all kernel-discharged; structural
binders remain (each a named classical fact).

**Route B (fully binder-free — second tranche).** On our pin: import tauceti (same
toolchain) to discharge the factorization and analyticity; write the window-finiteness
glue (discreteness of zeros of nonvanishing meromorphic functions on compacts — the one
analytic gap, **M**); keep `hEχ` as the last binder. At the zeta23 pin: a discharge file
proving exactly the binder Prop from ThmE (uses §10.2's on-pin vocabulary). Final
theorem documented cross-pin (the 50-M2/R1 precedent). Route B effort: **M** total.
Result: ζ_K ≥ 2/3 with zero analytic and zero structural binders — the S4(a) theorem.

### 10.4 Consumer shape (ii): 75-N2 — ζ_L ≥ 2/3 for every abelian extension of ℚ

Target statement: for every finite abelian L/ℚ, with-multiplicity cumulative on-line
proportion of ζ_L ≥ 2/3, for all large T.

**What it needs beyond zeta23-E + the 75 assembly schema (proved, `pilots/75/Pa.lean`) —
the flag answered: YES, one named piece, plus one binder:**

1. **[The named missing piece] the ℚ ray-class ↔ Dirichlet dictionary with L-series
   identification.** DZDF's factorization is stated over `RayClassCharacter K m` — a
   *functional structure on ideals* (multiplicative, supported on the coprime cone, 1 on
   principal ≡ 1 mod m; `Challenge/DedekindZetaChallenge.lean:14–20`, structure read in
   Cycle 2). For K = ℚ the dictionary must (a) identify such χ on ideals of ℤ with
   Dirichlet characters (ideals of ℤ ↔ ℕ, absNorm = id); (b) identify the Hecke series
   Σ'_I χ(I)·N(I)^{−s} with the Dirichlet L-series `L(s, χ̂)`; (c) handle imprimitivity —
   characters of the tower inflate to Dirichlet characters that need not be primitive,
   and imprimitive L differs from its primitive associate by finitely many Euler factors
   `1 − χ̂(p)p^{−s}` whose zeros lie on **Re s = 0, outside the critical strip**, so
   window counts are unaffected; this argument belongs in the glue (plus the `q > 1` /
   `IsPrimitive` scope bookkeeping for ThmE). **Absent from every corpus** (verified:
   all `RayClass` hits are number-field machinery — `TauCeti/NumberTheory/NumberField/
   Global/Orders/RayClass.lean`, DZDF challenge, vendor CFT; no ℚ→DirichletCharacter
   bridge anywhere). This is exactly the piece article 75 §7.3 names ("the Dirichlet ↔
   ray-class dictionary it needs"). Estimate **S–M**.
2. **[The binder] the abelian factorization for K = ℚ.** `abelianFactorization`
   (`axiommath/DedekindZetaZeroFree/…/Dedekind/AbelianRayCharacterFactorization.lean:62`,
   read verbatim this session: for K ⊆ L number fields, `[Algebra K L] [IsGalois K L]`,
   `hcomm : ∀ σ τ, σ * τ = τ * σ` ⇒ ∃ moduli and nonprincipal RayClassCharacters with
   `dedekindZeta L s = (∏ Hecke-series) · dedekindZeta K s` for 1 < Re s). Consume as a
   **statement-binder** (G7 pattern; DZDF statements elaborate verbatim — G1a/G3
   precedent; no vendor build: G1b FAIL stands). Proof in-corpus would need CFT — do not.
   The CFT-free-over-ℚ alternative (Kronecker–Weber + cyclotomic
   conductor-discriminant) is **absent from every corpus** (direct-source query run:
   `rg -rln "dedekindZeta.*cyclotomic|cyclotomic.*dedekindZeta"` over mathlib + tauceti →
   no hits) and is priced **L** — not recommended.
3. ζ column (route-dependent: `thmA₀_cumulative` at the donor pin, or V2 at ours);
   75's Theorem A schema; the structural set per component and for ζ_L (window
   finiteness — classical, unformalized; binder in route A, M-glue in a route-B analog).

So: **(ii) = zeta23-E + 75-schema + [dictionary glue (new, S–M)] + [DZDF factorization
binder]** — nothing else. Class-field-theory-free *assembly* is possible over ℚ in
principle but not formalized anywhere; the spec's route is CFT-free for *us* (binder),
not in substance.

**Effort:** (i) Route A **S–M**; Route B **M**; (ii) **M** total (= Route A + dictionary
S–M + instantiation S). Modal cost class **S** throughout (single small corpus build;
default 2 CPU / 4 GB per AGENTS; long build layers only if the zeta23 pin surprises —
not expected at ~40 modules).

### 10.5 Nearest-miss citations (mandatory in the articles)

- de Laat–Rolen–Tripp–Wagner, arXiv:1908.04876, Thm 1.1 / Cor 1.3(i) — > 45% *distinct*
  zeros, **fixed abelian/quadratic K, GRH-conditional, T→∞ asymptotic** (A5 P2-3 scope
  flip; re-confirmed by arXiv sweep 2026-11-16). Comparison stays
  hypothesis-shape-to-hypothesis-shape (structural binders remain on our side).
- Bansal–Maji, arXiv:2507.18121 — Hardy-type *infinitude* of on-line zeros for any
  number field; nearby family, weaker shape.
- Our articles 42 / 42-M4 / 75 — the statement family being upgraded; 42-M4's ζ-column
  discharge is the template for this χ-column discharge.
- zeta23 preprint (the factor theorems' source); Lamzouri/V2 and Knausgård (sharper ζ
  columns — route-dependent, optional); DZDF (`abelianFactorization`) for (ii).

### 10.6 Hygiene protocol (per AGENTS donor gate)

Donor build at its own pin; `#print axioms` on `thmE_A₀` + delegation roots (transitive);
0 sorryAx / no native_decide in the consumed chain; run logs persisted with provenance
headers; every consumer theorem triad-only. Post-landing: pilot-10-pattern full-coverage
axcheck on the bridge file.

### 10.7 Slot-worthiness

Feeds R5 (statement-class depth: 42/75 → discharged) and R9 (strength-bar S4(a): the
discharge lands *in the same article* per the adopted bar). With §9's 01-stability this
is one of the two Iter-4 moves that convert the corpus's strongest conditional assets
into unconditional theorems; KPI hook: ≥half-discovery quota satisfied by
42-v2-B + 75-N2 as the two discovery-graded deliverables.

---

## 11. Strength-bar re-grade of R6's five seeds (`novelty/iter4-fresh-bridges.md`)

Bar applied strictly (§4: S1 statement-level novelty with named nearest-miss, S2
essential multi-corpus bridge, S3 non-trivial proof or surprising statement, S4
discharge discipline). Verdict vocabulary per queue: ITER-4-WATCH (charter watch list,
gated, no slot by default) / ITER-5-QUEUE / KILL.

| seed | R6 grade | S1 | S2 | S3 | S4 | verdict |
|---|---|---|---|---|---|---|
| FB-1 zero-temp duality + tropical rule | B | R2 pass (raised by in-corpus counterexample, answered nowhere); R1 **unresolved** (Carlier–Duval–Peyré–Schmitzer 2017 [LIT] likely covers dual convergence) | **pass, strong** (tauceti entropic + OAI tropical + mathlib Tropical/LP — no single side can state R2) | R2 pass (characterization/fence shape); R1 fail (compactness + sandwich) | n/a | **ITER-4-WATCH** — the only seed with a live discovery-grade rung after its gates; gate = the two R6-named checks (CDPS differentiation sweep; Truffet-literature kill-check on R2). If CDPS states R1-ii verbatim, R1 drops to citation-grade and the seed stands or falls on R2 alone. |
| FB-2 SiegelZeros/QRH registration + PNT-AP | B− | **fail** for the pilot: PNT-AP at x^{7/8+δ} = QRH paper2 **Corollary 1.2 verbatim** (`preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/paper2.pdf`, [V per R6 §3-FB-2]) — FORMALIZATION-OF-RECENT | pass (OAI binder + mathlib `PrimesInAP` + explicit-formula build) | fail (paper corollary; the explicit formula is formalization cost, not math) | binders = donor theorems (fine) | **split**: registration + clock correction (`OAI.SiegelZeros.exists_absolute_real_zero_gap`; QRH-paper2 11/12; the tracker-vs-7/8 [H] re-check) = **Iter-4 infrastructure, no slot**; the PNT-AP pilot = **ITER-5-QUEUE** behind the PrimeNumberTheoremAnd T2 trigger. |
| FB-3 irrationality-exponent layer | C+ | **fail** everywhere: (i)–(iii) classical (μ = ∞ ↔ Liouville textbook; μ ≥ 2 = Dirichlet); (iv) is a **definition-unpacking of the donor's own μ(π) = 2** (from `EventualLowerBound` at ν > 2: eventually ‖qπ‖ ≥ q^{1−ν}, so q^{ν−1}‖qπ‖ ≥ 1 — a citation, exactly R6's own kill-check outcome) | pass (OAI × mathlib × tauceti) | fail (glue + pigeonhole) | n/a | **KILL** (as a discovery or watch item; the S-class (i)–(iii) port remains permissible filler infrastructure if a lane is idle — never a slot, never an article) |
| FB-4 FF PNT | C+ | **fail** (Schmidt-1931-class classical; R6's own cap: "no new mathematics, a new formal artifact") | **pass, genuine** (Weil rationality/RH binders × tauceti general Wiener–Ikehara — first non-ℚ consumer of the Tauberian) | fail (assembly = the classical proof) | binders = Weil conjectures, named and proved elsewhere | **ITER-5-QUEUE** — honest formalization-first technical record; natural second consumer of the 71/73 FF substrate once that zone is warm; must not consume a discovery slot |
| FB-5 Laughlin/CAR parity decomposition | B | **likely fail** even if the in-file read comes back empty: parity-sector decomposition of number-conserving pair Hamiltonians is standard many-body folklore (nearest-miss must be named: even/odd Fock sectors, textbook quantum many-body; the S1 sweep R6 ran was corpus-only) | pass (tauceti graded CAR × OAI LaughlinFock, zero cross-citations [V]) | fail ((b) is S-class graded-algebra bookkeeping per R6 itself) | binder = OAI's proved `thm_fock` | **ITER-5-QUEUE** + one no-slot confirm-read now (R6's own kill-check: `OAI/Analysis/LaughlinFock/{SquareSplitting,Assembly}.lean` — if a parity/block decomposition is already proved there, KILL) |

**FB-2 and the N=1/N=2 slot question (argued as instructed): FB-2 does not consume a
discovery slot.** Its operational content is donor *registration* — the same class as
the ZZV2 on-pin bump, the Liu-1 registration, and the PNT+ watchlist entry (all recorded
in AGENTS.md §Sibling resources / feasibility as infrastructure chores, none ever a
pilot slot). Under the adopted bar the pilot half fails S1 outright (the target
statement is printed in the donor's own preprint), so it is at best a formalization-first
technical record, and the existing watchlist convention already routes this territory:
AGENTS.md's PNT+ trigger T2 ("a PNT-AP/Chebotarev consumer appears") fires on exactly
this pilot, at which point the right move is registering/citing upstream
(PrimeNumberTheoremAnd, Liu-1 convention), not building our own explicit formula.
Net: registration in Iter-4 at zero slot cost; pilot deferred and possibly never ours.

**Net effect on the charter's watch list:** one watch entry (FB-1, gated), one
infrastructure chore (FB-2 registration), three non-slots (FB-3 dead, FB-4/FB-5 queued
to Iter-5 as technical-record material). None of the five competes with §10-hEχ,
§12-01-stability, or §12-32-crossing for the cap-N=2 discovery quota.

---

## 12. Completion-path mini-specs (companions to §10)

### 12.1 01-stability converse (the identity → characterization upgrade)

**Objective.** Convert article 01 from "exact identity + equality at one configuration"
into a characterization theorem: the five-defect sum controls distance to the extremal
SHAPE. This is the single completion that deepens the project's strongest unconditional
discovery.

**Precise statement, two rungs.**

*(Rung 0 — zero-locus converse; sharpens Theorem 3 to an iff, and is a better theorem
than the dossier's A4 as originally framed.)* Define the **TightMult shape class**
(real-weight form): pairs (P, Q) such that some unitary U, some b, and weights
λ₁,…,λ_r ∈ [0, c] give UPU* = diag(λ₁,…,λ_r, 0,…) and UQU* = diag(0,…,0, c·I_b).
Claim: **all five defects vanish ⟺ (P,Q) has TightMult shape.** (⇐ is a computation
each channel vanishes on the shape; note the shape class is strictly larger than the
donor's `TightMult` — integrality of the m_j was the donor lemma's artifact, and
e.g. diag(λ, 0 | 0, c) with any real λ ∈ [0,c] already has Δ_pt = Δ_SJ = Δ_vN = Δ₊ =
Δ_Q+ = 0 since for p ≤ c, μ = 0: Δ_c(p,0) = 0.) **Integrality is not recoverable from
the defects — state the converse over real weights and say so in the article.**

*(Rung 1 — quantitative stability.)* With normalization scale := c²·(1 + π):
for every (P, Q) there is a shape-class (P', Q') with
‖P − P'‖²_F + ‖Q − Q'‖²_F ≤ K·(Δ_pt + Δ_SJ + 2Δ_vN + Δ₊ + Δ_Q+)^(1/2)·scale^(1/2)
— i.e. distance O(defect^{1/2}); π = n₊(Q) and b' := π is forced by Δ_Q+ ≈ 0. (Rate
√δ is the natural one since every defect channel is quadratic; if the quantitative
cores resist, fall back to qualitative stability — defects → 0 forces distance → 0 —
which is already a real theorem.)

**Proof-sketch requirements (paper):** five mechanism lemmas, two hard cores.
1. Δ_Q+ channel: Σ_{q_i>0}(q_i − c)² — zero locus = positive spectrum ⊆ {c};
   stability |q_i − c| ≤ √Δ_Q+ per eigenvalue (trivial).
2. Δ₊ channel: 2·Re tr(P^{1/2}Q₊P^{1/2}) = 2‖P^{1/2}Q₊^{1/2}‖²_F — zero iff PQ₊ = 0;
   stability = small Frobenius norm of the cross block.
3. Δ_pt channel: explicit quadratics Δ_c(p,m) = m(m+2(c−p)) for p ≤ c, (p−c−m)² for
   p ≥ c — zero locus = the two branches (p ≤ c, m = 0) and (m = p−c); stability:
   each eigenvalue pair within O(√Δ_pt) of a branch point (elementary).
4. **[Hard core A] Δ_vN channel:** equality/stability of von Neumann's trace
   inequality for the PSD pair (P, Q₋). Zero locus = simultaneous diagonalizability
   with the reversed ordering. **Mandatory LIT sweep: quantitative von Neumann trace
   inequality** (stability versions exist in matrix-analysis literature — the paper
   tranche must name them or prove a bespoke rate).
5. **[Hard core B] Δ_SJ channel:** equality/stability of the convex-majorization
   bound (g_c convex, g_c(0)=0) between the Gram diagonal {m_j‖v_j‖²} and the spectrum.
   Note g_c is only piecewise strictly convex (linear on x ≥ c), so the zero locus is
   *partial* rigidity, not full permutation — this lemma is the subtlest.
   **Mandatory LIT sweep: quantitative Schur–Horn.**
Assembly: 1–3 pin the block/eigenvalue geometry; 4–5 pin near-simultaneous
diagonalization + near-orthonormal atoms; glue gives the shape approximation.

**What the Lean diagonal case covers:** the commuting sector (v_j = e_j, P and Q
diagonal) — mechanisms 1, 3 in full, 2 trivially, 4 and 5 vacuous (Δ_vN = Δ_SJ = 0
automatically in the sector). Lean deliverables (on the ported stack,
`pilots/01/port/…`): `defect_zero_diag_iff_shape` (Rung 0 in the sector) and
`tightmult_shape_approx_diag` (Rung 1 in the sector, explicit constants). The
noncommutative case stays paper-only this iteration.

**Effort:** paper Rung 0 **M**; Rung 1 **M+** (gated on the two LIT sweeps; fall back
qualitative). Lean diagonal **S–M** (~0.4–0.8k LoC).

**Slot-worthiness:** third in line after §10-hEχ (M) and §12.2-32-crossing (S–M).
Recommendation: **Iter-4 = paper Rung-0 tranche only**, and only if a lane is free
after hEχ Route A lands; quantitative stability + Lean diagonal tranche = Iter-5.
Feeds R5 (deepens the strongest KEEP article; a characterization theorem is a
category upgrade for the KPI's "discovery-grade" accounting).

### 12.2 32-crossing discharge (close the frontier theorem's last gap)

**Objective.** Discharge the one §5 gap article 32 admits: the crossing c*(ε) is a
*parameter*; prove it **exists** for every ε ∈ (0, ε*), making Theorem 5 unconditional
parametric.

**Ingredients already in-file** (`pilots/32/M1.lean`, verified this session):
`gammaOf_eq` (:79–80, gammaOf c θ = θ·ln((c−1)/9)/ln4), `gammaOf_pos` (:88),
`gammaOf_strictMono` (:98–100), `lnΛ_upper` (:272, lnΛ c 0 ≤ lnΛ 10 0 + (c−10)·Lconst),
`lnΛ_10_0` (Thm 2), lnΛ continuity via `hasDerivAt_Ffun … ContinuousAt` (:204),
`gmax_strictAnti` (:367–368), `IsCrossing ε c := gammaOf c (9/10) = gmax ε c` (:375),
`membership_of_lt` (:403), `frontier_of_crossing` (:433).

**Missing lemma forms (exact; new file `pilots/32/M2.lean`):**
1. `gammaOf_tendsto_ten_right : ∀ e > 0, ∃ c > 10, gammaOf c (9/10) < e`
   — `gammaOf_eq` + `Real.log_lt_log`/ln(1+x) ≤ x on (c−1)/9 near 1.
2. `gmax_pos_near_ten : ε < ε* → ∃ c > 10, 0 < gmax ε c`
   — `lnΛ_upper` + `lnΛ_10_0`: gmax ε c ≥ (ln4/ε − 5·ln10 − (c−10)·Lconst)/ln4; since
   ε < ε* = ln4/(5 ln10) the bracket is positive; halve it and pick c.
3. `gmax_neg_far : 0 < ε → ∃ c > 10, gmax ε c < 0 ≤ gammaOf c (9/10)`
   — `lnΛ_upper` with (c−10)·Lconst > ln4/ε − 5·ln10; `gammaOf_pos` for the right half.
4. `crossDiff_continuous : ContinuousOn (fun c => gammaOf c (9/10) − gmax ε c) (Icc c₁ c₂)`
   for 10 < c₁ ≤ c₂ — continuity of `gammaOf` (field ops + `Real.continuous_log`) and
   of `gmax` (from the `hasDerivAt_Ffun` derivative on c > 1; add `lnΛ_contAt` if the
   pointwise form at :204 does not compose directly).
5. `crossing_exists : ε < ε* → ∃ c > 10, IsCrossing ε c`
   — from 1–3 pick c₁ with gammaOf(c₁) < gmax(ε,c₁) and c₂ with gmax(ε,c₂) < 0 <
   gammaOf(c₂); the difference changes sign on [c₁,c₂]; apply mathlib's interval IVT
   (`intermediate_value_Icc` / `intermediate_value_Icc'`,
   `Mathlib/Topology/Order/IntermediateValue.lean`, names verified on the encore
   checkout @ ff2494ea, module doc lines 26–28).
6. `frontier_unconditional : ε < ε* → ∃ c*, IsCrossing ε c* ∧ Ach ε = Ioo 0 (gammaOf c* (9/10))`
   — compose 5 with the existing `frontier_of_crossing` (:433) + `membership_of_lt`
   (:403). Then update article 32 §5 ("What is not formalized" → discharged) and the
   README status cell (R-set: "**proved**; crossing exists for all ε < ε*").

**Effort:** **S–M** (~300–600 LoC; bounds 1–3 are one-liners, 4–5 are IVT plumbing).

**Rides an existing lane: yes.** `research/pilots/32/run_pilot.sh` is the generic
multi-file runner (app `crossmath-pilot-32`); add `M2.lean`, in-file `#print axioms`,
register in the final-sweep axcheck TARGETS. No new Modal app; warm-run cost class
(default 2 CPU / 4 GB).

**Slot-worthiness: Iter-4 YES** — the cheap filler slot: closes a KEEP article's only
formalization gap, riskless, rides an existing lane; feeds R9's quality-gate story
(a discovery-grade article completed to fully-unconditional parametric form).

---

## 13. Concurrence with the orchestrator-resolved R1 splits (record per queue)

- **42-M4 integrated-merge into article 42 (§Cycle-2 addendum): R2 CONCURS** — matches
  this lane's §8 MERGE verdict (effort M; M4a vocabulary + donor-hygiene trail to the
  pilot record/ledger; main-run sections untouched, append-only).
- **10 keep-relabel (no rename): R2 CONCURS — SUPERSEDED post-execution (2026-11-16,
  orchestrator relay): the rename + full cite-sweep was already executed and R4-verified
  (H commit `20af866`), so the no-rename option is MOOT; R2 concurs with the executed
  rename (`10-layers-toward-uniform-poly-space-eth-refutation.md`) — reverting would be
  pure churn. The §7.2-A1 row edit (R6, OPEN-leading status) stands as written.
- **21 demote (certificate moved out of articles): R2 CONCURS** — matches §8
  DEMOTE-to-dossier; certified numerics are not an article under the adopted bar and
  TRIAGE had already demoted the candidate.
