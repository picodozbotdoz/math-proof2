"""presolve7 generator — CONTRACT ONLY (pre-stub; ZERO code body, NO data, never run).

The constraint-propagation engine for the iter-7 H4 pre-solve (charter:
../H4-presolve-charter.md cda679eca1d7fd76 §1-§2; skeleton README in this
directory). Lane R4 stubs the contract; the iter-7 unit writes the bodies.

INPUTS (all deterministic, all local):
  - tier A (semigroup): the two certified 8x8 targets M+/M- ONLY (entries +-1,
    from the H4.lean §0 formulas phiQ/tau — recompute, never hardcode
    unverified numbers); the 254 (F+,F-) partitions; associativity + the
    evaluation equations per the charter §1(A).
  - tier B (structure constants): band bounds (B_N, B_f) in {(1,1),(1,2),(2,1),
    (2,2)}; the 64 evaluation equations + the 512x8 associativity identities.
  - tier C (spin-host combination): T_spin recomputed EXACTLY from the archived
    formulas (../presolve/h3_presolve_archive.py class: tauceti cup/cap/
    generator formulas at both integer fibers -> 14x14x14 integer constants);
    never imported from tauceti, never a kernel claim.

DETERMINISM / SEED RULE: one fixed seed recorded in the README at run (the
archive precedent: 20261121); no wall-clock, no hash-order iteration (sort
every enumeration); two runs must be byte-identical; no network, no Modal,
numpy only (solver accelerators ONLY behind the README's solver-assisted
section + the re-verification gate).

PLANTED-CONTROLS PROTOCOL (mandatory every run, per tier): plant synthetic
solutions — (kappa,f) / (N,f) / (W,f) pairs constructed to satisfy the tier's
equations — and REQUIRE detection (exact-integer match on integer paths; the
~1e-13-residual discipline on any float path, per the archived presolve); plant
far tables (random +-1 tables) and REQUIRE rejection. A run whose plants are
not detected does not land.

OUTPUTS: outputs/ artifacts only (survivor lists, per-tier/band/fiber counts,
partition/propagation traces for tier A, the T_spin constants for tier C, the
run log) — shaped to fill the README's [PENDING] tables verbatim. The
generator NEVER writes billing prose; the README's fixed vocabulary governs.

CLASS: CERTIFIED-NUMERIC machinery (never kernel theorem, never in proved
counts — the 41H §N3 / 2026-11-20 BANK ruling). This stub contains no code by
design.
"""
