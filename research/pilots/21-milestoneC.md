# Pilot 21 — Milestone C: the certified quartic-transplant check

Lane R5 (ant-bridge), 2026-11-09. Decides dossier 21
(`research/candidates/21-quartic-window-zeta-thmD.md`) milestone (C) and
orients outcomes (A2)/(B). Companion: dossier 21 § Precise statement; R8's
`research/novelty/round-1.md` §10 (CCLM17/AF-paper evidence). This is
**scoping research with a certified external computation, not a proof
artifact** — the ground rules' kernel-only standard applies to the eventual
theorem; the in-Lean proof path is specified in §5. All rational arithmetic
below is exact (`fractions.Fraction`); all transcendentals carry rational
interval certificates. Script inlined in §6 (stdlib-only, reproducible).

## §1 What was computed

Objects (zeta23 `Zeta23/ThmD/Functional.lean` [VERIFIED]): the scale-free
functional `cFun λ v = λ(∫v)²/(∫v² + λ²J(v))` with
`J(v) = ∬_{[−1/2,1/2]²} |s−s′| v(s)v(s′)` (`:40–43`); `cStar λ`
(`:35`); attainment `cFun λ (vStar λ) = cStar λ` (`cFun_vStar :432`);
`vQuartic s = 1 − (7/100)(2s)² − (51/200)(2s)⁴` (`Zeta23/XiPrime/Defs.lean`),
i.e. on the unit window `v = 1 − (7/25)s² − (102/25)s⁴`.

**Exact rational moments.** With `I_j := ∫_{−1/2}^{1/2} s^{2j} ds = 1/(4^j(2j+1))`
and the kernel-operator identity (derived here; same shape as
`Functional.lean:321 kernel_eq`)
`T[t^{2l}](s) := ∫|s−t|t^{2l}dt = α_l·s^{2l+2} + β_l`,
`α_l = 2/((2l+1)(2l+2))`, `β_l = 2^{−(2l+1)}/(2l+2)`,
every moment `M(k,l) := ∬|s−s′|s^{2k}s′^{2l} = α_l·I_{k+l+1} + β_l·I_k` is an
explicit rational. Sanity anchors asserted in the script (all pass):
`M(0,0) = 1/3`, `M(1,0) = 1/30`, `M(1,1) = 1/2688 + 1/384`,
`M(2,0) = 1/448 + 1/320`, `M(2,1) = (1/6)/2304 + (1/32)/80`,
`M(2,2) = (1/15)/11264 + (1/192)/80` (note α₂ = 2/30 = **1/15** — the hand
value 1/30 in dossier 21's preliminary note was wrong; corrected there via
erratum, see §7).

For `vQuartic = 1 + c₁s² + c₂s⁴` with `c₁ = −7/25`, `c₂ = −102/25`:

| quantity | exact value | decimal |
|---|---|---|
| a = ∫v | 2777/3000 | 0.925666666666666638 |
| b = ∫v² | 518783/600000 | 0.864638333333333287 |
| J = ∬\|s−s′\|vv′ | 37896811/138600000 | 0.273425764790764803 |
| **cFun(1, vQuartic)** | **593803133/788678420** | **0.752909066536903593** |

**Transcendental side.** `cStar 1 = √2·sin ϑ/(cos ϑ + ϑ·sin ϑ)`, `ϑ = 1/√2`,
enclosed by rational intervals: √2 via `isqrt` (integer square root,
`lo² ≤ 2 ≤ hi²` asserted), sin/cos via exact-rational Taylor partial sums
(N = 20) widened by the Lagrange remainder `x^{2N+1}/(2N+1)!` (valid for all
x ≥ 0 since all derivatives are bounded by 1), monotone composition on
[0, 1]. Denominator bounded below by 3/4 as in zeta23's own
`cStar_denom_ge` (`Functional.lean:105`).

