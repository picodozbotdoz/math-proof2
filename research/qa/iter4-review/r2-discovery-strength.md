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
