# Pilot 41-H4 record — RUN-1 GRANT EXECUTED: E1 GREEN (the d = 8 uniform-diagonal-κ monomial-host no-go, both fibers)

*Lane R4 (worktree agent-08), 2026-11-21, under the E1 FIRE GRANT (orchestrator;
conditions (1)–(5) as stated). Files here; H commits. Basis: `H4-precharter.md`
§3 run-1 (probe-certified statements, `H4-probe.lean` `bef92692230690f5`).*

## Verdict

**E1 GREEN at exactly the granted 3-fire budget** — `H4.lean` (302 LoC, fired
bytes = on-disk sha256(16) `768c6f5d6e777d25`): 0 errors, 0 sorry, 0
other-warnings. Kernel-only; Mathlib-only imports; zero `sorry`/`native_decide`;
H3.lean UNTOUCHED (self-contained file — grant condition (1); the 16-helper
custody rider stays untriggered and carries).

## What landed (the mathematical content)

1. **`table_diagLeft_nogo` / `table_diagRight_nogo`** (table-free, over any
   `Ring H`, EnclOK binders: zero-free table + `NonRankOne` + torsion-free word
   vectors + uniform diagonal structure constants + the dictionary equations →
   `False`): associativity + the dictionary equations force the structure
   function S constant in its first (resp. second) index, so the table factors
   as an outer product — rank one — and every 2×2 minor vanishes, contradicting
   `NonRankOne`. Axioms: **[propext, Quot.sound] each — LEANER than the triad**
   (no `Classical.choice` in the abstract chains).
2. **The four fiber finals** `no_diagLeft/Right_dim8_sigmaRow/sigmaOne`: no
   8-word uniform-diagonal monomial host realizes EITHER certified table —
   exactly triad each.
3. **The certified minor witnesses + zero-free rows** (kernel decides, carried
   verbatim from the probe): `sigmaRow_nonRankOne` / `sigmaOne_nonRankOne`
   [propext] — the certified asymmetry pairs (100,110) at q = −1 and (100,010)
   at q = +1 ARE nonvanishing-minor witnesses (minor = 1 − (−1) = 2);
   `sigmaRow/sigmaOne_zero_free` (triad).
4. **`dictionary_of_combination_data`** (the F pullback, EnclOK form): [propext]
   — the iter-7 positive arm's certificate vehicle, kernel-clean already.
5. **Statement surface of record for the banked arms**: E2's
   `StructureConstantDictionary` / `SemigroupEvaluationTable` /
   `diagonal8_open_questions` (Props, no verdict claimed) + F's
   `CombinationDictionary` + G's `sigmaInt` / `GenericNoDim7` — all #check'd.

