# xi-k-prime-precharter — the Ξ_K′ proportion family (iter-7 census Tier-1 #1; the precharter-gated seed)

Lane R9 (worktree agent-09), 2026-11-21. Precharter for the iter-7 seed census's Tier-1 #1
(`novelty/iter7-seed-census-DRAFT.md` §1 row 1, landed `c56c7aa` + the v2 correction
stanza). Parent dossier: `candidates/40-zeta-k-prime-derivative-zeros.md` (T1/T2/T3 +
F1–F6 pricing, 2026-11-09; its "Literature side: PENDING lane R8 round-2" was discharged
by novelty round-3 — VERDICTS row 40, T3 NEW-SUPPORTED). This precharter's new content:
the GATE is scoped, the statement-tier checkpoint probe is EXECUTED (GREEN shape), and the
iter-7 day-1 GO/NO-GO is ruled. Structure follows the fb2-pntap-precharter precedent.
NO discovery claim is made at precharter stage; nothing here spends the quota.

## §0 The target (the statement family, dossier-40 T3)

For K imaginary quadratic (the pilot family; the census's "or the quadratic pilot
first"), with `Ξ_K s := s(s−1)·Λ₀ s·Λ_χ s + 1` (dossier-40's assembly; χ = χ_D the
primitive quadratic character):

- **T3-flat:** `∃ T₀, ∀ T ≥ T₀, 0.85838·N_{Ξ_K′}(T,2T) ≤ N⁰ˢ_{Ξ_K′}(T,2T) ∧
  0.92919·N_{Ξ_K′}(T,2T) ≤ N^d_{Ξ_K′}(T,2T)` — the K-analogues of zeta23's proved
  `xiDeriv_simple_on_line(_cumulative)` (`Zeta23/XiPrime/Final.lean:199/:207`, the
  Solution-side copies `Solution/XiPrime.lean:25/:32`); counts via `analyticOrderAt`
  multiplicity over window zero-sets (the `Zeta23/XiPrime/Defs.lean:40–62` idiom).
- **T3-quartic:** the same at 0.86864/0.93432 (mirror `:40/:48` of the Solution file).
- **T1 (structure) / T2 (Speiser-type)** — the dossier's provable core, unchanged
  (Ξ_K entire with endpoints 1; reflection at root number +1; Re(Ξ_K′/Ξ_K) > 0 on
  Re s ≥ 1, s ≠ 1; zeros of Ξ_K′ confined to the open strip).

Billing class at article time: **DISCOVERY-CONDITIONAL** — the T3 statements are binder-
conditional until the window calculus is discharged (the template's kind vocabulary; the
S1–S4 gate applies at ship, not here).

## §1 Statement surface (elaborated shapes; probe-verified)

The probe file `research/pilots/40/XiKPrime-stmt-probe.lean` (`033b96a1ffc82d76`)
elaborates the four layers on-pin at `ff2494ea` (run 6: errors=0, sorry=6 = the expected
count; logs `research/pilots/40/logs/probe40-run{1..6}.log`, run-6 header = provenance):

- **Layer A (object):** `XiChi χ s := s*(s−1)*completedRiemannZeta₀ s *
  DirichletCharacter.completedLFunction χ s + 1` — **zero donor imports**: the assembly
  elaborates over MATHLIB'S OWN completions. The K-instantiation (tauceti's
  `fundamentalDiscriminantChar` completion) is glue item (a) below, priced S per the
  dossier.
- **Layer B (counts):** the zeta23 counting idiom mirrored — `analyticOrderAt`
  multiplicity, membership-`∑ᶠ` window sums, `Set.ncard` distinct, the N0simple
  intersection. ALL THREE count defs are `noncomputable` at statement tier (run-3/4/5
  findings; see §2 friction).
