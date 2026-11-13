# Pre-work spec — iteration-4 slot 1: the LP-duality layer + first consumer [PROPOSAL]

**[CHARTER-PENDING — this file pre-works A1's PROPOSAL (`feasibility/ITERATION4-CHARTER-
DRAFT.md` slot 1) and the iteration-4 charter decision; it presumes nothing. Everything
here is PROPOSAL-grade until the orchestrator charters iteration 4.]**

Lane A2, 2026-11-14 (execution prework, no Lean runs — this document only). Spec sources,
in precedence order: `research/feasibility/lp-duality-bridge.md` (A1, 2026-11-14 — the
authoritative statement forms, absence evidence, and consumer-mapping table; §2.1 below
is VERBATIM from its §3), `research/feasibility/ITERATION4-SEED-DOSSIERS.md` seed 2,
`research/novelty/iter4-seed-triage.md` row 9 (**NEW-LEAN — LEAN-ECOSYSTEM SCOPE
ONLY**, infrastructure theorem, two-consumer; "fastest de-risk — do it FIRST regardless
of which discovery-grade seeds win slots"; seed-9 evidence block RUN 2026-11-14, verdict
**AFP-HAS-LP_DUALITY** — the phrasing rule of §7 R1 is applied throughout this file),
`research/candidates/02-ez5-bandwidth-k-ceiling-laws.md` §Re-scope item 1
(consumer 1), `research/candidates/74-surprisal-moment-hierarchy-ceilings.md` §T3
(consumer 2, optional). Execution discipline mirrors `research/pilots/71-prework.md` /
`73-prework.md` (P0 → P1 → P2; probe-convention stubs; inline full-coverage axiom
audits; Modal-only; logs with provenance headers).

**Verdict up front: GO at Tier "mathlib-only", zero import gates, zero donor builds.**
The layer is ordered-field algebra over stable `Finset` API (§3); both consumers' donor
statements (zeta23 `EnclOK` enclosures, openai `moment`/`MarginalTails`) enter as
hypothesis binders or not at all. No Stacks, no donor library, no analysis beyond
`Finset` calculus and ordered-ring reasoning.

---

## §1 The pilot in one page

**Deliverable 1 (the layer, S):** `lp_weak_duality` in Lean on our pin — the asymmetric
standard form (free primal `x`, dual equality constraint, nonnegative multipliers `y`),
which covers BOTH consumers verbatim because both have sign-free primal variables
(bridge §3), plus the symmetric-form corollary (reserve). **No Lean LP-duality exists
anywhere**: mathlib's OWN declared TODO (`Analysis/Convex/Cone/Basic.lean:31–37`:
"Define primal and dual cone programs and prove weak duality", "Define linear programs
and prove LP duality as a special case of cone duality"; verified by A1 tree-grep +
direct read, bridge §2; path-verified on our pin by A5 seed-9), no other Lean corpus
hit, no Lean preprint 2024–26 (A5 arXiv sweep). The theorem CLASS itself is formalized
OUTSIDE Lean (Isabelle/AFP trio; Coq 2017) — §3 evidence, §7 R1 phrasing rule.
Neither consumer needs Farkas, strong duality, or any algorithm.

**Deliverable 2 (the first consumer, M):** the **02-core consumer clause** in the
LP-native, grid-quantized form: *every dual-feasible combination of data rows bounds
every valid certificate's value* (dossier-02 §Re-scope item 1's `B_k(N,τ) ≤ LP-dual
value`, stated pointwise so NO `sSup` machinery is needed — §2.3). This is the pair-mass
B₂ ceiling LP's weak-duality half; the `=`/vertex-enumeration half and 02's Theorems
A/B/C are explicitly OUT (§5 stop gates).

**Optional second consumer (74-T3, behind the charter gate):** statement-port-only in
LP-P0; execute only if the charter names it (bridge §4 maps it to the same layer lemma
with the `u ≠ 1` side condition carried in the STATEMENT, never implicit).

**Why first (A5 row 9, verbatim intent):** one Lean layer unlocks dossier 02 core +
74-T3 across cycles; it is the fastest de-risk in the seed inventory regardless of which
discovery-grade seeds win slots. The layer's mathematical depth is trivia — the NOVELTY
LIVES IN THE CONSUMERS' DICTIONARIES and in the layer's **LEAN-ecosystem absence**
(mathlib TODO on our pin + no corpus hit + no Lean preprint 2024–26). Novelty scope is
phrasing-bounded [A5 seed-9, RESOLVED 2026-11-14: AFP-HAS-LP_DUALITY]: the theorem
class is owned by Isabelle (AFP trio, maintained through Isabelle2026) and formalized
in Coq (2017) — claim wording per §7 R1 only, never theorem-class priority.

**Effort:** layer ≈ 0.1–0.2k LoC (S; empirical anchor pilot-22-M1 68 LoC); consumer ≈
0.2–0.5k LoC (M; structures + validity + barycenter glue + the layer application);
total slot ≈ 0.35–0.75k LoC — comfortably inside the pilot-71/73 envelope.

## §2 Exact statement specs

### 2.1 The layer — asymmetric standard form [VERBATIM from bridge §3; A1's spec]

```lean
theorem lp_weak_duality {m n : Type*} [Fintype m] [Fintype n] {R : Type*}
    [LinearOrderedRing R] (A : m → n → R) (b : m → R) (c : n → R)
    (x : n → R) (y : m → R)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)            -- primal feasible (x FREE)
    (hy : ∀ i, 0 ≤ y i)                            -- dual multipliers nonneg
    (hATy : ∀ j, ∑ i, y i * A i j = c j) :         -- dual equality feasibility
    ∑ j, c j * x j ≤ ∑ i, b i * y i
