# Candidate 21 — quartic-window-zeta-thmD

Owner: lane R5 (ant-bridge). Realizes `research/bridges/analytic-nt.md` §2(a)
(the frozen-λ / frozen-window lift) and §3 item 3 (the 0.67250 ↔ 0.6818287
gap). Created 2026-11-09. **Honesty-first dossier**: the investigation below
has three possible outcomes — a constant improvement, a certified optimality
theorem, or a negative finding; all three are stated up front because two of
the three are publishable content and the task explicitly allows a certified
impossibility as the result. Tags: [VERIFIED]/[HYPOTHESIS] per claim.

## Name

quartic-window-zeta-thmD

## One-line pitch

zeta23's Theorem D constant 2 − 1/c₁* ≈ 0.67250 is provable only through the
scale-free functional `cFun λ v` whose *attainment* by the cosine profile is
formalized (`cFun_vStar`) but whose *optimality* is not — so the corridor
between that constant and the formal bandwidth-one ceiling 0.6818287
(`ceiling_law256`) is an open gap in the AF method's own framing, and closing
it from either side (a better window, or a proof that none exists within the
certificate class) is the candidate.

## Precise mathematical statement

Objects ([VERIFIED] `Zeta23/ThmD/Functional.lean`): for λ ∈ (0, 1] and
v : ℝ → ℝ on [−1/2, 1/2],
`cFun λ v := λ·(∫v)² / (∫v² + λ²·∬|s−s′|·v(s)·v(s′) ds ds′)`
(`Functional.lean:40–43`); `vStar λ s := cos(√2·λ·s)` (`:32`); the moments
`aStar/bStar/jStar` (`:47–50`) with closed forms (`aStar_eq :259`, `bStar_eq
:273`, `jStar_eq :385`, `jStar_closed :483`); `cStar λ` (`:35`) with
`cFun λ (vStar λ) = cStar λ` (`cFun_vStar :432`) — **attainment only**;
`HD λ := 2 − 1/cStar λ` (`:53`); at λ = 1, c₁* = cStar 1 ≈ 0.7532960 and
HD 1 ≈ 0.67250 (`HD_one :464`; formal statements `Challenge.lean:163–190
montgomery_taylor_*`). The quartic profile of the ξ′ topic:
`vQuartic s := 1 − (7/100)(2s)² − (51/200)(2s)⁴` (`Zeta23/XiPrime/Defs.lean`),
so far used ONLY for ξ′ (`Quartic.lean:29 fQ`, `:275 cQ`; constants
86.864%/93.432% vs flat 85.838%/92.919%, `Challenge/XiPrime.lean:79–105`).

