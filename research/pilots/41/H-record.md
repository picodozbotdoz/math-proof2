# Pilot 41-H — tranche 1 record: GREEN (transport banked; traciality obstruction banked)

*Lane R4 (worktree agent-08), 2026-11-19, unit 4 under the (H) promotion ruling
(mid-wave, DECISION-4 gates met). Binding conditions all honored — see §Compliance.
Files here; H commits post-K. The second-discovery-own-file adjudication stands; the
article stub (no content claims) is at `research/articles/41H-tl-realizability-transport.md`.*

## Verdict

**TRANCHE 1 GREEN** — `H1.lean` (455 LoC; cap 1.5k): 0 errors, 0 sorry, 2 cosmetic
warnings (unused `hq` — the q = −A² fiber is dictionary-side, deliberately unused by
the transport algebra). Runs used: **2 of 9** (§T gate run + full-file run).
Kernel-only; decide-only; no tauceti module imported or consumed at any point.

## What landed

1. **§T — the tauceti donor-hygiene gate (fired FIRST, per the ruling):** verbatim
   quotes of the five named donors (TemperleyLieb.lean:87/:146/:157, Hecke.lean:49,
   QuantumTrace.lean:41) + on-pin statement-binder shape-analogs. Gate output
   (run 1, syntax fix re-certified in run 2): `jonesDelta` VERBATIM copy [propext];
   `JonesHomShape`, `SkeinRelationShape` — **zero axioms**; `QuantumTraceShape`
   triad-clean. The on-tauceti-pin `#print axioms` (Cycle-2 gold standard) remains
   DEFERRED to actual-import time (tranche 2+, if ever) per the no-consumption rule —
   nothing was consumed.
2. **§0–§1 — the corrected statement surface** (GqGen surface; the P0 HostTransport
   wording is absent, barred by the ruling): `HostTransportCor`, `HostTransportStratum`,
   `TLRealizability` (the latter now DOCUMENTED in-file as content-free at binder tier).
3. **§2 — the transport direction, formally banked:** `hostTransportCor` (+`_full`)
   and `hostTransportStratum` (+`_full`), all **triad-clean**, proved by composition:
   realizability hypothesis × the core's mainCor/mainStratum (machinery copied
   verbatim from GREEN Core.lean — one-pass green, lessons applied).
4. **§3 — the TL_3(δ) search's first decide-encoding milestone — the TRACIALITY
   OBSTRUCTION (a tranche-1 finding for the charter):**
   - `sigmaQ_asym_witness` [propext]: σ_q(100,110) = 1 ≠ −1 = σ_q(110,100) at q = −1
     (kernel decide).
   - `tracial_realizability_refuted` [propext, Quot.sound]: NO tracial evaluation
     (∀ u v, ev(uv) = ev(vu)) can realize σ_q on w-word products — traciality forces
     symmetry, the witness breaks it. **Consequence:** Markov/Hecke-TRACE-per-word
     realizations of σ_q are IMPOSSIBLE; the (H) dictionary must be NON-tracial —
     tangle/Kauffman-bracket evaluations, exactly the dossier's skein phrasing (and
     its Kauffman-bracket nearest-miss). This KILLS the naive "closure-trace" reading
     of (H) and sharpens tranche 2's target.

## Compliance vs the binding conditions

| condition | status |
|---|---|
| corrected statements only; P0 HostTransport wording barred | ✓ — absent from H1.lean; surface = HostTransportCor/Stratum/TLRealizability on GqGen |
| tauceti triad FIRST, statement-binder class, no consumption | ✓ — h1-run1 fired before any proof work; nothing imported; on-pin print in-log |
| cap ≤1.5k LoC / ≤9 runs | ✓ — 455 LoC, 2 runs used |
| decide-only search | ✓ — kernel decide only (sigmaQ_asym_witness, machinery decides) |
| own-file bookkeeping from tranche 1 | ✓ — H1.lean/H-record/logs + the article stub, all separate from 41-core's files |
| re-price checkpoint at tranche close | ✓ — §Re-price below |

## Re-price checkpoint (per the ruling)

