# Pilot 40 M1 — the Ξ_K′ Stage-1 tranche 1 record (iter-7 day-1, D2′(a))

Lane R9 (worktree agent-09), 2026-11-21, at main `d429d19` (the iter-7 opening).
Charter: RESEARCH.md §Iteration 7 D2′(a) — the precharter GO scope exactly
(`candidates/xi-k-prime-precharter.md` `78c34427` §4): T1 + T2's reduction layer +
the elaborated statement skeleton + the elementary slice of the d = −3 bite;
≈1–2k LoC / 6–14 runs; Stage-2 NO-GO stands.

## Outcome

**GREEN at run 10 of the 6–14 grant: `M1.lean` `71922301cbb0761d` — PROBE-OK
errors=0 sorry=0; 11/11 audited theorems TRIAD-CLEAN** (`[propext,
Classical.choice, Quot.sound]`, zero sorryAx; the `#print axioms` block rides the
artifact's tail, captured in the record log). Record run:
`logs/probe40-m1-run10.log` (provenance header in-log; telemetry: warm walls
28–55 s, under the 60 s sampling interval — samples=0 means NO SAMPLE, not zero
usage; SPEC 2 CPU / 4 GB, LEAN_NUM_THREADS=2, doz CLI, app `crossmath-probe-40`,
mathlib @ `ff2494ea`, no donor imports). ~250 LoC of mathematics; 10 fires.

## What was proved (all on the mathlib-only substrate, zero donor imports)

**T1 (structure):**
- `xiChi_zero` / `xiChi_one`: the assembly's endpoints (Ξ 0 = Ξ 1 = 1).
- `differentiable_xiChi` (hχ : χ ≠ 1): the assembly is entire (via
  `differentiable_completedZeta₀` + `DirichletCharacter.differentiable_completedLFunction`).
- `xiChi_one_sub` (binder form, quadratic + root number 1): the reflection —
  PROVED from mathlib's `completedRiemannZeta₀_one_sub` +
  `IsPrimitive.completedLFunction_one_sub`, modulo the two classical hypotheses
  (`hinv : χ⁻¹ = χ`, `hε : rootNumber χ = 1` — the quadratic Gauss-sum evaluation,
  named glue for a later tranche).

**T2 (reduction layer):**
- `symCompleted_ne_zero` / `gProd_ne_zero`: nonvanishing on the closed half-plane
  (the χ-side discharged by mathlib's `completedLFunction_ne_zero_of_one_le_re`;
  the Λ₀-side carried as the classical `hζ` binder — zeta23's ZeroFree territory).
- `deriv_div_gProd_eq_sum` (the **Σ identity**): on Re s ≥ 1, s ≠ 1, Λ₀ s ≠ 0,
  `g′/g = 1/s + 1/(s−1) + Λ₀′/Λ₀ + Λ̃′/Λ̃` — the four-term sum the step-3 device
  plugs into.
- `xiChiDeriv_ne_zero_of_re_pos` (the **confinement composition**): a positivity
  device on `g′/g` kills every zero of `Ξ′` on the closed half-plane — with NO
  nonvanishing side condition (at a zero of `deriv g` the quotient is literally 0,
  so `0 < re 0` is false). This is the T2(ii) shape in its correct form.

**The d = −3 bite, elementary slice:** `re_inv_pos` (Re(1/s) > 0 for Re s > 0) and
`re_sub_one_inv_nonneg` (Re(1/(s−1)) ≥ 0 on the half-plane) — the two positive
terms of the dossier's step-2 sum, PROVED. The residual class is named below.

**Statement skeleton (Layers B/C/D):** the counting idiom (`zerosIn`/`Ncount`/
`Ndist`/`N0simple` over `analyticOrderAt`), the `WindowCalculus` binder schema
(hSymm/hRVM/hEF/hSeam), and the T3 surfaces as Prop-defs (`XiKPrimeFlatProp`,
`XiKPrimeQuarticProp`) — no proofs claimed, none needed (defs).

## The two Stage-1 mathematical findings (the record's payload)

1. **The symmetrizer correction (Layer A).** Mathlib's FE normalization is
   `Λ_χ(1−s) = N^(s−1/2)·rootNumber χ·Λ_{χ⁻¹}(s)`, under which the RAW product
   `s(s−1)·Λ₀·Λ_χ` does NOT reflect (the `N^(s−1/2)` factor survives). The correct
   Stage-1 object carries the symmetrizer `Λ̃_χ(s) := exp((s/2)·log N)·Λ_χ(s)`
   (`symFactor`/`symCompleted`), for which the FE reads
   `Λ̃_χ(1−s) = rootNumber χ · Λ̃_{χ⁻¹}(s)` — and T1's reflection follows for
   quadratic χ with root number 1 (`xiChi_one_sub`, the absorption lemma
   `cpow_exp` is the bridge). The probe's historical Layer-A form
   (`XiKPrime-stmt-probe.lean`) is superseded for the object; this file is the
   object of record. Dossier-40's §Setting (the tauceti normalization) is
   thereby confirmed as already-symmetrized.
2. **The +1 correction to the dossier's step 2.** The dossier's sketch says
   "`Ξ_K′/Ξ_K = 1/s + 1/(s−1) + Λ₀′/Λ₀ + Λ_χ′/Λ_χ`" — that is the log-derivative
   of `g = Ξ − 1`, NOT of `Ξ` (the `+1` breaks the product log-derivative). The
   correct reduction: the Σ identity holds for `g′/g`, and the CONFINEMENT
   composition consumes `g′/g`-positivity directly (a zero of `Ξ′ = g′` forces
   `g′/g = 0`, contradicting positive real part — no nonvanishing hypothesis
   needed at all, cleaner than the dossier's step-4 sketch). The classical
   `Re(ξ′/ξ) > 0` route is NOT needed for strip confinement at Stage-1.

**Named residual (the step-3 χ-bound, honestly parked per D7):** the device
`hdev : ∀ s, 1 ≤ s.re → s ≠ 1 → 0 < Re(g′/g)(s)` — equivalently (by the Σ
identity + the two elementary terms) a lower bound on
`Re(Λ₀′/Λ₀ + Λ̃′/Λ̃)(s)` covering `−(1/s + 1/(s−1))`. This is the dossier's
hardest step (zeta23's `xiPrime_over_xi_re_pos` device ported to the χ-column);
the d = −3 first bite delivered its elementary slice only. Also parked: the
`hinv`/`hε` classical glue (the quadratic Gauss-sum evaluation) and the Λ₀
nonvanishing on the half-plane (mathlib exposes ζ ≠ 0 but not Λ₀ ≠ 0; the
s(s−1)Λ₀ = s(s−1)Λ identity would route it — recorded as the cheapest next
lemma).

## Run history (10 fires; all logs `logs/probe40-m1-run{1..10}.log`, headers in-log)

25 → 13 → 9 → 7 → 5 → 3 → 2 → 1 → 0 (+1 cosmetic) → 0-FINAL. The fix classes
(all statement/elaboration mechanics, zero math defects — every "error" was a
tactic/API-form issue, the proofs' mathematical content never changed):
(v1) the χ-explicit-argument convention (mathlib's section-variable ordering —
`completedLFunction_ne_zero_of_one_le_re` takes χ explicitly); (v2) Pi-vs-lambda
matching for `deriv_mul`/`deriv_add` applications (fixed by typed `have`s and a
`change`); (v3) `deriv_id`'s `id`-form vs `fun s => s` (bridged by an rfl-rewrite
of the lambda to `id`); (v4) `Complex.log_ofReal` does not exist at this pin —
the bridge is `Complex.log_ofReal_mul` at x = 1 (a named micro-lemma for the
record); (v5) `𝓝`/`Filter.nhds` resolution inside the structure (resolved by
bare `nhds` under `open Filter`); (v6) `field_simp` closings (one dead `try ring`
removed at run 10). Runs 1–9's diagnosis is recoverable from the logs' error
contexts; the artifact's bytes at each run are recoverable from this history.

## Custody + next tranche (Stage-1 continuation, within the D2′(a) grant)

- The grant's remaining fires: 4 (10 of 6–14 spent). The next tranche's
  candidates, priced: (a) the Λ₀-nonvanishing lemma via the
  `s(s−1)Λ₀ = s(s−1)Λ` identity + mathlib's ζ/Gamma nonvanishing (S-class,
  removes the `hζ` binder); (b) the `hinv`/`hε` glue at the concrete quadratic
  (χ mod 3 for d = −3 — conductor 3; the Gauss-sum evaluation is the content,
  M-class); (c) the step-3 device's first real bite (M-class, the named
  residual). Stage-2 (the T3 discharge arc) remains NO-GO per the charter.
- Article eligibility: NOT yet — T3's surfaces are statement-only; the
  precharter's S1–S4 framing governs at ship time.

— lane R9 (worktree agent-09), 2026-11-21. GREEN; no further fires this session;
records worktree-side until H lands. No commits.