```

Design notes (A1's, carried): plain function types `m → n → R`, NOT `Matrix` (the
portable form; a `Matrix`-typed variant is cosmetic and deferred); `LinearOrderedRing`
suffices (weak duality is ring-level — no division anywhere); the asymmetric form is
what both consumers consume (sign-free primals); the textbook symmetric form is a
corollary (§2.2). All sums are unqualified `∑ i, … i …` over the `Fintype` index.

### 2.2 The symmetric-form corollary (reserve; ~15 LoC rider on the layer)

```lean
theorem lp_weak_duality_symm {m n : Type*} [Fintype m] [Fintype n] {R : Type*}
    [LinearOrderedRing R] (A : m → n → R) (b : m → R) (c : n → R)
    (x : n → R) (y : m → R)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)
    (hx : ∀ j, 0 ≤ x j) (hy : ∀ i, 0 ≤ y i)
    (hATy : ∀ j, c j ≤ ∑ i, y i * A i j) :
    ∑ j, c j * x j ≤ ∑ i, b i * y i
```

Proof shape: apply `lp_weak_duality` with `c' := fun j => ∑ i, y i * A i j` (its
`hATy'` is `fun j => rfl`), then `Finset.sum_le_sum` of `mul_le_mul_of_nonneg_right
(hATy j) (hx j)` pointwise. Kept in the pilot as the reserve interface for any future
nonneg-variable consumer (bridge §4 row 3); NOT needed by 02-core or 74-T3 as specced.

### 2.3 The 02-core consumer clause (LP-native, grid-quantized; PROPOSAL shape)

