# The Prime Number Theorem in ψ-Form, Assembled from Mathlib's Own Wiener–Ikehara Theorem — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [The Prime Number Theorem in ψ-Form, Assembled from Mathlib's Own Wiener–Ikehara Theorem](../22-pnt-psi-form-from-mathlib-wiener-ikehara.md).
> Audience: an undergraduate mathematics background — limits, logs, and complex numbers
> assumed; no Lean, no analytic number theory assumed.
> Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win.
> Written 2026-11-21 against the article's committed state (v3).

## 1. In plain words

The Prime Number Theorem (PNT) says primes thin out in a precise way: the weight of
primes up to x — measured by the function ψ(x), a sum of log-prime weights — is
asymptotically x. The Lean mathematics library mathlib already contains the hard analytic
ingredient, the Wiener–Ikehara theorem, plus most supporting facts (nonvanishing of ζ on
the line Re s ≥ 1, Chebyshev's bounds) — but no PNT, and nobody using its Wiener–Ikehara
theorem. This article records the assembly: two small missing links (a continuous
extension of −ζ'/ζ − 1/(s−1) across the pole; a linear bound on partial sums of Λ), and
the PNT in ψ-form follows from mathlib's own theorem. The billing is honest: this is a
formalization record, not new mathematics — ψ(x) ~ x is the classical PNT (Hadamard,
de la Vallée Poussin 1896). The record's claim, scoped to the surveyed corpora, is the
first-consumer fact: mathlib's Wiener–Ikehara theorem now has a consumer, at 290 lines.

## 2. The background, in one page

### 2.1 Counting primes (classical)

Let π(x) be the number of primes up to x. The Prime Number Theorem (classical) says
π(x)·ln x / x → 1 as x → ∞: near x, the density of primes is about 1/ln x.

### 2.2 The von Mangoldt weight and Chebyshev's ψ (classical)

The von Mangoldt function Λ weights prime powers: Λ(n) = ln p if n is a power of the
prime p (so Λ(8) = Λ(4) = Λ(2) = ln 2), and Λ(n) = 0 otherwise. Chebyshev's function is
ψ(x) = Σ_{n ≤ x} Λ(n). The PNT in ψ-form is the equivalent statement ψ(x)/x → 1. (The
translation between the π-form and the ψ-form is standard; the article lists it as two
unformalized one-step corollaries, not claims.)

### 2.3 ζ and its pole (classical)

For complex s with Re s > 1, ζ(s) = Σ 1/n^s; it extends to a meromorphic function with
one simple pole at s = 1 of residue 1. The logarithmic derivative packages Λ's transform:
−ζ'(s)/ζ(s) = Σ Λ(n)·n^{−s} on Re s > 1 — it has the same pole. (classical)

### 2.4 Wiener–Ikehara (classical)

A Tauberian theorem: if a nonnegative arithmetic function's transform equals
A/(s − 1) + G(s) on Re s > 1, with G continuous on the closed half-plane Re s ≥ 1 and
partial sums linearly bounded, then its summatory function is asymptotic to A·x. Applied
with the function Λ, this converts analytic information about −ζ'/ζ into ψ(x) ~ x.
(Ikehara 1931; Wiener 1932 — classical.)

### 2.5 The article's core question

mathlib at the pin `ff2494ea` owns all the pieces but never assembled them: its
Wiener–Ikehara theorem had no consumer, and no PNT. Question: how small is the missing
surface? Answer: two links (M2, M3 below), plus plumbing.

## 3. One example, by hand

The smallest instance that shows the machinery is ψ at x = 10, computed from the
classical definition (§2.2). Λ fires exactly on the prime powers ≤ 10: 2, 3, 4, 5, 7, 8,
9 — with weights ln 2, ln 3, ln 2, ln 5, ln 7, ln 2, ln 3:

  ψ(10) = 3·ln 2 + 2·ln 3 + ln 5 + ln 7 = ln(2³·3²·5·7) = ln 2520 ≈ **7.832**.

So ψ(10)/10 ≈ 0.783 — far from 1. That is expected and says nothing against the theorem:
M4 is asymptotic, and the article proves no error term. What M4 asserts is: for every
tolerance δ > 0 there is a cutoff X beyond which |ψ(x)/x − 1| < δ; it is silent about any
specific x, and no effective cutoff is formalized here (the effective forms — the 7/8-band
quasi-RH shape and the classical-strength exp(−c√log x) form — are article §7 items 2–3:
one statement-only, one closed by upstream work; neither is claimed).

The one concrete numeric handle the article does record is M3's explicit constant:
Σ_{n<N} Λ(n) ≤ (log 4 + 4)·N for every N, with C = log 4 + 4 ≈ 5.386. At N = 10:
ψ(10) = 7.832 ≤ 53.86 = 5.386·10. ✓ (The bound is coarse — it is the partial-sum
hypothesis Wiener–Ikehara needs, not a sharp estimate.)

*Provenance:* the constant C = log 4 + 4 and the M3/M4 statements are article-recorded
(article §3 M3, M4; kernel declarations `exists_range_sum_vonMangoldt_le`,
`tendsto_psi_div_atTop`). The value ψ(10) = ln 2520 ≈ 7.832 and the check against M3's
bound are hand-computed from the classical definition of Λ and §2 of this file; the
article records no numeric instance of ψ, and none is attributed to it.

## 4. How the proof works, without Lean

The engine is the Wiener–Ikehara theorem, already inside mathlib. M1 builds the local
model: F(s) = (s − 1)·ζ(s) tends to the residue 1 at s = 1, so it extends analytically
across the pole (removable singularity). mathlib at the pin already proves the sharper
limit — ζ(s) − 1/(s−1) → γ, the Euler–Mascheroni constant — so M1 is a corollary of
mathlib's own lemma and is kept only because its construction feeds M2. M2 is the first
missing link: on the closed half-plane Re s ≥ 1, ζ has no zeros, so the extension h of F
is zero-free there and −ζ'/ζ − 1/(s−1) = −h'/h, which is continuous everywhere on
Re s ≥ 1, pole and all — the pole of −ζ'/ζ is exactly cancelled. M3 is the second link:
Chebyshev's bound ψ(N) ≤ (log 4 + 4)·N, transported to range sums. M4 applies mathlib's
Wiener–Ikehara to f = Λ: its transform is −ζ'/ζ = 1/(s−1) + G(s) with G the continuous
function from M2 and A = 1, and M3 supplies the linear partial-sums hypothesis; the
theorem gives (1/N)·Σ_{n<N} Λ(n) → 1, and a floor argument passes from integer N to real
x.

## 5. What the main results say, informally

- **M1 (`exists_tendsto_riemannZeta_sub_inv`).** Some constant c ∈ ℂ satisfies
  ζ(s) − 1/(s−1) → c as s → 1, s ≠ 1. PROVED-UNCONDITIONAL — but "not a missing link":
  mathlib at the pin already proves this limit with the sharper constant γ
  (`tendsto_riemannZeta_sub_one_div`), and M1 is a corollary; it is kept because its
  construction (the analytic extension of (s−1)ζ(s)) is reused inside M2's proof. M4's
  proof does not use it. → article §3, M1.
- **M2 (`exists_logDerivExtension`).** Some G : ℂ → ℂ is continuous on {Re s ≥ 1} with
  G(s) = −ζ'(s)/ζ(s) − 1/(s−1) for Re s > 1. PROVED-UNCONDITIONAL — missing link 1. →
  article §3, M2.
- **M3 (`exists_range_sum_vonMangoldt_le`).** Σ_{i<N} Λ(i) ≤ (log 4 + 4)·N for every
  N. PROVED-UNCONDITIONAL — missing link 2. → article §3, M3.
- **M4 (`tendsto_psi_div_atTop`), the PNT in ψ-form.** ψ(x)/x → 1 as x → ∞.
  PROVED-UNCONDITIONAL. This is the classical PNT — the mathematics is Hadamard and
  de la Vallée Poussin's; the record's content is that mathlib's own pieces now assemble
  to it. → article §3, M4.
- **What is *not* here:** no new mathematics (the article's §7 item 1, verbatim in
  spirit); no error term — the quasi-RH effective form |ψ(x) − x| ≤ C·x^{7/8+ε}
  elaborates as a statement only (not attempted); the classical-strength effective form
  is closed by upstream (`PrimeNumberTheoremAnd` @ `938912bb` proves StrongPNT — not
  ours, no priority claimed); the corollaries θ(x)/x → 1 and π(x)·ln x/x → 1 are
  one-step records not claimed. → article §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| π(x) | number of primes ≤ x | π(10) = 4 |
| Λ(n) | von Mangoldt: ln p at powers of the prime p, else 0 | Λ(8) = ln 2 |
| ψ(x) | Chebyshev's function Σ_{n ≤ x} Λ(n) | ψ(10) = ln 2520 ≈ 7.832 |
| PNT, ψ-form | ψ(x)/x → 1 as x → ∞ | M4 |
| ζ(s) | the Riemann zeta function, Σ 1/n^s for Re s > 1 | pole at s = 1, residue 1 |
| Re s | real part of the complex number s | Re 1/2 + it is 1/2 |
| −ζ'/ζ | logarithmic derivative; Λ's transform Σ Λ(n)n^{−s} | pole 1/(s−1) at s = 1 |
| h | the analytic extension of (s−1)ζ(s) with h(1) = 1 | zero-free on Re s ≥ 1 |
| G | the continuous extension of −ζ'/ζ − 1/(s−1) | M2's conclusion |
| Wiener–Ikehara | Tauberian theorem: transform = A/(s−1) + G(s), G continuous, partial sums O(N) ⇒ sum ~ A·x | mathlib's `WienerIkehara.lean` |
| log 4 + 4 | M3's explicit constant C | ≈ 5.386 |
| γ | the Euler–Mascheroni constant: mathlib's sharper M1 limit | — |
| O(N) | "bounded by a constant times N" (the one big-O in the route) | M3's role |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-UNCONDITIONAL | kernel-checked with no hypotheses beyond the triad | all of M1–M4 |

## 7. What this is — and what it is not

- ψ here is Chebyshev's summatory function of Λ — not a quantum wavefunction, not the
  digamma function, not any other Greek-letter ψ from another field.
- Λ is the von Mangoldt arithmetic function (log-prime weights at prime powers) — not a
  cosmological constant and not lambda calculus.
- "Wiener–Ikehara" names a Tauberian theorem (a machine converting analytic facts about
  a transform into asymptotics of sums) — not Norbert Wiener's cybernetics or control
  theory.
- No new mathematics is claimed: M4 is the classical PNT; the record's claims are the
  assembly and the first-consumer fact, scoped to the surveyed corpora (mathlib at the
  pin and the sibling surveys), with no priority claimed over the upstream
  `PrimeNumberTheoremAnd` effort — mathlib's Wiener–Ikehara file is in fact adapted from
  that project, as the article discloses.
- Proving M4 uses nonvanishing of ζ on Re s ≥ 1 — a classical fact — not the Riemann
  Hypothesis; nothing here touches zeros off the line. "Kernel-verified" means every
  theorem was machine-checked term by term by the Lean type checker against fixed axioms
  — the triad (propext, Classical.choice, Quot.sound) is the full set used by all four.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statements → article §3 (M1–M4, short), with the glossary (§6 here) open.
- Proof ideas → §4 here, then article §5.
- Verification → article §6 (formal record), `research/pilots/22/Tier1.lean` (M1's first
  home `M1.lean`), and the cited logs.
- Novelty and nearest misses → article §4 (the Eberl–Paulson row; the upstream
  PrimeNumberTheoremAnd row with the adaptation disclosure; the mathlib lemma row that
  demotes M1).
- What stays open → article §7 (the statement-only quasi-RH form; the upstream-closed
  StrongPNT; the unformalized corollaries M5/M6).

## 9. What you need going in

- Limits at infinity and the ε-definition of a limit ("for every δ there is a cutoff").
- Natural logarithm; powers of primes and factorizations (2520 = 2³·3²·5·7).
- Complex numbers and Re s; a pole of a function, in one sentence.
- The one big-O: "O(N)" means bounded by a constant times N.
- What a proof-assistant library is, in one sentence — nothing else about Lean.