- **Layer C (THE GATE, statement form):** `WindowCalculus χ` — a structure with four
  Prop fields the K-window-calculus must eventually discharge: `hSymm` (the T1
  reflection, object-level), `hRVM` (the denominator asymptotic
  `N_{Ξχ′}(T,2T) ~ c·T·log T`, mirror of `xiDerivZeros₀_rvm`), `hEF` (the windowed
  explicit formula at a κ-profile — the engine's Thm-8.2-at-λ shape
  `(2−κ(λ)−ε)·N ≤ N⁰ˢ ∧ (3/2−κ(λ)/2−ε)·N ≤ N_d`), `hSeam` (off-diagonal control).
- **Layer D (targets):** six statements — T1 endpoints, T2 Speiser, and the four
  proportion theorems (flat/cumulative × flat/quartic constants) consuming
  `WindowCalculus`.

## §2 Corpus state + THE GATE (direct-source, this session + the probe)

**What is IN-CORPUS at the pin (verified at source):**
- mathlib `ff2494ea`: `completedRiemannZeta₀` (`NumberTheory/LSeries/RiemannZeta.lean:64`)
  and — load-bearing for `hSymm` — **the χ-side functional equation is a THEOREM at the
  pin**: `DirichletCharacter.completedLFunction_one_sub` (`DirichletContinuation.lean:291`,
  `IsPrimitive χ`): `Λ_χ(1−s) = N^(s−1/2)·rootNumber χ·Λ_χ⁻¹(1−s)`; plus
  `rootNumber` (`:279`). The ζ-side reflection is tauceti's
  `zetaEntireCompletion_one_sub` (`Zeros/Completion/RiemannZeta.lean:53`).
- tauceti: the quadratic layer the dossier F2 lists — `dedekindZetaC = ζ·L(χ_D)`
  (`LFunctions/DedekindZeta/Quadratic.lean`), Dirichlet completion order-preservation,
  `AnalyticLFunctionData` dual, `argumentPrinciple_nullHomologous`.
- zeta23 (v4.33 tree, statement-port ≈ 0 per the corpus-wide finding; re-based at
  port time): the ENGINE — `Zeta23/XiPrime/` (Defs/Statement/ZeroCount+{Contour,Landau}/
  ExplicitFormula+ZeroFree/Hardy/Coeff+{...}/Certificate/QuarticWindow/Transfer/Window/
  Seam/Final), whose headline theorems are UNCONDITIONAL for ζ's ξ′ (Final.lean:199/:207
  + the λ-parameterized form). The proved/sorry split: `Solution/XiPrime.lean` (0 sorry)
  vs `Challenge/XiPrime.lean:79` (sorry) — consume Solution-side statements only.
- openai-math: the OBJECT FAMILY exists (`OAI/NumberTheory/PrimePackets/
  IdealThetaXi.lean:100/:232/:351` `idealThetaXi/classThetaXi/completedThetaXi` over a
  general NumberField; dossier novelty check) — no derivative-zero or proportion content
  (re-confirmed by the round-2 sweeps, `r9-novelty-verification-iter6-round2.md`).

**What is MISSING (the gate content, decomposed):** the engine's ζ-specific consumables
have no K-analog anywhere — (i) an RvM-class zero-count for Ξ_K′ (the `hRVM` field);
(ii) the Ξ_K′ explicit formula — its coefficient layer is the CONVOLUTION of the ξ′
coefficients with the χ-coefficients (`Coeff/` analog; `hEF`); (iii) the on-line/moment
(Hardy-type) layer for the product; (iv) the seam term (`hSeam`). The window-REGULARITY
class (Gevrey taper `FamilyHyps`, `Zeta23/Taper/`) is object-agnostic and NOT a gate. The
dossier's F3(b) names the sharpest single unknown: **the χ-analogue of the Re(Λ_χ′/Λ_χ)
device** — M-grade new mathematics.

