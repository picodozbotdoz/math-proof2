# Landau η-port — iteration-5 PRE-CHARTER (codebase level)

Lane A3 (worktree agent-04), 2026-11-18. Paperwork only — no Modal runs fired, no new
.lean files. Grounded in the ACTUAL identifiers of `pilots/zzv2-lam/P1.lean` (GREEN
FINAL, sha `a9a6555c…`), `P1-record.md` §HARD-STOP (:75–90), `P0-record.md` pin table,
the prework `pilots/zzv2-lambda-prework.md` (§1 L-ladder, §4 novelty posture, §5
guards), A6's charter candidate (`qa/iter4-review/a6-iter5-charter-candidate.md` Lead 3
+ Q3), and a fresh read-only census of the donor tree
(`axiommath/ZetaZerosV2/ZetaZeros/…` @ the dev/claude pin, mathlib `ff2494ea`,
toolchain v4.36.0-rc2). Billing of THIS document: pre-charter input; the orchestrator
typesets the real charter.

---

## AMENDMENT (2026-11-18, probe-staging session — corrects §1.3(iv) and revises §2.2/§2.3/§2.4)

Reading the donor's own four Fourier/identity statements
(`fourierC_iteratedDeriv_two_cutoffSelfConv`, `fourierC_correctedTest`,
`correctedTest_weight_cancel`, `unweightedKernelSum_cutoffTest_eq_pairCorrelationSum`,
`Zeta/Kernel.lean` :540±–:575±-area, statements mirrored verbatim into
`eta-pin-probe.lean`) corrects this pre-charter's §1.3(iv): **the corrected-test
coefficient does NOT scale by (2λ)² — it stays the donor's `1/(4 log²T)`.** The weight
cancellation is family-INDEPENDENT: `fourierC_correctedTest` gives the factor
`1 + π²z²/log²T`, and at `z = rescaledDiff T ρ ρ' = i(ρ−ρ')·log T/(2π)` one has
`π²z²/log²T = −(ρ−ρ')²/4` exactly, so `(1 − (ρ−ρ')²/4) · 4/(4−(ρ−ρ')²) = 1` cancels
`pairWeight` for ANY kernel family at κ = 1. The Fourier/derivative identities behind
it (`fourierC(Q'') = (2πiz)²·fourierC(Q)`, `fourierC(f⋆f) = fourierC(f)²`) are
family-free modulo regularity. Consequences: (a) §1.3(iv)'s `correctedTestLam` is the
donor's `correctedTest` shape VERBATIM at `Q_λ` (staged so in `eta-pin-probe.lean`);
(b) §2.2's genuine-content tier shrinks — the exact-identity layer is family-generic
modulo the regularity/support analogues, so §2.3 risk 1 (coefficient-sensitivity)
largely dissolves; (c) §2.4's budget band shifts down: 5–8 runs plausible, 6–10 still
the safe charter number, ceiling 12 unchanged (the identity-layer restructuring
scenario is mostly off the table; the remaining tail is the covariance/normalisation
web + admissibility). The staged probe file carries the corrected shapes and a
statement of each mirrored lemma at the scaled family.

---

## 0. The one-paragraph problem statement

