# Survey addendum — PrimeNumberTheoremAnd deep dive (+ § RvM triplication)

Lane A1, 2026-11-13 (task A1-2). Companion to `research/survey/axiommath.md` §1.4 (PNT+ was
covered thinnest there). Inputs: the bumped Axiom fork on our pin
(`/home/doz/zcode-workdir/axiommath/PrimeNumberTheoremAnd`, HEAD `d82cfae`, mathlib
`ff2494ea`, v4.36.0-rc2, full build GREEN via axbump v2-run9), a read-only shallow clone of
upstream `AlexKontorovich/PrimeNumberTheoremAnd` (`/tmp/pntplus-upstream-clone/repo`, HEAD
`938912bb`, 2026-11-12, toolchain v4.35.0 — fetched this session, discarded after), the encore
mathlib checkout, tauceti, and the dossier-22 file set. Same citation discipline: file:line
for every claim; fork paths are relative to the fork root unless prefixed `upstream/`.

## §0 Fork vs upstream — what the fork actually is

Upstream is a large, very active community project (last commit 2026-11-12 is PR **#1809**,
`938912bb`; blueprint/docs/Zulip per `upstream README.md`; objective: "formalize in Lean the
Prime Number Theorem (with classical error term), as well as … PNT in Arithmetic Progressions.
A stretch goal would be to obtain the Chebotarev density theorem" — the last directly
adjacent to tauceti's `frobeniusPsi_asymptotic`, `TauCeti/NumberTheory/Chebotarev/
PrimeCounting/Chebotarev.lean:210`). Upstream total: 235 .lean files; 272 lines carrying the
token `sorry`, concentrated in `IEANTN/` (`TMEEMT.lean` 77, `Dusart.lean` 33,
`FioriKadiriSwidinsky/` 29, `FKS2*TrustedNumerics` 22+13, `Kadiri.lean` 14, `Buthe.lean` 8)
plus `IwaniecKowalskiCh1.lean` (7) — i.e. **the explicit-NT layer is where upstream's sorries
live; the asymptotic core (Wiener, MediumPNT, StrongPNT, ZetaBounds, PerronFormula) is
sorry-free upstream**.

The Axiom fork (README.md:3–8) = upstream minus the sorry-carrying explicit-NT files (126
upstream `IEANTN/` files → 29 in the fork: the FKS2 row/table files, `FioriKadiriSwidinsky/`,
`KadiriEq15*`, `Dusart`, `TMEEMT`, `Buthe`, `LeanCertEnclosures.lean` are gone), minus the
tail of `StrongPNT.lean` (see §1b), with the module-system upgrade and the mathlib-ff2494ea
port (bump commits `ada1a83`, `8c631b7`, `d82cfae`). The fork's shallow history (4 commits)
does not reach the sorry-strip commit, so the delta was established by tree comparison
(upstream API listing vs fork `find`), not `git log -S`.

## §1 (a) The PNT ladder: exact state

**WeakPNT (both editions, proved).** `Wiener.lean:2352 WeakPNT : Tendsto (fun N ↦ cumsum Λ N /
N) atTop (𝓝 1)` (Wiener–Ikehara route; `Wiener.lean` is 4276 lines); packaged as
`Consequences.lean:88 WeakPNT'` and `:108 WeakPNT'' : ψ ~[atTop] (fun x ↦ x)`.

**MediumPNT (both editions, proved).** Statement (identical text fork/upstream):
`MediumPNT.lean` — fork `:3714`, upstream `:4142` —

```
theorem MediumPNT : ∃ c > 0, (ψ - id) =O[atTop] fun x ↦ x * Real.exp (-c * (Real.log x) ^ ((1:ℝ)/10))
```

i.e. ψ(x) = x + O(x·exp(−c·(log x)^{1/10})); **"medium" = the exponent 1/10 on log x** in the
de la Vallée Poussin-shaped error (vs 1/2 = √log for "strong", vs no error term for "weak").
No hypotheses — unconditional; fork proof runs the smoothing kernel route inline
(`SmoothExistence` → `SmoothedChebyshevClose`/`MellinOfSmooth1cExplicit` → bounds
`I1Bound…I9Bound`, `MediumPNT.lean:3715–3760`); upstream proof is one line off the generic
engine: `GenStrengthPNT LogDerivZetaBoundedAndHolo99`, with in-file `#guard_msgs`/`#print
axioms` recording `[propext, Classical.choice, Quot.sound]` (upstream
`MediumPNT.lean:4148–4151`).

**The parametric engine (upstream; folded away in the fork).** Upstream
`MediumPNT.lean:3606 GenStrengthPNT {n₁ n₂} (LogDerivZetaBoundedAndHolo :
LogDerivZetaBoundedAndHoloGenProp n₁ n₂) (0 < n₁) (0 < n₂) : ∃ c > 0, (ψ - id) =O[atTop] fun
x ↦ x * exp(-c * (log x)^(1/(1+n₁)))` (blueprint `:3586–3594`: proof = smoothed-Chebyshev
decomposition `𝓜(1̃_ε)(1)x + I₁−…+I₉ = ψ(x) + O(εx log x)`, then balancing). The engine is
parametrized by the strength of a −ζ′/ζ bound in a zero-free strip: n₁ = 9 gives MediumPNT
(1/10), n₁ = 1 gives StrongPNT (1/2). The fork keeps only the two concrete instances
(`LogDerivZetaBoundedAndHolo` at fork `MediumPNT.lean:3595`, n₁=9-shaped) — the generic lemma
and the `*GenBound` variants are absent from the fork (grep: `GenStrengthPNT` 0 hits).

**StrongPNT — deleted in the fork, PROVED upstream (terminal point corrected).** The main
survey recorded the fork's terminal point correctly (commented-out placeholder
`PrimeNumberTheorem`, fork `StrongPNT.lean:1883–1885`, preceded by the blueprint LaTeX at
`:1843–1857`); the deleted form would say exactly