**Primary target (outcome A — certified optimality / strengthened ceiling).**
Define the admissible class 𝒱 := even, C², v ≥ 0 profiles on [−1/2, 1/2]
(the class the engine's windows generate: `phiD_nonneg`/`phiD_even`,
`ThmD/Window.lean:50,45`; the admissibility question itself is part of the
work, see Proof sketch step 0). Then:

  (A1) ∀ v ∈ 𝒱, cFun 1 v ≤ cStar 1   — the optimality theorem, absent from
      all four corpora [VERIFIED: `rg -rn 'optimal|≤.*cStar|sup.*cFun'
      anthropics_formal-math/zeta23/Zeta23/ThmD/` → no inequality theorem;
      no `∀v`-optimality theorem among cFun's ~80 token occurrences across
      zeta23 (ThmD/{Concrete,Limit,PP}, XiPrime Coeff, WeilEF, PrimeSide —
      all instantiation sites)]. [erratum 2026-11-09, H/QA: v1 claimed "cFun
      is consumed nowhere outside Functional.lean"; the token is widespread —
      what is absent is the optimality theorem];
  (A2) **class identification**: every bandwidth-one (c₀, r)-certificate of
      `Zeta23/PairCeiling/` (the objects of `ceiling_stability`/`ceiling_law256`)
      determines an admissible profile, and the proportion it certifies is
      ≤ 2 − 1/cStar 1 — upgrading the formal ceiling 0.6818287
      (`PairCeiling/Signed.lean:94 ceiling_law256_signed`, hypothesis `EnclOK`)
      down to 0.67250, i.e. the MT constant IS the exact supremum of the
      method. [HYPOTHESIS — this is the genuinely new mathematical claim; the
      AF paper frames the residual as "within 0.016 of the ceiling of its own
      method" (§7.2, per R8 round-1 §10) without deciding it.]

**Alternative target (outcome B — constant improvement).** Exhibit v ∈ 𝒱 with
cFun 1 v > cStar 1 (a "separator"), then rerun the Theorem-D assembly with
that profile to get a new proportion constant strictly between 0.67250 and
0.6818287 for ζ: `∀ε>0, ∃T₀, ∀T≥T₀, (2 − 1/c⁺ − ε)·N(T,2T) ≤ N₀*(T,2T)`
with c⁺ := cFun 1 v > c₁*. [HYPOTHESIS; my preliminary computation below says
the natural transplant does NOT beat it — outcome B requires a *ζ-tuned*
profile, not the ξ′-tuned one.]

**Included negative-control milestone (cheap, decisive either way).**
(C) Rigorous interval-arithmetic proof of `cFun 1 vQuartic < cStar 1`
(or the contrary). Hand-grade preliminary computation [HYPOTHESIS — margin is
within hand-arithmetic error, see below]: with
v = 1 − 0.28 s² − 4.08 s⁴, the exact moments are
∫v = 1 − 0.28/12 − 4.08/80 = 0.925667;
∫v² = 1 − 0.56/12 − 8.0816/80 + 2.2848/448 + 16.6464/2304 = 0.864640;
J = M₀₀ + 2a₁M₁₀ + 2a₂M₂₀ + a₁²M₁₁ + 2a₁a₂M₁₂ + a₂²M₂₂ with a₀=1, a₁=−0.28,
a₂=−4.08 and ∬-kernel moments M₀₀ = 1/3, M₁₀ = 1/30, M₂₀ = 1/448 + 1/320,
M₁₁ = 1/2688 + 1/384, M₁₂ = (1/6)/2304 + (1/32)/80, M₂₂ = (1/30)/11264 +
(1/192)/80 (each from the antiderivative identities ∫|s−t|t^{2k}dt =
s^{2k+2}/((2k+2)(2k+1)·…) + const — same shape as `Functional.lean:321
kernel_eq`), giving J ≈ 0.273377 and
**cFun 1 vQuartic ≈ 0.856859/1.138017 ≈ 0.752941 vs cStar 1 ≈ 0.753296** —
a margin of ≈ 3.5·10⁻⁴, consistent with cosine optimality but too thin to
trust by hand. The first Lean milestone is to make this rigorous (all
integrands are polynomials; the enclosing inequalities are finite sums of
rationals — exactly the shape of `PairCeiling`'s decide-checked row
inequalities, `LawN256_check` precedent).

## Novelty check

Corpus-side:
- **zeta23**: `rg -rn 'quartic' Zeta23/ThmD/` → 0 hits (quartic lives only in
  `Zeta23/XiPrime/`, 23 files [erratum 2026-11-09, H/QA: v1 said "10 files";
  `grep -li quartic` over XiPrime .lean files recounts 23]) [VERIFIED]; no
  `cFun`-optimality theorem anywhere (the `cFun` token occurs in ~80 zeta23
  files but all as instantiation sites — no `∀v` theorem; the docstring
  "[eq:vstar] the optimal profile" is an assertion from the paper, not a
  formalized theorem) [VERIFIED].
- **mathlib**: nothing (no window functionals at all). [VERIFIED]
- **openai-math / tauceti**: no ThmD-window analogue; openai's window content
  is the Ostmann/DirichletL detector machinery (different functionals).
  [VERIFIED via `rg -i 'cFun|vStar|ThmD' openai-math/lean tauceti/TauCeti` → 0]

Literature [via R8 round-1, `research/novelty/round-1.md` §10 — STRONG prior
evidence, round 2 to confirm]: the MT window ψMT(s) = cos(2s)·1[−1/2,1/2](s)
is AF §2.2 eq. (2.6); cMT⁻¹ = 1/2 + (1/√2)·cot(1/√2) is AF Lemma 5.6;
**"optimality among windows is cited to prior work [CCLM17, Cor. 14]"
(Carneiro–Chandee–Littmann–Milinovich)**; the bandwidth-one ceiling 0.6818287
is in AF §7.2 and appears **new as an optimality barrier** (R8 verdict:
NEW-CLAIM-SUPPORTED). Consequences for this dossier: (A1) alone is
KNOWN-INFORMAL (CCLM17) → formalization-first, not discovery; **(A2) — that
the ceiling class collapses to the MT constant — is not in CCLM17 or AF as
far as round-1 evidence shows** [HYPOTHESIS]; outcome B (a separator) would
contradict CCLM17's optimality if their class contains ours — the exact
CCLM17 class is THE round-2 question. `[R8 confirmation pending]`. Queued
queries: "Carneiro Chandee Littmann Milinovich extremal functions zeta
optimality" (recover Cor. 14 statement + its function class); "Montgomery–
Taylor window quartic zeta"; AF arXiv:2608.13637v2 §7.2 + §8.1 fulltext
("does the paper assert sup = 2−1/c₁* over certificates, or only the 0.6818
bound?"); Lamzouri arXiv:2609.02882 (does the simpler proof re-derive or
improve the window constant? — R8: no improvement of 0.6725).

Nearest miss: CCLM17 Cor. 14 (informal optimality of the extremal window for
the *pair-correlation/Levinson functional*); what differs there is precisely
(A2) — relating the *certificate* class of `PairCeiling` to the *window/functional*
class, which neither CCLM17 nor AF settles.

## Bridge analysis

- Corpora bridged: anthropics (zeta23) only, in the narrow sense — but it is a
  *within-corpus lift* of exactly the kind Phase 2 §2(a) licenses (proved but
  not generalized: quartic exists for ξ′ only; optimality asserted but not
  proved), with the ceiling providing the second, independent formal object
  (`PairCeiling/`) that makes (A2) a well-posed question. mathlib enters as
  the substrate for the interval arithmetic (`Real` computing, `IntervalArithmetic`-style
  bounds or rational decide, precedent `PairCeiling/LawN256_check`).
- Essentiality: (A1) is single-corpus mathematics (zeta23's own functional);
  its value is closing zeta23's internal assertion-vs-theorem gap and feeding
  (A2). (A2) is essential-bridge in the corpus sense: it consumes BOTH
  `ThmD/Functional.lean` AND `PairCeiling/{Defs,Stability,Signed}.lean`, two
  zeta23 components with no current consumer-producer link (survey §2(d):
  PairCeiling "ends at ceiling_law256; nothing downstream").
- Empty-zone fit: `research/bridges/analytic-nt.md` §2(a) (quartic-for-ζ lift;
  rank–trace c-continuum noted adjacent) and §3.3 (the 0.67250/0.6818287 gap).

## Proof-strategy sketch

0. **Fix the admissibility class.** `cFun` is homogeneous (v ↦ tv leaves it
   invariant), so the variational problem is a shape optimization. Sign-
   changing v is NOT a priori excluded by `cFun`'s definition, but the engine
   only ever uses v ≥ 0 windows (`phiD_nonneg`); also the |s−s′| kernel is
   conditionally negative definite, so unconstrained sign changes can game
   the denominator. State (A1) over 𝒱 := {even, C², v ≥ 0}; verify against
   `Window.lean`'s actual requirements (`TaperProfile ϱ`, `ModFactor`-type
   bounds in the ξ′ analogue `Quartic.lean:257`) whether C² + nonnegativity
   is exactly what the assembly consumes. [Flagged as the statement-shaping
   step; routine but decisive.]
1. (C) Rigorously decide the transplant: polynomial moment bounds for
   vQuartic (rational arithmetic — every M(k,l) above is an explicit
   rational), then `cFun 1 vQuartic ≤ cStar 1` by rational interval
   arithmetic on the closed forms of `aStar_eq/bStar_eq/jStar_eq` at λ = 1.
   [Routine; S effort; the answer orients everything else.]
2. (A1) Optimality: the kernel identity `kernel_eq` (`Functional.lean:321`)
   says the |s−s′|-convolution of the cosine is *affine in cos* —
   T(v*)(s) = a*/2 + cosϑ/λ² − v*(s)/λ². Conjectured mechanism [HYPOTHESIS]:
   expand ∫(v − α·v*)²-type nonnegativity with T's symmetry (T is self-adjoint
   with kernel |s−s′|) to get a Cauchy–Schwarz-tight quadratic form bound
   ∫v² + λ²J(v) ≥ (∫v)²/cStar λ for all v ∈ 𝒱; the affine-action identity is
   what makes v* the equality case. This is one-variable real analysis —
   `Functional.lean` imports Mathlib only ("pure one-variable calculus: no
   project imports"). [The genuinely new idea; if CCLM17's proof
   (Fourier-extremal) transposes, the Lean proof may instead go through
   positivity of a trigonometric kernel.]
