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
| 72 | Rényi monotonicity no-go gate | **the mathematical content of the no-go is Kuwahara's published theorem; our layer is textbook inequalities plus a one-line corollary** | (v) + (iv): knowledge-level fence + glue | **Kuwahara arXiv:2610.15199 — the paper's own title/abstract is the no-go ("The Rényi area law conjecture is false below α = 1"); log-rank failure follows in one line from S₀ ≥ S_α** (abstract checked 2026-11-16: he even proves rank-error trade-offs himself); Rényi monotonicity and S_α ≤ log rank are textbook | kernel-verified fenceposts N1–N3 + the M1 cross-encoding interface layer (links 1–3) |
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
    volume law via S₀ ≥ S_α.

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
