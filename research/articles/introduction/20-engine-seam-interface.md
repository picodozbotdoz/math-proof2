# An Interface Theorem for Zero-Proportion Engines: the Analytic-Input Card, λ-Families, and Multiplicity Merging — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [An Interface Theorem for Zero-Proportion Engines: the Analytic-Input Card, λ-Families, and Multiplicity Merging](../20-engine-seam-interface.md).
> Audience: an undergraduate mathematics background — limits and complex numbers assumed;
> no Lean, no analytic number theory assumed.
> Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win.
> Written 2026-11-21 against the article's committed state.

## 1. In plain words

Analytic number theory has "engines" that convert hard analytic inputs into zero-counting
statements — typically: a fixed positive fraction of the zeros of an L-function, counted
with multiplicity, lie on the critical line. The zeta23 corpus formalizes such an engine
for specific L-functions, but its analytic inputs do not transfer verbatim to new
L-functions. This article restates the engine at the level of an abstract "zero
configuration" — a bookkeeping function counting zeros with multiplicities — and proves,
in Lean, the interface layer: how the engine's outputs are instantiated (Theorem 1), how
its one-parameter family of constants upgrades to the concrete constants 2/3, 1/2, 3/4
(Theorem 2), how two configurations' bounds merge with no assumption about shared zeros
(Theorem 3), and the two atom facts about common simple zeros and disjoint strips
(Theorem 4). Every theorem is PROVED-CONDITIONAL: the interface is deliberately hollow,
and the analytic content lives exactly in its named hypotheses. No corpus article uses
this interface — it is a technical record of what the "engine route" needs, with nothing
hidden.

## 2. The background, in one page

### 2.1 Zeros and the critical line (classical)

The Riemann zeta function ζ(s) and its relatives (L-functions) have zeros in the critical
strip 0 < Re s < 1. The critical line is Re s = 1/2; a zero there is "on-line". A
zero-proportion statement counts zeros in the dyadic window (T, 2T] — N(T), with
multiplicity — and those on the line — N^on(T) — and says: for every tolerance ε > 0,
eventually (that is, for all T past some threshold) (c − ε)·N(T) ≤ N^on(T). In words: at
least a fraction c of the zeros lie on the line, asymptotically. (classical)

### 2.2 Factorization and additivity (classical)

For a quadratic number field K, the Dedekind zeta function factors as ζ_K = ζ·L(·, χ_D):
the zeros of ζ_K are, with multiplicity, the zeros of both factors pooled — multiplicities
add. This additivity is the door through which per-factor proportion statements combine.
(classical)

### 2.3 The zeta23 engine and its λ-families

The zeta23 corpus's engine consumes a five-field analytic-input card (explicit formula,
Riemann–von Mangoldt, Chebyshev–Mertens, Hilbert majorant, gamma facts) and produces, for
each λ ∈ (1/2, 1), bounds with constants

  H(λ) = 2 − 1/λ − λ/3,  F(λ) = λ/(1 + λ²/3),

three families per λ (constants H(λ), 2F(λ) − 1, F(λ)). As λ → 1 these tend to 2/3, 1/2
and 3/4. The engine is proved for ζ and Dirichlet L-functions; running it on a new
L-function needs new analytic inputs.

### 2.4 Two routes, and the article's question

For the zeros of ζ_K there are two routes: assembly (add the factors' theorems — done
elsewhere, articles 42 and 75) and engine (run the density engine directly on ζ_K's zero
configuration). The engine route needs its inputs restated for arbitrary configurations.
The article's core question: what exactly does the engine route need — stated once, at
configuration level, with every hypothesis named and nothing hidden?

## 3. One example, by hand

The smallest concrete case is the binary merge (Theorem 3) at the constant 2/3. Suppose
two configurations z and w each satisfy `EpsLower z 2/3` and `EpsLower w 2/3` — each
bound says: for every ε > 0 there is a threshold T₀ with (c − ε)·N(T) ≤ N^on(T) for all
T ≥ T₀. Merge them at c = 2/3 with ε = 1/50, so c − ε = 2/3 − 1/50 = 97/150:

- Beyond the later of the two thresholds, (97/150)·N_z(T) ≤ N^on_z(T) and
  (97/150)·N_w(T) ≤ N^on_w(T).
- Add the two inequalities — legitimate because both hold at the same T once past
  max(T₀z, T₀w) — and use additivity of with-multiplicity counts (the article's
  `count_add`: N_{z+w} = N_z + N_w, N^on_{z+w} = N^on_z + N^on_w):
  (97/150)·N_{z+w}(T) ≤ N^on_{z+w}(T).
