# Pilot 40 M2 — the Ξ_K′ Stage-1 tranche continuations record (iter-7 day-1, D2′(a))

Lane R9 (worktree agent-09), 2026-11-21. The continuation unit after tranche 1 landed
(`120b6d0`; M1 GREEN `71922301cbb0761d`). **Grant arithmetic: 14 of the 6–14 Stage-1
fires spent at park (M1: 10; M2: 4) — THE CAP. This unit parks per D7 with the
residuals classified and the next-fire fixes pre-written.**

## What is GREEN (verified by run 4's error-line coverage: zero errors before :297)

M2.lean carries M1's entire GREEN content verbatim (self-contained) PLUS three new
theorems, all elaborating clean in the last fire (`logs/probe40-m2-run4.log`):

1. **`smul_la₀_add_one`** (s ≠ 0, s ≠ 1): `s(s−1)·Λ₀ + 1 = s(s−1)·Λ` — the
   zeta23-doc identity, PROVED from mathlib's `completedRiemannZeta_eq`. **This
   CORRECTS the M1-record's own "cheapest next lemma" mispricing** ("s(s−1)Λ₀ =
   s(s−1)Λ" was a slip — the offset is 1, and the identity FAILS at s ∈ {0,1} both
   times). Consequence, now on record: the Λ₀-binder (`hζ`) is NOT
   elementary-dischargeable — Λ₀ ≠ 0 on the half-plane ⟺ `s(s−1)·Λ ≠ 1` ⟺ ξ ≠ ½
   there; this is real content adjacent to the ξ-device and is re-classified from
   "S-class, cheapest" to a named residual (the corrected binder to carry forward is
   `hsL : s(s−1)·Λ ≠ 1`, or keep `hζ`).
2. **`gProd_eq`**: `g = (s(s−1)·Λ − 1)·Λ̃` — the g-product in Λ-form.
3. **`completedRiemannZeta_ne_zero`** (S-class, mathlib-direct): Λ ≠ 0 on the closed
   half-plane (Re ≥ 1, s ≠ 0), routed through `riemannZeta_def_of_ne_zero` +
   `riemannZeta_ne_zero_of_one_le_re` — the Γℝ-notation never surfaces.

## What is PARKED (the step-3 slice, 4 classified tactic-layer residuals)

`deriv_symFactor` / `deriv_div_symCompleted_eq` / `re_pos_of_factor_bound` — the
mathematical content (SF′ = (log N/2)·SF; hence Λ̃′/Λ̃ = ½log N + Λ_χ′/Λ_χ; hence
hdev from the factor bound) is elementary and the proof SKELETON is right; the four
residuals are pure tactic/API-form classes, each with a pre-written next-fire fix:

- **(r1) :311** the inner-derivative lemma: `deriv_mul`'s Pi-form refuses to match
  the lambda `fun t => t / 2 * c`. Pre-written fix: route via
  `deriv_mul_const` (f := (fun t => t/2)) + `deriv_div_const`/`simp [deriv_div_const,
  deriv_id, id]` for `deriv (·/2) = 1/2`, then `field_simp`.
- **(r2) :297** the `hin`-typing site feeding (r1)'s route.
- **(r3) :337** the ending `congr 1; ring` splits the product wrongly (goal shape
  `cexp(…) * (1/2 * L) = L/2 * cexp(…)`); pre-written fix: replace with
  `field_simp; ring` (no `congr`).
- **(r4) :367** `re_pos_of_factor_bound`'s final assembly — cascade of (r1)–(r3);
  its own `hre`-bridge (`Complex.add_re`-pushthrough, pre-verified shape) stands.

**Continuation 2 (the quadratic Gauss-sum glue, hinv/hε) was NOT attempted** — the
fires ran out first, exactly as the M3-precedent cap discipline prescribes. Its
price stands: the χMod3 API hunt + the two-term Gauss-sum evaluation
(`τ = e^{2πi/3} − e^{4πi/3} = i√3` against rootNumber's `gaussSum/I^a/N^{1/2}`
shape) + the cpow-√3 bridge — 2–3 fires under a FRESH grant, M-class.

## Run history (4 fires; logs/probe40-m2-run{1..4}.log)