P1 proved the λ-family transfer theorems conditional on ONE binder,
`KSAsymptotic lam c` (`P1.lean:54`) — and discharged it only via the frozen kernels
(`kernelConstruction`, `Zeta/Kernel.lean:995`, admissible at `lam = 1/2`) re-windowed
to `lam ≥ 1/2` (`KSAsymptotic_mono`, `exists_KSAsymptotic_of_half_le`, `P1.lean:75/:85`).
The open territory is `lam ∈ (0, 1/2)` — narrower admissibility windows than any frozen
kernel supports — because the bridge theorem
`unweightedKernelSum_cutoffTest_tendsto` (`Zeta/Kernel.lean:600`) is proved only at
`cutoffTest ψ = ψ·√f₀/√A_ψ` kernels with the Montgomery–Taylor extremal
`f₀ = extremalTest` (`Zeta/Defs.lean:76`, support hard-wired to `[−1/2, 1/2]`)
inside the construction. The iteration-5 ask (P1-record :88–89): prove
**`∃ c, KSAsymptotic lam c`** for λ-kernels beyond the frozen witness's re-windowing.
The new formal content that makes that possible: a **scaling-covariance ladder for the
corrected-test machinery** (`correctedTest`/`r_{ψ,T}`, `Zeta/Defs.lean:126`) — which is
exactly the "no scaling-covariance lemma exists anywhere in the tree" gap P0(b) pinned
(tree-wide grep, `P0-record.md` pin (b)).

---

## 1. Statement sketches (actual identifiers; Lean verbatim where load-bearing)

### 1.1 The target theorem (the discharge)

The family domain today: `[1/2, ∞)` via re-windowing. The port's target — the full
honest domain:

```lean
/-- The η-port headline (target shape; `scaledConstLam` sketched in §1.3). -/
theorem exists_KSAsymptotic_of_pos (lam : ℝ) (hlam : 0 < lam) (ε : ℝ) (hε : 0 < ε) :
    ∃ c : ℝ, KSAsymptotic lam c ∧ |c - scaledConstLam lam| < ε
```

Two-arm assembly: `lam ≥ 1/2` is ALREADY P1's `exists_KSAsymptotic_of_half_le`
(`P1.lean:85`, frozen kernels re-windowed — unchanged); `lam ∈ (0, 1/2]` is the port
proper (λ = 1/2 itself lands in both — the regression glue). The honest intermediate
form (so the consumer ladder can land GREEN independently of the bridge port) carries
the ported bridge as an explicit Prop binder, EnclOK convention:

```lean
/-- Intermediate rung: the ported bridge as ONE explicit binder (the P1 pattern
repeated one level down). -/
def ScaledBridge (lam : ℝ) (psi : ℝ → ℝ) : Prop :=
  Filter.Tendsto (fun T => unweightedKernelSum (cutoffTestLam lam psi) T
      / ((zeroScale T : ℝ) : ℂ))
    Filter.atTop (nhds ((pairMainTerm (cutoffSelfConvLam lam psi) : ℝ) : ℂ))

theorem discharge_of_scaledBridge {lam psi} (hB : ScaledBridge lam psi)
    (hψ : IsAdmissible lam (cutoffTestLam lam psi)) :
    KSAsymptotic lam (pairMainTerm (cutoffSelfConvLam lam psi))
```

### 1.2 The scaled family (new defs, donor vocabulary)

The construction mirrors `cutoffTest` (`Zeta/Defs.lean:111`) with the base extremal
and the cutoff window dilated to the λ-window (ρ := 2λ ∈ (0, 1]):

```lean
/-- Coordinate dilation to the λ-window. -/
def dilateTo (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => f (x / (2 * lam))

/-- The λ-scaled extremal base: support shrinks from [−1/2, 1/2] to [−λ, λ]. -/
noncomputable def extremalLam (lam : ℝ) : ℝ → ℝ := fun x =>
  if |x| ≤ lam then Real.cos (Real.sqrt 2 * x / (2 * lam))
      / (Real.sqrt 2 * Real.sin (1 / Real.sqrt 2)) else 0
        -- = dilateTo lam extremalTest pointwise (Defs.lean:76 re-windowed)

/-- The λ-scaled cutoff family (cutoffTest at the dilated base+window; normaliser
recomputed over the λ-window). -/
noncomputable def cutoffNormaliserLam (lam psi) : ℝ :=
  ∫ x : ℝ, dilateTo lam psi x ^ 2 * extremalLam lam x
noncomputable def cutoffTestLam (lam psi) : ℝ → ℝ := fun x =>
  dilateTo lam psi x * Real.sqrt (extremalLam lam x)
    / Real.sqrt (cutoffNormaliserLam lam psi)
noncomputable def cutoffSelfConvLam (lam psi) : ℝ → ℝ  -- Q_λ (Defs.lean:120 shape)
```

