# What the 7/8 Half-Plane Buys, and What It Cannot Move — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [What the 7/8 Half-Plane Buys: Formal Strip Confinement for ζ and Dirichlet L; and Why the
> Shipped Window-Certificate Engine Cannot Move Its Constants](../50-zero-free-regions-cannot-move-certificate-constants.md).
> Audience: an undergraduate mathematics background — modular arithmetic and polynomials
> assumed; no Lean, no analytic number theory, no exposure to this project assumed. Nothing
> here adds, weakens, or replaces any claim of the article: if this file and the article ever
> disagree, the article and its Lean artifacts win. Written 2026-11-21 against the article's
> committed state (merged revision).

## 1. In plain words

Late 2026 produced several machine-checked "zero-free half-plane" results: theorems saying
that the Riemann zeta function and its relatives have no zeros to the right of a vertical
line — for instance, none with real part above 7/8. Two natural questions follow. First,
what does such a result buy? This article proves, unconditionally, the classical reflection
consequence: every nontrivial zero is then confined to a fixed vertical strip, here
1/8 ≤ Re ρ ≤ 7/8 — and it does so with the 7/8 input *imported* from another verified
corpus rather than assumed, making the strip theorem itself unconditional. Second, does a
zero-free region help improve the neighboring "proportion" constants — the record of what
fraction of zeros lie on the critical line? Here the article's answer is a negative of a
different kind: not a theorem but a documented source reading of the relevant proof engine
showing that no statement of that improvement is even expressible in it — the engine looks
upward at heights and classifies zeros yes/no, so sideways zero-free information never
enters. That reading is billed honestly as source-verified, not machine-checked.

## 2. The background, in one page

### 2.1 Zeros, the critical strip, and zero-free half-planes