```
∃ c > 0, (ψ - id) =O[atTop] fun x ↦ x * Real.exp (-c * Real.sqrt (Real.log x))
```

What the fork's shallow git history cannot show — and what upstream confirms — is that this
is **not an open problem but a fork amputation**: upstream `StrongPNT.lean:2900–2905` proves

```
theorem StrongPNT : ∃ c > 0, (ψ - id) =O[atTop] fun x ↦ x * Real.exp (-c * (Real.log x) ^ ((1:ℝ)/2))
```

from `GenStrengthPNT LogDerivZetaBoundedAndHolo12` (the n₁=1 instance), where
`LogDerivZetaBoundedAndHolo12` (:2886) ← `LogDerivZetaBndUnif12` (:2855) ←
`LogDerivZetaUniformLogSquaredBound` (:2831): ∃F ∈ (0,1/42), |ζ′/ζ(σ+it)| ≤ C·log²|t| for
|t| ≥ 3, σ ≥ 1 − F/log|t| — itself the endpoint of the in-file Borel–Carathéodory /
Blaschke / Jensen chain (`borelCaratheodory' :76`, `BorelCaratheodoryDeriv :205`,
`LogOfAnalyticFunction :265`, `ZerosBound :874`, `JBlaschkeDerivBound :951`, `FinalBound
:1029`, `GlobalBound :1400`, `LogDerivZetaFinalBound :1536`; upstream line numbers, file is
2908 lines vs the fork's 1885). Upstream posts the axiom check inline
(`StrongPNT.lean:2906–2908`: `#guard_msgs in #print axioms StrongPNT` →
`[propext, choice, Quot.sound]`). So: **the classical-strength PNT (T2b-shaped, see §4) is a
proved, triad-clean theorem one toolchain below us; on our pin the strongest built PNT is
MediumPNT.** Recovering StrongPNT on ff2494ea is a *port* job (the ~1000-line
`StrongPNT.lean` tail + the `GenStrengthPNT` engine from upstream `MediumPNT.lean:3586–3700`),
not a math job.

## §2 (b) The `Mathlib/` subtree — 75 files, three-way overlap

Inventory method: fork's `PrimeNumberTheoremAnd/Mathlib/` = 75 .lean files laid out in
mathlib's directory scheme ("each file names the Mathlib or Physlib file it extends" is the
AreaLaw2D convention; here: `Mathlib/…`-mirrored paths). Existence check against the encore
checkout at `ff2494ea` (script over `find`): **26 of 75 paths exist in mathlib proper
(extensions/modifications of live mathlib files), 49 do not (new material)**.