Admissibility discharge (port of `cutoffTest_isAdmissible`, Kernel.lean:237, private
in-tree ⇒ re-proved locally): `IsAdmissible lam (cutoffTestLam lam psi)` for
`IsCutoff delta (dilateTo lam psi)`-class hypotheses — the support clause now closes
at `lam ≤ |x|`; the Fourier normalisation `fourierC (η²) 0 = 1`
(`Definitions.lean:100`) is by construction of the normaliser.

### 1.3 The new formal content: the scaling-covariance ladder

Four lemmas, in dependency order. (i)–(iii) are classical change-of-variables content
with no in-tree analogue; (iv) is the analytic heart.

```lean
/-- (i) Fourier covariance: fourierC (Definitions.lean:74) along a dilation. -/
lemma fourierC_dilateTo (f : ℝ → ℝ) (hlam : 0 < lam) (ξ : ℂ) :
    fourierC (dilateTo lam f) ξ = (2 * lam) * fourierC f ((2 * lam) * ξ)

/-- (ii) Self-convolution covariance: dilation of Q (Defs.lean:120 shape). -/
lemma cutoffSelfConvLam_eq (lam psi) (hlam : 0 < lam) :
    cutoffSelfConvLam lam psi = (2 * lam) * dilateTo lam (cutoffSelfConv psi)
    -- at matched normalisers; constants per the fourier_sq_zero = 1 pinning

/-- (iii) Functional covariance — the SCALED CLOSED FORM (no per-λ numerics needed):
with ρ = 2λ, Q = cutoffSelfConv psi, c₀ = pairMainTerm Q:
    pairMainTerm (cutoffSelfConvLam lam psi) = ρ^2 * c₀ + (1 - ρ^2) * Q 0
Sketch derivation (P0-pin verifies): Q_λ = a²·ρ·(Q ∘ (·/ρ)) with a²·ρ = 1 forced by
fourierC (η_λ²) 0 = 1; then pairMainTerm Q_λ = a²ρ·(Q 0 + 2ρ² ∫₀¹ β Q β dβ), the
∫-window [0,1] not truncating because supp Q ⊆ [−1,1] and 1/ρ ≥ 1. -/
lemma pairMainTerm_cutoffSelfConvLam (lam psi) (hlam : 0 < lam) (hle : lam ≤ 1 / 2) :
    pairMainTerm (cutoffSelfConvLam lam psi)
      = (2 * lam)^2 * pairMainTerm (cutoffSelfConv psi)
        + (1 - (2 * lam)^2) * cutoffSelfConv psi 0

def scaledConstLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ :=   -- the "scaled functional"
  (2 * lam)^2 * pairMainTerm (cutoffSelfConv psi)
    + (1 - (2 * lam)^2) * cutoffSelfConv psi 0

/-- (iv) Corrected-test covariance — the DEFINITION-LEVEL content. The frozen
`correctedTest` (Defs.lean:126) subtracts Q'' / (4 log²T); under dilation
(Q ∘ (·/ρ))'' = ρ⁻² · (Q'' ∘ (·/ρ)), so the scaled correction coefficient must be
ρ² = (2λ)² — the scaled corrected test is NOT the dilation of the frozen one. -/
noncomputable def correctedTestLam (lam psi T) : ℝ → ℝ := fun x =>
  cutoffSelfConvLam lam psi x
    - (2 * lam)^2 * iteratedDeriv 2 (cutoffSelfConvLam lam psi) x
      / (4 * Real.log T ^ 2)
```

And the ported identity + asymptotic (ports of
`unweightedKernelSum_cutoffTest_eq_pairCorrelationSum` and the :600 bridge; both
private/public respectively in Kernel.lean — see §2):