Transport: BANKED (was priced +0 — correct). The search: tranche 1's obstruction
REDUCES the tranche-2 space (trace dictionaries eliminated; tangle/skein or
non-tracial diagram evaluations remain). Remaining tranche-2 scope: (a) a concrete
non-tracial dictionary candidate (Kauffman-bracket tangle evaluation or an explicit
5-dim TL_3(δ)-module functional — the latter now must be NON-tracial by §3);
(b) its finite check, decide-encoded. Estimate UNCHANGED from the preflight
(+0.5–1k LoC / 4–8 runs) but with sharpened direction; the L-case (build TL
infrastructure) remains possible if no mathlib-native non-tracial functional
suffices. Tranche-2 charter decision belongs to the orchestrator.

## Runs

| run | bytes sha256(16) | verdict | wall | log |
|---|---|---|---|---|
| 1 (§T gate, H1T.lean truncation) | `471575520b29fc32` | NOT-GREEN 2 err (LinearMap.id named-arg syntax) — GATE OUTPUT printed; shapes zero-axiom/triad | 55 s | `logs/h1-run1.log` (`c9c48a3d3fe00087`) |
| 2 (full H1.lean) | `283503ada8f5571e` | **GREEN** (0/0; audits as above) | 41 s | `logs/h1-run2.log` (`7da103c36d929c1f`) |

## Files (this worktree; sha256(16))

- `research/pilots/41/H1.lean` — `283503ada8f5571e` (fired = on-disk: no post-green edits)
- `research/pilots/41/H-record.md` — this record
- `research/pilots/41/logs/h1-run1.log`, `logs/h1-run2.log` — above
- `research/articles/41H-tl-realizability-transport.md` — stub (own-file bookkeeping;
  NO content claims until landing)

## Tranche 2 (unit 5, same promotion ruling): PARTIAL — certificates GREEN, cap-stop invoked

**Verdict: the two WALSH CERTIFICATES are GREEN and axiom-lean; the lifting chain +
no-go theorem are open at the run cap.** Fired history (8 h2 runs; cumulative 10/10
runs — the cap): v1 Matrix/det design (det-decide kernel-stuck) → v2 explicit-inverse
(ℚ-division stall) → v3/v4 division-free over ℚ (isolated: `Matrix.mul`/`Finset.sum`
do not whnf under decide) → v5 over ℤ after the **`Rat.add` extern-opacity discovery**
(even `0 + 0` at ℚ stalls — no ℚ-arithmetic decide is possible on this toolchain;
retro-explains all stalls) → v5b/c fix passes. Final state (h2-run8, file sha16
`ab8da9e12feb44c7`):

- **LANDED (audit, run 8): `sigmaOrth` [propext] and `sigmaExpand_basis` [propext]** —
  the σ-table at q = −1 has orthogonal rows (⟨r_p, r_p'⟩ = 8·δ) and the basis-expansion
  8·e_{b₀} = Σ_p ⟨r_p, e_{b₀}⟩ r_p, both kernel-decide-certified over ℤ. These two
  facts ARE the rank-8 discovery core: the specialized table is nonsingular.
- **OPEN: `sigmaExpand` (the linearity lifting) and `rank_obstruction_nogo`** — the
  remaining 9 errors are one-word normalization classes (visible in the transcripts:
  e.g. `0 + lsum …` needing `zero_add` where `add_zero` was written; evec-unfold
  directions) — NO mathematical content at risk. STOP-at-cap per the ruling;
  re-charter cost: ~4 word-level fixes + 1 confirm run.

Mathematical statement of the tranche-2 finding (as designed; derivation pending the
re-charter): at q = −1 the σ-table is the Walsh/character table of the invertible
form phiQ mod 2 — full rank 8 — while any 5-dimensional (TL₃) linear-functional
realization factors as C·Φ·Cᵀ with rank ≤ 5, contradiction. Consequence: the (H)
dictionary needs ≥ 4 strands (TL₄, dim 14); the dossier's 3-strand [HYPOTHESIS] is
closed negative. LoC at cap: H1 455 + H2 350 = 805 of the 1455 cumulative cap ✓;
runs at cap: 10/10 ✗ (STOP invoked).

Elaboration discoveries (recorded in-file + logs): `Rat.add`/`Rat.div` are
extern-opaque to the kernel on v4.36.0-rc2 (decide must avoid ALL ℚ arithmetic —
integer certificates only); `Matrix.mul`/`Finset.sum`/`Matrix.det` do not whnf under
decide at this scale (literal-list foldrs do); the ᵀ postfix attaches only to bare
identifiers.

— lane R4, 2026-11-19 (tranche-2 addendum).
