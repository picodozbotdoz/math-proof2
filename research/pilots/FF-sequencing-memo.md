# FF sequencing memo — triage input from the zone owner (lane A2)

2026-11-13, post P0–P1 execution. Orchestrator-authorized companion to
`research/pilots/71-prework.md` (§f estimates), `research/pilots/71/logs/` (measured runs),
`research/candidates/71-*.md` / `73-*.md` (dossiers). One page; numbers first.

## Measured costs (pilot 71 P0–P1, DONE)

- **4 Modal runs** (2 fix cycles, both mechanical: import-before-docstring order;
  `Multiset.induction_on` case names + `noncomputable lPoly` + stub arg `W.A 1`), then green ×2.
  Warm-run latency only; image layers shared with axbump/probe (8,710 oleans).
- **243 LoC** new content (P0 statement probe 112 + P1 dictionary 131), inside the prework's
  0.2–0.35k P1 estimate. **P1 = 7/7 lemmas kernel-clean** (`[propext, Classical.choice,
  Quot.sound]`), 0 sorry: `one_lt_card_field`, `norm_wOf` (the `‖q^{−s}‖ = q^{−σ}` engine),
  `norm_wOf_pos/_lt_one`, `lPoly_eval`, `multiset_norm_sum_le` (D2, the mathlib gap),
  `a2_eq` (D3 duality extraction). No mathematical surprise at any point — the D1 exp-log
  route (no `rpow`/`cpow`) validated exactly as spec'd.

## P2 estimate (71 landing theorems W1/W2/HW), adjusted by P1 experience

**Unchanged: M, ≈ 0.35–0.55k LoC** (prework §f said 0.3–0.5k; small upward tick for cast
plumbing). Decomposition: W1 ≈ 0.1k (denominator pole-exclusion `s ≠ 1` is the one genuinely
new technique — `Complex.exp_eq_exp` kernel step, budgeted in prework R2); W2 ≈ 0.08k
(`Multiset.prod_eq_zero_iff` + the same modulus arithmetic as W1's numerator — now de-risked,
since D1 landed); HW ≈ 0.15–0.25k (new D4: expansion of the point-count clause over
`Finset.Iic 2` with `A 0 = {1}` / `A 2 = {q}` singletons + D2 application; the ℕ→ℂ cast
friction is the fiddly part — P1's `a2_eq` shows the simp route works). Risk profile: LOW
increment over P1; all substrate green on disk (`research/pilots/71/P1.lean`).

## 73 Tier-C pricing (from dossier 73 + this lane's read)

- **73-C skeleton** (FF Hecke class def transplant + `hTate`/`hRat`/`hPur` binder vocabulary +
  (P)(i) continuation under `hRat` + (P)(ii) window under `hPur`): **S–M, ≈ 0.4–0.6k LoC**;
  zero import gates; reuses 71's proved transfer lemmas verbatim (duplication per the
  pilot-01 self-contained convention).