3. (A2) Class identification: unfold `PairCeiling/Defs.lean`'s certificate
   weights s : ℕ → ℝ (atom masses at grid points j/N; `Csum/Cstep/Dfun/Efun`)
   into the profile language of `ThmD/Window.lean` (`phiD`, `cDT` `:286`);
   show a (c₀, r)-certificate with bandwidth one induces v ∈ 𝒱 with
   cFun-value equal to the certified proportion rate (or ≤ it). Hardest
   sub-step; `ceiling_stability` (`PairCeiling/Stability.lean`) is the
   formal bridge surface. [HYPOTHESIS on exact statement shape; requires
   reading `Stability.lean`'s hypotheses against `Window.lean`'s.]
4. (Outcome B, only if (C) or a search finds a separator): rerun the assembly
   — `ThmD/Window.lean` moment-closeness lemmas for the new profile
   (a/b/J-close, the role of `cDT` and the `Limit.lean` convergence
   `cRatio(λ₁; a_D, b_D, J_D) → c*(λ)`), then `Endgame.lean` + `Final.lean`
   verbatim. The swap cost is the moment lemmas only [VERIFIED: assembly
   structure from `ThmD/Final.lean` header]; the profile family
   v_θ = 1 − θ₁(2s)² − θ₂(2s)⁴ (θ from a grid) is the natural search space,
   optimizable by the same rational-arithmetic machinery as step 1.