| Capability | PNT+ `Mathlib/` file (fork) | mathlib `ff2494ea` | tauceti | verdict |
|---|---|---|---|---|
| ζ functional equation, concrete | `NumberTheory/LSeries/ZetaFunctionalEquation.lean:30 zeta_functional_equation` ("Functional equation for Mathlib's completed Riemann zeta factor Λ") | only the symmetric form `completedRiemannZeta_one_sub` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:106`, per R3) + abstract `IsStrongFEPair` instances | own `LSeries` FE layer (`FEPairWithLevel`) | **nobody has the Λ-asymmetric form over mathlib's ζ** — glue candidate |
| Hadamard factorization of Λ₀/ξ | `NumberTheory/LSeries/RiemannZetaHadamard.lean` (canonical genus-1 product over the zero divisor; main-results docstring, header cites Tao [tao246b] Thm 22) + `Analysis/Complex/HadamardFactorization{,/Growth,/Order,/Summability}.lean` + `Analysis/Complex/WeierstrassFactor.lean`, `CanonicalProduct.lean` | nothing for ζ (mathlib's `Analysis/Meromorphic/Divisor.lean:41 MeromorphicOn.divisor` + `FactorizedRational.lean:178` provide the divisor machinery only) | nothing | **unique** — the only formal Hadamard product for ζ in any corpus |
| ζ convexity bound | `NumberTheory/LSeries/RiemannZetaConvexity.lean:38 norm_riemannZeta_ratio_le_on_verticalLine` (Euler product at re 2σ controls ‖ζ(2σ)/ζ(σ+it)‖) | none | none | unique (zeta23 needs none; DZZF builds its own bounds) |
| ζ strip/Abel/partial-sum bounds | `NumberTheory/LSeries/RiemannZetaStripBound.lean`, `RiemannZetaAbelKernel.lean`, `RiemannZetaAbelContinuation.lean`, `RiemannZetaPartialSum.lean`, `RiemannZetaValues.lean`, `ZetaFiniteOrder.lean` | none of these paths | — | unique set; consumed by ZetaZerosV2 (lakefile comment) |
| Selberg sieve | `NumberTheory/Sieve/{Basic,Selberg,SelbergBounds,AuxResults}.lean` (4 files; `SelbergBounds.lean:83 siftedSum_eq`, `:56 zeta_pos_of_prime`) | **`Mathlib/NumberTheory/SelbergSieve.lean` exists** (different layout/name; no `NumberTheory/Sieve/` dir) | none | second development; overlap to audit before donating |
| Cartan bounds | `Analysis/Complex/{CartanBound,CartanMajorantBound,CartanProductBound,CartanInverseFactorBound}.lean` (dyadic log-majorants, e.g. `CartanBound.lean:154,267,279`) | **`Mathlib/Analysis/Complex/ValueDistribution/Cartan.lean` exists** (Nevanlinna program: `FirstMainTheorem.lean`, `SecondMainTheorem.lean`, `Proximity/`, `LogCounting/`) | none | partial overlap; PNT+'s are complex-analysis-grade majorants for zero-free work |
| Value distribution / log counting | `Analysis/Complex/ValueDistribution/LogCounting/Growth.lean` | `…/LogCounting/Basic.lean` exists (PNT+ has both: Basic in-mathlib, Growth not) | none | PNT+ rides mathlib's newest NT-adjacent program |
| Meromorphic divisor algebra | `Analysis/Complex/Divisor*.lean` (10 files) + `Analysis/Meromorphic/{DivisorHolomorphic,DivisorSupport}.lean` | `Analysis/Meromorphic/Divisor.lean` + `FactorizedRational.lean` (core only) | none | extension of fresh mathlib core |
| Γ bounds (Stirling-adjacent) | `Analysis/SpecialFunctions/Gamma/{CriticalLineDecay,DigammaSeries,GammaStirlingAux,IntegralBounds,StripBounds}.lean`, `GammaBounds.lean` | none of these paths (zeta23 keeps its own `GammaFacts` hypothesis layer instead) | none | unique-vs-mathlib; **overlaps zeta23's `GammaFacts` binder** — a discharge donor for it (§5) |
| completed ξ as an object | `Analysis/SpecialFunctions/CompletedXi.lean:42 riemannXi` (entire ξ, `:51 riemannXi_zero : ξ 0 = 1/2`) | none (mathlib has `completedRiemannZeta₀` only) | `zetaEntireCompletion` (2·ξ normalization, `NumberTheory/LFunctions/Zeros/Completion/RiemannZeta.lean:33`); zeta23 `XiPrime.xi` (same 2·ξ) | **third normalization of ξ in the ecosystem** — duplication-audit row (cf. survey/anthropics.md §tauceti-contributions (a)) |
| Perron | `PerronFormula.lean:116 tendsto_truncated_vertical_shift_with_simple_pole`, `:197 …_Ioo` (rectangle contour shift through a simple pole; residue-theorem grade) | none | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean:130 truncatedPerron_LSeries`, `:229 norm_truncatedPerron_LSeries_sub_sum_le`, `:289 tendsto_truncatedPerron_LSeries` (Dirichlet-series grade: truncated Perron vs coefficient sums, `Basic.lean:81` kernel lemmas) | **different API levels, zero shared declarations**: PNT+ = geometry of contours; tauceti = arithmetic of L-series. Both are "Perron" only by name |