run1 9 err (assembly: M2 initially built without M1's body — self-containment fixed);
run2 5 (bridge-identity hypotheses added: the ∀s-form was FALSE at s ∈ {0,1} — a real
statement-layer catch; Pi/DifferentiableAt mixing); run3 4 (derivative-shape order
+ explicit-χ call sites); run4 4 (the residuals above — improvement stalled at the
tactic layer with zero math defects). All fires SPEC-compliant (2 CPU / 4 GB,
LEAN_NUM_THREADS=2, doz CLI, telemetry in-log; warm walls ≈30–55 s, under the
sampling interval — samples=0 = no sample).

## State at park + what a fresh grant buys

- **Parked bytes**: `M2.lean` at sha256(16) `1284d0b3597de373` (the worktree bytes at
  park; M1's GREEN content + the three GREEN continuations + the parked slice).
- **Next fire (1)**: apply (r1)–(r3) fixes → expected GREEN for the whole file; the
  step-3 slice then lands as proved content (the decomposition + the composed
  conditional — the device itself stays the named open core).
- **Next 2–3 fires**: continuation 2 (the Gauss-sum glue at χ mod 3).
- **The Λ₀-binder re-classification propagates**: the precharter's "cheapest next
  lemma" note and any consumer of `hζ` should read the corrected posture (ξ ≠ ½,
  non-elementary).

— lane R9 (worktree agent-09), 2026-11-21. PARKED at the cap per D7; no further
fires without a fresh grant; records worktree-side until H lands. No commits.

## ADDENDUM — the fresh continuation tranche (granted ≤5 fires; ALL 5 SPENT, parked at cap)

Fires m2-run5..9 (logs alongside; same SPEC/provenance). Outcome: the r1–r3 fixes
CONVERGED structurally — the decisive route for `deriv_symFactor` is the
**HasDerivAt pipeline** (`hasDerivAt_exp` ∘ `HasDerivAt.comp` ∘ `HasDerivAt.mul` ∘
`HasDerivAt.div_const`, ExpDeriv.lean:87 + Deriv/Mul.lean:254/:496), replacing the
Differentiable/Pi-mul route entirely (recorded as the canonical idiom for this
corpus's constant-factor derivatives). State at park: **two residuals, both
one-line, both pre-written**:

- **(:299)** the `.trans` bridge's `exact mul_comm _ _` picked the INNER product —
  pin the pair: `exact mul_comm (Complex.exp (s / 2 * Complex.ofReal (Real.log (N : ℝ))))
  (Complex.ofReal (Real.log (N : ℝ)) / 2)`.
- **(:351)** `re_pos_of_factor_bound`'s closer: `exact hfb s hs hs1` missed on
  `one_div`-vs-`inv` and `L/2`-vs-`L*(1/2)` normalization; close with
  `simpa only [one_div, mul_one_div] using hfb s hs hs1` (or state hfb in the
  normalized shape).

Everything else in the file — M1's content, the bridge identity, `gProd_eq`,
`completedRiemannZeta_ne_zero`, `deriv_div_symCompleted_eq` (which elaborates GREEN
in isolation once :299's value-lemma lands) — is error-free in the run-9 coverage.
**Continuation 2 (the Gauss-sum glue) was again NOT attempted — the step-3 slice's
tactic tail consumed the tranche. The glue's price is updated by one hard datum:
`χMod3`/`χMod4` DO NOT EXIST in mathlib at `ff2494ea` (zero corpus hits) — the
character must be hand-built (`ZMod 3`ˣ →* ℂ, sign map), the conductor/primitivity
and the `gaussSum`/rootNumber evaluation ride it; M-class stands, now with the
construction cost explicit.**

**The Λ₀-propagation flag (rides this report per the grant):** the precharter's
`candidates/xi-k-prime-precharter.md` §2 "cheapest next lemma" framing (the
`s(s−1)Λ₀ = s(s−1)Λ` route to discharge `hζ`) is SUPERSEDED by M2's
`smul_la₀_add_one`: the offset is 1, the identity fails at s ∈ {0,1}, and the Λ₀-
binder is non-elementary (ξ ≠ ½ on the half-plane). Any consumer (precharter §4's
Stage-1 list; the census Tier-1 row's gate text; future tranche charters) should
carry `hζ` / `hsL : s(s−1)·Λ ≠ 1` as a named open input, not an S-class discharge.

Parked bytes: `M2.lean` sha256(16) **38e5a73bca8a2631** at park (post fresh-tranche).
