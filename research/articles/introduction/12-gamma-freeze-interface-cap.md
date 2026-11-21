# A Cap Theorem for the 3SUM/APSP Refutation's One-Call Interface: No Expressed Parametric Savings Beyond n^{3−0.00175} — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [A Cap Theorem for the 3SUM/APSP Refutation's One-Call Interface: No Expressed
> Parametric Savings Beyond n^{3−0.00175}](../12-gamma-freeze-interface-cap.md).
> Audience: an undergraduate mathematics background — exponents and logarithms assumed;
> no Lean, no fine-grained complexity, no exposure to this project assumed.
> Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win.
> Written 2026-11-21 against the article's committed state (shipped @ `0924078`) — the
> sync witness per the registry's companion-sync rule.

## 1. In plain words

A formalized mathematics corpus proves its big results through a fixed internal recipe:
one query "call" whose cost is pinned at two decimal exponents (0.437 and 0.063) chosen
by the corpus's authors. The project hoped — as a pre-registered goal — that tuning the
recipe's other knobs could buy extra speed as the numbers involved grow; this article
proves that hope dead inside that corpus. The key object is a cap: the frozen recipe
cannot express total savings beyond one explicit, tiny amount, n to the power
3 − 0.00175, no matter how its knobs are set. Two theorems do the closing: the cap sits
exactly at the recipe's discharge boundary (savings apply precisely on one half of the
knob band), and the regime a better matrix-multiplication method would produce is
blocked strictly below that boundary. The central distinction, everywhere: this is a
cap on what one fixed recipe can EXPRESS — never a claim that fast algorithms are
impossible. The negated hope is the project's own; the article closes it with
machine-checked certificates and cites, rather than hides, the donor paper's nearest
remark.

## 2. The background, in one page

### 2.1 Exponents, bases, and "savings" (classical)

For a base b > 1, the power b^x grows with x; the logarithm log₂ 7 ≈ 2.807 asks "2 to
what power is 7?". A cost like n^{3−δ} beats n³ by the exponent savings δ — smaller
costs mean faster algorithms. In fine-grained complexity, even tiny constant savings
are the currency: matrix multiplication's exponent ω dropped from Strassen's 3 toward
2.37 over decades, each drop a world result. (classical)

### 2.2 The corpus and its frozen recipe

The 3SUM/APSP refutation corpus (a formalized, machine-checked proof development)
derives its results through a chain of certified time claims. Its query interface is
frozen: one call costs n²/D^{0.063}, where D is a size knob — the decimals 0.437 and
0.063 are the corpus's fixed literals, not tunable. Write γ = 0.063 for the frozen
savings exponent. A deployment of the recipe also picks an allocation η of effort
between two costs — instances n³·D^{η−γ} and scans n³·D^{−η} — and the corpus's landed
chain converts D-savings to n-savings through D = n^{1/18}.

### 2.3 The band and the ε-fiber