```lean
/-- The exact identity, ported (Kernel.lean private chain, re-proved locally). -/
lemma unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum … :
    unweightedKernelSum (cutoffTestLam lam psi) T
      = (normalising constant) • pairCorrelationSum (correctedTestLam lam psi T) T

/-- The ported bridge (the lemma whose absence P0(b) pinned). -/
lemma unweightedKernelSum_cutoffTestLam_tendsto (hlam : 0 < lam) (hle : lam ≤ 1 / 2)
    (hd : 0 < delta) (hd4 : delta < 1/4) (hpsi : IsCutoffLam delta lam psi) :
    Filter.Tendsto (fun T => unweightedKernelSum (cutoffTestLam lam psi) T
        / ((zeroScale T : ℝ) : ℂ))
      Filter.atTop (nhds ((pairMainTerm (cutoffSelfConvLam lam psi) : ℝ) : ℂ))
```

### 1.4 The consumer payoff (conditional ladder, binder-first)

```lean
/-- Full-domain family theorem (assembled from the port + P1's re-windowing arm). -/
theorem thm_simple_lam_full_domain (lam : ℝ) (hlam : 0 < lam) (ε : ℝ) (hε : 0 < ε) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀, (scaledConstLam lam ψ*) - ε
      < (simpleOnLineCount T : ℝ) / (zeroCount T : ℝ) := …
    -- via thm_simple_lam (P1.lean:124) + exists_KSAsymptotic_of_pos

/-- Strict-improvement corollary (no numerics): for λ < 1/2 the scaled constant is
strictly SMALLER (better: C0Lam c = 2 − c is larger) because Q ≥ 0, Q ≢ 0 on (0,1)
forces Q 0 < pairMainTerm Q. Frozen margin transfers: 2/3 < 2 − c₀ ⇒ 2/3 < 2 − c_λ
for EVERY λ ∈ (0, 1/2). -/
theorem scaledConst_lt_of_lt_half (lam) (hlam : 0 < lam) (hlt : lam < 1 / 2) (…) :
    scaledConstLam lam psi < pairMainTerm (cutoffSelfConv psi)
```

Honesty flags on §1: (a) the ρ-algebra of (ii)/(iii) is a paper derivation — the P0-pin
run verifies it before anything consumes it; (b) whether the improvement DIRECTION is
already stated in Lamzouri's paper is a round-5 battery question (must-cite regardless,
prework §4); (c) `IsCutoffLam` (the dilated cutoff-window class) is a new side-condition
class — the sketch keeps `IsCutoff delta (dilateTo lam psi)`-shaped hypotheses, exact
spelling to be pinned; (d) the numerics caveat stands (prework §1: no per-λ closed
forms beyond the covariance identity; the sublattice λ = 1/√(2q) series trick noted
there remains the only exact-numerics route if ever wanted).

---

## 2. Proof-strategy decomposition + risk register + budget sanity-check

### 2.1 What the P1 MT-frozen state gives (no port needed)

- `KSAsymptotic_mono` (`P1.lean:75`): windows widen — frozen witness serves λ ≥ 1/2.
- `exists_KSAsymptotic_of_half_le` (`P1.lean:85`): `[1/2, ∞)` in the family domain.
- The four λ-generic transfer endpoints (`Zeta/Transfer.lean:126/:151`,
  `Zeta/TransferBounds.lean:35/:63`) + `PairCorrelation` (`Zeta/Inputs.lean:55` Prop,
  proved `PairCorrelation/FromLandau.lean:52`) — the INPUT layer is η-generic and
  UNCONDITIONAL (P0 pin (b)): the port re-instantiates it, never re-proves it.
- `thm_simple_lam` … `thm_simple_or_critical_lam` (`P1.lean:124–230`): the consumer
  ladder, binder-shaped, GREEN — the port's discharge plugs in unchanged.