- Bookkeeping instance: if at some past-both-thresholds T the counts were N_z = N_w = 300
  with each on-line count ≥ 97/150·300 = 194, then N^on_{z+w} ≥ 194 + 194 = 388 =
  97/150·600. The same constant c = 2/3, the same ε, the threshold is the max of the two.

No common-zero hypothesis is needed — that is Theorem 3's point.

Second, the λ → 1 upgrade's arithmetic (Theorem 2), at δ = 1/100. The article records the
explicit bound H(1 − δ) ≥ 2/3 − (5/3)·δ (its `hfun_one_sub_le`). Hand-check: exactly,
H(1 − δ) = 2 − 1/(1−δ) − (1−δ)/3 = 2/3 − (2/3)δ − δ²/(1−δ), and for δ ≤ 1/2 the tail
δ²/(1−δ) ≤ δ, giving the recorded 2/3 − (5/3)δ. At δ = 0.01: H(0.99) = 2 − 1/0.99 − 0.33
≈ 0.6599 ≥ 2/3 − 1/60 ≈ 0.65. ✓ So to land a target tolerance ε on 2/3, take
δ = min(3ε/10, 1/4) (then (5/3)δ ≤ ε/2) and apply the family bound with slack ε/2: the
slacks add to at most ε. The same shape gives 1/2 from 2F(λ) − 1 ≥ 1/2 − (5/4)δ and 3/4
from F(λ) ≥ 3/4 − (5/8)δ.

*Provenance:* the definitions (`EpsLower`, the windows, additivity `count_add`, H and F),
the recorded inequalities H(1−δ) ≥ 2/3 − 5δ/3 (etc.) with their δ-choices, and the merge
proof's structure are article-recorded (article §2, §3 Theorems 2–3, §5). The numeric
illustrations (97/150 bookkeeping, H(0.99) ≈ 0.6599) are hand-applications of those
recorded formulas and inequalities. No concrete zero count exists anywhere in the article
— the statements are asymptotic — and none is asserted here.

## 4. How the proof works, without Lean

Theorem 1 is one-line plumbing: the engine step is applied at each λ to the traces
family's per-λ data; the transcribed analytic-input card is carried as an anchor but the
proof never uses it — the elaboration log flags it unreferenced, by design, so a future
discharge of the card can slot in unchanged. Theorem 2 is ε-bookkeeping: the three
explicit bounds above, with δ chosen so the δ-term is at most ε/2, then the family bound
applied with slack ε/2 so the slacks sum to ε. Theorem 3 is additivity plus max: counts
with multiplicity distribute over the pooled support, so the two ε-inequalities add at
the same ε and c with threshold the max of the two; iterating merges any finite sum, and
a factorization L = L₁L₂ transports component families to the product. Theorem 4's atom
lemmas are pointwise arithmetic: a simple zero of both factors is a double zero of the
sum (multiplicities add); and where z has a strip zero, strip-disjointness forces w's
multiplicity to 0 there, so the shared mass — the minimum of the two multiplicities,
summed over the window — vanishes.

## 5. What the main results say, informally

- **Theorem 1 (`instantiate_family_A/B/C`).** A traces family and an engine step for a
  configuration z yield, for every λ ∈ (1/2, 1), the three ε-bounds
  `EpsLower z (H λ)`, `EpsLower z (2F(λ) − 1)`, `EpsLower z (F λ)`; the card
  `Card20 z ν μ ℓ` is carried but unused (the discharge anchor).
  PROVED-CONDITIONAL on htf : `TracesFamily Traces z`, hstep : `EngineStep Traces z`,
  with hCard carried. A conditional theorem here carries its hypotheses as named explicit
  assumptions (binders); the kernel proof is complete relative to them, and the article
  names them all — the analytic content is exactly the hypotheses. → article §3, Thm 1.
- **Theorem 2 (`family_to_two_thirds`/`_half`/`_three_quarters`).** From the H-family:
  `EpsLower z 2/3`; from the 2F − 1 family: `EpsLower z 1/2`; from the F-family:
  `EpsLower z 3/4`. PROVED-CONDITIONAL on the configuration's λ-family (one binder per
  variant). → article §3, Thm 2.
- **Theorem 3 (`assemble_eps`, `family_merge`, `two_thirds_of_components`).** Two
  configurations with the same constant c merge: `EpsLower (z + w) c` with NO common-zero
  hypothesis; longer sums iterate; component λ-families give the merged 2/3 statement,
  and factorization L = L₁L₂ transports it to L. PROVED-CONDITIONAL on hz, hw
  (`EpsLower z c`, `EpsLower w c`, same c) and, for the family versions, the components'
  λ-families. → article §3, Thm 3.