**Flagged as candidate glue (nobody else has, on our pin, sorry-free, built):** the
`RiemannZetaHadamard` product; `zeta_functional_equation` for mathlib's Λ;
`RiemannZetaConvexity`; the Γ-bound quintet (discharges zeta23's `GammaFacts`-shaped
hypotheses and V2's implicit Stirling use); the ζ strip/Abel bound set. Caution items:
Selberg sieve and Cartan bounds each partially overlap live mathlib files under other names
(the "3 mathlib PRs open" dynamic of TRIAGE row 22 is exactly this subtree).

## §3 (c) `IEANTN/` — what it is, and the AFP relation

IEANTN = **Integrated Explicit Analytic Number Theory**, the IPAM UCLA research network
(upstream README: "We are also hosting the Integrated Explicit Analytic Number Theory
network … Terence Tao's personal log" — the wiki link there; the fork inherits the name via
`PULL_REQUEST_STYLE.md:107–109`: "The IEANTN subproject formalizes specific published
papers"). Content by paper: Kadiri (zero-free region + zero counting with explicit
constants), FKS2 = Cully-Hugill–Johnston–Trudgian–Yang arXiv:2206.12557 (explicit π(x)),
Rosser–Schoenfeld, Dusart, Büthe, eSHP, CH2, BKLNW, TMEEMT. Two structural facts:

1. **It is being ported out**: upstream README "IEANTN porting notice (2026-08): the IEANTN
   Lean material is being ported to its own repository, teorth/IEANTN; the code presently
   under `PrimeNumberTheoremAnd/IEANTN/` here will be trimmed once the port is complete."
   The Axiom fork's 27-file IEANTN slice is therefore a **frozen pre-port snapshot** — stable
   as a donor, but its upstream future is a separate repo.
2. **The fork's IEANTN is hypothesis-binder-ized where upstream sorries**: the fork's
   `KadiriZeroCounting.lean` (no sorries) carries the explicit-constant RvM bound as a
   *hypothesis* — `riemannZeta.Riemann_vonMangoldt_bound 0.137 0.443 6.1` appears as binder
   `hRvM` at `:810, :839, :1403, :1433`; the Prop is defined at
   `ZetaDefinitions.lean:165` (see §5) but proved nowhere in the fork. Upstream's
   `Kadiri.lean` (14 sorries) is mid-proof of exactly that statement (`kadiri_thm_3_1_q1_*`
   chain, upstream `Kadiri.lean:180–1031+`).

**AFP relation.** Dossier 22's novelty check cites "Isabelle AFP has PNT entries"
(`candidates/22-quasi-rh-pnt-effective.md:9`, queued queries `:96–98`); TRIAGE row 22's
novelty note: "AFP PNT+Eberl–Paulson exist; Tier-2 is the content". The relation is
*tradition-complementary, not competitor*: the AFP entries (Prime_Number_Theorem /
Prime_Distribution_Elementary line) are **asymptotic** PNT formalizations in Isabelle — the
same target as upstream PNT+'s Wiener/MediumPNT/StrongPNT core, in a different prover, with
no explicit constants. IEANTN is the **explicit** tradition: every statement carries decimal
constants (0.137/0.443/6.1, FKS2's table-7 rows, eSHP/Rosser–Schoenfeld prime tables as
`List (ℕ × ℕ)` data, e.g. `IEANTN/eSHP/eSHP_tables.lean:16 table_8`). No Lean-side overlap
with AFP is possible (different systems); the operative comparison for *us* is: (i) the
explicit statements the AFP line does not touch (Kadiri zero-free with constants, N(σ,T)
density bounds — §5); (ii) the trusted-numerics problem (upstream's `LeanCertEnclosures`
cut by the fork; zeta23's `EnclOK` pattern is our corpus-side precedent for the same
boundary).

## §4 (d) Verdict — does PNT+ accelerate dossier 22's Tier-2?

Recall the split (`candidates/22-quasi-rh-pnt-effective.md:35–58`): Tier 1 = asymptotic
T1a/T1b (ψ~x, π~x/log x); Tier 2 = **T2a** |ψ(x)−x| ≤ C_ε·x^{7/8+ε} from openai's quasi-RH
(`QuasiRiemannHypothesis.lean:7`), **T2b** |ψ−x| ≤ C·x·exp(−c√log x) from the classical
zero-free region; TRIAGE row 22 + `novelty/knausgaard-as-donor.md:135` ("Tier-2 framing (ψ =
x + O(x^{7/8+ε}) from openai's quasi-RH) is the content") make T2a the real content.

- **T2b is dead as a target — already proved upstream.** Upstream `StrongPNT.lean:2900`
  proves exactly the T2b error term unconditionally (triad axioms, `:2906–2908`). Any
  Cycle-2 statement of T2b is formalization-only. This *sharpens* the TRIAGE row-22
  "strategically dead" verdict from "dead man walking (Tier-1)" to "Tier-2's T2b half is
  also gone; only T2a remains".
- **T2a is NOT shortcut by PNT+ — but two of its three hard steps get on-pin donors.**
  `GenStrengthPNT`'s parametrization is by a −ζ′/ζ bound of *logarithmic* zero-free shape
  (σ ≥ 1 − F/(log t)^{n₁}); a quasi-RH-strength input instantiates it but the engine's error
  is always x·exp(−c(log x)^{1/(1+n₁)}) — a *power saving* x^{7/8+ε} needs the contour shift
  to Re = 7/8+ε (dossier step 8), which no PNT+ statement provides. What PNT+ does supply,
  sorry-free on our pin: (i) **step 7's Perron truncation**: `PerronFormula.lean:116/:197`
  (contour-shift-with-pole, rectangle grade) as the substitute or companion for tauceti's
  `truncatedPerron_LSeries` (`Perron/Formula.lean:130`) — dossier 22 flagged tauceti-Perron
  as its step-7 donor and zeta23's `WeilEF/Contour.lean` as alternative; PNT+ is a third,
  on-pin, already-built option; (ii) the **Borel–Carathéodory bootstrap** (dossier's
  "[HARDEST STEP for T2b]") exists proved upstream (`borelCaratheodory'` :76 through
  `LogDerivZetaFinalBound` :1536) — the exact template T2a's log-derivative-on-shifted-line
  step needs, albeit for the classical region rather than the 7/8 line.
- **Net for the dossier-22 trajectory**: Tier-2-as-T2a survives as the only open content;
  its pilot plan should re-point step 7 to a Perron bake-off (tauceti LSeries-grade vs PNT+
  contour-grade) and import the upstream Borel–Carathéodory chain as the T2a-conditional
  bootstrap skeleton. Tier-1 and T2b are closed by upstream/PNT+ (rebase-only).

## §5 RvM triplication (+ two more editions found in PNT+)

Who states Riemann–von Mangoldt counting N(T), in which form, with which hypotheses:

| Edition | Object counted / window | Form | Hypotheses | Status / locator |
|---|---|---|---|---|
| **zeta23** | `ZeroConfig Z` (ζ config: open strip, multiplicity via `analyticOrderAt`); **dyadic** window (T,2T] | additive with main term: \|N(T,2T) − (T/2π)(ℓ+2log2−1)\| ≤ C·log T (T ≥ T₀); **plus** local count N(t,t+1) ≤ A₀·log(\|t\|+3), two-sided — a two-field structure | `GammaFacts` (Stirling) carried as binder **by design** | `structure RiemannVonMangoldt (Z)` `zeta23/Zeta23/Hypotheses.lean:67–71`; proved `Zeta23.RvM.riemannVonMangoldt (hΓ)` `RvM/Statement.lean:20` (= `rvM_main` + `zetaZeroConfig_local_count`, header `:10–14`); Backlund horizontal separately (`RvM/Backlund.lean:12 backlund_horizontal`) |
| **ZetaZerosV2** | `zeroCount T` (ζ, open strip, `analyticOrderNatAt`, **upper half-plane ordinate** 0 < Im ρ ≤ T; cumulative) | additive with refined main term: \|N(T) − M(T)\| ≤ C·log T for **T ≥ 4**, M(T) = (T/2π)log(T/2π) − T/2π (`ZeroCount/MainTerm.lean:42`) | none — **unconditional** | def `Zeta/Inputs.lean:46–47`; proved `ZetaZeros.riemannVonMangoldt` `ZeroCount/RiemannVonMangoldt.lean:465` (= `exists_abs_zeroCount_sub_mainTerm_le` `:424`, GoodHeight detour `ZeroCount/GoodHeight.lean:44`) |
| **ZetaZeros (V1)** | same `zeroCount` convention | multiplicative ε-asymptotic: \|N(T)/((T/2π)log T) − 1\| < ε for T ≥ T₀(ε) | **hypothesis only** — never proved in V1 | `def RiemannVonMangoldt : Prop` `ZetaZeros/Defs.lean:133–136`; consumed as binder `Main.lean:33,72,113,132` |
| **PNT+ explicit (IEANTN)** | `riemannZeta.N T = zeroes_sum univ (Ioo 0 T) 1` — `zeroes_sum I J f = ∑' ρ ∈ zeroes_rect I J, f ρ * order ρ` (`ZetaDefinitions.lean:111–114`, `order = meromorphicOrderAt` `:108`): real part unrestricted, ordinate (0,T), **with multiplicity**; cumulative | explicit constants + constant term: \|N(T) − ((T/2π)log(T/2πe) + 7/8)\| ≤ b₁log T + b₂loglog T + b₃ for T ≥ 2; canonical instance (0.137, 0.443, 6.1) | in the fork: **binder only** (`hRvM`); upstream: mid-proof (`Kadiri.lean`, 14 sorries) | def `riemannZeta.Riemann_vonMangoldt_bound` `IEANTN/ZetaDefinitions.lean:163–166` (RvM error def `:155`, N def `:141`, N(σ,T) def `:151`); dyadic corollaries proved from the binder: `KadiriZeroCounting.lean:809 zetaCounting_abs_N_le_backlund_majorant`, `:838 …Dyadic…`, `:999 zetaCountingRvM_dyadic_le` |
| **PNT+ crude** | same `riemannZeta.N` | polynomial majorant \|N(T)\| ≤ A·T^{3/2} (T ≥ 2), no main term, "no argument-principle input" (docstring `:1101–1104`) | none — unconditional | `Backlund/ZeroCountCrude.lean:1105 zetaCounting_crude_majorant` |
| tauceti | — | none (no zero counting; nearest are ψ/θ-side `SumPrimePow.lean`, `LFunctions/Mertens.lean`) | — | `bridges/analytic-nt.md` §0 row "Zero counting N(T): tauceti none" |
| mathlib `ff2494ea` | — | none (`riemannZetaZeros` set only, `Mathlib/NumberTheory/LSeries/ZetaZeros.lean:33–68`) | — | `bridges/analytic-nt.md` §0 |

Also relevant in the same neighborhood (found this session, fork, sorry-free):
`IEANTN/ZetaDefinitions.lean:151 riemannZeta.N' (σ,T)` — the zero-**density** counting
function (zeros with real part > σ, ordinate (0,T)); `:178–188 structure zero_density_bound`
— a Prop-level interface N(σ,T) ≤ c₁(σ)T^{p(σ)}(log T)^{q(σ)} + c₂(σ)(log T)²; `:121
riemannZeta.RH_up_to (T)`; `:130 riemannZeta.classicalZeroFree (R)`. These are
statement-layer hooks for dossier 20/70-series zero-density work, not theorems — no bound is
instantiated in the fork.

**Which edition to consume (recommendations):**

- **42-M4 donor swap (closing the ζ_K landing theorem)**: consume **ZetaZerosV2's**
  `riemannVonMangoldt` + `simple/distinct_proportion_lower`. Reasons: cumulative window
  matches pilot 42's phrasing (TRIAGE row 42 caveat "cumulative-window phrasing" — zeta23's
  engine is dyadic-first with cumulative *variants*, V2 is cumulative-native); fully built on
  our pin (axbump v2-run9); constants equal zeta23's ThmD optimum (C₀ = 2−C_MT, C₁ =
  (3−C_MT)/2; `survey/axiommath.md` §4 H2). zeta23 remains the donor of record for the
  Dirichlet-column (ThmE) — V2 has no L(s,χ) statements.
