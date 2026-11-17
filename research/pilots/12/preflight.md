# Preflight — pilot 12 (z4-parametric-savings-function-in-matrix-exponent)

Lane A2, 2026-11-17 (reading/spec work only, no Modal). Bench item of the Iteration-4
charter draft (`feasibility/ITERATION4-CHARTER-DRAFT.md` :50); bench row
`qa/iter4-review/r5-iteration4-backlog.md` :116 ("ε(ω_b) monotonicity statement with
the termPrime check run at pilot (SCAN :33)"). With FF-EZ2 in flight and the physlib
probe done, 12 is the other of the two last bench-listed items without a preflight.

## 1. What the item is

Dossier `candidates/12-z4-parametric-savings-function-in-matrix-exponent.md` (R4
proposal, R9 F4-graded 2026-11-09). Convert 3sum-apsp's frozen Exact-Triangle savings
constant ε_T = 0.0017 (instantiated at Strassen's log₂ 7) into an explicit, strictly
increasing function ε(ω_b) of an assumed word-RAM matrix-multiplication exponent, by
generalizing the two existing route lemmas (`Theorem19.explicit_of_theorem_17_
corollary_15/16`) from the frozen `strassen` instance to the abstract `MM` parameter
that `Claim.Theorem_17 M MM D g` already carries but instantiates exactly twice, both
at Strassen. Core deliverable: `Claim.Theorem_19_explicit M (ε(ω_b)) e(ω_b)` for every
`WordRamMM MM` with exponent ω_b ∈ (2, 2.9], with ε(log₂ 7) = the frozen value,
strict monotonicity, and ε → 0 as ω → 3. The flagship corollary (openai's proved
ω_ℂ ≤ 9/4 ⇒ ε(9/4) > 0.0017, a printable strictly-better formal exponent) is
**conditional on F3b** — the arithmetic-ℂ ⇒ word-RAM model-gap transfer lemma.

**Resolved rescope** (SCAN §1b :32 + backlog :116): the former "feeder = 51"
dependency folded — dossier 51 (ω-to-word-RAM) is benched/KNOWn-informal-only and now
lives as "fold into 12-F3b or formalization-only"; the pilot's core scope stands
alone. Final triage score **6.0** (N 4 × S 3 ÷ E 2, `TRIAGE.md` row 12) — second
cold score behind 41's 7.0.

## 2. Substrate class

**[WARM] statement-port class**, measured on BOTH donor sides:
- 3sum-apsp side (v4.33): `Claim.Theorem_17` plumbing + route-lemma shapes + Sec-4
  trade-off objects — all ℝ-valued propositions, same statement family as ProbeB3
  (verbatim-clean). Port risk minimal.
- openai side: enters the CORE theorem as a citation-quality hypothesis —
  `ProbeC2_OAI_Model.lean` elaborated the entire cited API (`Model.lean:88–101`)
  verbatim on v4.36, 0 errors/0 warnings, closure depth 0 (R9 F4: "confirmed and
  cheapened"). **Zero port at core scope.**
- F3b add-on (NOT core): importing the bound as a proved theorem instead of a
  hypothesis is a different substrate class — measured OAI closure 129 files /
  20,694 LoC / depth 12 (`AuxiliarySeparation`), or the 78-file/13,697-LoC witness
  route with named level-1 blockers (port-probe §7.3). Priced M add-on, plus an
  honesty item (openai coefficient integrality unverified — the transfer lemma may
  need rational reconstruction/rounding).

## 3. Effort class (r5 sizing)

**S–M for the core** (~0.5–1.5k LoC: MM-generalized restatement of the two route
lemmas + the Sec-4 symbolic re-instantiation + one derivative-sign computation for
monotonicity + numeric re-instantiation of ε(log₂ 7)). **M–L with F3b** (dossier F4;
R9 attached the closure numbers above). The 32-crossing pilot's experience (same
Sec-4/Rc calculus territory, now chartered as filler) amortizes directly if both run.

## 4. Gates / batteries

**None live** ("bench — no live gates", backlog :68); novelty round-2 was run at
dossier time with no disqualifier found (AVW and the literature freeze constants by
design; the ε(ω) function unpicked). The one standing item is NOT a gate but a
**pilot-time check the backlog flags twice** (SCAN :33; TRIAGE row 12: "Flag
monotonicity-via-termPrime check at pilot"): whether the Sec-4 arithmetic, which the
corpus validates at specific rationals (per-cell `table_2_*` statements) and which
the frozen route instantiates at D = ⌊n^{1/18}⌋, actually supports the SYMBOLIC
balance-point monotonicity — dossier F5 names the risk ("if `total_corollary_26`-style
sums were tuned to the frozen D choice, the symbolic choice may need a stronger
monotonicity input than `Sec4_Rc_strictAntiOn` gives; check `Sec4_Rc_zero_tendsto`
suffices"). This check is statement-shape-level → it belongs in P0, which is exactly
why the bench deferred it to pilot time.

## 5. What a P0 statement rung would need

A `pilots/12/P0.lean` probe (warm `crossmath-probe`, probe-convention stubs):
1. ported shapes: `DetTimeModel`-carrier + `Claim.Theorem_17 M MM D g` signature +
   `Claim.Theorem_19_explicit` def (verbatim, `TimeClaims/Sec3/Definitions.lean:75,
   178–199, 305–308`) and the `termPrime MM n D = MM n * D^{3/2}` def
   (`Sec3/Parameters.lean`) — the termPrime def is the anchor the flagged check
   revolves around;
2. generalized statements, stubbed: the two route lemmas restated at abstract `MM`
   with `WordRamMM` + exponent hypotheses; the parametric conclusion
   `Claim.Theorem_19_explicit M (ε(ω_b)) e(ω_b))` with ε as DATA + the three
   properties (frozen fiber / strict monotone / limit) as explicit hypotheses —
   the P0 pins that the parametric statement closes against the route-lemma shapes
   WITHOUT committing to ε's closed form;
3. **the flagged check as a P0 consumer**: a stubbed monotonicity statement in the
   shape `Sec4_Rc_strictAntiOn`-input ⇒ balance-point monotone in ω_b — its
   statement elaboration (or failure to) is the first real evidence on the F5 risk;
4. regression: none (first pilot in the dir).
Expected P0 cost: 1–2 warm runs. GO/NO-GO read: P0 GREEN with the monotonicity
statement elaborating ⇒ core is charterable as scoped; the monotonicity statement
NEEDING a stronger input than the Sec-4 general lemmas provide ⇒ rescope (ship the
MM-parametric route lemma + the frozen-fiber instance only, drop the ε-function
headline to hypothesis-explicit form).

## 6. Recommendation: **DEFER** (iteration-5 opener candidate behind 41; charter the
P0 as the wave-tail drain-filler only if a lane drains AND 41 is already assigned)

Rationale: healthy item — 6.0, both donor sides measured zero-to-cheap port, no
gates — but it loses the head-to-head with 41 on every axis that matters now: lower
score (6.0 vs 7.0), a pilot-time technical flag (the monotonicity-via-termPrime
statement-shape risk, unsettled until P0) versus 41's none, and a flagship payoff
(the printable ε(9/4) corollary) that is gated behind the F3b M-add-on with its own
honesty risk (openai integrality), whereas 41's core payoff is self-contained. The
right sequencing: 41 first; 12's P0 — which doubles as the flagged-check discharge —
is a natural iteration-5 opener or a lane-drain filler, and its P0-first structure
(settlement of the F5 risk before any charter of the full core) is mandatory either
way. NOT kill: nothing disqualifies it, the cheapened substrate reading is favorable,
and the parametrization template ("supply-side exponent meets demand-side reduction")
has reuse value for every future F3b-class consumer (51's fold lives here).

— end preflight (A2, 2026-11-17)
