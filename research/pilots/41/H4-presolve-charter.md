# Pilot 41-H4 — the iter-7 CONSTRAINT-PROPAGATION PRE-SOLVE unit charter (the E2/F arms' gate instrument)

*Lane R4 (worktree agent-08), 2026-11-21. **CHARTER-GRADE ONLY, NO FIRES** — and
by design **zero Modal**: the unit is local-CPU machinery (the custody-archive
class). Authority chain: the landing ruling at `5c7fac7` ("E2/F/G bank to iter-7
w/ constraint-propagation pre-solve first") → `RESUME-BRIEF-ITER7.md`'s R4-class
row (this unit named as the prerequisite, verbatim) → R2's gate
`qa/iter4-review/r2-41h4-s1s4-gate.md` S4(iii) (R4's own NO-GO on blind E2/F
fires ENDORSED as a binding condition; this charter is that condition's
instrument) → the M-candidates lesson institutionalized (`H3-M-candidates.md` §3:
random search cannot see the combination tier — S2/S4). Basis bytes:
`H4.lean` `768c6f5d6e777d25` (E1 GREEN, 11/11 print-verified, landed `cc7ef3c`),
`H4-precharter.md` `b0eb56b94c3419c7`, the archived machinery
`pilots/41/presolve/` (the custody-settlement re-run of record), article-41H3
@ `ffec7498` (R2's sha note: cite this, not the older `cee50022`).*

## §0 Why this unit exists (the one-paragraph case)

E1 closed the d = 8 uniform-diagonal band in the kernel. What remains — E2
(the d = 8 structure-constant / semigroup tiers) and F (the d = 14
combination-word tier at the spin host) — is two-sided: a survivor is
dictionary DATA (the DISCOVERY route, quota-free per R2's reconciliation); a
bounded miss is a band-scoped CERTIFIED-NUMERIC negative. Both outcomes route
through the SAME gate: a mechanical, exhaustive-where-possible,
constraint-propagation pre-solve that runs BEFORE any kernel fire, so that an
iter-7 H4 resumption needs zero ramp and never burns a fire on a blind search.

## §1 Scope — the three search spaces, their bands, and their propagation designs

**(A) The semigroup tier (E2's `SemigroupEvaluationTable`) — FINITE-DOMAIN,
potentially EXHAUSTIVE.** Unknowns: κ : Block → Block → Block (64 cells over 8
values) + f : Block → ℤ. Constraints: (i) associativity
κ(a,κ(b,c)) = κ(κ(a,b),c) — 512 ternary constraints; (ii) the evaluation
equations f(κ p q) = M p q — 64 equations. **Reduction 1 (the fiber-class
split):** every entry of both certified tables is ±1, so the 64 cells partition
into P (M = +1; 36 cells at each fiber: 8 in the trivial row + 4 in each of
the 7 character rows) and N (M = −1; 28 cells); f takes ≤ 2 values, and κ must
map P-cells into F₊ := {v : f v = +1} and N-cells into F₋ — **cells with
different M-values must take different κ-values**. Enumerate the (F₊,F₋)
partitions (2⁸ − 2 = 254), then run domain consistency (AC-3-class) on the
associativity constraints over the two-valued-per-cell domains. **Honest
complexity note:** the nominal space is |F₊|³⁶·|F₋|²⁸ summed over partitions —
infeasible raw; the design bets on associativity's rigidity (the E1
experience: diagonal κ died by cancellation; the mixed case is expected to
prune to nothing under arc consistency + witness-tree enumeration of
survivors). If propagation alone stalls, the SAT-encoding option (§2b)
accelerates. **This tier's negative, if reached, is CLASS-CLOSED** ("no
semigroup-algebra evaluation table for either certified fiber" — a finite
exhaustion, no integer band qualifier) — the strongest negative shape in the
unit.

**(B) The d = 8 structure-constant tier (E2's `StructureConstantDictionary`) —
BOUNDED BANDS, honestly scoped.** Unknowns: N : 512 integers + f : 8
integers; constraints: 512·8 quadratic associativity identities + 64 linear
evaluation equations. Unbounded integers cannot be exhausted — the pre-solve
covers the **low-structure-constant bands** |N| ≤ B_N, |f| ≤ B_f with
(B_N,B_f) ∈ {(1,1),(1,2),(2,1),(2,2)} (band (1,1) first; stop-loss per §4).
Design: enumerate f (≤ 3⁸ = 6,561 vectors at B_f = 1; 5⁸ ≈ 390k at 2), then
per-f column-wise propagation on N (the linear equations fix the
f-weighted row sums Σ_r N(p,q,r)·f r = M p q; the associativity then
closes quadratically over the bounded lattice). **The negative is
BAND-SCOPED** — wording locked: "no d = 8 structure-constant dictionary with
|N| ≤ B_N, |f| ≤ B_f" — never "no d = 8 host" (R2's S4(ii) host-scoped-locked
class).

**(C) The d = 14 combination tier at the spin host (F's
`CombinationDictionary`) — the article's named open core.** Fixed data: T_spin,
the spin host's word-algebra structure constants, recomputed EXACTLY by the
archived machinery (`presolve/h3_presolve_archive.py` class: host generator
literals at both integer fibers → word-basis products → 14×14×14 integer
constants; dim-14 stays binder-or-cite, never claimed). Unknowns: W (8×14) +
f (14). **Design (the per-f reduction + sequential row-solve):** for each
bounded f (|f| ≤ B_f), compute the integer Gram matrix G_f[k,l] =
Σ_r T_spin k l r · f r; **necessary filter**: rank(G_f) ≥ 8 (exact integer
rank — kills degenerate f's cheaply); then sequential row elimination:
w₁ ranges the bounded lattice points on the quadric w₁ᵀG_f w₁ = M(1,1);
each subsequent w_p is constrained by LINEAR conditions
(w_iᵀ G_f w_p = M(i,p), w_pᵀ G_f w_i = M(p,i) for i < p — a lattice
intersection) + its own quadric M(p,p). Bands: |W| ≤ B_w ∈ {1,2}, |f| ≤
B_f ∈ {1,2}. **The sector-aligned variant runs FIRST** (S3's frame: f
supported per weight sector (1,4,6,4,1), W sector-aligned — the structured
ansatz, the lead; the archived S3 finding "no single sector suffices,
needs 4+6+4 alignment" is the pruning prior). The unstructured full-band
scan is the stop-loss-gated tail.

**Out of scope:** G's genericity L-rung (kernel work, separately granted if
ever); any tauceti import (statement-binder class only); any kernel fire
(all fires on E2/F need this unit's output first, then a fresh grant).

## §2 Method options priced

| option | design | class | verdict |
|---|---|---|---|
| (a) **exact-integer propagation + sequential elimination** (numpy-only, deterministic seed, planted controls; generator/checker split) | the custody-archive pattern verbatim (`presolve/` re-run of record: 782 s local, 4 cores, controls ~1e-13) | CERTIFIED-NUMERIC | **PRIMARY** — deterministic, re-runnable, zero new tooling |
| (b) SAT / CP-SAT encoding (esp. tier A's finite-domain κ-CSP) | finite-domain clauses; solver pinned in provenance | engineering accelerator | **PRICED ALTERNATIVE** — any solver-assisted NEGATIVE must be re-verified by the deterministic checker (option-a class) before it enters any record; UNSAT claims additionally re-verified by an independent encoding or bounded re-run |
| (c) MILP | weak fit (quadratic constraints need linearization) | — | NOT recommended |
| Modal | none by default; priced ONLY if a band exceeds ~2 h local — SPEC 2 cpu/4 GB + telemetry, fresh approval per the standing rules | — | deferred |

The kernel-only ground rule is respected structurally: whatever the engine,
the pre-solve's outputs are **CERTIFIED-NUMERIC class, never kernel** — the
41H §N3 / BANK-rule billing carried from the settlement precedent.

## §3 Interface — what the pre-solve's output certifies (the billing contract)

Output artifact (the custody-settlement shape): `pilots/41/presolve7/` (name
H's call) — persisted generator + INDEPENDENT checker + outputs (per-tier,
per-band, per-fiber counts; survivor lists; controls; run log) + README;
deterministic seed; every load-bearing number re-derivable. Controls: planted
dictionary solutions (synthetic (N,f) / (W,f) pairs) MUST be detected; far
tables (random ±1 tables) MUST be rejected — the archive's plant/far
discipline.

- **0 survivors in a tier/band → CERTIFIED-NUMERIC negative rows** feeding
  E2-negative billing: NEGATIVE-kind quota-free (the fourth-obstruction class
  per R2's S2), PROVIDED the class-reading condition holds (the negative must
  terminate/extend the d = 8 structure-constant tier — tier A's
  class-closed form is the strongest; tier B's negatives carry their band
  qualifiers verbatim; tier C's negative is spin-host-scoped per the
  no-injectivity caveat + band-scoped). Never in proved counts; never
  unscoped wording.
- **A survivor → the F/E2-positive certificate DATA**: exhibit (T_spin, W, f)
  (tier C) or (N, f) / (κ, f) (tier B/A) → a NEW kernel fire (≤3-run class,
  the E1 pattern) proves the `CombinationDictionary` /
  `StructureConstantDictionary` / `SemigroupEvaluationTable` instance +
  `dictionary_of_combination_data` pullback → the DISCOVERY route,
  **quota-free per R2's reconciliation** (improves the share; full S1–S4 at
  ship). The survivor list itself is certified data only — never a kernel
  claim.
- **Partial/exhausted-with-parks → the honest-park convention** (D7-class):
  per-band counts + the parked band's shrink plan; the record never claims
  more than was enumerated.

## §4 Fire plan, price, GO/NO-GO (the iter-7 slot ask)

- **Price:** ≈ 0.6–0.9k LoC Python (generator + checker + outputs + README);
  local CPU. Wall estimates (calibrated on the archive's 782 s / ~3×10⁸
  systems): tier C sector-aligned variants — minutes each; tier A
  propagation — minutes-to-hours (the 254-partition loop + AC); tier B band
  (1,1) — the f-enumeration dominates (6.5k f's × column propagation);
  tier C unstructured full bands and tier B band (2,2) — the stop-loss tail.
- **Stop-loss (pre-registered):** any single band exceeding ~4 h local wall
  parks that band with partial counts + the named shrink plan (finer f-side
  filtering, sector pre-split, or the SAT accelerator w/ its re-verification
  gate); no unbounded burn; the park is a first-class outcome.
- **Unit GO conditions:** (i) the orchestrator slots it in the iter-7
  day-1/day-2 window (the census DRAFT `422face2` does not currently carry
  the H4 line in its bench verdict — absorbing this unit's output as the
  R4-class resumption gate is the orchestrator's census call, recorded here
  as the open alignment question); (ii) zero Modal by default (any Modal
  exception is a fresh approval). **NO-GO:** none technical — the unit is
  fully specified by §1–§3; the only NO-GO shape is the orchestrator
  declining the iter-7 H4 resumption entirely (then this charter is the
  deferral record, and the E2/F arms stay banked with their statement surface
  of record in `H4.lean`).
- **Acceptance:** the settlement pattern — counts reconcile across
  generator/checker, controls reproduce, the re-run is deterministic, the
  README maps every number to its band; R2's S4 conditions (i)–(vi) bind any
  downstream billing.

— lane R4 (worktree agent-08), 2026-11-21. No fires; no Modal; no files
outside this worktree touched. H lands this file + its INDEX row on
acceptance.
