# Pilot 41 — (H)-preflight (DECISION-4 promotion input)

*Lane R4 (worktree agent-08), 2026-11-19, unit 3. Input state: core S–M GREEN
(`Core-record.md`, run 9, sha `921bc43cbd06d252` fired / `733b4a2d93a84689` on-disk).
This preflight is the gating input for the orchestrator's mid-wave ruling; the ruling
stays the orchestrator's. Evidence base: the core's 9 runs + the 1 probe run below;
dossier 41 (H) section; precharter §1.6/§3; preflight §4 (pilot-41's own, on tauceti
hygiene); the standing two-discovery watchlist instruction.*

## (1) Binder-tier elaboration check — GREEN (1 warm run)

`H-probe.lean` (sha16 `740adaf154eb9e18`, 120 LoC, statement-only, probe conventions)
fired on crossmath-probe (doz/semraker, 2cpu/4GB, telemetry, wall 36 s): **OK, 0
errors, 0 sorry**. All three (H) statement shapes elaborate on-pin:

- `HostTransportCor` (unified/GqGen form) — the corrected transport;
- `HostTransportStratum` (stratum form, dossier's G_q) — mirrors MainIdentityStratum;
- `TLRealizability` (∃ A q ev w over ℂ, q = −A², realizing σ_q on word products) —
  the finite-search assertion's shape.

**Attribution note (record precision):** the re-task's phrase "eth HostTransport
surface" is a misattribution — HostTransport is the PRECHARTER's binder (§1.6, EnclOK
convention); eth's surface is the Signs/phi block (all TRUE, re-proved). This matters
for the defect finding below.

**Preflight finding (statement defect inherited — must condition any GO):** the P0's
`HostTransport` as stated INHERITS FINDING F1: its realizability hypothesis
(∀ p p′, ev (w p · w p′) = σ_q p p′) substituted into its conclusion yields exactly
MainIdentity-as-a-Para-universal — machine-refuted (Core §1: 0 = 2 at ℤ, q = −1).
So (H) must be chartered against the CORRECTED statements above (both now
elaboration-GREEN), never the P0 wording. Propositionally, HostTransportCor is a
one-composition corollary of the core's `mainCor` — i.e., the transport direction is
already banked; the (H) milestone's real content is ONLY the ∃-side (realizability).

## (2) Pricing re-check (lessons applied)

Core actuals: ~600 LoC, 9 runs — of which 4 fix-loops were ALL one-elaboration-issue
classes now documented (kernel-decide ✗ aeval-through-Classical; if-as-simp dead;
Gq base-coercion + C_pow; auto-bound-`Type*` universe freeze). With lessons applied,
those classes cost ~0 going forward.

(H) cost drivers, re-priced:

| item | precharter price | re-price (lessons applied) | basis |
|---|---|---|---|
| tauceti donor-hygiene triad at statement level (Cycle-2 gate, runs FIRST) | implied in (H) budget | **1–2 runs** via verbatim statement-copies (corpus finding: port cost ≈ 0; same toolchain v4.36.0-rc2) | tauceti `TemperleyLieb.lean:87,146,157`, `Hecke.lean:49`, `UqSl2/QuantumTrace.lean:41` — statement-tier copies in a probe file, `#print axioms` at tauceti's pin is a SEPARATE question (claim vs proof — the Cycle-2 caveat); a taucetiolean-capable Modal image (G-series layer pattern) is needed only if the (H) core imports tauceti for real |
| corrected (H) transport theorem | inside +1–3k | **banked** (mainCor composition; ~10 LoC) | core GREEN |
| the finite TL_3(δ) search (dossier [HYPOTHESIS]; TL_3 has dimension 5) | the risk mass | **S: +0.5–1k LoC, 4–8 runs** if it closes under explicit enumeration + kernel decide (the core's decide pattern); **M: +1–1.5k** if the trace calculus needs real in-Lean TL algebra; **the precharter's L (+1–3k)** only in the worst case (building TL infrastructure) | the search is 8 words × TL_3(δ=−A²−A⁻²-ish) closures — finite, but the ENCODING is the cost; decide-only discipline (no native_decide) per the ground rules |
| q = −A² dictionary plumbing (jones/jonesDelta/Markov trace transcription) | inside +1–3k | +0.1–0.3k LoC, ≈ 0 port churn (verbatim class) | corpus finding B1–F |

**Bottom line:** realistic (H) first tranche (hygiene probe + corrected statements +
search skeleton + decide driver) ≈ **0.7–1.5k LoC, 5–9 runs**; worst case (TL
infrastructure built from scratch) reverts to the precharter's +1–3k. The core's
per-run cost profile (36–77 s warm) makes the run-count cheap; LoC is the real cost.

## (3) Discovery-coherence (the two-discovery test)

If (H) lands at discovery grade, it should count as a **SECOND discovery, own file**
— not an extension of the 41 identity:

- 41-core (banked) = a new *algebraic identity family* inside eth's own sign-algebra
  framework (defect-deformation + antipodal stratification + nondegeneracy) — its
  nearest-miss table is sign-rule/q-deformation-shaped.
- (H) = a *realization/bridge theorem* (σ_q arises as Jones/Markov-trace evaluations
  of 3-strand words at q = −A²) — object level is TL/Hecke/quantum-topology; NO
  octonion–TL connection in any corpus sweep (dossier Novelty). Its nearest-miss
  table (Kauffman bracket skein calculus, Hecke traces, UqSl2) is disjoint from
  41-core's.
- They are linked by dependency ((H) transports (M-corrected)), not by content
  merger — the same relation dossier 41's significance section already draws ("first
  theorem connecting a complexity-theory seed identity with the TL/Jones world").
- Honest counterweights: (i) (H)'s hypothesis-side (TLRealizability) could FAIL the
  finite search (F5(iii)) — then nothing lands and 41 stays single-discovery (the
  Cayley–Dickson q=1 anchor fallback shapes the close); (ii) if the search lands but
  only weakly (e.g., realizability over ℂ without the full skein-identity reading),
  the grade drops to corollary-of-41 + construction — a mid-wave re-read then, not a
  pre-commitment.

## (4) Recommendation — CONDITIONAL-GO

**Recommendation: GO to a bounded (H) tranche**, conditions:

1. **Statement gate (hard):** charter against the corrected surface only
   (HostTransportCor / HostTransportStratum / TLRealizability — all
   elaboration-GREEN above); the P0 HostTransport wording is F1-defective.
2. **Donor hygiene FIRST (Cycle-2 gate):** the tauceti statement-level triad probe
   (1–2 runs, verbatim-copy class) before any (H) math work; if the triad cannot run
   at statement level on-pin, STOP — that is the standing no-consumption rule.
3. **Scope cap (first tranche):** ≤ 1.5k LoC, ≤ 9 runs; the search must close under
   explicit enumeration + kernel decide (no native_decide, no external CAS);
   descope ladder pre-negotiated: search-no-match ⇒ ship the Cayley–Dickson q = 1
   anchor + (H) restated open (the precharter's ladder rung 2).
4. **Own file + two-discovery bookkeeping from tranche 1** (e.g.
   `research/pilots/41H/` or a fresh pilot number per the standing instruction), so
   the watchlist's two-discovery test is cleanly adjudicable at iter-5 close.
5. **Re-price checkpoint:** after the hygiene probe + search skeleton, re-price
   before any second tranche (the L-case must be a fresh ruling).

**NO-GO triggers:** tauceti triad fails on-pin; the search cannot be encoded as
explicit finite enumeration at ≤ 1.5k LoC; or a mid-wave budget ruling doesn't
materialize (DECISION-4 keeps the ruling with the orchestrator).

## Evidence table

| artifact | sha256(16) | status |
|---|---|---|
| `H-probe.lean` (fired) | `740adaf154eb9e18` | GREEN (36 s, 0 err/0 sorry; `logs/h-probe-run1.log` sha16 `f4ae5f653602e4d7`) |
| `Core.lean` (core GREEN input) | `733b4a2d93a84689` on-disk (fired `921bc43cbd06d252`) | GREEN run 9 |
| `P0.lean` (unchanged) | `b177acdbf0346bf1` | as fired |
| HostTransport (P0 §1.6, as stated) | — | elaborates, but F1-defective as a target (§1 above) |

— lane R4, 2026-11-19. Ruling requested per DECISION-4.
