# Round-6 — Iteration-5 standing-clocks sweep #1 (R9, unit 3)

Lane R9 (novelty/prior-art), 2026-11-19. Unit: tick every clock in the charter's
standing-clocks row (§4 rung 3; registry lineage `qa/REPORT-INPUTS-ITER4.md:69` "clocks"
row + `al-3d-prework.md:298` challenge-repo definition). Convention per debt h: every
claim dated; each verdict FIRED / SILENT (+ content-variant for tick-moved/no-new-content)
with consequence-if-fired. All fetches this session (2026-11-19, 11:20–11:40Z window
unless noted). Siblings read-only; no Modal.

**Sweep verdict line: 1 clock FIRED — the mathlib PNT clock (weak PNT is now on mathlib
master via PR #43238/Bors, exactly one file beyond our pin); 6 SILENT (tracker, Liu-2,
WenrongZou, LP/Cone, AreaLaw2D challenge repo, QR-D consumers); physlib tick-moved but
content-silent (the wing re-sweep held, already recorded in round6-77); one adjacent
new-entry note (Chang–Wang 2611.00924).**

| clock | tick (2026-11-19) | verdict | consequence-if-fired |
|---|---|---|---|
| **QuasiRiemannTracker** (`gtimg.github.io/QuasiRiemannTracker/bound-badge.json`, fetched live) | "best verified bound θ ≤ 0.873345856106…" | **SILENT** — identical to the 2026-11-16 record (`iter4-external-priorart.md` §2.3) | a drop in θ would update article-50's honest frontier line + the Liu-B♭/B_new informal-vs-formal gap table; none occurred |
| **Liu-2** (arXiv:2610.26835) | arXiv feed (2026-11-19T11:30:06Z): `2610.26835v2`, updated 2026-10-29 — **no v3** | **SILENT** (same v2 this lane read in full on 2026-11-19, `round6-n2-p3-priorart.md` row 6) | a v3 with the announced in-progress Lean formalization (the [Liu26b]/[CTLean]-based build) would become the C3-clock's third-party formal Hecke layer — none landed |
| **WenrongZou** (github.com/WenrongZou/TateThesis) | `pushed_at = 2026-11-12T20:45:09Z`; still 4 commits ("First commit"/update/fix/README), size 8 KB | **SILENT** — matches the 2026-11-16 census ("4 commits, PhD project, in progress"); nothing since | dossier 73's softened "no competing formalization" stands; substantial pushes would re-open it |
| **physlib pushed_at + wing sweep** | `pushed_at = 2026-11-19T11:23:12Z` (moved from the 2026-11-18T13:00:37Z end-tick); wing re-swept at source THIS session (`round6-77-wick-novelty.md` §0): equal-statistics lemmas confirmed, **0 Clifford/quadratic content, no {a,a†} operator equation, no finite Fock-matrix/occupation layer**; `WickAlgebra/Grading.lean` = statistic grading, not occupation blocks | **TICK-MOVED / CONTENT-SILENT** (the standing FIRED-PARTIALLY state from the 2026-11-17/18 event is unchanged and already consumed) | the round6-77 collapse trigger ({a,a†} + Clifford landing) has not fired; T1-core differentiation holds at the current tick |
| **mathlib PNT PRs** (the dossier-22 Tier-1 race; FB-2 substrate adjacency) | gh API, mathlib4 master: **PR #43238 "[Merged by Bors] feat(NumberTheory/LSeries): the (weak) prime number theorem"** — closed 2026-11-11T18:29:56Z, bors-landed (API `merged:false` is the bors-workflow artifact); master tree now carries **`Mathlib/NumberTheory/LSeries/WeakPNT.lean`** — verified present on master, ABSENT from our pin (encore ff2494ea already carries the other new-wing files: WienerIkehara/ZetaZeros/PrimesInAP/RiemannZetaLogDeriv/Injectivity; the pin-delta is exactly WeakPNT.lean). Mertens PRs **#41394 / #44062 still OPEN** (no Mertens files on master) | **FIRED** | (a) dossier-22 / CLAIMS-REGISTER row 22: "Tier-1 … strategically ceded" has MATERIALIZED — the weak PNT is in mathlib proper; any 22-v2/derivative article must cite mathlib's WeakPNT as the Tier-1 holder (R8-lineage/H consume at the next claims pass); (b) FB-2 substrate note: a native weak-PNT layer now exists ONE FILE beyond our pin — a pin-bump decision sits above this lane; the FB-2/T2-ignition gate itself is UNAFFECTED (its trigger is an FB-2 charter, not this PR); (c) the round-3 "Tier-1 urgency vs IEANTN" race is resolved by mathlib proper |
| **mathlib LP/Cone clock** (`lp-duality-bridge.md:68`) | `Analysis/Convex/Cone/Basic.lean` on master still carries the TODO block (:31 section, :76 `ConvexConeClass` TODO) | **SILENT** — the duality-contribution slot remains open | a landed separation/duality PR would collapse the LP layer's first-mathlib-native claim; none |
| **AreaLaw2D challenge repo** (github.com/AxiomMath/AreaLaw2D; the "donor or a contestant may land B.2–B.5 first" clock) | remote `pushed_at = 2026-11-09T19:05:50Z` — last activity = PR #1 `ruiz/v2-merge` (2026-11-09), which PREDATES our 2026-11-13 clone/bump `c0f6d96` (our local HEAD is our own pin commit atop the merged state) | **SILENT** — no B.2–B.5 landings by donor or contestants since registration | a donor/contestant B-rung landing would preempt the AL-3D rebuild ladder; none |
| **QR-D race consumers** (charter §4 rung 3) | arXiv feed (2026-11-19T11:30Z): Bhargava–Vemulapalli 2611.09031 **v1** (2026-11-06); Baldwin–Sivek 2611.06705 **v1** (2026-11-04, "3-manifold decision problems and Riemann hypotheses"); Cao–Gao–Huang–Nie 2610.37179 **v1** (2026-10-27); Frei–Sofos–Widmer 2610.18491 **v2** (2026-10-14) — no version movement on any | **SILENT** (all four at their registered states) | none fired; a v2 on 2611.09031/2611.06705 (the two November entries) is the highest-watch pair — re-check at sweep #2 |