**Reading (host-scoped, wording locks honored):** the shipped article-41H3
closure excludes hosts of dimension ≤ 7 at both closed fibers; E1 extends the
exclusion into the d = 8 boundary band for the UNIFORM-DIAGONAL monomial
multiplication class (P6(b)'s paper heuristics, now kernel). Mixed-κ and
general structure constants at d = 8 stay open (E2); the combination tier at
d = 14 stays open (F) — both banked to iter-7 per the landing ruling.

## Runs (3 of ≤3; descent 14 → 4 → 0 errors; ZERO math defects)

| run | bytes sha256(16) | verdict | wall | log |
|---|---|---|---|---|
| 1 | `3291454a23faccc1` (superseded) | FAIL rc=1, 14 errors — the budgeted mul↔zsmul lemma class (`mul_assoc` orientation; `Int.mul_right_cancel₀` absent at the pin → `Int.eq_of_mul_eq_mul_right`) + the finals missing explicit `φ u S` | 54 s | `logs/h4-run1.log` (`9e216ee1f3cb2ab3`) |
| 2 | `30bf23cd9fb3f6c6` (superseded) | FAIL rc=1, 4 errors — `mul_comm` unavailable in a noncommutative Ring (CommMagma synth fail) → the canonical `Ring.toIntAlgebra` route; 2 redundant `exact zero_smul` lines (rw already closed) | 45 s | `logs/h4-run2.log` (`979a4886d7777b2c`) |
| 3 | `768c6f5d6e777d25` (= on-disk, fired = record) | **GREEN** (0/0/0; audits as tabled) | 44 s | `logs/h4-run3.log` (`e53b17fe63409b05`) |

Telemetry: samples=0 every run (< 60 s interval), OVER=0. Route: doz CLI
`/home/doz/dozenv/bin/modal`, profile semraker, warm app `crossmath-probe`,
SPEC cpu=2.0/memory=4096, `LEAN_NUM_THREADS=2` (CAP secret), stage
`/tmp/crossmath-41-h4fire` (world-readable, discarded after).

## Audit (run-3 tail, verbatim in the log)

`sigmaRow_nonRankOne`, `sigmaOne_nonRankOne`, `dictionary_of_combination_data`
= [propext]; `table_diagLeft_nogo`, `table_diagRight_nogo` = [propext,
Quot.sound]; `sigmaRow_zero_free`, `sigmaOne_zero_free`, and the four
`no_diag*_dim8_*` finals = [propext, Classical.choice, Quot.sound]. **Zero
sorryAx anywhere.** The two decided micro-theorems are load-bearing inputs of
the finals (the finals' `Classical.choice` enters through them, not the
chains).

## Engineering-billing note (grant condition (5); the honest S1 posture)

E1 is an **ENGINEERING-class band extension of the shipped NEGATIVE article's
elementary register** — the hunt's floor rung, NOT a standalone discovery:
per the precharter's own §1 honesty note and the S2-formality ruling
precedent, it must not be billed as a discovery alone. The unit's discovery
payload stays the E2/F resolution (banked to iter-7 behind the
constraint-propagation pre-solve). Article disposition (a dated revise-in-place
of article-41H3 adding the d = 8 diagonal-band rows, vs folding into the
eventual H4 article) is the orchestrator's; R2's S1–S4 gate any billing.

## Custody + riders

- **H3.lean print-coverage rider (16 helpers): NOT triggered** (H3.lean
  untouched this fire); still BINDING at the next H3.lean edit's verification
  run (ledger §12.5's unaffected clause).
- **Sweep note (A1/H):** `make_axcheck.py`/TARGETS gains `AxPilot41_H4` if a
  close-time Step-B batch wants it; the run-3 audit tail already covers every
  top-level theorem of the file (11/11 — no unprinted-helper gap in H4: every
  theorem is named and printed; `lsumV`/`idx14` are defs, not theorems).
- **R7 editorial relay (2026-11-21) — APPLIED post-fire:** the precharter's
  two "quota-consuming DISCOVERY" sites reworded to "discovery-grade
  DISCOVERY, quota-free per the 41/41H lineage" (`H4-precharter.md` now
  `b0eb56b94c3419c7`; §1 F novelty claim + §4 second bullet). Queued for the
  eventual article path (NOT now): exact ids for the Morin–Duchesne 2015 and
  Chernyak 2023 nearest-miss rows (R7 mints the bib-cards) + E1's "Recht-class"
  row needs a named reference or drops.

## Files (this worktree; sha256(16))

- `research/pilots/41/H4.lean` — `768c6f5d6e777d25` (fired = on-disk, no post-green edits)
- `research/pilots/41/H4-record.md` — this record
- `research/pilots/41/logs/h4-run{1,2,3}.log` — `9e216ee1f3cb2ab3` / `979a4886d7777b2c` / `e53b17fe63409b05`
- `research/pilots/41/H4-precharter.md` — `b0eb56b94c3419c7` (the 2-site quota-vocabulary fix)

Lane: budget exhausted exactly (3 of ≤3); STANDBY. — R4, 2026-11-21.
