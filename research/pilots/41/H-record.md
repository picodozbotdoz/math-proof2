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

## TRANCHE-2 COMPLETE + BANK-AS-NEGATIVE RULING (unit 7, 2026-11-19)

**h2-run 11 (the granted confirm, bytes `9534383949a6ac0c`): H2.lean GREEN — 0
errors, 0 sorry.** Full audit: sigmaOrth [propext], sigmaExpand_basis [propext],
sigmaExpand [propext, Classical.choice, Quot.sound], **rank_obstruction_nogo
[propext, Classical.choice, Quot.sound]** — the complete obstruction theorem
(Walsh certificates → expansion → no-go) is kernel-proved. (Post-green status note
in H2.lean's header; fired bytes = the run-11 staged copy, sha16 above.)

**TRANCHE-3 RULING (orchestrator, 2026-11-19): BANK-AS-NEGATIVE.** The (H) program
ships as the second-discovery NEGATIVE-kind result (78 precedent: discovery-grade,
quota NOT consumed; own file per the standing instruction):

- **Theorem A (traciality obstruction, H1.lean, [propext, Quot.sound]):** no
  tracial evaluation realizes σ_q on w-word products (witness σ_q(100,110) = 1 ≠
  −1 = σ_q(110,100), kernel decide).
- **Theorem B (rank obstruction, H2.lean, triad):** the σ-table at q = −1 is the
  full-rank Walsh table of the invertible form phiQ mod 2 (orthogonal rows +
  basis expansion, [propext] certificates), so no 5-dimensional — TL₃(δ) —
  linear-functional realization exists; with the EnclOK dependence binder, every
  C·Φ·Cᵀ realization collapses to a singular table, contradiction.
- **The corrected-surface transports (H1.lean, triad):** hostTransportCor /
  hostTransportStratum — the banked direction.
- **Headline (negative-kind):** the dossier's 3-strand Temperley–Lieb hypothesis
  for the q-deformed Graves sign is FALSE in every dictionary class considered
  (tracial: Theorem A; arbitrary linear-functional at dim 5: Theorem B); the
  deformation's host, if any, lives at n ≥ 4 strands, non-tracial.

The n≥4 hunt (TL₄, dim 14 ≥ 8, non-tracial, decide-only) is DEFERRED to the
next-wave charter as a named candidate — the tranche-3 scope note below is its
seed (0.5k/4–6 pricing, raised no-go prior, third-negative-is-legitimate honesty
all carry). The article-fill chain (R7/R9) fires next on this record.

## Unit-6 re-charter close (2026-11-19): sigmaExpand GREEN; the no-go is one step from GREEN at cap

Runs 9–10 (h2 logs; the re-charter's 2-run budget, both used): run 9 — **sigmaExpand
TRIAD-CLEAN** (the linearity lifting landed; the expansion theorem now holds for ALL
function vectors); run 10 (fired sha16 `06431ff427bcdfcd`) — `rank_obstruction_nogo`
2-errors-from-GREEN, both errors the SAME final hcon congr-step, fully diagnosed (the
per-i `mul_zero` proof left F/G open; the closed-shape one-liner fix is applied
in-file as a documented UNFIRED amendment — on-disk sha16 `9534383949a6ac0c`, the
next confirm run fires those bytes). Audit at run 10: sigmaOrth / sigmaExpand_basis
[propext], sigmaExpand [propext, Classical.choice, Quot.sound]. STOP-at-cap per the
ruling. One confirm run completes tranche 2.

## Substrate notes (per the unit-6 routing: the Rat finding)

- **`Rat.add` and `Rat.div` are extern-opaque to the kernel on v4.36.0-rc2** — even
  `0 + 0` at ℚ fails to whnf under `decide` (h2-run5's smoking gun; retro-explains
  every ℚ-decide stall in h2-runs 1–4). Rule for all future (H)/core files: kernel-
  decided propositions use INTEGER arithmetic only; any denominators live in field-
  reasoning outside decides (the 8·-scaled certificate pattern).
- `Matrix.mul` / `Finset.sum` / `Matrix.det` do not whnf under `decide` at this scale
  (reproducible, h2-runs 2/4) — use literal-list foldrs (`lsum`) for finite sums.
- The `ᵀ` postfix attaches only to bare identifiers; `Matrix.transpose` long-form for
  compound expressions.

## Tranche-3 scope note (draft for the charter ruling; the two obstructions change its shape)

State: tranche 1 killed ALL tracial dictionaries (H1, axiom-lean); tranche 2's
certificates prove the σ-table full-rank 8 (orthogonal Walsh rows + basis expansion,
[propext]) with the no-go assembly one confirm run away — TOGETHER these close the
dossier's 3-strand [HYPOTHESIS] NEGATIVE: no TL₃(δ) (dim 5) linear-functional
realization of σ_q exists, tracial or not.

Tranche 3, if chartered, is therefore a DIFFERENT hunt than the dossier's original:

1. **Target tier**: n ≥ 4 strands (TL₄, dim 14 ≥ 8 — the necessary condition the
   obstruction leaves open). The rank constraint generalizes: any dim-d algebra
   realization needs d ≥ 8; TL₄ clears it but the search must still find words +
   a non-tracial functional satisfying the 64 σ_q-equations AT q = −A² with the
   Jones/Kauffman dictionary — the dimension bound is necessary, not sufficient.
2. **Dictionary class**: non-tracial by force (tranche 1) — tangle/Kauffman-bracket
   evaluations or explicit non-tracial functionals on TL₄; the five tauceti donors
   stay statement-binder-class unless a real import is chartered (then the
   on-tauceti-pin triad FIRST).
3. **Honest risk read**: the two obstructions raise the prior that NO dictionary
   exists at any strand count (the σ-table's structure is Walsh-rigid); tranche 3
   should be priced as SEARCH-WITH-NO-GO-ESCALATION: a bounded enumeration over
   TL₄-generator words (length ≤ L, L picked so the 64-equation system is
   decide-checkable per candidate — the certificates' pattern), with the negative
   outcome itself reportable (a third obstruction finding).
4. **Budget shape** (for the ruling, not a request): statement of the dim-14 search
   space + decide driver ≈ 0.5k LoC, 4–6 runs, own file H3.lean; the q-genericity
   lemma (det M(q) ≠ 0 as a polynomial, killing all-but-finitely-many q in one blow)
   is a cheap +1 lemma (evaluate at 25 integer points, all nonzero by decide) and
   should ride along.
5. **Alternative close**: if the orchestrator prefers banking over hunting, (H) can
   close NOW as a strong-negative result: "no 3-strand TL dictionary exists
   (traciality + rank obstructions, kernel-certified); the deformation's host, if
   any, lives at n ≥ 4" — a clean second-discovery-grade negative finding for the
   41H article stub, with zero further runs.

— lane R4, 2026-11-19 (unit-6 close).