- **Theorem 4 (i) (`merged_mult_of_common`).** A simple common zero (multiplicity 1 in
  both) is a double zero of z + w. PROVED-CONDITIONAL on hz, hw : `z.mult ρ = 1`,
  `w.mult ρ = 1` — configuration data discharged at every instantiation (the article's
  own wording). → article §3, Thm 4(i).
- **Theorem 4 (ii) (`sharedMass_eq_zero_of_disjoint`).** Under strip-disjointness (every
  strip zero of z is a non-zero of w), the shared mass vanishes at every height.
  PROVED-CONDITIONAL on hdisj. → article §3, Thm 4(ii).
- **Theorem 5 (hCZ, common-zero control at η > 1/6).** PAPER-ONLY — it lives in the
  companion note, has no declaration in the artifact, and is NOT an article claim. →
  article §3, §6 (the row with no evidence).
- **What is *not* here:** any proportion statement for a specific L-function; the card
  for a new L-function (Weil explicit formula etc. — the engine route's true cost);
  distinct/simple constant transport past common zeros (the hCZ subject); any consumer —
  articles 42 and 75 carry their own copies of the counting lemmas and do not import
  this interface. → article §1, §4, §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| zero configuration (ZeroMult) | a multiplicity function m : ℂ → ℕ, finite support in every window | z, w |
| strip / line window | zeros with 0 < Re ρ < 1 (resp. Re ρ = 1/2) in T₁ < Im ρ ≤ T₂ | — |
| on-line zero | a zero in the line window | Re ρ = 1/2 |
| N(T), N^on(T) | zeros in the dyadic window (T, 2T], total resp. on-line, with multiplicity | — |
| EpsLower z c | ∀ ε > 0, eventually (c − ε)·N(T) ≤ N^on(T) | c = 2/3 |
| eventually | for all T past some threshold T₀(ε) | — |
| λ-family | the per-λ bounds at constants H(λ), 2F(λ)−1, F(λ), λ ∈ (1/2, 1) | H(1) = 2/3 |
| H(λ), F(λ) | 2 − 1/λ − λ/3; λ/(1 + λ²/3) | F(1) = 3/4 |
| z + w | pointwise sum of multiplicities (pooled zeros) | multiplicities add |
| Card20 | the transcribed five-field analytic-input card (carried anchor) | explicit formula, R–vM, Chebyshev–Mertens, Hilbert, gamma |
| TracesFamily, EngineStep | the traces hypothesis; the engine step at configuration level | Theorem 1's binders |
| SharedMass | minimum of the two multiplicities, summed over the window | 0 under hdisj |
| hdisj | strip-disjointness: every strip zero of z is a non-zero of w | Theorem 4(ii) |
| hCZ | common-zero control at η > 1/6 — PAPER-ONLY, not an article claim | companion note |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-CONDITIONAL / PAPER-ONLY | kernel-checked relative to named binders / proved on paper only | Thms 1–4 / Thm 5 |

## 7. What this is — and what it is not

- A "zero configuration" is a bookkeeping object — a multiplicity function over the
  critical strip — not a physical vacuum, a cosmological constant, or an energy level.
- "Engine" means the zeta23 corpus's fixed theorem-producing pipeline of analytic inputs —
  not a software engine and not a search engine; "on-line" means on the critical line
  Re s = 1/2, not internet-connected.
- No proportion theorem for any particular L-function is proved here: every theorem is
  conditional, and the interface is deliberately hollow — the analytic content is exactly
  its named hypotheses (the article's own phrase).
- No consumer depends on this interface: the assembly articles prove their results from
  their own copies of the counting lemmas; this record's value is the restatement of what
  the engine route needs, plus the carried discharge anchor.
- "Kernel-verified" means every theorem was machine-checked term by term by the Lean type
  checker against fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the
  full set used by every row; conditionality here is honest structure, not incompleteness.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statements → article §3, with the glossary (§6 here) and article §2 (the
  configuration definitions) open.
- Proof ideas → §4 here, then article §5.
- Verification → article §6 (formal record), `research/pilots/20/M1.lean`, and the cited
  logs (`axcheck-cycle2.log`, `m1-cycle2-green.log`).
- Novelty and nearest misses → article §4 (the zeta23 engine row; the independent
  consumers 42 and 75).
- What stays open → article §7 (the new-L-function card, the hCZ seam) and the companion
  note `research/pilots/20-seam-analysis.md` (its Theorem 5).

## 9. What you need going in

- Limits and the "eventually" idiom: for every ε > 0 there is a threshold beyond which
  an inequality holds.
- Counting with multiplicity (a double zero counts twice).
- Complex numbers: what Re s means.
- What an L-function is, in one sentence: a Dirichlet-series analogue of ζ(s) carrying
  arithmetic information.
- What a hypothesis binder is (one sentence, §5 above) — nothing else about Lean.