| quantity | certified interval (width) |
|---|---|
| ϑ = 1/√2 | [0.707106781186547572737310929369, …369] (2·10⁻⁵¹) |
| **cStar(1)** | **[0.75329606785607072794164196238853, +1.5·10⁻⁵⁰]** |
| HD(1) = 2 − 1/c₁* | [0.67250070367941161553204665324301, +1.5·10⁻⁵⁰] |

Sanity: these agree with the literature values 0.753296067856… /
0.672500703679… to all printed digits (R8 round-1 §10; AF abstract).

## §2 Verdict (C) — certified

**cStar(1) − cFun(1, vQuartic) ∈ [3.870013·10⁻⁴, 3.870013·10⁻⁴] (certified;
both endpoints to 6 significant digits).**

- The ξ′-tuned quartic transplant **loses** to the cosine window by a
  certified margin **≥ 3.870·10⁻⁴** at the c-level; at the proportion level,
  the quartic would give HD = 2 − 1/0.752909… = 0.671818358358173273 —
  **strictly worse than the current Theorem D constant** HD(1) =
  0.672500703679411616. Outcome (B)-via-transplant is **DEAD**.
- This upgrades dossier 21's hand-grade estimate (margin then thought
  ≈ 3.5·10⁻⁴ with the M(2,2) slip) to a certified inequality with an
  error analysis: every step is either exact rational arithmetic or a
  Taylor remainder bound; the only external inputs are the four arithmetic
  operations and `isqrt`, both machine-verified here and reproducible from
  §6.

## §3 (c) Separator-window direction — one-page analysis

Three probes, all pointing the same way:

1. **Full quartic family** `v = 1 − t₁(2s)² − t₂(2s)⁴`, `v ≥ 0` on the
   window (⇔ t₁+t₂ ≤ 1), 2001×2001 float grid then certified evaluation at
   the winner: max at **(t₁, t₂) = (0.2414–0.2415, 0)** — the family's best
   member is a *pure quadratic*, value 0.753295667571…, i.e. **4.0·10⁻⁷
   below cStar(1)** (refined 1-D: t₁ = 12069/50000, margin ≥ 3.99·10⁻⁷). The
   polynomial family approaches the cosine from below and does not beat it.
2. **Free-frequency cosine** `v = cos(ωs)`, λ = 1: float scan over
   ω ∈ [0.2, 2.2] (4001 points) peaks at the grid point nearest √2;
   certified evaluation at ω = 1.414000: cFun = 0.753296067523…,
   **3.3·10⁻¹⁰ below cStar(1)**; at ω = √2 exactly, cFun = cStar(1) by
   zeta23's `cFun_vStar`. The maximizer of the frequency family is the MT
   window itself. (Grid scan, not a proof of the ω-supremum — but the
   direction is unambiguous.)
3. **AF paper's own obstruction** [VERIFIED verbatim, WebFetch of
   `arxiv.org/html/2608.13637v2`, 2026-11-09]: §1.4 ("What the results are
   not"): *"improving on 2/3 by this route would require pair-correlation
   information beyond Fourier support 1."* Mechanism (§7.2(a)): for window
   scale X ≫ T *"the off-diagonal prime sum is no longer dominated by the
   diagonal"* — evaluating it needs *"the Hardy–Littlewood conjectures, or
   equivalently Montgomery's pair correlation conjecture for support > 1."*
   And §7.2(e): higher-moment traces are controllable only in the
   Rudnick–Sarnak range X^k ≤ T^{2−ε}, so at X ≍ T *"unconditionally,
   higher moments add nothing."* Conditional escapes exist (AF: HL*(4)
   would give ≥ 13/18 ≈ 0.7222; full HL* gives proportion 1) — i.e. the
   only (B) route is a *conditional* program on prime-pair conjectures.

