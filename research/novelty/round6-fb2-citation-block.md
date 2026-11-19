# Round-6 — FB-2 citation block PRE-DRAFT (R9, unit 6)

**PRE-DRAFT / NOT-A-CHARTER — no execution implied.** Lane R9 (worktree agent-09),
2026-11-19, per the filler re-task ("IF a mid-wave ruling executes FB-2
(spend-only-if-executed), its charter is citation-complete same-hour"). This file holds
the citation block an FB-2 charter would carry at fire-time — assembled from
source-verified facts only (every name/file/id below read at source this session or
carried from registered evidence with its citation). It does not charter, schedule, or
re-rank anything; FB-2 remains **iteration-5-QUEUE behind the L-grade ruling**
(`RESEARCH.md` §ignition block; R6's deciding rg: zero PNT-AP statements in the OAI tree,
the DirichletL endgame stops at the two zero-free theorems).

---

## §1 The target (verbatim, formalization-of-recent class)

**PNT-AP at x^{7/8+δ} = QRH paper2, Corollary 1.2 VERBATIM** — source
`openai-math/preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/paper2.pdf` (OpenAI,
Oct 5 2026), [V per R6 §3-FB-2 (`qa/iter4-review/r2-discovery-strength.md` seed FB-2 row)].
Paper context: paper2 Theorem 1.1 = zero-free Re s > 11/12 for every finite-order Hecke L
over K = ℚ(√−3), hence every Dirichlet L including ζ (the paper's own p.2: "a natural
intermediate step toward the stronger zero-free region Re s > 7/8 established in [36]" —
[36] = the OAI 7/8 paper). S1 verdict carried: FORMALIZATION-OF-RECENT (the corollary is
the paper's; the explicit formula is formalization cost, not new mathematics); FB-2 never
bills discovery.

## §2 Upstream Tier-1 substrate (the 2026-11-19 upgrade — weak PNT-AP now on mathlib master)

`Mathlib/NumberTheory/LSeries/WeakPNT.lean` (master via PR #43238, bors-merged
2026-11-11; **ABSENT at our pin ff2494ea** — pin ruling 2026-11-19: pin STAYS; a bump
would invalidate every warm cache + donor build; **WeakPNT = external-math citation
class, PNT+ DEFER-watchlist convention** — cite, never import, at the current pin).
Exact headline decls (gh raw read 2026-11-19), all deduced from
`WienerIkehara.tendsto_sum_div`:

- `ArithmeticFunction.vonMangoldt.tendsto_sum_residueClass_div_atTop` — PNT-AP, von
  Mangoldt form, residue-class stated (WeakPNT.lean:62)
- `ArithmeticFunction.vonMangoldt.tendsto_sum_modEq_div_atTop` — PNT-AP, von Mangoldt
  form, modEq stated (:71–74)
- `Chebyshev.isEquivalent_psi_id` — the ψ-form PNT, ψ x ~ x (Tier-1a's exact shape)
- `Nat.isEquivalent_primeCounting` — the π-form PNT, π x ~ x / log x
- `Nat.isEquivalent_card_prime_modEq` — **the π-form PNT-AP** — the nearest upstream
  formal neighbor of FB-2's target (ASYMPTOTIC; FB-2's content is the ERROR TERM
  x^{7/8+δ} — no preemption, but this block must cite it and differentiate:
  asymptotic-vs-effective)

**On-pin note:** FB-2's declared landing surface
`Mathlib/NumberTheory/LSeries/PrimesInAP.lean` IS on our pin (pin LSeries census 2026-11-19,
`round6-clocks-iter5-s1.md` §mathlib row) — only WeakPNT sits beyond pin; the charter's
"landing on PrimesInAP" phrasing survives the ruling unchanged.

## §3 Our binder cites (registered, audit-verified)

- **G7b (PRIMARY zero-free binder — the 7/8 tree, in-corpus consumable):**
  `SevenEighths.ProbeFinalAssemblyUnconditional.dirichlet_nonzero` and `.zeta_nonzero`
  (`openai-math/lean/OAI/NumberTheory/DirichletL/Nonvanishing.lean:23/:31` — decls
  verified at source 2026-11-19); G7b audit PASSED at openai's own pin
  (`feasibility/axiommath-donor-probes.md` §G7b; runs 28+/32) — the stronger 7/8
  zero-free half-plane that DOMINATES paper2's 11/12 (the [36] relation), consumed as
  the zero-free binder per the ignition rule's own parenthetical.
- **G11 (SiegelZeros binder FALLBACK — no-Siegel-zero-class):**
  `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap`
  (`OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11–21`; full statement quoted
  in ProbeG11's header: ∃ c > 0, ∀ q ≥ 3, ∀ primitive real χ ≠ 1, ∀ β ∈ (0,1),
  χ.LFunction β = 0 → c ≤ (1−β)·log q); donor-pin axiom audit PASS (G11, 2026-11-17,
  `feasibility/probe/logs-g/run35-g11-fix.log:188/:198–206/:271–276` — headline + both
  delegation roots triad-clean); **statement-binder class RELEASED, build-dependency ban
  stands** (`novelty/oai-siegelzeros-piexponent-as-donor.md` §G11/G12 verdict). Delegation
  roots (convention-audit targets): `SiegelZerosAwei.W50.uniform_exclusion_of_local_
  isolated_bezout` (`Intersection/BezoutBoundary.lean:13`), `WeightedTorusJets.W22.
  localIsolatedBezout_of_actual_regular_selection`
  (`Intersection/IsolatedBezoutFromRegularSelection.lean:346`).
- **Informal-frontier cite (watch, not binder):** Liu B_new = 0.8749570… (arXiv:2610.12234
  v2; formalized externally [Liu26] = the liubaiying101 sibling) and the uniform informal
  frontier B♭ = 0.8748866… (Liu 2610.26835 v2) — Liu-1 convention: statement-level
  citation only, DO-NOT-CONSUME as build dep. The in-repo Liu B_new statement-port (R7,
  in flight) is the statement-binder artifact class.

## §4 The T2-ignition dependency (pre-registered, NOT fired)

Verbatim (`RESEARCH.md` §ignition block, iter-5): "**FB-2/PNT+ T2 ignition rule
(pre-registered; NOT fired this cycle):** IF an FB-2 PNT-AP pilot charters (the G7b-audited
7/8 tree as zero-free binder, error x^{7/8+δ}, landing on mathlib's
`NumberTheory/LSeries/PrimesInAP.lean`), THEN T2 FIRES and the PNT+ watchlist upgrades
DEFER → REGISTER-AND-PORT (upstream statement as binder; G9 preflight staged)."
Firing this charter therefore ALSO fires: (a) PNT+ REGISTER-AND-PORT (upstream StrongPNT
statement as binder at the donor pin — OAI's lake-manifest already declares
PrimeNumberTheoremAnd/StrongPNT + TauCeti as deps; G9 statement-port GREEN evidence:
`feasibility/probe/logs-g/run37-g9-fix.log:30`); (b) the G9 preflight staging.
Upstream state at sweep #1 (2026-11-19): PNT+ still v4.35.0 (T3 unfired).

## §5 Effort/eligibility guardrails (carried, so a fire-time ruling needs nothing else)

- FB-2 = **L-grade explicit-formula build** (R6 deciding rg; the charter's L-class
  budgeting applies); the [DECISION-1] contest is FB-2 vs FB-4 vs unspent, default
  UNSPENT (spend-only-if-executed).
- FB-2 never bills discovery (S1 fail by design — formalization-of-recent); the quota
  N=1 slot question rides the orchestrator ruling, not this block.
- Differential line vs upstream (§2): asymptotic (master) vs effective x^{7/8+δ} (FB-2) —
  the charter's novelty table cites WeakPNT as Tier-1 upstream holder + Cor 1.2 as the
  target + G7b/G11 as binders; no "first PNT-AP" phrasing anywhere (the weak PNT-AP
  exists upstream as an asymptotic).

— lane R9 (worktree agent-09), 2026-11-19. PRE-DRAFT ONLY; no charter, no scheduling, no
commits (rides the H batch with the round-6 family). Resume: 41-core gate standby.
