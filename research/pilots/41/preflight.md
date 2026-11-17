# Preflight — pilot 41 (q-deformed-eight-square-temperley-lieb)

Lane A2, 2026-11-17 (reading/spec work only, no Modal). Bench item of the Iteration-4
charter draft (`feasibility/ITERATION4-CHARTER-DRAFT.md` :50 — "Main-run cold
inventory — 41/12/… compete for slots"; bench row `qa/iter4-review/r5-iteration4-backlog.md`
:113). With FF-EZ2 in flight and the physlib probe done (G13), 41 is one of the two
last bench-listed items without a preflight. This file is the preflight.

## 1. What the item is

Dossier `candidates/41-q-deformed-eight-square-temperley-lieb.md` (R1, 2026-11-09;
R9 F4-graded same day). A one-parameter q-deformation of eth's Graves sign rule:
`sigmaQ q p q' := (−1)^(phiQ p q') · (−q)^(tau p q')` on eth's `Block = Bool × Bool × Bool`,
with the classical alternation (`Eight.signs`) as the q = 1 fiber (bridge axiom B,
definition-level verified via eth's `phi_parts … := rfl`). Deliverables in scope order:
**(M)** the four-term parallelogram identity with explicit defect
`… = (1 − q)·G_q` (G_q an explicit ℤ[q]-polynomial — geometric-sum shape
`Σ_{j≤2k}(−q)^j`), conditional only on two parity facts (P1)(P2) that are lifts of
eth's own proved mod-2 chain; **(N)** nondegeneracy — a `decide`-able finite check over
the 8⁴ = 4096 quadruples; **(B)** the q = 1 fiber recovers `Eight.signs`; **(H)** the
Temperley–Lieb/Jones host theorem over tauceti (`jones`, Markov/Hecke traces, 3-strand
finite search) — explicitly a SECOND-phase milestone with its own fallback (no-match ⇒
ship (M)+(N) with the Cayley–Dickson q = 1 anchor and (H) restated open).

**Locked re-scope** (R8 round-3 §2, `novelty/round-3.md` :50–70): headline =
"first *sign-rule/parallelogram-defect* deformation", NOT "first q-deformation of a
composition algebra" — Benkart–Pérez-Izquierdo 1998 (`arXiv:math/9801141`) owns the
q-composition object level. Novelty verdict per round-3: object level
NEW-CLAIM-CONTESTED; **(M)+(N) plausibly new; (H) NEW** (no octonion–TL connection in
any sweep). Final triage score **7.0** (N 3.5 × S 4 ÷ E 2, `TRIAGE.md` row 41) — the
TOP cold-inventory score.

## 2. Substrate class

**[WARM] statement-port class** for (M)+(N)+(B) — the corpus's measured-cheapest
category:
- eth side (the only donor the core needs): `Eight.signs` + the parity chain
  `four_phi → … → four_phi_odd` (`proof/networks/Eight/SecCrossing_Identity.lean:88–266`)
  + statement defs (`EightSquareStatement.lean:53`; `@[expose]` defs
  `SecCrossing_Identity.lean:126–133`). The file imports only core +
  `Mathlib.Data.Nat.ModEq` + tactics — R9 graded the port surface **tiny (S)**, same
  eth statement family whose probes ran clean (ProbeB2/B3, v4.33→v4.36 ≈ 0 cost).
- mathlib side: `MvPolynomial`/`Bool`/`Finset` decide infra — long-stable, unprobed
  per R9 with "churn risk negligible".
- **(H) second phase** is a different substrate: tauceti as a direct lake dependency
  (`KnotTheory/TemperleyLieb.lean`, `Hecke.lean`, `UqSl2`, `CayleyDickson`) —
  tauceti `lean-toolchain` = v4.36.0-rc2, IDENTICAL to our pin, so **zero port
  friction** (R9 F4 grade), but a dependency build, not a warm statement probe.
  Scope it only if (M)+(N) lands and a lane + slot exist.

## 3. Effort class (r5 sizing)

**S–M — twice confirmed** (R9 F4 grade + dossier F4): (M)+(N)+(B) ≈ 0.5–1k LoC
(definition ~50; parity-split ~200 — transcribing eth's chain with both parts
tracked; step-2 polynomial algebra ~100; (N) decide driver ~50; packaging ~100).
(H) adds +1–3k with the finite TL search — separate milestone, do not bundle.

## 4. Gates / batteries

**None live.** "Bench — no live gates" (backlog :68); the one hard precondition the
dossier carried (R8 round-2 novelty clearance) is **done** (round-3 §2 verdict above —
"R8-cleared, pilotable", SCAN §1b :30). No donor hygiene gate applies at core scope
(eth enters as statement-port scaffold, not imported theorems); if (H) is later
chartered, tauceti's theorems enter as direct imports → the Cycle-2 donor-hygiene
triad check applies THEN, at statement level, on tauceti's own pin (same-toolchain,
so one probe covers it).

## 5. What a P0 statement rung would need

A `pilots/41/P0.lean` probe (warm `crossmath-probe`, probe-convention stubs):
1. ported defs: `Block`, `bxor`, `phi/phiQ/phi1/2/3` components, `sigma`, the `Signs`
   predicate (verbatim from the two eth files — the v4.33→v4.36 surface S);
2. new defs: `sigmaQ` (decide the polynomial home: `G_q` and all `(−q)^τ` factors have
   NONNEG exponents, so `Polynomial ℤ`-valued with a `q : Rˣ` evaluation parameter
   suffices — no Laurent polynomials needed; pin this in the P0 header);
3. statements, stubbed: (B) as a `rfl`-shaped lemma statement, (P1)(P2) phrased as
   `decide`-able parity props over Bool³ (the P0 proves or stubs them — they are the
   finite facts the dossier says are routine lifts), (M) with explicit `G_q`,
   (N) as the ∃-quadruple statement;
4. regression: nothing to regress (first pilot in the dir); no sibling imports.
Expected P0 cost: 1–2 warm runs, statement-class. The P0 IS the faithfulness check
(dossier R2-mitigation pattern): it pins that eth's defs elaborate verbatim on-pin
and that the σ_q/G_q shapes typecheck.

## 6. Recommendation: **CHARTER** (iteration-5 opener; wave-tail only if a lane drains)

Rationale: top cold score (7.0) with the novelty question already settled by R8
round-3 (the expensive precondition, done); both donor sides measured cheap (eth port
S; mathlib stable); no live gates; the P0 is the corpus's cheapest statement class;
effort S–M with a pre-negotiated fallback ladder ((H) no-match ⇒ (M)+(N)+octonion
anchor, still a bankable finding — "every q preserves the alternation" is the other
branch of the (N) decide, publishable either way). It slots cleanly as an
iteration-5 opener: two-phase scope (core, then (H)-if-lane), self-contained, zero
contention with in-flight waves. Versus 12 (the other bench item): 41 has the higher
score, NO pilot-time technical flag, and a discovery-grade claim shape ((H) NEW);
12's flagship corollary is gated behind its F3b add-on and carries the
monotonicity-via-termPrime statement-shape risk — 41 should be chartered first.

— end preflight (A2, 2026-11-17)
