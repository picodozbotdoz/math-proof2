# AGENTS-ITER4-DRAFT — proposed Iteration-4 addendum for AGENTS.md (E-block)

**DRAFT-FOR-REVIEW — nothing here applies until the orchestrator approves at launch; H
applies under launch authorization (AGENTS.md is not edited by this lane).**

Lane R8, 2026-11-16 (review-phase queue 4). Modeled on `research/AGENTS-C2-DRAFT.md`
(same discipline: placement notes in brackets, AGENTS.md's terse style, every fact cited
to an on-disk artifact). Backing record: `research/feasibility/iter4-donor-unblock-plan.md`
(§5 runner kit, §8 first-48h approval packet).

---

## Block E1 — [append to "Lean verification via Modal":]

- Substrate update (2026-11-16): the xyz route is viable again but lands on the Modal
  workspace `donniexyz888`, which is **cache-less** (no shared image-layer history); the
  doz CLI (`/home/doz/dozenv/bin/modal`, workspace `semraker`) is the **continuity
  default** — all Cycle-2 layers, volumes and warm apps live there. All wrappers patched
  2026-11-16 to `MODAL_USER=doz` default with the xyz override kept
  (`feasibility/probe/run_probe.sh`, `pilots/32/run_pilot.sh`; dual-branch shape of
  `run_axcheck.sh`). New apps must keep image `run_commands` TEXTUALLY IDENTICAL to the
  shared recipe so layers stay shared across apps (R8 §5b).
- Iteration-4 runner template (staged-unrun, jointly owned H+R8, R8-reviewed PASS):
  `feasibility/probe/run_iter4_probe.sh` + `iter4_probe.py`, app `crossmath-iter4-probe`
  — the pilots/71 pattern with the probe-convention prefix broadened to
  `("P0", "Probe")`, env-overridable `MODAL_BIN`, SPEC 2cpu/4GB + `@telemetered` +
  `LEAN_NUM_THREADS=2`, staged-dir `modal_telemetry` import. No new axcheck app: the
  existing kit (`axcheck_probe.py`/`make_axcheck.py`, `m4b_donor_axcheck.py`) covers
  iteration-4 (no new donor is chartered to be BUILT).
- First-48h runs go through the per-run approval cards in
  `feasibility/iter4-donor-unblock-plan.md` §8 (command, app, class, duration @SPEC,
  telemetry path, abort condition; approval is per-run and does not carry over).
- Modal incident protocol (outages/overruns): ≤4 artifact-cache retries then
  seed-and-build (`_seed_mathlib`, `gprobe.py`); `[tele]` OVER on `mem` with flat `anon`
  on mathlib-heavy elaboration is the inherent mmapped-olen reading (G7b measured fact),
  not an escalation trigger — investigate `anon` growth first (AGENTS.md guideline 3);
  log tails from outage windows are suspect until re-verified; long builds >~40 min run
  detached (`setsid nohup` + `modal run --detach`), >~2 h use the `g7_layers.py` chunk
  recipe. Pointer: R8 §5b + `RESUME-BRIEF-C2.md` §Protocol.

## Block E2 — [extend the G-series bullet in "Cycle-2 conventions" (or its Iteration-4 successor):]

- G-series staged (2026-11-16, ALL approval-gated, none run): **G9**
  `ProbeG9_StrongPNT.lean` (R8) — upstream StrongPNT binder transcription, mathlib-only,
  rides the `run_gprobe.sh probe` auto-glob; **G10** `ProbeG10_PhyslibRefresh.lean` (R8)
  — physlib-refresh shelf-probe, in-tree via the new `g10` mode, skip-set-excluded from
  probe mode; **G11/G12** `ProbeG11_OAI_SiegelZeros.lean` /
  `ProbeG12_OAI_PiExponent.lean` (lane R6) — OAI donor-pin probes (G7b precedent),
  skip-set-excluded, **their runner modes are owed by R6** (g7-style; until wired they
  must not ride any batch). Numbering coordination: G9/G10 = R8, G11/G12 = R6.

## Block E3 — [amend the `PrimeNumberTheoremAnd` watchlist bullet in "Sibling resources":]

- T2-trigger evaluation note (2026-11-16): mathlib AT OUR PIN already carries
  `Chebyshev.psi` + the scoped `ψ` notation (`Mathlib/NumberTheory/Chebyshev.lean:70/:74`),
  `ArithmeticFunction.vonMangoldt`
  (`Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean:66`), and PNT-AP-class
  content (`Mathlib/NumberTheory/LSeries/{PrimesInAP,Dirichlet}.lean`) — so (i) the 22-T2a
  StrongPNT binder transcription is pure-mathlib (G9; upstream `ChebyshevPsi` maps onto
  mathlib's own `Chebyshev.psi` — the only delta), and (ii) mathlib itself absorbing
  PNT-AP/Dirichlet-L content WEAKENS the upstream-registration case when T2 is next
  evaluated (evaluate against mathlib-on-pin first, upstream second).
- Donor-map correction (R6 rg + R8-verified, 2026-11-16): openai-math's
  `lake-manifest.json` declares **PrimeNumberTheoremAnd** (@ `c39a7511`, :64–:73) AND
  **TauCeti** (@ `3bed7e37`, :194–:203) as dependencies — importable inside OAI
  donor-pin builds. New route class **"PNT+ via OAI manifest import"** for any FB-2-class
  explicit-formula consumer; weakens the upstream register-and-port case further (third
  datapoint). Neither entry was in `novelty/pntplus-glue-as-donor.md` /
  `novelty/axiommath-as-donor.md` — correction of record:
  `feasibility/iter4-donor-unblock-plan.md` §3 addendum.

## Block E4 — [extend the donor-hygiene bullet in "Cycle-2 conventions":]

- Donor-hygiene gate — iteration-4 application: the two NEW OAI donors (Siegel-zeros,
  π-exponent; R6's G11/G12) pass through the SAME gate as ZetaZerosV2/G7b did — on-pin
  `#print axioms` of the consumed chain at the donor's own pin is the proof; comparator
  configs/READMEs are claims. G11/G12's audit verdicts ARE the gate records; no
  consumption of either donor before its verdict line lands. Same rule for any future
  built donor (hEχ/zeta23 Theorem-E included — see R8 §8 card 9's abort condition).

---

*Sources backing every line: `feasibility/iter4-donor-unblock-plan.md` §5/§8;
`feasibility/probe/{run_probe.sh,pilots/32→run_pilot.sh}` (patched 2026-11-16);
`feasibility/probe/{run_iter4_probe.sh,iter4_probe.py,gprobe.py,run_gprobe.sh}` and
`ProbeG{9,10}*.lean`; R6's `ProbeG{11,12}_*.lean` headers; encore mathlib checkout
(`Mathlib/NumberTheory/{Chebyshev.lean:70/:74,ArithmeticFunction/VonMangoldt.lean:66,
LSeries/PrimesInAP.lean,LSeries/Dirichlet.lean}`); upstream raw fetch 2026-11-16
(`PrimeNumberTheoremAnd/StrongPNT.lean`, toolchain v4.35.0); `RESUME-BRIEF-C2.md` §Protocol;
`qa/iter4-review/r5-iteration4-backlog.md` §14.*