**Hardest step**: (A2) — it is the only part that is new mathematics rather
than formalization; (A1) is the second-hardest and is self-contained
elementary analysis.

## Feasibility

F0. Target: (A1) ∀v ∈ 𝒱, cFun 1 v ≤ cStar 1; (A2) ceiling collapse to
    2 − 1/cStar 1; (C) cFun 1 vQuartic ≤ cStar 1 rigorously; (B) conditional.

F1. Mathlib entry points: `Real.sin/cos` integral API (already exercised by
    `Functional.lean`'s own `integral_cos`, `integral_cos_sq` uses), rational
    arithmetic / `Nat.decide`-style bounds (precedent: `PairCeiling/LawN256
    _check` in-kernel decide); `Real.sqrt` positivity; no advanced API needed.
    The whole primary target lives in one-variable calculus + finite
    combinatorics on 256-point laws — **no L-function theory required**.

F2. Donor lemmas: all zeta23, same repo (no cross-toolchain port for A1/C):
    `cFun/vStar/cStar/aStar_eq/bStar_eq/jStar_eq/jStar_closed/cFun_vStar`
    (`ThmD/Functional.lean:40–501`), `HD_one :464`; `phiD`-window API
    (`ThmD/Window.lean:38–291`); `PairCeiling/{Defs,Stability,Signed,
    CeilingLaw256}.lean` for (A2); ξ′ quartic precedent `XiPrime/QuarticWindow/
    {Quartic,Moments}.lean` (moment computation style for polynomial profiles).

F3. Missing glue:
    a. the admissibility-class formalization (𝒱) matching the assembly's
       actual consumption — S;
    b. the optimality inequality (A1) — the driver, M depth of pure analysis;
       CCLM17's proof (if it transposes) or the kernel-identity route;
    c. (A2) certificate↔profile dictionary — M–L, and possibly blocked by the
       `EnclOK` external hypothesis (see F5);
    d. (C) rational moment bounds — S.

F4. Effort: **M** for (C)+(A1) (one-variable analysis, ~1.5–3k LoC);
    (A2) M–L on top; (B) M given (C)-style machinery. No porting debt for
    (A1)/(C) (same repo); (A2) same repo as well.

F5. Risk factors:
    - **the CCLM17 scope risk cuts both ways**: if their class strictly
      contains ours, (A1) is a corollary (novelty 1–2, formalization value
      only); if it does not cover e.g. non-|s−s′|-kernel variants the AF
      assembly actually uses, (A1) is genuinely open;
    - `PairCeiling` carries `EnclOK` (external interval-arithmetic enclosures,
      sha256-stamped, NOT in-repo — survey §2(b)); (A2)'s statement must
      either inherit `EnclOK` (weaker claim) or re-derive the needed rows
      internally — flagged;
    - the 3.5·10⁻⁴ margin in (C): if hand arithmetic is off in the other
      direction, outcome B opens — this is why (C) is milestone 1;
    - no toolchain risk: everything is in-repo zeta23 / mathlib-core content.

F6. Verification plan: kernel-only; interval/rational arithmetic in Lean
    (no external CAS), mirroring the `LawN256_check` decide methodology; Modal
    build via the math-proof1 loop when scaffolding exists.

Toolchain split note: no cross-corpus port needed for (C)/(A1) (all zeta23 +
mathlib-core); zeta23 sits on v4.33.0-rc2 vs the workspace v4.36.0-rc2, but
R9's port-probe (`research/feasibility/port-probe.md`, round-2 DONE) showed
zeta23 statements elaborate cleanly against v4.36 (B1) — proofs re-fix cost
only, and here the proofs are being written new anyway.

## Significance

Decides whether the AF method for ζ is exhausted at 0.67250 or has certified
headroom to 0.6818287 — a question the AF paper itself poses ("within 0.016
of the ceiling of its own method") and leaves open; either answer (exact
supremum theorem, or a new proportion constant for ζ) is a citable result,
and (A2) would upgrade the only formal optimality barrier in the ecosystem.
Methodologically it is the cheapest candidate in this lane: no L-functions,
no explicit formulas, no ports — one functional, one polynomial family, one
certificate class.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (R5, non-binding)**: depends on outcome, which is itself the
pilot's product — propose scoring AFTER milestone (C)+step 0 (≈ S effort):
if (A2) survives the CCLM17 scope check: Novelty 4, Significance 3,
Effort 3 → rank 4.0; if (A1)-only (CCLM17 covers it): Novelty 2,
Significance 2, Effort 2 → rank 2.0 (formalization-grade, deprioritize);
if (B) opens: Novelty 5 (new ζ proportion constant, beating AF/Lamzouri
0.6725 — R8 found no such paper), Significance 5, Effort 4 → rank 6.25.
Pilot-first within this dossier regardless: milestone (C), because it is
S-effort and orients all three outcomes.

---

## Erratum + verdict update (R5, 2026-11-09, append-only; from pilot `research/pilots/21-milestoneC.md`)

Note: this dossier was concurrently edited (mtime 19:25); the erratum was
checked against the current tail before appending — no conflict found; the
authoritative expanded version of this update lives in the pilot file.

- **Erratum to the (C) paragraph above**: the hand-computed moments
  contained a slip in M(2,2) (kernel coefficient α₂ = 2/30 = 1/15, not
  1/30). Certified values (exact rational moments; cStar(1) by rational
  Taylor intervals): **cFun(1, vQuartic) = 593803133/788678420 =
  0.752909066536903593**, and **cStar(1) − cFun(1, vQuartic) ≥
  3.870·10⁻⁴** (cStar(1) = 0.75329606785607072794164196238853 certified to
  1.5·10⁻⁵⁰). Quartic-window HD = 0.671818358358… < HD(1) =
  0.672500703679411616…: the transplant would make Theorem D *worse*.
- **Verdicts**: (C) decided — cosine wins, certified. **(B) unconditional
  DEAD**: full quartic family grid max is the pure quadratic (t₁ ≈ 0.24138,
  t₂ = 0), 4.0·10⁻⁷ below cStar(1); free-frequency cosine peaks at ω = √2
  (= cStar by `cFun_vStar`); AF §1.4 verbatim: "improving on 2/3 by this
  route would require pair-correlation information beyond Fourier support
  1". **(A1)** survives as formalization-grade (CCLM17 Cor. 14 covers the
  window class per AF's citation "among windows ψ (equivalently,
  certificates of the form 2 − R(ψ))"). **(A2) ALIVE** and now the
  dossier's sole discovery-grade claim: AF bound 0.6818287 over "the
  broader class of all bandwidth-one certificates" without asserting the
  supremum equals 2 − 1/c₁* — the class-identification (certificate ⇒
  window domination) is open.