### 2.2 What the port adds (the frozen chain, re-proved at scaled bases)

The bridge proof's own dependency chain (`Zeta/Kernel.lean:191–:600`, censused this
session): `integrable_cutoffWeight`/`integrable_cutoffTestSq`,
`cutoffTest_isAdmissible` (:237), `cutoffTestSq_eq_smooth`/`contDiff_cutoffTestSq`/
`hasCompactSupport_cutoffTestSq`/`cutoffTestSq_even`, `integrable_cutoffSelfConv`/
`cutoffSelfConv_even`/`cutoffSelfConv_eq_zero_of_one_lt_abs`,
`hasCompactSupport_iteratedDeriv_two_cutoffSelfConv`/
`integrable_iteratedDeriv_two_cutoffSelfConv`,
`fourierC_iteratedDeriv_two_cutoffSelfConv`, `fourierC_correctedTest`,
`correctedTest_weight_cancel`, `cutoffSelfConv_isPairTestFunction`/
`iteratedDeriv_two_cutoffSelfConv_isPairTestFunction`,
`unweightedKernelSum_cutoffTest_eq_pairCorrelationSum`, `PairCorrelation.tendsto`,
`unweightedKernelSum_cutoffTest_tendsto` (:600).

**Structural constraint (load-bearing for budgeting): all but the last two are
`private`** — module-local, inaccessible to any consumer file even inside the built
tree (the P1 precedent: two private `Proportions.lean` bookkeeping lemmas were copied
locally with citations, `P1.lean:95/:109`). So the port file re-proves the whole chain
locally at the scaled family; it CANNOT transport the donor's proofs by invocation.
Sibling-read-only forecloses the alternative (patching the donor tree).

- **Transport-clean tier (~10 lemmas)**: integrability/evenness/support/compact-support/
  `IsPairTestFunction` analogues — real proofs but structurally isomorphic (support
  windows shrink, `1 − ε` margins widen: supp Q_λ ⊆ [−2λ, 2λ] ⊂ (−1,1) for λ < 1/2,
  `Inputs.lean:40` margin ε = 1 − 2λ).
- **Genuine-content tier (~4)**: `fourierC_correctedTest`-scaled (the ρ² coefficient),
  `correctedTest_weight_cancel`-scaled (the pairWeight `4/(4 − z²)`, `Zeta/Defs.lean:39`,
  cancellation re-alignment), `unweightedKernelSum_cutoffTestLam_eq_…` (the exact
  identity), and the `cutoffTest_isAdmissible`-scaled normaliser computation.
- **Assembly tier**: the tendsto port + the discharge + regression glue
  (`lam = 1/2` recovers the frozen constants bit-for-bit — the L4 anchor discipline).

### 2.3 Risk register (where it can die)

1. **The identity layer's coefficient-sensitivity (top risk).** `correctedTestLam` is a
   DEFINITION-level divergence (the (2λ)² coefficient, §1.3(iv)); every downstream
   Fourier/algebra step of the frozen identity proof that mentions `1/(4 log²T)`
   inline must be re-derived, not rewritten. If the frozen proofs are written with the
   coefficient inlined (likely — the tree never parameterized it), the genuine-content
   tier is a re-derivation: this is the difference between 6 and 12 runs.
2. **The normalisation web.** `cutoffNormaliser` → `fourier_sq_zero` → the identity's
   leading constant interact; the ρ-powers must cancel exactly as in the §1.3 sketch.
   A wrong factor surfaces only at the final tendsto (late failure = budget risk).
   Mitigation: prove the λ = 1/2 regression FIRST as a mid-ladder checkpoint.
3. **`iteratedDeriv`-under-dilation API.** The chain rule for second derivatives of
   dilates on mathlib at this pin (`iteratedDeriv` composition lemmas) — expected
   present but unverified; if the API is thin, this alone is a lemma's worth of work.