- **A5 novelty checks (round 4, decl-index v2)**: index must distinguish *proved theorem*
  names from *Prop definitions*: `ZetaZeros.riemannVonMangoldt` (V2, theorem),
  `ZetaZeros.RiemannVonMangoldt` (V1, **def : Prop, unproved** — must not satisfy an
  "RvM exists" query), `Zeta23.RvM.riemannVonMangoldt` (theorem, Γ-conditional),
  `PrimeNumberTheoremAnd.IEANTN.ZetaDefinitions.riemannZeta.RiemannVonMangoldt_bound`
  (def : Prop, binder-only in the fork; **proved-in-upstream status is Kadiri-in-progress**
  — novelty verdicts should treat the explicit-constants RvM as *contested territory*, not
  absent). Four distinct names across three spellings of "RiemannVonMangoldt" is exactly the
  false-negative pattern the round-3 Knausgård lesson flagged.
- **Pilot 20's Card20 `rvm` field** (transcribes zeta23's two-field record,
  `pilots/20-blueprint.md` §1): for ζ_K instantiation no edition applies (all are ζ-only);
  keep the binder, with V2's `ZeroCount/` tree as the *proof-strategy* template if 20-M3
  ever needs a ζ_K RvM (folded-path argument principle over the tauceti continuation).