Dossier-02's certificate class is infinite-dimensional (`r_i ∈ C¹[0,1]`), but validity
and value depend only on GRID quantities (dossier 02 Theorem E's own quantization
program: "certificates represented by their `N(+1)` grid values, the only values
validity and `∫r·x dx`-type functionals depend on up to the stability error"). The
consumer clause is therefore stated directly in the finite, LP-native vocabulary — the
C¹→grid reduction (02 Theorems A/B/C) is NOT slot-1 work:

```lean
/-- Grid index (read `G = Fin (N+1)`, `j/N` gridpoints; kept abstract for the statement). -/
variable (G D : Type*) [Fintype G] [Fintype D]

/-- One k = 2 datum: one-point row `s`, two-point diagonal row `s₂`, simple fraction `p₁`
(dossier 02 §Precise; rows of a configuration in the near-CUE enclosure family — the
enclosure itself enters the 02-core only as the `EnclOK`-style binder, NOT here). -/
structure BWDatum (G : Type*) [Fintype G] where
  s : G → ℝ
  s₂ : G → ℝ
  p₁ : ℝ

/-- The grid-quantized bandwidth-2 certificate: constant + grid values of `r₁, r₂`. -/
structure BWCert (G : Type*) [Fintype G] where
  c₀ : ℝ
  r₁ : G → ℝ
  r₂ : G → ℝ

/-- Validity at a datum (dossier 02 §Precise, verbatim shape). -/
def BWCert.valid {G : Type*} [Fintype G] (cert : BWCert G) (δ : BWDatum G) : Prop :=
  cert.c₀ + ∑ g, δ.s g * cert.r₁ g + ∑ g, δ.s₂ g * cert.r₂ g ≤ δ.p₁

/-- **02-core consumer clause.** Every dual-feasible combination of data rows bounds
every valid certificate's value — the weak-duality half of dossier-02 §Re-scope item 1
(`B_k(N,τ) ≤ LP-dual value`), pointwise in the certificate (no `sSup` machinery; the
`B_k`-sup packaging is an optional extension behind a stop gate, §5). `μ` is the model
(CUE) weight vector the value functional selects; the three barycenter equalities ARE
the dual equality constraint `Aᵀy = c` for this program. -/
theorem bw2_ceiling_of_dual {G D : Type*} [Fintype G] [Fintype D]
    (dat : D → BWDatum G) (μ : G → ℝ) (y : D → ℝ)
    (hy : ∀ δ, 0 ≤ y δ)
    (hsum : ∑ δ, y δ = 1)
    (hbary₁ : ∀ g, ∑ δ, y δ * (dat δ).s g = μ g)
    (hbary₂ : ∀ g, ∑ δ, y δ * (dat δ).s₂ g = μ g)
    (cert : BWCert G) (hvalid : ∀ δ, cert.valid (dat δ)) :
    cert.c₀ + ∑ g, μ g * cert.r₁ g + ∑ g, μ g * cert.r₂ g
      ≤ ∑ δ, y δ * (dat δ).p₁
```

Proof shape: `lp_weak_duality` with index types `m := D`, `n := Unit ⊕ G ⊕ G`
(coordinate `(tt) := c₀`-coefficient 1, `inl g := r₁(g)`, `inr g := r₂(g)`), objective
`c (tt) = 1`, `c (inl g) = μ g`, `c (inr g) = μ g`; row `A δ` assembles `δ.s`, `δ.s₂`;
`hAx := hvalid` (definitionally the validity rows); `hATy` unfolds to exactly
`hsum/hbary₁/hbary₂` (the `Unit`-coordinate sum is `∑ δ, y δ * 1 = ∑ δ, y δ`); the
conclusion is the value functional ≤ `∑ δ, b δ * y δ`. ~30–60 LoC of `Sum`-index
plumbing (`Finset.sum_sum_elim`-family or a `Finset.sum` over `Unit` + two `G`-sums
recombined), zero new mathematics.

### 2.4 The 74-T3 second consumer (OPTIONAL; statement-port in LP-P0; execute only if
chartered)

Kept at the bridge's schematic level in LP-P0 (elaboration of the SHAPE only, sorry
stubs): rows = grid spectra `q ∈ 𝒢_N`; `b i = F(q_i)` computed through the `moment`
identification with **`u ≠ 1` carried explicitly in the statement** (A5's row-74 glue
note: at `u = 1` `Real.rpow`'s `0^0 = 1` counts zero atoms, `moment p 1 = card ι` ≠ the
filtered support sum); `x = (c₀, a : Fin k → ℝ)` sign-free; objective selects `c₀`.
The layer supplies ONLY the `≤` clause; vertex enumeration / the `=` claims / N > 8 are
NEVER slot-1 (bridge §4, §6.4). Full statement at charter time if 74-T3 is named.

## §3 Proof sketch + substrate inventory (all [VERIFIED] on the encore checkout @
`ff2494ea`, 2026-11-14)