The recipe's data carries a band parameter ω_b with 2 < ω_b ≤ 2.9, and a savings
schedule ε(ω_b): a function on the band, fixed to take the value 0.00175 exactly at the
special point log₂ 7, strictly decreasing across the band, and vanishing at the band's
right edge. Intuitively: ε says how much savings the recipe awards at each ω_b, and it
is stingier to the left. Two facts about the total, stated exactly (the article's §2):
the balanced TOTAL is independent of ω_b; the DISCHARGE band — where ε's savings apply
— is not.

### 2.4 The flagship hope, and the question

The project's flagship goal on this corpus hoped that a better matrix multiplication
(smaller ω, i.e. ω_b lower in the band) would buy additional parametric savings through
this recipe. The corpus's own evaluation found the door frozen shut; the article's core
question: can that freezing be made an exact theorem — a cap on everything the recipe
can express — with the blocked regime identified precisely?

## 3. One cap instantiation, by hand

Three small computations display every moving part. First, the frozen fiber sits inside
the band, by exact integer arithmetic (both directions hand-checked):

- Low end: 2⁵ = 32 < 49 = 7², and both sides are squares-comparable — taking log₂,
  5/2 < log₂ 7. So the point 9/4 + 1/4 = 5/2 = 2.5 lies strictly LEFT of the fiber.
- High end: 7¹⁰ = 282,475,249 (7⁵ = 16,807; 16,807² = 282,475,249) and 2²⁹ =
  536,870,912; since 7¹⁰ ≤ 2²⁹, log₂ 7 ≤ 2.9. So 2.5 < log₂ 7 ≤ 2.9 — the fiber is in
  the band, above 2.5.

Second, the balance point at a concrete size. Take D = 4 and γ = 0.063, so the balance
allocation is η = γ/2 = 0.0315. At that η both terms equal 4^{−0.0315} — the two
exponents, η − γ and −η, coincide at −0.0315. Move away and the maximum of the two
terms grows: at η = 0.01 the scans term is 4^{−0.01} > 4^{−0.0315}; at η = 0.06 the
instances term is 4^{−0.003} > 4^{−0.0315}. The balanced value is the floor of the
two-term profile — the article's Theorem 2, at one size.

Third, the witness chain: a band word at ω_b = 2.5 (the better-matrix-multiplication
regime the corpus itself can produce, ω_b ≤ 9/4 + 1/4) lies strictly left of the fiber
by the first computation; ε strictly decreases, so ε(2.5) > ε(log₂ 7) = 0.00175 — the
awarded savings exceed the cap everywhere on that regime, which is exactly why nothing
discharges there.

*Provenance:* the band inequalities (32 < 49; 7¹⁰ ≤ 2²⁹), the balance theorem, the
frozen value 0.00175 = 0.063/(2·18), and the witness statement are article-recorded
(article §2, §3 Theorems 1–4, §5). The concrete multiplications (7⁵, 16,807², 2²⁹) and
the D = 4 / η = 0.0315 instantiations are hand-computed from those recorded statements;
the article records no numeric instances, and none is invented.

## 4. How the proof works, without Lean

The engine is monotonicity, twice over. Powers x ↦ D^x increase in the exponent (for
D ≥ 2), which gives the balance bound by a two-case split at η = γ/2: whichever term
dominates, its exponent is at least −γ/2, so the maximum is at least D^{−γ/2}. And ε
strictly decreases across the band, which converts any strict inequality between band
points into a strict inequality between their ε-values — the discharge boundary and the
blockade witness are both this one conversion plus the frozen value at the fiber. All
numeric content (the band placement of log₂ 7, the cap constant) is exact rational
arithmetic — integer comparisons like 7¹⁰ ≤ 2²⁹, never floating point. Nothing deeper
is used; the article's own register is "elementary certificates, nonelementary closure":
the proofs are short because the content is the closure they certify, not the machinery.

## 5. What the main results say, informally

- **Theorem 1 (`savings_cap_frozen`) — the cap as the discharge boundary.** Within the
  band, the recipe's savings schedule satisfies ε(ω_b) ≤ 0.00175 exactly when
  ω_b ≥ log₂ 7: the cap value and the boundary point are the same thing, stated as an
  if-and-only-if. PROVED-UNCONDITIONAL. → article §3, Thm 1.
- **Theorem 2 (`two_term_balance`) — the balance bound.** For every size D ≥ 2 and all
  γ, η: the balanced value D^{−γ/2} is at most the maximum of the two cost terms. The
  balanced point η = γ/2 attains the bound (both terms coincide there); **no uniqueness
  of the minimizer is claimed** — the kernel theorem is the bound alone, and the
  article says so. PROVED-UNCONDITIONAL. → article §3, Thm 2.
- **Theorem 3 (`cap_constant_exact`) — the frozen arithmetic.** 0.063/(2·18) = 0.00175
  exactly (and 0.0315/18 = 0.00175; 0.063 = 2 × 0.0315): the cap constant is exactly
  γ/(2·18) at the corpus's frozen literal. PROVED-UNCONDITIONAL. → article §3, Thm 3.
- **Theorem 4 (`fiber_cap_blocked_regime`) — the blockade witness.** Every band word
  with ω_b ≤ 9/4 + 1/4 — the regime a better matrix multiplication produces — has
  ε(ω_b) > 0.00175: the awarded savings exceed the cap everywhere on that regime.
  PROVED-UNCONDITIONAL. → article §3, Thm 4.
- **The closure (composition, by citation).** Combining Theorems 1 and 4 with the
  corpus's already-landed 14/14 chain: the dischargeable half-band is exactly
  ω_b ≥ log₂ 7, the better-multiplication regime is excluded exactly, and no setting
  of (D, g, η) the frozen interface can express delivers total savings beyond
  n^{3−0.00175}. The flagship's parametric-savings question terminates. → article §3,
  the closure paragraph.
- **What is *not* here:** any lower bound about algorithms (the central exclusion —
  nothing here says any problem is hard); the corpus flagship's second half (the
  explicit-refutation conjunct, still blocked as stubbed); any uniqueness of the
  balance minimizer; and the standing open door — a re-split interface (new exponents
  in place of 0.437/0.063) would let the flagship compose through it. → article §7.