**Statement-tier friction found by the probe (priced, run history in the log headers):**
(1) `completedLFunction` resolves only as `DirichletCharacter.completedLFunction`;
(2) it requires `[NeZero N]` — a missing instance SILENTLY DROPS the auto-bound χ (46-error
cascade from one missing instance); (3) the counting trio is noncomputable at statement
tier (`analyticOrderAt`/`finsum`/`Set.ncard`) — the membership-`∑ᶠ` on a bare Set is the
`finsum` idiom on v4.36, so the finiteness that upgrades it to a genuine sum is itself a
proof obligation of the window layer; (4) scoped-notation gaps (`𝓝`, `Filter.Tendsto`)
under the minimal import set. All four are one-line fixes; none touches the mathematics.

**The checkpoint probe's verdict (the gate's statement tier): GREEN SHAPE — errors=0,
sorry=6-expected, 6 runs / ~4.5 min total wall (28–55 s each, warm; telemetry note: all
runs under the 60 s sampling interval, hence `[tele] samples=0` — no OVER possible, none
recorded; SPEC 2cpu/4GB, LEAN_NUM_THREADS=2, doz CLI, app `crossmath-probe-40` ephemeral
no-volume/no-secret).** Statement-port cost ≈ 0 CONFIRMED for this family; the gate's
risk is entirely in the binder discharge, not the statements.

## §3 Donor-binder plan (EnclOK consumption only)