- **73-(C1) probe** — one honesty correction to dossier 73 (its proof-sketch step 5 says
  "Gauss-sum derivations of `hRat`/`hPur`"): **`hRat` for the 𝔽_q[T] class is elementary and
  dischargeable** (χ periodic mod m ⇒ residue-class decomposition of
  `Σ_{f monic} χ(f) T^{deg f}`; finitely many classes; `M` ≈ 0.3–0.6k LoC of bookkeeping);
  **`hPur` is NOT** — "all inverse roots ‖α‖ = √q for Dirichlet L over 𝔽_q[T]" IS the RH for
  the Kummer covers of ℙ¹ (Weil's theorem, deep). At Tier C, `hPur` stays a binder even for
  the probe; (C1) lands (P)(i) unconditionally and (P)(ii) conditional on `hPur`. This
  downgrades (C1) from "land (P) outright" to "land (i) + conditional (ii)" — recommend A9
  append this delta to the dossier.

## G6a/G6b gate impact: Tier B/A only

Per `research/pilots/71/logs/run4.log` (the no-Stacks baseline relayed to A7): the entire
executed layer and everything queued below runs mathlib-only. G6a (partial StacksFrontier
build pricing) and G6b (Stacks rev `012108f6` toolchain-vs-v4.36 compatibility check) affect
only provenance upgrades — 71 Tier B (import `Weil.LeanEval.WeilConjectures` as binder body)
and Tier A (discharge `hWeil := weil_conjectures`, kernel-checking Deligne's chain), and 73's
Tier-A dictionary (Kummer sheaf construction — not in any corpus, the permanent ceiling).
**No sequencing decision below depends on G6a/G6b; treat both as post-success upgrades.**

## Recommended FF pilot order (zone owner's call)

1. **71-P2 (W1 → W2 → HW)** — converts the paid-for green substrate into the FF-EZ1 landing
   theorems at M-effort, lowest risk per unit of ecosystem value; the dictionary every other
   FF statement (incl. 73-(C2)'s comparison packaging) consumes. Already triage-known scope.
2. **73-C skeleton** (binders + class def + (i)/(ii) statements) — S–M, zero gates, begins
   the "first formal Tate-type statement" claim (pending A5 PART-2); nothing in it is risky
   once 71-P2's W1 pattern exists to mirror.
3. **73-(C1) `hRat` discharge** — the honest M-item (elementary periodicity bookkeeping,
   0.3–0.6k LoC); sequenced after 1–2 so the M-risk sits isolated behind two S/M wins.
4. **71-P2c anti-CT pairing + 73-(C2) window table** — cheap corollary packaging once 1–2
   land (both need W1-style theorems to conjoin with DZDF's challenge statement).

One-line verdict: **71-P2 first** (finish the dictionary), **73-C skeleton second** (the
substrate layer), (C1) third; G6a/G6b nowhere on the critical path.

## Execution record (2026-11-14, lane A2-relaunch — items 1 and 2 of the order above LANDED)

- **71-P2 GREEN** (`research/pilots/71/P2.lean`, 279 LoC; `logs/p2-run6.log`: OK, 0 sorry,
  11/11 theorems triad `[propext, Classical.choice, Quot.sound]` — the inline `#print axioms`
  block covers every top-level theorem, i.e. full-coverage axcheck per the make_axcheck
  list; A1 should add the `AxPilot71_P2 → pilots/71/P2.lean` row to TARGETS at sweep time).
  W1 + W2 + HW all proved; 6 fix cycles, all mechanical except one mathematical find:
  **W1 statement honestly corrected** — the prework §2.5 draft's `hs1 : s ≠ 1` was UNSOUND
  (complex `exp` is 2πi-periodic; `q·q^{-s} = 1` holds on the whole family
  `s ∈ 1 + (2πi/log q)·ℤ` with `Re s = 1`, inside the window, where Lean field division
  makes `zetaC = 0`). W1 now carries the pole-family exclusion
  `hs1 : 1 − (Nat.card F : ℂ) * wOf (Nat.card F) s ≠ 0` — the honest FF translation of
  DZDF's single-pole clause — plus new Core 2 (`re_eq_one_of_card_mul_wOf`) locating that
  family on `Re s = 1` (real-exp kernel route; note `Complex.exp_eq_one_iff` does exist but
  only in `Analysis/SpecialFunctions/Complex/Log.lean` with the full 2πi-kernel, unused
  here). **A9: dossier 71 §Pilot-outcome must record this statement delta.**
- **73-C GREEN** (`research/pilots/73/C.lean`, 236 LoC; `logs/run6-c-green.log`: OK, 0 sorry,
  7/7 theorems triad — same inline full-coverage audit convention). Q0 probe
  (`P0.lean`, `logs/run1-q0.log` + final-form `run7-p0-final.log`) elaborated the whole
  Tier-C skeleton FIRST TRY; Q1 (FFRayClassCharacter transplant + `no_real_homs` vacuity +
  coprime-cone vanishing + `monicDegreeN` + `heckeSeriesT`), Q2 `(P)(i)` `hecke_continuation`
  (quotient-of-entire, `DifferentiableAt.div` off the `P₀(q^{-z}) = 0` locus; the
  series-agreement clause is honestly deferred to the Q4/eval layer — the 71 pattern, not
  PowerSeries.eval convergence), Q3 `(P)(ii)` `hecke_window` (W2's numerator step one
  factor level up, ε-unit split; GREEN on the first C.lean run). Runner
  `research/pilots/73/run_pilot.{sh,py}` (app `crossmath-pilot-73`, doz CLI). **HARD STOP
  before Q4 observed** (the `hRat` discharge for 𝔽_q[T] — orchestrator gate; the
  `monicDegreeN` coefficient-vector parametrization is deliberately its substrate).
- Substrate notes for the corpus: `Real.exp_eq_one_iff` has an EXPLICIT section variable
  (`.mp` resolution on it fails — route via `Real.exp_eq_exp`); `Differentiable.mul`/`.neg`
  are Pi-form `@[to_fun]` lemmas and `Differentiable.fun_comp` with a LAMBDA `g` trips
  HO-unification — state such haves in `∘`-form and apply `Differentiable.comp` explicitly
  (three fix cycles of C.lean were exactly this class).