The Riemann zeta function ζ(s) is a function of one complex variable whose "nontrivial
zeros" — solutions of ζ(s) = 0 with real part strictly between 0 and 1 — have been studied
for 160 years. The **critical strip** is the band 0 < Re s < 1; the **critical line** is
Re s = 1/2. A **zero-free half-plane** is a statement of the form "ζ(s) ≠ 0 whenever
Re s > σ₀" for some constant σ₀: no zeros to the right of the vertical line at σ₀. The
famous (open) Riemann hypothesis is the case σ₀ = 1/2; the results this article consumes
are the cases σ₀ = 7/8 for ζ and for Dirichlet L-functions (proved in a sibling formal
corpus). A stronger case, σ₀ = 31/32 for all number fields, exists in another corpus but
is cited there, not consumed — it is not consumable at this project's toolchain pin
(article §4). (classical framing; the cited formal results are the donors'.)

### 2.2 Reflection: the functional equation

ζ has a symmetry, the functional equation (classical), which in mathlib's product form
relates the value at 1 − ρ to the value at ρ:

  ζ(1 − ρ) = 2·(2π)^{−ρ}·Γ(ρ)·cos(πρ/2)·ζ(ρ).

In words: the picture at height ρ on the left of the strip mirrors the picture at 1 − ρ on
the right. So a zero-free region on the right immediately forces a zero-free region on the
left: if ζ has no zeros for Re s > 7/8, then ζ has no zeros for Re s < 1/8 either —
because any zero at Re ρ < 1/8 would reflect to a zero at Re(1 − ρ) > 7/8, which is
forbidden. Combined with the strip itself, every nontrivial zero satisfies
1/8 ≤ Re ρ ≤ 7/8: a fixed **strip confinement**.

### 2.3 The proportion program next door

A separate line of work (the zeta23 corpus, inside this project's ecosystem) proves
*proportions*: machine-checked statements that at least 2/3 of ζ's nontrivial zeros are
simple and on the critical line. Its engine is a "window certificate": it detects zeros
inside vertical windows ordered by *height*, and extracts constants from that bookkeeping.
The bridge question: if no zeros exist above Re s = 7/8, can the constants improve?

### 2.4 The article's core questions

(Q1, the positive bridge) Does the half-plane plus the functional equation formally yield
the strip confinement for ζ and for Dirichlet L-functions? (Q2, the negative bridge) Is
"re-optimize the proportion constants under a zero-free half-plane" expressible in the
shipped engine at all? The article answers Q1 with kernel-checked theorems and Q2 with a
structured source reading that says no.

## 3. One reflection, by hand

The strip theorem's engine is one reflection, and it is fully hand-checkable. Suppose —
for a contradiction — that ρ is a nontrivial zero of ζ (so ζ(ρ) = 0 and 0 < Re ρ < 1) with
Re ρ < 1/8. Picture a candidate at Re ρ = 0.1. The functional equation above then gives

  ζ(1 − ρ) = [2·(2π)^{−ρ}·Γ(ρ)·cos(πρ/2)] · ζ(ρ) = [factor] · 0 = 0.

In words: the reflected point 1 − ρ is *also* a zero, because the right side carries the
factor ζ(ρ), which is 0 — we never need to check that the bracket is nonzero. Now measure
the reflected point: Re(1 − ρ) = 1 − Re ρ = 1 − 0.1 = 0.9, and 0.9 > 7/8 = 0.875. But the
imported donor theorem says ζ(s) ≠ 0 for all Re s > 7/8. Contradiction: 0.9 lies strictly
inside the donor's zero-free half-plane, yet 1 − ρ is a zero. Hence no nontrivial zero can
have Re ρ < 1/8; the mirrored argument (apply the donor theorem to ρ itself) forbids
Re ρ > 7/8. Conclusion: 1/8 ≤ Re ρ ≤ 7/8 — and the two boundary numbers are forced: the
reflection of the line Re s = 7/8 is exactly Re s = 1/8.

Two bookkeeping details, both handled in the article: the reflection map ρ ↦ 1 − ρ never
lands on a pole (the excluded points s = 1 and s = −n would need Re ρ ≤ 0 or Re ρ = 1,
outside a nontrivial zero's strip), and the Dirichlet version needs the same reflection
for L-functions — supplied by one named hypothesis hFEχ, because mathlib's product-form
reflection for primitive characters is a recorded gap there.

*Provenance:* the functional equation in mathlib's product form (`riemannZeta_one_sub`),
the donor half-plane statements, and the strip conclusion are article-recorded (§2, §3,
§5); the arithmetic above (0.1 → 0.9 > 0.875; the reflection of 7/8 being 1/8) is
hand-recomputed from those recorded statements and agrees with Theorem 1's proved
conclusion. No numeric zero locations are recorded or invented anywhere.

## 4. How the proof works, without Lean

Theorem 1 is the §3 argument made airtight: for a nontrivial zero ρ, the functional
equation forces ζ(1 − ρ) = 0; if Re ρ < 1/8 then Re(1 − ρ) > 7/8, contradicting the
imported donor theorem; if Re ρ > 7/8 the donor theorem contradicts ζ(ρ) = 0 directly.
The subtlety is *where* the input comes from: the 7/8 half-plane is not assumed — it is
a proved theorem of the openai-math corpus, consumed at that corpus's own pinned
toolchain ("at donor pin") after a transitive axiom audit of its 2,924-file dependency
closure (exactly the three routine axioms, no unproved gaps). Because the input is
imported rather than hypothesized, Theorem 1 carries no mathematical hypotheses at all —
only the definition of "nontrivial zero" of the object being classified. Theorem 3 runs
the same reflection for Dirichlet L-functions, reflecting a zero of L(·, χ) to a zero of
L(·, χ⁻¹); it is conditional on the single named hypothesis hFEχ (the product-form
functional equation for primitive characters — a recorded mathlib donation candidate).
Part I is deliberately not a proof: it is a file-by-file reading of the zeta23 engine's
constant-extraction pipeline, locating where a horizontal (zero-free) hypothesis would
have to enter and showing that no such slot exists — the engine's variable is the height
offset inside a detection window and its zero classification is binary.

## 5. What the main results say, informally

- **Part I, Proposition 1 (the negative bridge).** Within the zeta23 window-certificate
  engine *as shipped*, no statement of the form "the constant improves to a
  σ₀-dependent one under a zero-free half-plane Re s > σ₀" is expressible at any stage of
  the constant extraction. In words: the improvement bridge is not merely hard — the
  engine has no slot for it. This is a source-verified reading of the donor files, not a
  theorem of mathematics, not kernel-checked, and never counted among proved artifacts.
  PAPER-ONLY. → article §3, Part I.
- **Theorem 1 (`strip_confinement_seven_eighths`, ζ).** Every nontrivial zero ρ of ζ
  satisfies 1/8 ≤ Re ρ ≤ 7/8. In words: the half-plane input is imported (proved, not
  assumed), so the strip theorem itself is unconditional. PROVED-UNCONDITIONAL — at donor
  pin. → article §3, Thm 1.
- **Theorem 2 (mathlib vocabulary forms).** The same confinement stated for ζ's zero set
  as a membership and as a set-inclusion. PROVED-UNCONDITIONAL — at donor pin. → article
  §3, Thm 2.
- **Theorem 3 (`…_dirichlet_seven_eighths_of_FE`).** For every modulus, every primitive
  Dirichlet character χ, and every zero ρ of L(·, χ) with 0 < Re ρ < 1: 1/8 ≤ Re ρ ≤ 7/8
  — conditional on hFEχ, the product-form reflection (a named mathlib gap; its completed
  form exists in mathlib and is the recorded donation candidate). PROVED-CONDITIONAL — at
  donor pin. → article §3, Thm 3.
- **The discharges.** The half-plane inputs are the imported donor theorems applied
  verbatim — not assumed binders — so the strip theorems' only "conditional" content is
  Theorem 3's hFEχ. PROVED-UNCONDITIONAL — at donor pin (as discharge records). → article
  §3.
- **The conditional shells (earlier revision, retained).** The same strip theorems proved
  at this project's pin with the half-planes carried as explicit hypotheses — the portable
  fallback form. PROVED-CONDITIONAL. → article §3 (status table, last row).
- **What is *not* here:** any improved proportion constant (the article claims none, and
  Part I says the shipped engine cannot express the improvement); the ζ_K / Hecke strip at
  31/32 (specified, not done); and any claim against the donors whose results are
  consumed — the 7/8 input is cited as prior work, with mathematical priority explicitly
  disclaimed (the strip is derived in the donor preprint's Corollary 1.2; the reflection
  is classical).

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| ζ(s) | the Riemann zeta function | ζ(2) = π²/6 |
| ρ | a nontrivial zero: ζ(ρ) = 0, 0 < Re ρ < 1 | the object being confined |
| Re s, Im s | real / imaginary part of the complex variable s | Re s = 1/2 is the critical line |
| critical strip | the band 0 < Re s < 1 | where all nontrivial zeros live |
| zero-free half-plane | ζ(s) ≠ 0 for all Re s > σ₀ | σ₀ = 7/8 here |
| 7/8, 1/8 | the donor's constant and its reflection | 1 − 7/8 = 1/8 |
| functional equation | ζ(1−ρ) = 2(2π)^{−ρ}Γ(ρ)cos(πρ/2)ζ(ρ) | the reflection engine |
| L(s, χ) | Dirichlet L-function of a character χ | Theorem 3's object |
| hFEχ | product-form reflection for primitive χ: zero at ρ ⟹ zero at 1−ρ | the one conditional input |
| χ⁻¹ | the inverse character (reflection's target) | L(·,χ) reflects to L(·,χ⁻¹) |
| `IsNontrivialZeroP50 ρ` | the article's predicate: ζ(ρ) = 0 and 0 < Re ρ < 1 | the definition being classified |
| window-certificate engine | zeta23's height-ordered zero-detection machinery | the constant-extraction pipeline of Part I |
| σ₀ | a generic zero-free constant | re-instantiates at better donors |
| at donor pin | proved inside the donor corpus at its own pinned toolchain, audited transitively | Theorems 1–3 |
| PAPER-ONLY | source-verified reading; not kernel-checked; not a proved artifact | Part I |
| triad | the routine Lean axioms: propext, Classical.choice, Quot.sound | every kernel row here |

## 7. What this is — and what it is not

- "7/8" is a zero-free constant — no zeros of ζ with real part above 0.875 — **not** a
  probability, a score, or a fraction of zeros. The "quasi-Riemann hypothesis" nickname
  refers to such half-plane statements, which are weaker than the (open) Riemann
  hypothesis.
- "Strip confinement" is the reflected zero-location statement 1/8 ≤ Re ρ ≤ 7/8 — **not**
  confinement in any physical sense, and not a proportion: it says *where* zeros must lie,
  not *how many* are on the line.
- Part I is a **reading, not a theorem**: it documents that an improvement statement is
  inexpressible in one specific engine as shipped. It is billed PAPER-ONLY, must not be
  counted among proved artifacts, and does not preclude a different engine from using
  zero-free information.
- "At donor pin" means: proved and axiom-audited inside the openai-math corpus's own
  2,924-file dependency closure at that corpus's toolchain versions — not this project's
  pin; the unconditional status of Theorems 1–2 rests on the audited import.
- "Kernel-verified" means: every kernel row was machine-checked by the Lean type checker
  against fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the full set
  used, with zero `sorry`. Constants-staleness is disclosed by design: the formal frontier
  constant was already better when this shipped, and the strip theorem re-instantiates at
  any improved donor constant with the same proof.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statement → article §3 with §2's predicates and the glossary (§6 here) open.
- Proof idea → §4 here, then article §5 (the reflection; the Dirichlet analogue; the
  pole-exclusion bookkeeping).
- Verification → article §6 (formal record), `research/pilots/50/R1.lean` (donor pin) and
  `research/pilots/50/M1.lean`, `Dirichlet.lean` (project pin), with the audit log
  `research/feasibility/probe/logs-g/run32-g7-elab.log`.
- Novelty and nearest misses → article §4 (the donor preprint, Titchmarsh, and the
  stronger-but-unconsumable 31/32 and 0.8749 rows).
- What stays open → article §7 (hFEχ; the port to this project's pin; the 31/32 strip;
  Part I's status discipline).

## 9. What you need going in

- Complex numbers as points in a plane; vertical lines Re s = constant; "zeros of a
  function".
- One reflection fact, taken on faith here: the functional equation relates ζ at 1 − ρ to
  ζ at ρ by a multiplicative factor (§2.2, §3).
- Plain inequality arithmetic with the constants 1/8 and 7/8 — §3 uses nothing more.
- The distinction between "where zeros lie" (location) and "how many lie on a line"
  (proportion); what a Lean kernel check is and what "PAPER-ONLY" means (§7 above).
