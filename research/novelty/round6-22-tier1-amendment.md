# Round-6 — drafts for H: dossier-22/CLAIMS Tier-1-ceded amendment + Chang–Wang registry row (R9, unit 4)

Lane R9 (worktree agent-09), 2026-11-19, on orchestrator approval ("both ride H's next
batch"). Two paste-ready drafts, exact-source-dated. **PIN RULING (recorded verbatim per
the relay): mathlib pin STAYS at `ff2494ea` — `WeakPNT.lean` (#43238, master 2026-11-11)
is one file beyond pin; a bump would invalidate every warm cache + donor build across the
ecosystem; the FB-2/T2-ignition gate is unaffected. WeakPNT = external-math citation
class (PNT+ DEFER-watchlist convention).** This file drafts only; H applies to the owners'
files (dossier 22 = R-lineage; CLAIMS-REGISTER/VERDICTS = R8-lineage; registry = charter
typeset).

## 0. Source facts the drafts cite (all verified this session, 2026-11-19)

- **PR #43238** "[Merged by Bors] feat(NumberTheory/LSeries): the (weak) prime number
  theorem" — closed 2026-11-11T18:29:56Z, bors-landed on mathlib master (API `merged:false`
  is the bors artifact; the content is on master's tree).
- **`Mathlib/NumberTheory/LSeries/WeakPNT.lean` on master** (read via gh raw): deduces PNT
  from `WienerIkehara.tendsto_sum_div`; headline decls — `ArithmeticFunction.vonMangoldt.
  tendsto_sum_residueClass_div_atTop` + `tendsto_sum_modEq_div_atTop` (**PNT in arithmetic
  progressions**, von Mangoldt form), `Chebyshev.isEquivalent_psi_id` (**the ψ-form PNT,
  ψ x ~ x** — Tier-1a's exact shape), `Nat.isEquivalent_primeCounting` (π x ~ x/log x),
  `Nat.isEquivalent_card_prime_modEq` (**PNT-AP**, π-form). ABSENT at our pin
  `ff2494ea` (pin-delta = exactly this file; the pin already carries WienerIkehara.lean,
  which the file consumes).
- **Our pilot-22 M4** (dossier :308, R3-appended 2026-11-09): `tendsto_psi_div_atTop`
  (= Tier-1a verbatim, ψ-form), sorry-free, triad-clean, at `ff2494ea`, via
  `WienerIkehara.tendsto_sum_range_div` — **Wiener–Ikehara's first consumer**, proved
  in-project 2026-11-09, i.e. TWO DAYS BEFORE the upstream bors merge.

## 1. DRAFT (a) — dossier-22 / CLAIMS-REGISTER / VERDICTS Tier-1-ceded amendment

### 1.1 dossier-22 (`candidates/22-quasi-rh-pnt-effective.md`) — dated erratum block,
paste after the "Pilot outcome" block (§F5's upstream-race line :231–236 stays as history):

> **[ERRATUM 2026-11-19, lane R9 draft / H apply — the §F5 upstream race RESOLVED.**
> mathlib PR #43238 (weak PNT) was bors-merged to master 2026-11-11:
> `Mathlib/NumberTheory/LSeries/WeakPNT.lean` carries `Chebyshev.isEquivalent_psi_id`
> (ψ x ~ x — Tier-1a's exact form), the π-forms, AND the arithmetic-progression forms
> (`Nat.isEquivalent_card_prime_modEq`, vonMangoldt `tendsto_sum_modEq_div_atTop`).
> Timeline precision: our M4 proved Tier-1a in-project on 2026-11-09 (two days earlier,
> sorry-free at ff2494ea, Wiener–Ikehara's first consumer) — the in-project result
> stands as executed; the ECOSYSTEM-priority claim ("mathlib's first PNT") is now
> SUPERSEDED by the upstream landing. Pin ruling 2026-11-19: pin STAYS ff2494ea;
> WeakPNT is external-math citation class (PNT+ DEFER-watchlist convention), absent at
> our pin. Consequences: (i) M5/M6 stay skipped, permanently justified; (ii) any 22-v2 /
> T2a consumer cites mathlib's WeakPNT as the Tier-1 upstream holder alongside our M4
> execution record; (iii) FB-2 note: master now carries the WEAK PNT-AP — FB-2's target
> is the ERROR-TERM class (x^{7/8+δ}, explicit-formula), so no preemption, but the
> weak-PNT-AP substrate enters FB-2's citation block at charter time. — end erratum.]

### 1.2 CLAIMS-REGISTER row 22 — replacement text (the claim sentence only; verdict/
prior-art columns updated in place):

> We prove ψ(x) = x + O(x^{7/8+ε}) conditional on openai's quasi-RH zero-free strip —
> an effective PNT-class error term beyond anything upstream; Tier-1 has LANDED UPSTREAM
> (mathlib PR #43238, bors 2026-11-11, `WeakPNT.lean`: ψ-form + π-form + PNT-AP — absent
> at our pin per the 2026-11-19 pin ruling, external-math citation class), superseding
> the "first ψ∼x" priority claim; our M4 (2026-11-09, Tier-1a, triad-clean, on-pin)
> stands as the in-project execution + Wiener–Ikehara's first consumer.

### 1.3 VERDICTS row 22 — risk-tier cell delta (one-line replacement):

> **WARM→HOT → RESOLVED-LANDED** (the #43238 watch fired 2026-11-11; Tier-1 upstream,
> Tier 2 = the remaining content, untouched by upstream)

## 2. DRAFT (b) — Chang–Wang registry row (standing-clocks registry refresh)

Paste into the iter-5 charter's standing-clocks list (§4 rung 3) at H's next typeset
touch, and mirror in the `REPORT-INPUTS`-lineage clocks row at the next registry roll:

> Chang–Wang arXiv:2611.00924 (Nov 2026; id pinned via arXiv API 2026-11-19) — "An
> exhaustion-aware product moment and zero-free half-planes for Hecke L-functions":
> QR-D-cluster zero-free-axis entry (with 2610.12234/2610.26835/2610.15291); NO
> proportion/assembly content (round6-clocks-iter5-s1 + round6-n2-p3-priorart row 7);
> watch cadence = the QR-D race consumers' (v2-highest-watch pair remains
> 2611.09031/2611.06705).

## 3. Also stamped this session (my files, no H action needed)

- `round6-clocks-iter5-s1.md` gains a dated addendum recording the PIN RULING verbatim
  and the WeakPNT content precision (PNT-AP forms included — the sweep's one-line
  "weak PNT" now carries the full headline-decl list).

— lane R9, 2026-11-19. Drafts only; owners' files untouched; no commits (H batch).