**Adjacent new-entry note (not a registered clock):** the QR-D zero-free cluster gained a
new member since registration — **Chang–Wang arXiv:2611.00924** ("An exhaustion-aware
product moment and zero-free half-planes for Hecke L-functions", Nov 2026; id pinned via
arXiv API this session, tabled at `round6-n2-p3-priorart.md` row 7). Zero-free-axis only;
no proportion/assembly content; suggest adding to the standing list at the next registry
refresh (H/orchestrator own the registry row).

— lane R9 (worktree agent-09), 2026-11-19. Fetches: tracker badge curl; arXiv API
(`export.arxiv.org`, https) for {2610.26835, 2611.09031, 2611.06705, 2610.37179,
2610.18491}; gh API for WenrongZou/TateThesis, AxiomMath/AreaLaw2D,
leanprover-community/mathlib4 (PRs 41394/44062/43238 + master tree + Cone file). No
commits (hold for the H batch).

---

## ADDENDUM 2026-11-19 (post-sweep) — PIN RULING recorded + WeakPNT content precision

**Orchestrator pin ruling (relay, 2026-11-19, verbatim):** "mathlib pin STAYS at ff2494ea
— WeakPNT.lean (#43238, master 2026-11-11) is one file beyond pin; a bump would invalidate
every warm cache + donor build across the ecosystem; the FB-2/T2-ignition gate is
unaffected. WeakPNT = external-math citation class (PNT+ DEFER-watchlist convention)."
The sweep table's "pin-bump decision sits above this lane" line is thereby RESOLVED:
no bump. Content precision (gh raw read, this date): `WeakPNT.lean` on master carries not
just the weak PNT but the **arithmetic-progression forms** — `Chebyshev.isEquivalent_psi_id`
(ψ x ~ x, Tier-1a's exact shape), `Nat.isEquivalent_primeCounting` (π x ~ x/log x),
`Nat.isEquivalent_card_prime_modEq` + `ArithmeticFunction.vonMangoldt.
tendsto_sum_modEq_div_atTop` (PNT-AP, both forms) — all deduced from
`WienerIkehara.tendsto_sum_div`. FB-2 note upgraded accordingly: master carries the WEAK
PNT-AP; FB-2's target (error-term class x^{7/8+δ}) is NOT preempted, and the weak-PNT-AP
substrate enters FB-2's citation block at charter time. The dossier-22/CLAIMS/VERDICTS
amendment drafts ride the same H batch: `round6-22-tier1-amendment.md`.

— addendum R9, 2026-11-19 (same hold).

---

## REGISTRY ROW (applied 2026-11-19, R9, per the unit-5 re-task) — Chang–Wang watch entry

The registry file this row belongs to inside `novelty/` is THIS sweep record (the iter-5
standing-clocks registry's live carrier; the charter §4-rung-3 / RESEARCH.md typeset
insertion remains a one-line H action per the unit-4 draft's own routing —
`round6-22-tier1-amendment.md` §2). Row text (registry-format):

| clock | identity | axis | cadence/notes |
|---|---|---|---|
| **Chang–Wang** (registry addition 2026-11-19) | arXiv:2611.00924, "An exhaustion-aware product moment and zero-free half-planes for Hecke L-functions" (Nov 2026; id pinned via arXiv API this session) | QR-D cluster, ZERO-FREE axis only (with 2610.12234 / 2610.26835 / 2610.15291) — NO proportion/assembly content (`round6-clocks-iter5-s1` §sweep + `round6-n2-p3-priorart.md` row 7) | watch with the QR-D race consumers; highest-watch pair remains 2611.09031 / 2611.06705 |

— registry row R9, 2026-11-19 (same hold).