**The layer proof (termwise, bridge §3's sketch made concrete):**

```lean
theorem lp_weak_duality … := by
  have h1 : ∑ j, c j * x j = ∑ j, (∑ i, y i * A i j) * x j := by
    exact Finset.sum_congr rfl fun j _ => by rw [hATy j]
  have h2 : ∀ j, (∑ i, y i * A i j) * x j = ∑ i, y i * (A i j * x j) := fun j =>
    by simp only [Finset.mul_sum, mul_assoc]
  -- reindex (Finset.sum_comm), then per-row mul_le_mul_of_nonneg_left (hAx i) (hy i)
  -- under Finset.sum_le_sum, then mul_comm the RHS
```

- `∑ c_j x_j = ∑_j (∑_i y_i A_ij) x_j` — `Finset.sum_congr` + `hATy` (row substitution).
- `= ∑_i y_i (∑_j A_ij x_j)` — `Finset.mul_sum` (`Mathlib/Algebra/BigOperators/Group/
  Finset/Basic.lean`, to_additive twin of `prod_mul_sum`; corpus-wide usage) +
  `Finset.sum_comm` (same file, twin of `prod_comm`) + `mul_assoc`.
- `≤ ∑_i y_i b_i` — pointwise `mul_le_mul_of_nonneg_left (hAx i) (hy i)`
  (`Mathlib/Algebra/Order/GroupWithZero/Defs.lean:225`; also gcongr-registered) under
  `Finset.sum_le_sum` (to_additive twin of `Finset.prod_le_prod`,
  `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean` ~:121–126, gcongr).
- RHS shape `∑ b_i y_i` — `mul_comm` + `Finset.sum_congr` (or `Finset.sum_comm`-free
  `simp [mul_comm]` with care).

**mathlib-only import set for LP-P0 to verify** (all standard; expected reachable from
one or two imports): `Mathlib.Algebra.Order.BigOperators.Group.Finset` (sum_le_sum,
gcongr), `Mathlib.Algebra.BigOperators.Group.Finset.Basic` (mul_sum/sum_mul/sum_comm —
likely transitive), `Mathlib.Data.Fintype.Basic` (`Finset.univ`). The consumer adds:
`Mathlib.Data.Sum.Basic` (`Sum` coordinate index), `Mathlib.Data.Fintype.Sum`
(`Fintype (Sum m n)`) and the `Unit`/`Finset.sum` glue. NOTHING else — no analysis, no
convexity files (the separation-hyperplane route of dossier-02's original wording is
NOT needed for weak duality; it is the `=`/strong half's machinery and stays out).

**Formal prior art + Lean-side absence [A5 seed-9 check, RUN 2026-11-14, verdict
AFP-HAS-LP_DUALITY — RESOLVES the bridge §2 [NOVELTY-CHECK-NEEDED] mark]:** LP duality
(weak AND strong) is formalized in Isabelle/AFP — `Farkas` (Bottesch–Haslbeck–Thiemann
2019, maintained through 2026-10-26), `Linear_Programming` (Parsert–Kaliszyk 2019;
algorithmic, soundness via its own weak duality), `LP_Duality` (Thiemann 2022, published
2022-02-03, weak+strong via Farkas, maintained through Isabelle2026) — and in Coq
(Allamigeon–Katz arXiv:1706.10269, 2017; the CoqPolyhedra line: simplex → Farkas →
duality). The 2024–26 arXiv sweep has exactly one proof-assistant LP-duality hit
(Parsert 2403.19639, Isabelle/HOL). It is absent from mathlib — explicit TODO at
`Analysis/Convex/Cone/Basic.lean:37`, path-verified on our pin `ff2494ea` (tree-grep
clean of any LP duality/Farkas/LP-simplex; all `*Simplex*` hits algebraic-topology/
affine) — and from the whole Lean ecosystem (Yamashita 2026-06 is an algorithmic HSD
interior-point variant, not a reusable weak-duality lemma; no Lean preprint 2024–26).
**Our claim, phrasing-bounded (§7 R1):** the first mathlib/Lean-native duality layer
and the first application of formal LP weak duality to zero-proportion/entropic
certificate programs (02's ceiling programs; 74-T3's surprisal LPs).

**Substrate pitfalls, pre-recorded from this session's 71/73 experience** (so LP-P0/P1
don't rediscover them): `to_additive`-generated names (`sum_comm`, `mul_sum`,
`sum_le_sum`) resolve fine but grep-miss in the source tree (they appear only as their
`prod_*` twins — cite the twins' files); dot-notation through def-unfolding is fragile
(`(h x).foo` on `Differentiable`-class Props) — apply lemmas by full name; `Finset.sum`
over `Unit ⊕ G ⊕ G` decomposes via `Finset.sum_sum_elim` or `Fintype.sum_unit`-adjacent
lemmas — LP-P0 pins the exact spelling.

## §4 Runner, substrate, custody [PROPOSAL]

- **Pilot directory** `research/pilots/lp/` (new; lane-owned at charter). Runner: clone
  `research/pilots/73/run_pilot.sh` + `run_pilot.py` → app **`crossmath-pilot-lp`**,
  stage `/tmp/crossmath-lp-stage`, same image recipe (elan v4.2.4, toolchain
  `v4.36.0-rc2`, mathlib clone at `ff2494ea` + `lake exe cache get` — warm ≈ 68 s–2.5
  min per run, layers shared with the probe/axbump/71/73 apps). Probe-convention check
  stays `rel.startswith("P0")` — the probe file is named `P0.lean` (71/73 pattern).
- **elan image mirror (orchestrator instruction, 2026-11-14):** use
  `https://github.com/leanprover/elan/releases/download/v4.2.4/elan-x86_64-unknown-linux-gnu.tar.gz`
  — PROVEN working in pilots 71/73 this session (13/13 runs). The
  `leanprover-community/elan` URL is DEAD; do not let runner clones regress to it
  (the 71/73 `run_pilot.py`s pin the working URL verbatim — diff-check on clone).
- **Files**: `P0.lean` (probe, "not a proof artifact" header, sorry stubs allowed),
  `L1.lean` (the layer + symmetric corollary; proof artifact, no sorry), `L2.lean`
  (the 02-core consumer; proof artifact, no sorry). **`L2` imports `L1`** (the layer is
  the shared artifact — the pilot-11 `P11T1/T2` sibling-import pattern, NOT the
  pilot-01 duplication convention; `run_pilot.py` elaborates in sorted order
  `P0 < L1 < L2`, and `lake env lean` resolves the same-directory import). Note for
  A1's sweep machinery: the make_axcheck sibling-import rewrite rule (currently the
  `P11T[12] → AxP11T[12]` regex, `feasibility/probe/make_axcheck.py:78`) needs the
  `L1 → AxL1` case added at TARGETS time.
- Modal-only, `MODAL_USER=doz`, `/home/doz/dozenv/bin/modal`; NEVER local lake/lean.
  Logs → `research/pilots/lp/logs/` with provenance headers (date, file+LoC, exact
  command, verdict, Modal run URL); /tmp transcripts are ephemeral. Artifact-cache
  transient failures: retry once or twice before reporting blocked.
- Axiom audits: inline `#print axioms` block per proof-artifact file covering EVERY
  top-level theorem (the 71/73 full-coverage convention; the modal log is the
  evidence, TARGETS rows at sweep time).

## §5 Milestone sequencing + guards (the P0 → P1 → P2 discipline)

- **LP-P0 (S; one warm run; guard ≤ 0.15k LoC):** statement probe — layer signature
  (§2.1) + symmetric corollary (§2.2) + the FULL §2.3 consumer cluster
  (structures/defs/statement) + the §2.4 74-T3 shape (sorry stubs, probe-convention
  header). Elaboration against the §3 import set. Doubles as the substrate preflight
  (`to_additive` names, `Sum`-index sum glue).
- **LP-P1 (S; ≈ 0.1–0.2k LoC; guard ≤ 0.25k):** the layer + symmetric corollary proved
  kernel-clean in `L1.lean` (no sorry), inline full-coverage axcheck. **GO/NO-GO:** if
  the layer proof needs anything beyond §3's inventory (i.e., convexity/separation
  files, `Matrix` machinery, or > guard), STOP — that contradicts the bridge's S-grade
  and the charter premise; diagnose-note + report before proceeding.
