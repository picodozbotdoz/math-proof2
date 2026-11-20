# FB-2 PRE-CHARTER — PNT-AP explicit-L at x^{7/8+δ} (the quota contest's strongest contestant)

*Lane R9 (worktree agent-09), 2026-11-20. PRE-CHARTER — **charter-grade work only, NO
fires; this file INFORMS the N=1 quota contest, it never spends it** (the DECISION-1
discipline carries into Iteration 6: FB-2 vs FB-4 vs unspent, spend-only-if-executed,
never displacing a discovery lead). Class locked by the record: FORMALIZATION-OF-RECENT,
never a discovery headline (S1 fail BY DESIGN — R2's FB-2 row,
`qa/iter4-review/r2-discovery-strength.md` seed FB-2: "PNT-AP at x^{7/8+δ} = QRH paper2
Corollary 1.2 verbatim … FORMALIZATION-OF-RECENT"). Citation basis: this session's
direct-source re-verification + `novelty/round6-fb2-citation-block.md` (R9, 2026-11-19,
source-verified) + the registered probe records (G7b/G11/G9). Every claim carries its
citation; dates from records.*

## §0 The target (verbatim, extracted this session)

**QRH paper2, Corollary 1.2** — `openai-math/preprints/The-Quasi-Riemann-Hypothesis-
October-5-2026/paper2.pdf` (OpenAI, Oct 5 2026; pdftotext extraction this session,
pp.1–2):

> **Corollary 1.2.** Let π(x; q, a) count the primes p ≤ x with p ≡ a (mod q). Write φ
> for Euler's totient function. For x ≥ 2,
> sup_{1 ≤ q ≤ x^{1/2}, (a,q)=1} |π(x; q, a) − (1/φ(q)) ∫₂ˣ dt/log t| ≪ x^{11/12} log x,
> where the implied constant is absolute and effective.

Proved in-paper from Theorem 1.1 (zero-free Re s > 11/12 for every finite-order Hecke L
over K = ℚ(√−3), hence every Dirichlet L including ζ) "by a standard explicit-formula
argument (see [6, Chapters 19–20])" — [6] = the Iwaniec–Kowalski-class explicit-formula
chapters (the method citation). Paper2's own p.2 concedes the dominance relation: Thm 1.1
is "a natural intermediate step toward the stronger zero-free region Re s > 7/8
established in [36]" — [36] = the G7b-audited OAI 7/8 tree (§3).

**The FB-2 pilot = the Cor-1.2 statement FORM, instantiated at the STRONGER in-corpus
binder:** zero-free Re s > 7/8 (G7b) ⇒ the same sup-shaped effective PNT-AP with error
**x^{7/8+δ} for every δ > 0** (the explicit-formula margin above the zero-free
abscissa; the ignition rule's own "error x^{7/8+δ}" parenthetical). Both the 11/12
instantiation (paper2-faithful) and the 7/8 instantiation (binder-faithful) are
statement-tier options for the charter ruling; the 7/8 form is the registered design.

## §1 Statement surface (sketch; the statement tier prices at §4-i)

On the pin's `Mathlib/NumberTheory/LSeries/PrimesInAP.lean` substrate (the
`residueClass` machinery, §2-b): a Prop-valued, zero-sorry statement family of the shape

```lean
/-- Cor 1.2-form effective PNT-AP at the 7/8 binder (EnclOK: the zero-free
    hypothesis is the G7b donor statement as an explicit hypothesis binder). -/
theorem pntAP_effective_of_sevenEighths
    (hZF : ∀ χ : DirichletCharacter, χ.IsPrimitive →
      ∀ s : ℂ, 7 / 8 < s.re → χ.LFunction s ≠ 0)   -- the G7b binder (statement class)
    : ∀ᵉ δ > 0, ∃ C > 0, ∀ x ≥ 2,
      sup_{(q,a): 1 ≤ q ≤ x^(1:2), (a,q)=1}
        |π (x;q,a) - (∑ ...) / φ q| ≤ C * x ^ (7/8 + δ) * log x
```

with the explicit-formula remainder hypothesis-binderized at tier-0 (the ψ_χ-formula
remainder as an explicit hypothesis, discharged by the L-class body at the later
tranche — the precharter convention: statement tier never waits on the machinery).
The `sup` finiteness shape, the (a,q)=1 coprimality side-condition, and the
x^{1/2}-modulus range are the three nontrivial statement-tier obligations (each a
finite `Finset.sup` encoding at the qualitative tier).

## §2 Corpus state (direct-source, this session — R6's deciding rg RE-VERIFIED)

**(a) The OAI tree has ZERO PNT-AP statements** (re-verified by rg this session, not
memory): `rg -il "arithmetic progression"` over `openai-math/lean/OAI/` returns only
non-neighbor objects — `NumberTheory/Ostmann/ZeroDensity/ProgressionErrorRates.lean`
(a zero-density error-rate object, NOT a PNT-AP asymptotic),
`NumberTheory/JointDickman/Analysis/CharacterDistanceInput.lean`,
`Computability/QuantumFactoring/ProgressionEvaluation.lean`, plus Ising/Falconer
analysis noise; the ψ/π-asymptotic pattern greps return no Dirichlet-class hits. The
DirichletL endgame stops at the two zero-free theorems
(`OAI/NumberTheory/DirichletL/Nonvanishing.lean` — §3). R6's deciding-rg reading
stands: **FB-2 = L-grade explicit-formula build** (the whole effective error-term
layer is greenfield).

**(b) The landing target on our pin:** `Mathlib/NumberTheory/LSeries/PrimesInAP.lean`
(encore ff2494ea — IS on-pin, per the 2026-11-19 pin census) carries the QUALITATIVE
layer only: `residueClass` + its algebra (:91–:246: nonneg/le_vonMangoldt/apply_zero/
abscissaOfAbsConv/support/apply/eq), the LSeries/LFunction identifications
(:238/:266/:289/:304/:328), the lower bound + non-summability (:348/:379), and the
infinitude family — `infinite_setOfPred_prime_and_eq_mod` :431,
`forall_exists_prime_gt_and_eq_mod` :443, `forall_exists_prime_gt_and_zmodEq` :451,
`forall_exists_prime_gt_and_modEq` :463, `frequently_atTop_prime_and_modEq` :468.
**NO asymptotic PNT-AP statement exists on-pin.** (This session's declaration-list
read at source.)

**(c) One file beyond pin (master):** `Mathlib/NumberTheory/LSeries/WeakPNT.lean`
(PR #43238, bors-merged 2026-11-11) carries the WEAK PNT-AP forms —
`ArithmeticFunction.vonMangoldt.tendsto_sum_residueClass_div_atTop` (:62) /
`..._modEq_div_atTop` (:71–74), `Chebyshev.isEquivalent_psi_id`,
`Nat.isEquivalent_primeCounting`, **`Nat.isEquivalent_card_prime_modEq`** (the π-form
PNT-AP) — all deduced from `WienerIkehara.tendsto_sum_div`. Per the orchestrator pin
ruling (2026-11-19): pin STAYS `ff2494ea`; WeakPNT = **external-math citation class**
(cite, never import, at the current pin). **The differential line: asymptotic
(master) vs effective x^{7/8+δ} (FB-2) — the error-term class is NOT preempted; the
article's novelty table cites WeakPNT as the Tier-1 upstream holder and never phrases
any "first PNT-AP" claim.**

## §3 Donor-binder plan (registered, audit-verified; EnclOK consumption only)

- **PRIMARY — the G7b 7/8 tree** (`feasibility/axiommath-donor-probes.md` §G7b, PASS
  2026-11-14, runs 31/32: donor-pin axiom audit triad-clean):
  `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re` and
  `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`
  (`openai-math/lean/OAI/NumberTheory/DirichletL/Nonvanishing.lean:19/:29`, delegating
  to `SevenEighths.ProbeFinalAssemblyUnconditional.dirichlet_nonzero`/`.zeta_nonzero`
  at :23/:31) — the stronger zero-free half-plane that DOMINATES paper2's 11/12 (the
  [36] relation, §0). Statement-port ≈ 0 at our pin (port-probe C1 challenge form,
  elaboration-validated). Consumed as the `hZF`-style hypothesis binder — never
  imported (v4.34.1/d13f23b7 donor pin; the build-dependency ban stands).
- **FALLBACK — G11 SiegelZeros** (no-Siegel-zero class; PASS run35, 2026-11-17,
  `logs-g/run35-g11-fix.log`: headline + both delegation roots triad):
  `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap`
  (`OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11–21` — ∃ c > 0, ∀ q ≥ 3,
  ∀ primitive real χ ≠ 1, ∀ β ∈ (0,1), χ.LFunction β = 0 → c ≤ (1−β)·log q).
  Statement-binder class RELEASED; build-dependency ban unchanged.
- **Informal watch cites (never binders):** Liu B_new = 0.8749570… (arXiv:2610.12234;
  formalized externally, Liu-1 convention: statement-level citation only) and the
  uniform informal frontier B♭ (arXiv:2610.26835) — the location-axis race, distinct
  from FB-2's error-term axis.
- **Binder discipline (Cycle-2 gate):** donor statements enter ONLY as verbatim-marked
  hypothesis binders; a consumer-side `#print axioms` triad check fires at
  consumption time (the m4b precedent); no donor build, no cross-pin import.

## §4 Pricing (L-class per the charter's FB-2 row)

| tranche | content | LoC | runs | risk |
|---|---|---|---|---|
| i (statement tier) | the Cor-1.2-form statement family at the 7/8 binder + the three statement-tier obligations (sup encoding; coprimality; the x^{1/2} range) + the remainder-as-binder tier-0 form | 0.15–0.3k | 2–3 (warm `crossmath-probe`, doz CLI, SPEC cpu=2.0/4096, LEAN_NUM_THREADS=2, telemetry) | low — the residueClass substrate is on-pin and qualitative-only |
| ii (the explicit-formula body — the L-class cost center) | the ψ_χ explicit formula with zero-free summation → the effective error; the sup-uniformity layer; the π-from-ψ partial-summation transfer | 0.8–1.5k | 6–10 | **the honest unknown**: whether the effective-constant bookkeeping stays kernel-friendly at this pin — multi-tranche L with STOP-at-tranche + a re-price checkpoint after (i); if the explicit-formula remainder resists, the descope ladder fires (below) |
| iii (optional) | the 11/12 instantiation alongside the 7/8 one (paper2-faithful variant — one constant swap once (ii) lands) | +0.05k | +1 | trivial after (ii) |

Proposed cap at charter: **≤ 2k LoC / ≤ 13 runs** (tranches i+ii+iii), STOP-at-tranche
+ re-price after (i) and after (ii). Descope ladder (pre-negotiated): (1) (ii) stalls ⇒
ship the statement tier + the remainder-as-binder conditional (the theorem-shape
"effective PNT-AP conditional on the explicit-formula remainder" — honest
FORMALIZATION-FIRST partial, record-billed); (2) the sup-uniformity resists ⇒ the
fixed-(q,a) form first (drop the sup — a strictly weaker but complete statement);
(3) the π-transfer stalls ⇒ the vonMangoldt-form only (the WeakPNT-upstream-adjacent
ψ_χ form with the error term).

## §5 The T2-ignition consequence block (pre-registered; firing is a CONSEQUENCE of chartering)

Verbatim rule (`RESEARCH.md` §ignition, iter-5): "IF an FB-2 PNT-AP pilot charters
(the G7b-audited 7/8 tree as zero-free binder, error x^{7/8+δ}, landing on mathlib's
`NumberTheory/LSeries/PrimesInAP.lean`), THEN T2 FIRES and the PNT+ watchlist upgrades
DEFER → REGISTER-AND-PORT (upstream statement as binder; G9 preflight staged)."
Firing this charter therefore ALSO fires:

- **(a) PNT+ REGISTER-AND-PORT** — upstream StrongPNT (ψ = x + O(x·exp(−c√log x)),
  AlexKontorovich/PrimeNumberTheoremAnd @ `938912bb`) as a statement binder at the
  donor pin; OAI's lake-manifest already declares PrimeNumberTheoremAnd/StrongPNT +
  TauCeti as deps (the import-not-port posture recorded iter-4); G9 statement-port
  GREEN evidence on file (`feasibility/probe/logs-g/run37-g9-fix.log:30`).
- **(b) The G9 preflight staging** (the register-and-port probe family).
- **(c) Upstream state re-verification at charter time** — PNT+ was v4.35.0 at the
  2026-11-16 fetch (T3 unfired); re-fetch before the port (the T3 trigger:
  upstream reaching v4.36-class pins).

## §6 Nearest-miss rows (the formalization-first reading; ≥ 2 delivered)

| # | source | what it has | delta vs FB-2's effective PNT-AP |
|---|---|---|---|
| 1 | **mathlib master `WeakPNT.lean`** (PR #43238, 2026-11-11; the five decls §2-c) | the weak/asymptotic PNT-AP (π-form + vonMangoldt-form, modEq and residueClass stated) from WienerIkehara | NO error term — asymptotic-only; FB-2's content IS the effective class x^{7/8+δ}; one file beyond pin (external-citation class) |
| 2 | **QRH paper2 Cor 1.2** (the source, this file §0) | the informal statement (11/12 instantiation, absolute+effective constant, sup over q ≤ x^{1/2}) | unformalized; and its own 11/12 is dominated by the 7/8 binder FB-2 consumes — the pilot formalizes the FORM at the stronger in-corpus instantiation |
| 3 | **the OAI 7/8 tree** (G7b; Nonvanishing.lean:19/:29 → :23/:31) | the zero-free half-plane Re s > 7/8, proved, triad-audited at the donor pin | the BINDER — zero-free content only; no PNT-AP consumer exists in that tree (R6's rg, re-verified §2-a) |
| 4 | **G11 SiegelZeros** (Conclusions/Theorem.lean:11–21) | the uniform Landau–Siegel exclusion (∃c, no real zero β with (1−β)log q < c) | the FALLBACK binder class (the no-exceptional-zero route); no error-term content |
| 5 | **mathlib on-pin `PrimesInAP.lean`** (:431–:468) | Dirichlet's qualitative infinitude in AP | the landing surface itself — qualitative only, no asymptotics on-pin |
| 6 | **Iwaniec–Kowalski Ch 19–20 (paper2's [6])** | the classical explicit-formula method | the METHOD citation — the build's cost center is this machinery, formalization cost not new mathematics (S3's own fail reading) |
| 7 | **OAI `Ostmann/ZeroDensity/ProgressionErrorRates.lean`** (this session's nearest-neighbor check) | progression error rates in a zero-density context | checked-and-not-a-neighbor: a different statement class (zero-density error rates, not a PNT-AP asymptotic) — recorded so the nearest-miss table's negative is scoped |
| 8 | **Liu B_new / B♭ + the QuasiRiemannTracker** (arXiv:2610.12234 / 2610.26835; tracker θ = 0.873345856106…) | the informal zero-free FRONTIER race (location axis) | location-axis only — FB-2's axis is the ERROR TERM conditional on a fixed zero-free half-plane; no preemption either way |

## §7 The quota frame (this file informs, never spends)

- The N=1 knowledge-level slot: **FB-2 vs FB-4 vs unspent** (DECISION-1/3 discipline
  carried into Iteration 6 verbatim; the iter-5 disposition = UNSPENT, third
  consecutive unspent cycle — `r9-quota-disposition-draft.md` is the ruling input).
- FB-2's billing is locked: FORMALIZATION-FIRST kind at article time (if it ships);
  at most one knowledge-level article per cycle (the two-strike FINAL rule); never
  displaces a discovery lead; the S1 fail is by design and the article's novelty
  table leads with rows 1–2 (upstream asymptotic + the informal source), never a
  "first" claim.
- The charter ruling this file serves: [DECISION-Q] at the Iteration-6 charter —
  execute FB-2 (spend), execute FB-4 instead, or hold unspent (default).

— lane R9 (worktree agent-09), 2026-11-20. PRE-CHARTER; no fires, no commits (H
commits on main; REPORT ONLY). Companion records: `novelty/round6-fb2-citation-block.md`
(the fire-time citation block), `novelty/round6-clocks-iter5-s1.md` (the WeakPNT
landing + pin ruling), the census Tier-3 row #6 (`novelty/iter6-seed-census.md`).