4. **Budget-class mismatch risk (the A6 caveat, confirmed).** The prework's "P2 ≤ 400
   LoC (glue + continuity + margin)" priced a DIFFERENT P2 (route (a) without the
   bridge port); with the port, honest pricing is 0.8–1.5k LoC (16-lemma local
   re-proof chain + 4 genuine-content proofs + assembly), class L. The glue/continuity/
   margin ladder of the prework is now UNNECESSARY in its continuity form: the exact
   covariance identity (§1.3(iii)) replaces parametric-integral continuity — a real
   simplification, but only if the identity lands.

### 2.4 Budget sanity-check of A6's "6–10 runs"

Confirmed honest with a contingency band. Composition: 1 pin-probe run (P0-class,
enumerating the frozen chain + verifying the ρ-derivation + the `iteratedDeriv` API) +
4–8 proof-loop runs (at the m4b2/P1 friction class: P1 needed 3 runs for a zero-new-
analysis statement layer; the port ladder is real analysis with a 16-lemma surface —
the two-tier structure above suggests first-GREEN around run 4–6, fix-loop tail 2–3)
+ 1 regression/assembly run. **Estimate: 6–10 as A6 says; honest ceiling 12–13 if the
identity layer needs full re-derivation (risk 1).** Wall-time at SPEC: each run on the
warm app carries the in-container V2 build (~8262 jobs, taskset-capped; P1 walls
582–681 s) — 6–10 runs ≈ 1–1.9 h total; the staged runner plan (§4) cuts the loop-phase
runs to ~1–2 min each.

---

## 3. Binder / donor inventory (exact citations; hygiene-gate actions)

| Identifier | Site (donor `ZetaZerosV2/ZetaZeros/…`) | Class | Port action |
|---|---|---|---|
| `KSAsymptotic`, `LamParams`, `C0Lam/C1Lam/C2Lam`, `thm_*_lam`, `exists_KSAsymptotic_of_half_le` | OURS `pilots/zzv2-lam/P1.lean:54/:40/:62–70/:124–230/:85` | consumer layer, GREEN triad 10/10 | consumed verbatim |
| `PairCorrelation` (Prop) / `pairCorrelationFormula` | `Zeta/Inputs.lean:55` / `PairCorrelation/FromLandau.lean:52` | **η-generic, UNCONDITIONAL** (P0 pin (b)) | re-instantiated at `IsPairTestFunction`-scaled instances; triad already printed at P0 (4/4) |
| `IsPairTestFunction` | `Zeta/Inputs.lean:40` | generic class | scaled instances proved locally (support ⊂ (−1,1) widens margins) |
| `IsAdmissible` (+ fields) | `Definitions.lean:92–:100` | generic class | discharged at `cutoffTestLam` (port of private :237) |
| `fourierC`, `testKernel` | `Definitions.lean:74` / `:104` | generic | dilation lemma §1.3(i) |
| `unweightedKernelSum` | `Zeta/Kernel.lean:191` | η-generic def | consumed |
| `zeroScale` | `Zeta/Asymptotics.lean:29` | generic | consumed |
| `pairMainTerm`, `pairWeight`, `rescaledDiff`, `pairCorrelationSum`, `extremalTest`, `IsCutoff`, `cutoffNormaliser`, `cutoffTest`, `cutoffTestSq`, `cutoffSelfConv`, `correctedTest` | `Zeta/Defs.lean:48/:39/:43/:57/:76/:88/:106/:111/:115/:120/:126` | frozen-family defs | scaled analogues defined (§1.2); frozen versions consumed as the λ = 1/2 anchor + regression |
| `cutoffTest_isAdmissible` … `unweightedKernelSum_cutoffTest_eq_pairCorrelationSum` (the 14-lemma private chain) | `Zeta/Kernel.lean:237–:599` | **private ⇒ re-prove locally** (P1 precedent at `P1.lean:95/:109`) | the port's body (§2.2) |
| `PairCorrelation.tendsto`, `unweightedKernelSum_cutoffTest_tendsto` | `Zeta/Kernel.lean` (public) / `:600` | public bridge / **MT-FROZEN anchor** | tendsto consumed at scaled test functions; :600 consumed as regression anchor only |
| `kernelConstruction`, `montgomeryTaylorConst` | `Zeta/Kernel.lean:995` / `Numeric/MontgomeryTaylor.lean:39` | frozen witness | regression + the frozen arm of the full-domain theorem |
| `riemannVonMangoldt` (tendsto/positivity) | `Zeta/Asymptotics.lean` | generic | consumed (as in P1) |