- **LP-P2 (M; ≈ 0.2–0.5k LoC; guard ≤ 0.7k):** the 02-core consumer clause GREEN in
  `L2.lean` (structures + validity + barycenter glue + the layer application), inline
  full-coverage axcheck. Optional 74-T3 execution ONLY if the charter names it (own
  guard ≤ 0.6k additional; else statement-port remains in `P0.lean` only).
- **Stop gates (hard, per bridge §4/§6):** (i) the `B_k`-`sSup` packaging of §2.3 —
  optional 1-corollary extension, never required for GREEN; (ii) 74-T3's `=`
  direction / vertex enumeration / N > 8 — never; (iii) 02 Theorems A/B/C (stability,
  near-CUE propagation, the C¹→grid reduction) — separate dossier work, not slot-1;
  (iv) Farkas / strong duality / separation-hyperplane machinery — not needed for the
  `≤` direction; if a proof attempt reaches for them, that is a design error, stop.
- **Overrun rule (session convention):** any guard breach without GREEN ⇒ stop, write
  a diagnose note in the log dir, report back.

## §6 Consumer-mapping table (carried from bridge §4; the layer lemma → consumer clause)

| Layer artifact | discharges | consumer clause | adaptor needed on the consumer side |
|---|---|---|---|
| `lp_weak_duality` (≤ direction) | 02 §Re-scope item 1 | `B_k(N,τ) ≤ LP-dual value` — as §2.3's pointwise form | grid-quantize `(c₀, r₁, r₂)` to finite dim (done IN the §2.3 statement); assemble `A, b, c` from datum rows (`Unit ⊕ G ⊕ G`); dual feasible `y` = the nonneg combination the certificate analysis supplies |
| `lp_weak_duality` (≤ direction) | 74 T3 | `B_k(F) ≤ dual value` on `𝒢_N`, `u ≠ 1` in-statement | rows = grid spectra; `b i = F(q_i)` through the `moment` identification; `x = (c₀, a)`; objective selects `c₀` |
| symmetric-form corollary (§2.2) | (reserve) | any future nonneg-variable consumer | — |
| — (NOT the layer) | 74 T2 | `B_k ≤ B_{k+1}` — pure injection, no LP | — |
| — (NOT the layer) | 74 T1 | Cantelli floor / MGF ceiling / `hMGF` binder — analysis | — |
| — (NOT the layer) | 02 Theorems A/B/C | stability / near-CUE propagation / ceiling law | — |