**Conclusion on (B)**: no unconditional separator exists in the natural
window families; the cFun class is optimized at the MT window (consistent
with CCLM17 Cor. 14, which AF cite as proving optimality *"among windows ψ
(equivalently, certificates of the form 2 − R(ψ))"* [VERIFIED, same fetch]).
**(B) unconditional: DEAD.** (B) conditional-on-HL*: different programme,
out of scope for this dossier.

## §4 Verdict (A2) — ALIVE, with sharpened content

AF's own wording pins the open question exactly [VERIFIED, same fetch]:
Theorem A's 0.6725 is optimal *among windows / certificates of the form
2 − R(ψ)*; §7.2's ceiling 0.6818287 is a bound over *"the broader class of
all bandwidth-one certificates"*, and the paper only notes *"the 2/3 of
Theorem A(i) is within 0.016 of the ceiling of its own method"* — the
supremum over the broader class is **not** asserted to equal 2 − 1/c₁*.
Therefore:

- **A2 is ALIVE** as the remaining new claim of dossier 21: *every
  bandwidth-one certificate is dominated by a window certificate*, i.e.
  sup{bandwidth-one certificates} = 2 − 1/c₁* = 0.672500703679411616…,
  collapsing the 0.6818287 ceiling (PairCeiling `ceiling_law256_signed`,
  hypothesis `EnclOK`) down to the MT constant.
- Its two obligations split cleanly: (i) the variational half — sup over
  windows = cStar — is CCLM17-informal and now empirically confirmed in two
  families (§3.1–3.2); formalizing it is (A1), formalization-grade; (ii) the
  class-identification half — *certificate ⇒ window domination* — is the
  genuinely new mathematics, lives against `Zeta23/PairCeiling/{Defs,
  Stability}.lean` (the `Csum/Cstep/Dfun/Efun` certificate objects) vs
  `ThmD/Window.lean` (`phiD`, `cDT :286`), and has no literature statement
  we could find `[R8 round-2 queued: "bandwidth one certificate window
  domination", CCLM17 scope]`.
- One caution from the same fetch, to be respected in any A2 write-up: the
  PairCeiling enclosures *"are certified by interval arithmetic and are not
  checked by the Lean kernel"* (AF's disclosed caveat) — an A2 theorem that
  *consumes* `ceiling_law256` inherits `EnclOK`; an A2 theorem that
  *replaces* it by the analytic (A1) bound removes that dependency, a
  side benefit.

## §5 Specified in-Lean proof path (for the eventual theorem)

- **Milestone (C) as a Lean theorem** (`cFun_quartic_lt_cStar`): the moments
  are rational — verify by `norm_num`/`ring` from the antiderivative
  identities (each `∫s^{2j}` and `M(k,l)` is a one-line `integral_pow`
  computation; the kernel identity `T[t^{2l}]` is an elementary case split
  at s = t, same shape as `kernel_eq`'s proof in `Functional.lean:321–402`).
  The cStar side: partial-sum rational bounds from
  `Real.sin_eq_tsum`/`Real.cos_eq_tsum`
  (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Series.lean:112,:109`)
  with a tail bound `|tail| ≤ ϑ^{2N+1}/(2N+1)!·(1/(1−ϑ²/((2N+2)(2N+3))))`
  (geometric comparison), all quantities rational at ϑ-enclosure endpoints.
  N = 8 already gives ~10⁻¹⁸ ≪ 3.87·10⁻⁴ margin. **Interval arithmetic in
  Lean** (rather than bare Taylor) is an acceptable alternative; the
  external mpmath-style computation is NOT acceptable as evidence — this
  document is scoping only.
- **(A1) as a Lean theorem**: analytic, not computational — the
  kernel-identity/Cauchy–Schwarz expansion of dossier 21 step 2; candidate
  formal skeleton: `∀ v, ContDiff ℝ 2 v → (∀s, 0 ≤ v s) → cFun 1 v ≤ cStar 1`
  over the window interval, reducing to positivity of an explicit integral
  quadratic form in (v − α·v*).
- **(A2)**: analytic bridge between `PairCeiling` certificate objects and
  the window class; no computational component expected.

## §6 Reproducibility (script, stdlib-only, ~2 s)

The executed script is preserved verbatim at `/tmp/milestoneC/quartic_check.py`
in the session workspace (ephemeral); its complete logical core is:

```python
from fractions import Fraction as F
import math
# interval ops add/sub/mul/div_pos/scale (endpoint arithmetic, div by positive)
def sqrt2_interval(k=50):
    r = math.isqrt(2*10**(2*k)); lo,hi = F(r,10**k),F(r+1,10**k)
    assert lo*lo <= 2 <= hi*hi; return (lo,hi)
def sin_cos_interval(x, N=20):  # Lagrange remainder, all-rational
    sp=F(0); cp=F(0); x2=x*x
    for n in range(N):
        s = 1 if n%2==0 else -1
        cp += s*x2**n/F(math.factorial(2*n)); sp += s*x*x2**n/F(math.factorial(2*n+1))
    Rs = x*x2**N/F(math.factorial(2*N+1)); Rc = x2**N/F(math.factorial(2*N))
    return (sp-Rs,sp+Rs),(cp-Rc,cp+Rc)
theta = div_pos((F(1),F(1)), sqrt2_interval())        # 1/sqrt2
# cStar(1) = sqrt2*sin(th)/(cos th + th*sin th), monotone composition
c1,c2 = F(-7,25), F(-102,25)                          # vQuartic coeffs
I = lambda j: F(1,4**j*(2*j+1))
M = lambda k,l: F(2,(2*l+1)*(2*l+2))*I(k+l+1) + F(1,2**(2*l+1)*(2*l+2))*I(k)
a = 1+c1*I(1)+c2*I(2)
b = 1+2*c1*I(1)+(c1*c1+2*c2)*I(2)+2*c1*c2*I(3)+c2*c2*I(4)
J = sum((F(1) if k==0 else c1 if k==1 else c2)*(F(1) if l==0 else c1 if l==1 else c2)
        *M(k,l) for k in range(3) for l in range(3))
cFun_quartic = a*a/(b+J)                              # EXACT rational
# verdict: certified cStar(1) - cFun_quartic >= 3.870013e-4
```

Bugs found and fixed during the run (recorded for the audit trail): initial
`div_pos((0,1), s2)` misuse (produced a vacuous θ interval — caught by the
width printout); `ch,_ = sin_cos_interval(...)` grabbed the sin component
for the cos slot in the free-frequency probe (caught by float-vs-interval
cross-check 0.8286 vs 0.7533); the hand M(2,2) coefficient 1/30 → 1/15
(caught by the asserted anchor equalities). Every fix was validated by an
independent float recomputation agreeing to 10+ digits.

## §7 Dossier-21 updates (erratum + lane-proposal update)

Dossier file `research/candidates/21-quartic-window-zeta-thmD.md` was
re-read before this section: unchanged since my write (no H-edit conflict
detected), so the append-only erratum below was ALSO appended to the
dossier itself. Content of the update:

- **Erratum** (dossier § Precise statement, milestone (C) paragraph): the
  hand-computed moments contained a slip in M(2,2) (α₂ = 1/15, not 1/30);
  certified values are cFun(1, vQuartic) = 593803133/788678420 =
  0.752909066536903593 and margin **cStar(1) − cFun(1, vQuartic) ≥
  3.870·10⁻⁴** (this file §2); the hand estimate's "within hand-arithmetic
  error" caveat is discharged.
- **Lane-proposal update** (dossier Score section, appended): (B)
  unconditional DEAD (§3: polynomial family and free-frequency family both
  peak at/below cStar(1); AF §1.4's Fourier-support-1 obstruction);
  (A1) survives as formalization-grade (CCLM17 Cor. 14 covers the window
  class per AF's own citation); **(A2) is the dossier's sole remaining
  discovery-grade claim and is ALIVE** (§4). Proposed scoring now (not
  before): A2-path Novelty 4, Significance 3, Effort 3 → rank 4.0;
  A1-only fallback Novelty 2, Significance 2, Effort 2 → 2.0. The (B)-open
  branch of the original proposal (6.25) is closed.