- **Lane proposal updated**: A2-path Novelty 4, Significance 3, Effort 3 →
  rank 4.0; A1-only fallback 2.0; the (B)-open branch (6.25) is closed.
  In-Lean proof path for (C) specified at `research/pilots/21-milestoneC.md`
  §5 (`Real.sin_eq_tsum`/`Real.cos_eq_tsum`,
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/Series.lean:112,:109`).

## F4 grade by lane R9

2026-11-09, round 5. Evidence: Modal port-probe runs 5–6 (`research/feasibility/port-probe.md` §8).

- **Grade: M ((C)+(A1)) / M–L ((A2) on top) — confirmed.** The dossier-02 pre-condition
  probe directly de-risks this dossier's PairCeiling dependency: `ProbeD_PairCeiling.lean`
  elaborated the donor's own stability/ceiling/law256 statement chain (defs + 4 statements,
  donor's narrow interval-integral imports) against v4.36 with **0 errors** — the entire
  `PairCeiling/{Defs,Stability,Signed,CeilingLaw256}` statement surface F2 relies on is
  drift-free, including the 256-point numerals and the `EnclOK` hypothesis shape.
- **Porting-cost delta**: F2's implicit port assumption (same repo, no cross-toolchain for
  A1/C) now has measured analog: the one unprobed drift zone (interval integrals) is clean,
  so the (A2) milestone's certificate↔profile dictionary starts from elaboration-verified
  statements; effort driver stays the (A1) optimality inequality (pure analysis, M) —
  unchanged by probe evidence.
- No F1 corrections (F1 cites only stable one-variable calculus API, `Real.sin/cos`
  integrals — exercised inside zeta23's own `Functional.lean`).
- Verdict for triage: keep M / M–L; confidence on the statement side up.