Every external statement enters as an explicit Prop binder (the `WindowCalculus` schema
is the statement form of this plan): zeta23's engine statements are mirrored, not
imported (v4.33 tree; the dossier's porting debt F3(c), ~2–3k LoC, is incurred only at
T3-discharge time — NOT at day-1); tauceti's quadratic layer is same-toolchain (direct
dependency permissible, on-pin triad first per the Cycle-2 hygiene gate); mathlib's FE
theorem is consumed directly. No `native_decide`, no external CAS; kernel-only. Probe
`sorry` only inside probe-convention files with headers (the probe file's own header).

## §4 Pricing, risk classes, GO/NO-GO

- **Spent at precharter:** 6 probe runs (statement tier — DONE, GREEN shape), ≈150 LoC.
- **Stage 1 (day-1 charterable):** T1 + T2 + the Layer-C/D statements landed as a pilot
  skeleton with the binder schema — ≈1–2k LoC, 6–10 runs (the dossier's milestones 1–2 +
  glue (a), both S-class; the step-2 identity S; the probe's friction fixes already
  applied). First attempt of the dossier's milestone 3 (the step-3 χ-bound at d = −3,
  the Eisenstein field — kindest constants, openai's ℚ(√−3) Hecke family adjacency) is
  IN scope as the gate's first real bite: +2–4 runs, M-grade, honest-park allowed.
- **Stage 2 (gated, NOT day-1):** T3 discharge = the four binder fields — the EF port
  (F3(c)) + the coefficient-convolution layer + the moment layer: the dossier's ">10k
  LoC, gated" stands, now refined: the RvM field (`hRVM`) is plausibly the cheapest
  (Landau/Contour analog over the product; tauceti's argument-principle entry point),
  `hEF` the deepest.
- **Risk classes:** (r1) literature risk on T3 — RETIRED at precharter level (round-3
  verdict T3 NEW-SUPPORTED; round-2 corpus re-confirmation 2026-11-21); (r2) the step-3
  χ-bound may be genuinely hard (M-grade; the dossier's own driver) — mitigated by the
  binder schema (T3 ships conditional if Stage 2 stalls); (r3) `analyticOrderAt` churn
  (mathlib `ZetaZeros.lean` active neighborhood, dossier F5(v)) — pin-locked, accepted;
  (r4) statement-tier noncomputability trio (probe finding) — cosmetic at proof time but
  forces a `Classical`/decidability discipline in the counting layer; (r5) the
  finsum-upgrade obligation (§2 friction (3)) is a REAL proof load riding with `hRVM`.
- **GO/NO-GO for an iter-7 day-1 charter: GO for Stage 1** (T1+T2+statements+the
  d = −3 first bite; S-class + one M-class attempt, honest-park conventions apply).
  **NO-GO at day-1 for Stage 2** (the T3 discharge arc) — it charters only on a Stage-1
  GREEN plus a fresh orchestrator grant, per the two-strike discipline's spirit.

## §5 Consequence blocks (pre-registered)

- Chartering Stage 1 does NOT fire any T2-ignition-class consequence (no PNT+
  register-and-port; no quota spend — this seed is a DISCOVERY track, never the
  knowledge-level slot).
- A Stage-1 GREEN makes dossier-40 article-eligible at R2's S1–S4 (the T1/T2 slice is
  formalization-of-classical; the T3 binder statements are the discovery-conditional
  surface — the article's novelty table MUST lead with the ζ-side engine rows and the
  informal nearest misses, not with "first" claims unconditioned on the binders).
- A Stage-1 park (the step-3 M-grade bite failing) leaves the probe + statements as the
  record; the seed re-enters only through a fresh census.

## §6 Nearest-miss rows (≥2 delivered; leads, source-checked)

| # | prior work | what it proves | why this differs |
|---|---|---|---|
| 1 | **zeta23 XiPrime engine** (proved side: `Zeta23/XiPrime/Final.lean:199/:207`; `Solution/XiPrime.lean:25/:32/:40/:48`; Challenge copies are sorry) | the ζ-side ξ′ proportions, unconditional (85.838/92.919 flat; 86.864/93.432 quartic) | ζ-ONLY: no completion product, no χ-column, no K-family; our family is the K-assembly's derivative — every engine consumable (RvM/EF/moment/seam) is UNDISCHARGED for K (round-2 corpus re-confirmation 2026-11-21) |
| 2 | **Šleževičienė 2003** (Selberg-class Speiser-type conditional; covers ζ-conditionally) + **Broughan 2009** (ξ′/ξ positivity for ζ) | the T2-class informal nearests (dossier novelty; VERDICTS row 40) | conditional/ζ-side; no proportion statements, no K-family |
| 3 | **openai-math `IdealThetaXi.lean:100/:232/:351`** | the completed number-field ξ-type OBJECT (`idealThetaXi`/`classThetaXi`/`completedThetaXi`) | object family only: no derivative theory, no zero statements (dossier check + round-2) |
| 4 | **this project's ζ_K/ζ_L proportion stack (articles 42/75)** | ζ_K/ζ_L zero proportions (the L-function's OWN zeros) | different object: the DERIVATIVE's zeros; no overlap in statement class; composition (75's assembly schema + this family) is the census's pre-charted route |
| 5 | **Farmer–Gonek arXiv:0803.0425** (the ξ′-proportion method source zeta23 builds on) | the ζ-side method, informal | method kin; no number-field remark (dossier's query 4) |

## §7 The discovery-grade case vs article-22's ζ-side row (and the quota frame)

Article-22's row is the honest CONTRAST CASE: it assembled classical mathematics (PNT)
inside mathlib and is billed TECHNICAL-RECORD/knowledge-adjacent — the mathematics was
never in doubt, only the formal assembly. THIS seed's T3 has **no informal precedent for
K ≠ ℚ anywhere swept** (round-3 + round-2): the statements themselves — ξ_K′
simple/on-line/distinct proportions at the transplanted constants — would be new as
statements, with the honest condition that they are binder-conditional until Stage 2.
That is exactly the template's DISCOVERY-CONDITIONAL kind: stronger than
formalization-first (the object+constants are new), weaker than unconditional discovery
(the window calculus is consumed, not built, at Stage 1). The S1–S4 gate at article time
decides; this precharter claims nothing. Quota: INFORMS-NEVER-SPENDS (discovery track;
the N=1 knowledge-level slot is untouched by this seed — cross-ref R2's iter-7 structural
draft, `r2-iter7-quota-structural-draft.md` `4955ac91`, Option-A day-1 placement).

— lane R9 (worktree agent-09), 2026-11-21. Precharter delivered; the probe files + logs
ride the same worktree (pilots/40/). No commits (H lands); no quota spend; 6 probe fires
total (statement-tier only, SPEC-compliant, logs persisted with provenance headers).