## 6. Glossary

| symbol | one-line meaning | tiny example |
|---|---|---|
| n, D | problem size; the recipe's size knob (D = n^{1/18} in the landed chain) | — |
| γ = 0.063 | the frozen savings exponent in the one-call cost n²/D^{0.063} | the donor's literal, not tunable |
| η | the allocation of effort between the two cost terms | η = 0.0315 at the balance point |
| instances / scans terms | the two-term cost model n³·D^{η−γ} and n³·D^{−η} | at η = γ/2 both equal D^{−γ/2} |
| ω_b, the band | the matrix-multiplication knob; its range 2 < ω_b ≤ 2.9 | 2.5 is in the band |
| log₂ 7 ≈ 2.807 | the fiber point; 2 raised to what power is 7 | 2.5 < log₂ 7 ≤ 2.9, hand-checked |
| ε(ω_b), the fiber value | the savings schedule; ε(log₂ 7) = 0.00175, strictly decreasing | stingier to the left |
| 0.00175 | the cap: γ/(2·18) exactly | 0.063/36 |
| discharge | the recipe's savings applying at a band point | iff ω_b ≥ log₂ 7 |
| expressed savings | what the frozen recipe can state as a total bound | the capped n^{3−0.00175} |
| interface scope | claims hold for THIS frozen recipe only ("in-corpus") | never about algorithms |
| cap vs lower bound | a cap limits what a recipe can express; a lower bound limits all algorithms | the article's central distinction |
| MM-independence | the balanced total ignores ω_b; the discharge band does not | two different statements |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-UNCONDITIONAL | kernel-checked with no hypotheses beyond the definitions of the subject | all four theorems |

## 7. What this is — and what it is not

- **A cap is not a lower bound.** The theorem pins what one fixed cost recipe can
  EXPRESS; it says nothing about what algorithms can DO. "No algorithm beats
  n^{3−0.00175}" would be a far stronger claim that the proof does not support — the
  article never makes it, and every statement carries the in-corpus scope.
- "Interface" and "expressed" name the corpus's frozen internal recipe (its fixed
  0.437/0.063 literals and landed chain) — not a programming interface, not a
  hardware interface, not algorithms in general.
- "Frozen" describes the donor corpus's own fixed choices, made before this project;
  the article neither chose nor could change them.
- The negated hope is the project's own pre-registered flagship goal; no external
  paper's claim is refuted. The donor's Remark 20 — the nearest prior work, an
  informal balance note the donor left as an unproved challenge statement — is cited
  prominently: this article kernel-proves where the donor stated-as-challenge.
- "Kernel-verified" means every theorem was machine-checked term by term by the Lean
  type checker against fixed axioms — the triad (propext, Classical.choice,
  Quot.sound) is the full set used by all four theorems.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statements → the status table at the article's head, then §3 (numbered
  theorems with full hypothesis lists).
- Proof ideas → §4 here, then article §5.
- Verification → article §6 (the formal-record table) and the cited logs
  (`research/pilots/12/logs/n1c-runs1-3.log`,
  `research/pilots/12/logs/n2w-run4-full-transcript.log`).
- Novelty and nearest misses → article §4 (the Remark-20 row is the sharp one).
- What stays open → article §7 (the wording lock, the re-split door, the blocked
  second conjunct).

## 9. What you need going in

- Exponents and base-2 logarithms; comparing b^x by comparing exponents.
- The maximum of two numbers; increasing and decreasing functions (statement level).
- Reading "ε is strictly decreasing on the band" as: left point, bigger value.
- The idea of a cost model as a fixed formula in the input sizes — no complexity
  background beyond that.
- What a machine-checked theorem is (one sentence, §7 above) — nothing else about Lean.