**Donor hygiene gate at charter time (Cycle-2 convention):** the pin-probe run
re-executes consumer-side `#print axioms` for the NEWLY consumed public names —
minimally `PairCorrelation.tendsto` and the `pairCorrelationSum`/`pairWeight` public
surface (P0's 4-name check predates the port's consumption set); expected triad-only
(the donor is G2-audited, but the gate is on-pin prints, not claims).

**MT-frozen status, precise:** frozen = the :600 bridge + its private chain + the
terminal constants (`MontgomeryTaylor.lean:39/45/50`). Everything the port consumes
beyond that is η-generic. The port itself is the de-freezing move; it does NOT modify
the donor tree (read-only sibling; local re-proofs only).

---

## 4. Runner plan

State: `run_zzv2.py`/`run_zzv2.sh` (app `crossmath-pilot-zzv2-lam`) unchanged since the
wave-2 hard-stop, landed on main; M4b2-recipe: per-run tarball of the two sibling
repos → in-container `lake update` → `lake exe cache get` → `taskset -c 0,1 lake build
ZetaZeros` (~8262 jobs, NO `-j` flag on lake v4.36-rc2 — the P1-run1 finding) →
`lake env lean` per staged consumer; probe-convention verdicts; SPEC 2cpu/4GB +
telemetry + LEAN_NUM_THREADS=2 all in place.