- **zeta23's `GammaFacts` binder** (the one hypothesis its RvM carries): PNT+'s
  `Mathlib/Analysis/SpecialFunctions/Gamma/*` quintet (§2) is the natural discharge donor —
  a concrete §4-style hook not present in the main-run bridge map.

## Sources consulted

- Fork: `README.md`, `lakefile.toml`, `StrongPNT.lean:1820–1885`, `MediumPNT.lean:3595,3706–3760`,
  `Wiener.lean:2352`, `Consequences.lean:88,108`, `PerronFormula.lean:100–197`,
  `IEANTN/ZetaDefinitions.lean:120–215`, `IEANTN/KadiriZeroCounting.lean:16,809–1040`,
  `IEANTN/{PrimaryDefinitions,ZetaSummary}.lean` (heads), `IEANTN/eSHP/eSHP_tables.lean:16`,
  `IEANTN/FKS2Cor24TrustedNumerics.lean` (all), `PULL_REQUEST_STYLE.md:107–109`;
  `Mathlib/` subtree existence script vs encore checkout; sorry grep (14 tokens, all
  comments/docstrings).
- Upstream (`/tmp/pntplus-upstream-clone/repo`, HEAD `938912bb` 2026-11-12, v4.35.0;
  discarded): `README.md` (IEANTN network + teorth/IEANTN port notice + objective),
  `git log -1`, tree API listing (235 files), sorry-per-file counts,
  `StrongPNT.lean:76–2908` (locator pass; `:2900–2908` quoted),
  `MediumPNT.lean:3580–3700,4134–4151` (GenStrengthPNT + MediumPNT + axioms guard).