## §7 Risk register

- **R1 — formal prior art [RESOLVED 2026-11-14, A5 seed-9: AFP-HAS-LP_DUALITY]** (supersedes
  the bridge §2/§6.1 open-risk framing): the theorem class is OWNED by Isabelle — AFP
  `LP_Duality` (Thiemann 2022, weak AND strong via Farkas, maintained through
  2026-10-26/Isabelle2026), AFP `Linear_Programming` (Parsert–Kaliszyk 2019), AFP `Farkas`
  (Bottesch–Haslbeck–Thiemann 2019) — and formalized in Coq (Allamigeon–Katz
  arXiv:1706.10269, 2017). **PHRASING RULE (verbatim obligation,
  `novelty/iter4-seed-triage.md` seed-9 evidence block):** NEVER "LP duality
  unclaimed/unformalized/first formal"; claim ONLY "first mathlib/Lean-native duality
  layer + first application of formal LP weak duality to zero-proportion/entropic
  certificate programs (02's ceilings, 74-T3's surprisal LPs)". The AFP trio + Coq 2017
  are MANDATORY nearest-miss citations in this prework's and any dossier's novelty
  section (§3 carries them). Residual open risk: the mathlib-PR clock only (R2).
- **R2 — mathlib-Cone clock** (bridge §6.2): the `Cone/Basic.lean` TODO invites exactly
  this contribution upstream; if mathlib lands LP duality first, the layer drops to
  transcription — charter fast, and date the artifact against the clock at write-up.