- **Phase 1 (pin probe) — warm lineage as-is.** Reuse `crossmath-pilot-zzv2-lam`
  unchanged; doz CLI (`/home/doz/dozenv/bin/modal`) = PRIMARY per the 2026-11-17 route
  ruling (this app's image layers are the warm semraker family: byte-identical
  m4b2/71/probe block). One run, P0-prefixed probe file (sorry allowed by convention —
  though the pin probe should again need zero sorry), logs with provenance headers to
  `pilots/zzv2-lam/logs/eta-p0-run1.log` (η-prefixed names; same dir as the lineage —
  a fresh `pilots/zzv2-eta/` dir is the orchestrator's call if preferred).
- **Phase 2 (proof loop) — staged image layers if the loop grows past ~4 runs.** The
  runner docstring already records the option: bake the built V2 tree into image
  layers (`Image.run_function` chunks, the `feasibility/probe/g7_layers.py` G7b
  pattern — finished layers persist, reused at zero rebuild cost) in a fresh ephemeral
  app (name suggestion `crossmath-pilot-zzv2-eta`; same no-volume/no-secret recipe).
  Route note: brand-new apps ⇒ xyz route preferred per the ruling, but the substrate
  note stands (`sudo -n -u xyz` blocked in this environment) — realistically doz CLI
  again, recorded in the run log either way. Payoff: loop runs drop from ~10 min
  (build-dominated) to ~1–2 min elaboration-only; at 6–10 runs that returns ~1–1.5 h
  of wall and removes the per-run rebuild variance. Stop-loss: if the pin probe
  downgrades the loop to ≤3 runs (fast landing), stay warm-lineage and skip the bake.
- **Guardrails carried verbatim:** telemetry every run into the persisted log;
  OVER ⇒ investigate-not-upgrade; LEAN_NUM_THREADS=2; taskset-not-`-j`; sorry-strict
  verdicts for non-P0 files; one writer per file; siblings read-only.

---

## 5. Billing-ruling OPTIONS (A6's Q3) — **RULED 2026-11-18: Option A, record-billed, quota-free**

**Ruling stamp (coordinator relay, 2026-11-18): DECISION-2 = Option A** — the η-port
ships as the ZZV2-λ technical-record continuation, quota-free; round-5 battery verdict:
all η-port components PARTIALLY-COVERED/COVERED informally (Lamzouri + framework
literature), corpus-collision NONE stands formally. Options B/C below are retained as
the historical option analysis; they are CLOSED by this ruling.

- **Option A — pure technical record (quota-free).** The η-port ships as the ZZV2-λ
  technical-record continuation (P1-record billing header extended; never an article).
  The covariance ladder is formal infrastructure; the informal λ-dependence stays
  Lamzouri's (must-cite in full: Lamzouri + Montgomery ICF 1974 + Baluyot–Goldston–
  Suriajaya–Turnage-Butterbaugh 2024 Lemma 5 — prework §4's binding "NEVER phrase as
  new mathematics" posture).
  *Cost:* none to quota. *Risk:* under-billing if round-5 novelty finds the covariance
  layer (or the strict-improvement corollary) statement-novel; leaves the G7-retarget
  battery residual (`a2-g7-token-inventory.md:65`) formally unresolved.
- **Option B — discovery-billed covariance layer (battery-gated).** Bill
  `unweightedKernelSum_cutoffTestLam_tendsto` + the scaled closed form as a
  DISCOVERY-CONDITIONAL-class lemma set, article-shaped, gated on the round-5 novelty
  battery (the natural carrier per A6 Q5) passing R2's S1 (statement-level novelty
  with named nearest-miss). *Cost:* battery + article effort; occupies a billing slot.
  *Risk:* S1 likely FAILS — nearest-miss is Lamzouri's own λ-dependence plus the
  donor's frozen layer (KNOWN-INFORMAL posture, `novelty/iter4-seed-triage.md` row 2);
  a failed billing claim at review is worse than Option A's silence.
- **Option C — split billing (record + conditional corollary slot).** Port +
  covariance ladder = technical record (Option A's billing); separately, the CONSUMER
  corollary class (full-domain `(0, ∞)` discharge + the no-numerics strict-improvement
  margin, §1.4) is held as a candidate DISCOVERY-CONDITIONAL article slot, fired ONLY
  if (i) the port lands GREEN and (ii) the round-5 battery grades the corollary's
  statement shape above the S1 bar (including whether the improvement direction is
  already in Lamzouri's paper — the open battery question flagged in §1.4(b)).
  *Cost:* battery effort; if fired, competes for the knowledge-level quota N=1 with
  FB-2/FB-4 (A6 Q2 — same single slot). *Risk:* quota contention; the strongest
  honest packaging if the corollary survives.

Determining input for all three: the round-5 novelty battery (A6 Q5) — Option A needs
it for closure, B and C need it for firing.

---

## 6. Files/inputs this pre-charter consumed (all read-only)

`pilots/zzv2-lam/{P1.lean,P1-record.md,P0-record.md,run_zzv2.py,run_zzv2.sh}`;
`pilots/zzv2-lambda-prework.md` (§1 L-ladder, §2 sequencing, §4 posture, §5 guards);
`qa/iter4-review/a6-iter5-charter-candidate.md` (Lead 3, Q3, budget note); donor tree
census @ `axiommath/ZetaZerosV2/ZetaZeros/{Zeta/{Defs,Kernel,Inputs,Transfer,
TransferBounds,Asymptotics}.lean,Definitions.lean}` + `Numeric/MontgomeryTaylor.lean`
(read-only sibling; no edits). No Modal runs, no new .lean files, no edits outside
this deliverable.

— lane A3, 2026-11-18 (worktree agent-04 @ 53c1548; REPORT ONLY — H commits)