- Siblings: encore mathlib `ff2494ea` (`NumberTheory/SelbergSieve.lean`,
  `Analysis/Meromorphic/Divisor.lean:41`, `Analysis/Complex/ValueDistribution/` listing,
  `NumberTheory/LSeries/RiemannZeta.lean:106`); tauceti
  (`NumberTheory/ArithmeticDirichletSeries/Perron/{Basic,Formula}.lean`, no zero counting);
  zeta23 (`Zeta23/Hypotheses.lean:55–80`, `Zeta23/RvM/Statement.lean` all).
- Project: `research/candidates/22-quasi-rh-pnt-effective.md:9,35–58,96–98,146–175`,
  `research/novelty/knausgaard-as-donor.md:135`, `research/TRIAGE.md` row 22,
  `research/survey/axiommath.md` (§1.4, §4 H2, §5), `research/pilots/20-blueprint.md` §1,
  axbump logs (v2-run9).

## §FF double-cover — function-field / s-plane absence (requested by A2, verified independently)

A2's function-field bridge claims (its §0/§1): no s-plane ζ_C(s)/point-count-bound content
anywhere in the six AxiomMath repos — the function-field world (Weil) and the s-plane world
(zeta/DZZF/PNT+) share zero definitions. My independent sweep **confirms both absences**.