- **R3 — math-triviality discipline** (bridge §6.3): the layer alone is never a
  headline; the slot bundles the 02-core consumer. Article phrasing: infrastructure
  theorem + consumer dictionary, mirroring how 71/73 prework framed glue-grade claims —
  and every novelty sentence passes R1's phrasing rule (the claim is the Lean-native
  layer + the two consumer APPLICATIONS, never theorem-class priority).
- **R4 — 74-T3 [HYPOTHESIS] fence** (bridge §6.4): the layer only ever supplies T3's
  `≤` half; the `=` claims ride vertex enumeration (N ≤ 8) and are excluded; the
  `u ≠ 1` side condition is STATEMENT-level (never an implicit convention).
- **R5 — substrate friction (this session's 71/73 lessons, pre-loaded):**
  `to_additive`-twin name resolution; `Sum`-index `Finset` glue spelling; dot-notation
  fragility through def-unfolding — all logged for LP-P0 to clear in one warm run.
- **R6 — scope creep (banned list per §5 stop gates):** strong duality, Farkas,
  separation machinery, `sSup`-packaging (optional extension only), 74-T3 `=`,
  02 A/B/C, any `Matrix`-typed restatement.
- **R7 — novelty wording carry-over:** dossier 02's re-scope already killed "first
  formal barrier theory" (Knausgård `Ceilings/` owns the ladder framing); the consumer
  claims must respect that (02 §Re-scope verbatim: Knausgård is a DONOR and Python
  `law_lp.py` a motivation-only precedent).

## §8 Sources (this session)

Bridge/spec: `research/feasibility/lp-duality-bridge.md` §0–§6 (A1, 2026-11-14 — §2.1
verbatim); `research/feasibility/ITERATION4-SEED-DOSSIERS.md` seed 2;
`research/feasibility/ITERATION4-CHARTER-DRAFT.md` (a)(d) slot 1 [PROPOSAL];
`research/novelty/iter4-seed-triage.md` row 9 (+ "Fastest de-risk" line) AND its
seed-9 evidence block (RUN 2026-11-14: verdict AFP-HAS-LP_DUALITY; AFP `LP_Duality`
Thiemann 2022 maintained 2026-10-26, `Linear_Programming` Parsert–Kaliszyk 2019,
`Farkas` 2019, Coq Allamigeon–Katz arXiv:1706.10269; exact re-wording obligations —
applied to this file's §1/§3/§7 R1 the same day, per the orchestrator relay). Consumers:
`research/candidates/02-ez5-bandwidth-k-ceiling-laws.md` §Precise (certificate/datum/
`B_k` shapes, Theorem E sketch) + §Re-scope item 1–3 (deliverable, Knausgård framing);
`research/candidates/74-surprisal-moment-hierarchy-ceilings.md` §Setting (`moment`
identification, `u ≠ 1` caveat), T2/T3, §Feasibility (+M note). Substrate (encore
checkout @ `ff2494ea`): `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean`
(`prod_le_prod`/`sum_le_sum` ~:121–126, gcongr), `Mathlib/Algebra/Order/GroupWithZero/
Defs.lean:225` (`mul_le_mul_of_nonneg_left`), `Mathlib/Algebra/BigOperators/Group/
Finset/Basic.lean` (`prod_comm`/`prod_mul_sum` twins = `sum_comm`/`mul_sum`),
`Mathlib/Analysis/Convex/Cone/Basic.lean:31–37` (the TODO; bridge-verified). Execution
conventions: `research/pilots/71-prework.md`, `research/pilots/73-prework.md`,
`research/pilots/73/run_pilot.{sh,py}`, `research/pilots/71/logs/p2-run6.log` +
`research/pilots/73/logs/run6-c-green.log` (inline full-coverage axcheck pattern;
elan URL proven working), AGENTS.md (Modal substrate, probe convention, log custody).

— end prework (A2; PROPOSAL — chartering and slot ordering are the orchestrator's;
this file owns the execution spec only).