**(a) Function-field zeta content in PNT+ / ZetaZeros (V1): ABSENT.**
Queries (grep -rniE, over `PrimeNumberTheoremAnd/PrimeNumberTheoremAnd`, `ZetaZeros/ZetaZeros`,
`ZetaZeros/Challenge`): `zetaSeries` → 0 hits; `FiniteField` → 0; `F_\(q\|𝔽\|Fq\b` → 0;
`countPoints|pointCount` → 0; `IsSmooth|SmoothOfRelativeDimension` → 0;
`Deligne|Weil conject|rationality` → 0. Two near-neighbor hits, neither function-field:
"Frobenius" occurs only as **blueprint prose** in PNT+'s Chebotarev sketch
(`Wiener.lean:4076–4141`, "Orthogonality for Frobenius classes" — LaTeX, no declarations,
number-field side; it is the upstream stretch-goal text, §0 above); `ZMod q` occurs only as
Dirichlet residue-class AP machinery (`Wiener.lean:3835, 3877–3878`,
`Consequences.lean:2533` — primes in AP over ℚ, not varieties over 𝔽_q).

**(b) s-plane (q^{-s}) formulation of a function-field zeta, anywhere in the six: ABSENT.**
The only `zetaSeries` declaration in the corpus is Weil's, and it is **t-form**:
`pointCountLogSeries = ∑ₙ (pointCountOfDegree f n)/n · tⁿ ∈ ℚ⟦t⟧` and
`zetaSeries = exp (pointCountLogSeries)` (`Weil/Definitions.lean:78–88`) — `PowerSeries ℚ`,
no complex variable, no `cpow`. Every `^ (-s)` cpow in the six repos is number-field: DZZF's
ideal-norm Dirichlet series `(Ideal.absNorm I : ℂ) ^ (-s)` (e.g.
`DedekindZetaZeroFree/HeckeCorollary.lean:18`, `Theta/Unfolding/NarrowRayParityProjection.lean:78,86,107,112,116`)
— the q^{-s} shape `card * (… : ℂ) ^ (-` has **0 hits** across all six trees. Positive
control: `riemannZeta` (the s-plane object) appears in 66 files across
ZetaZeros/ZetaZerosV2/PrimeNumberTheoremAnd — the s-plane world is substantial and purely
number-field. **Nearest approach points for a future bridge** (A2's map, corroborated here):
Weil's t-form `zetaSeries` + its LeanEval point-count identity
(`Weil/LeanEval/WeilConjectures.lean:112 pointCountOfDegree_eq_sum_of_zetaSeries_mul_eq`),
PNT+'s aspirational Chebotarev prose (`Wiener.lean:4076+`), and DZZF's `absNorm^(-s)`
Dirichlet-series template (`IdealNormSeries.lean:130 hasSum_idealInverseNormPower`) — the
s-plane shape an 𝔽_q[t] bridge would need to instantiate with a card-type norm.
