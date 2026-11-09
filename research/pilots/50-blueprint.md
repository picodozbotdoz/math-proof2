# Pilot blueprint — dossier 50 (quasi-rh-truncated-window-constants), survivor S1a

Lane R2, 2026-11-09. Mirrors `research/pilots/42-blueprint.md` §1–5 (R1's pattern; conditional-
binder convention). Scope: M1 = the conditional strip-confinement theorem proved sorry-free
**today** against mathlib v4.36.0-rc2 (encore checkout `ff2494ea`) with **zero ports**; M2 =
hypothesis-discharge plan; M3 = the S2 composite. Companion: `research/candidates/
50-quasi-rh-truncated-window-constants.md` (S1a = the pilot statement; the dossier's §"Why the
headline is dead" audit is why the pilot is S1a and not a constant-improvement claim).

---

## §1 Milestone plan

**Posture.** Everything conditional: the openai quasi-RH statement is ONE explicit binder
(hQRH, verbatim challenge form); every other input is either proved inline from mathlib or
(beyond M1) bound explicitly. M1 is unconditional-in-its-hypotheses: all inputs visible.

**Mathlib functional-equation inventory [VERIFIED this session, checkout `ff2494ea`]:
mathlib's FE is SUFFICIENT — no `hFE` binder is needed.**

| Decl | File:line | Form | Usable for the reflection? |
|---|---|---|---|
| `completedRiemannZeta` | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:68` | `Λ := completedHurwitzZetaEven 0` | indirect |
| `completedRiemannZeta₀_one_sub` | `:100` | `Λ₀ (1−s) = Λ₀ s` | needs Λ₀↔ζ zero transfer (poles 1/s, 1/(1−s)) |
| `completedRiemannZeta_one_sub` | `:106` | `Λ (1−s) = Λ s` | same; this is the form zeta23's seam uses (zeta23 `Statement/SeamClosed.lean:22`) |
| `completedRiemannZeta_eq` | `:85` | `Λ s = Λ₀ s − 1/s − 1/(1−s)` | the pole bookkeeping the Λ-route would need |
| **`riemannZeta_one_sub`** | **`:178`** | `riemannZeta (1−s) = 2·(2π)^(−s)·Γ(s)·cos(πs/2)·riemannZeta s`, hyps `∀ n:ℕ, s ≠ −n`, `s ≠ 1` | **YES, directly**: at a nontrivial zero ρ both hypotheses hold (0 < ρ.re), the RHS carries the factor `riemannZeta ρ = 0`, so `riemannZeta (1−ρ) = 0` — zeros propagate ρ ↦ 1−ρ with NO Γ-nonvanishing and NO conjugation symmetry needed |

Consequences for the pilot: (i) the reflection is a **proved ingredient** (like pilot 42's
`multOf_mul`), not a binder; (ii) the `1−ρ` form (not `1−ρ̄`) suffices because only real
parts enter (`(1−ρ).re = 1 − ρ.re`); the conj-symmetry lemma — the one piece zeta23 had to
prove internally (`RvM/MainTerm.lean` header: "Λ(conj s) = conj Λ(s)") — is never needed.

### M1 — conditional strip confinement (this run)

File `research/pilots/50/M1.lean`, namespace `CrossMath.Pilot50`:

| # | Decl | Kind | Content / provenance |
|---|---|---|---|
| 1 | `IsNontrivialZeroP50 ρ` | def | `riemannZeta ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1` — zeta23 `IsNontrivialZero` shape (zeta23 `Zeta23/Defs.lean`, per `research/survey/anthropics.md` §1.3); NOT imported (zeta23 is v4.33) |
| 2 | `strip_confinement` | thm | **Headline**: binder `hQRH : ∀ s : ℂ, (7/8:ℝ) < s.re → riemannZeta s ≠ 0` (verbatim body of openai `riemannZeta_ne_zero_of_seven_eighths_lt_re`, challenge file `lean/ComparatorChallenges/QuasiRiemannHypothesis.lean:5–7`; ports standalone per `research/feasibility/port-probe.md` §7.3 run 3) ⇒ every `IsNontrivialZeroP50 ρ` has `1/8 ≤ ρ.re ≤ 7/8`. Proof: right side = binder at ρ (contrapositive); left side = `riemannZeta_one_sub` at ρ (hyps discharged by `0 < ρ.re`), `mul_zero`, then binder at `1−ρ` whose real part is `1 − ρ.re > 7/8` |
| 3 | `strip_confinement_mem` | thm | mathlib-vocabulary form: `∀ z ∈ riemannZetaZeros` (`Mathlib/NumberTheory/LSeries/ZetaZeros.lean:33`, `mem_riemannZetaZeros :37`) with the strip conditions ⇒ box confinement |
| 4 | `strip_confinement_set` | thm | zeta23-window form: `(riemannZetaZeros ∩ {z | 0 < z.re ∧ z.re < 1}) ⊆ {z | 1/8 ≤ z.re ∧ z.re ≤ 7/8}` — the S1a "box-confinement" phrasing of the dossier |
| 5 | `#print axioms strip_confinement` | check | expected `[propext, Classical.choice, Quot.sound]`; read off the run log |

LoC estimate ~90–110 with provenance comments; proof load trivial (two `by_contra` +
`linarith` + one `rw [hzero, mul_zero]`).

### M2 — hypothesis discharge plan (scope-honest)

- **hQRH**: NOT pilot-scale. The openai library statement sits on ~0.5M LoC of OAI-internal
  dependencies (`port-probe.md` §7.2: `Nonvanishing.lean` closure = 2,924 files); only the
  sorry'd challenge form ports standalone (§7.3). Realistic routes: (a) keep hQRH a binder
  until an openai→v4.36 bulk port exists; (b) R9-style targeted port of the proof's top
  assembly only — days, not a pilot. **M1's conditional posture is the design, not a stopgap.**
- **hTZ (trivial-zero identification)** — flagged by R5 (analytic-nt.md §2(b)) and by the
  dossier's S1a note: needed only to DROP the strip conditions 0 < re < 1 (strengthening to
  "every zero of ζ is trivial or in the box"). Mathlib today: `riemannZetaZeros` discreteness
  (`ZetaZeros.lean:56`), RH definition excluding `s = −2(n+1)` (`RiemannZeta.lean:182–183`)
  but NO theorem placing the re ≤ 0 zeros. Candidate source: mathlib's Hurwitz-zeta special
  values (`Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean` per port-probe §1 note) +
  `riemannZeta_one_sub` again. Est. M–L; **M2 = attempt hTZ from mathlib; if it exceeds
  pilot scope, binder it and report** (the coordinator's standing instruction).
- **hQRHχ (Dirichlet family)**: same posture as hQRH with openai's
  `DirichletSevenEighths.lean` challenge form (§7.1 pattern) — mechanical extension of M1,
  needs a χ-version of the FE (`hurwitzZetaEven_one_sub` exists for the Hurwitz layer;
  Dirichlet L FE is NOT in mathlib — zeta23 ThmE has it internally). Binder-first.

### M3 — S2 composite (dossier S2)

Windowed-count phrasing over the box: with zeta23's A/D statements as binders (pilot 42's
`EpsLower` convention) + M1's `strip_confinement_set`, state "≥ 2−1/c₁*−ε of window zeros
simple-and-on-line AND all window zeros in the box [1/8, 7/8]×(T,2T]" — pure packaging over
42's `ZeroMult`/`EpsLower` layer (coordinate with R1 before building; avoid duplicating its
defs). ~120 LoC.

## §2 M1 file spec

Given verbatim as `research/pilots/50/M1.lean` (header carries the provenance table above).
Spec decisions: (i) binder name `hQRH` with the openai signature EXACTLY as the challenge
file states it, only ∀-wrapped; (ii) `IsNontrivialZeroP50` defined locally (zeta23 import
impossible across toolchains; defeq shape recorded in docstring); (iii) no `sorry`, no
`native_decide`, no `noncomputable` needed (all statements are Prop); (iv) three phrasings of
the same theorem (binder/mathlib-set/zeta23-window) so downstream lanes consume whichever
vocabulary they own.

## §3 Modal plan (consume crossmath-probe)

R9's infra unchanged: `lean_probe.py` (app `crossmath-probe`, ephemeral `modal run`, image =
elan v4.2.4 + `v4.36.0-rc2` + mathlib `ff2494ea` + cached oleans, cpu=4/32 GiB/2 h). Stage per
`run_probe.sh` pattern pointed at the pilot: `mkdir /tmp/crossmath-pilot50-stage; cp
lean_probe.py + M1.lean (as Pilot50_M1.lean); chmod -R a+rX; sudo -n -u xyz …/modal run
lean_probe.py --dir /tmp/crossmath-pilot50-stage`. Budget: warm container ~2 min + `import
Mathlib` olean load + elaboration of a ~100-LoC tactic-light file ≈ **2–4 min/iteration**;
expected ≤2 iterations (the only plausible friction: `Complex.neg_re`/`Complex.natCast_re`
simp-normalization in the `s ≠ −n` discharge, and `push_neg` shape on `1/8` literals).
Iteration cap: 4 (coordinator instruction); stop at the exact blocker if exceeded.

## §4 Risk register

1. **FE hypothesis discharge** (`∀ n : ℕ, ρ ≠ −n`): needs `(-(n:ℂ)).re = -n` normalization;
   mitigation `simp [Complex.neg_re, Complex.natCast_re]` then `linarith` on `0 < ρ.re`.
2. **`rw [hzero, mul_zero] at hFE`** — the RHS product chain must end in `riemannZeta ρ`
   syntactically (it does, RiemannZeta.lean:179); if `rw` also targets the LHS `riemannZeta
   (1−ρ)` it cannot (different term).
3. **`push_neg` on `¬(1/8 ≤ ρ.re)`** — yields `ρ.re < 1/8` (strict); `linarith` closes
   `7/8 < 1 − ρ.re` from it. If `push_neg` leaves `Ennn`-shaped negations, use `not_le` directly.
4. **Axiom surprise**: none expected — `riemannZeta_one_sub` is classical mathlib; if
   `#print axioms` shows anything beyond the standard three, record it in the run log
   (finding, not blocker).
5. **Staging/policy**: same as R9's runs (ephemeral `modal run` only; no volumes/secrets/
   deploys) — math-proof1 AGENTS.md policy, unchanged.

## §5 Sanity errand — decl-index cross-check

Confirm no prior `strip_confinement`-shaped declaration: `cut -f4 research/qa/decl-index.tsv
| grep -xF strip_confinement` → expected empty (done pre-run; result recorded in the log).

---

## §M1 run log

(appended after execution)

Executed 2026-11-09, lane R2. Infra: R9's `crossmath-probe` verbatim (`lean_probe.py`,
image elan v4.2.4 + `v4.36.0-rc2` + mathlib `ff2494ea`, 8710 cached oleans, cpu=4/32 GiB);
staging per `run_probe.sh` pattern at `/tmp/crossmath-pilot50-stage` (file uploaded as
`Pilot50_M1.lean`); invocation `sudo -n -u xyz …/xyzenv/bin/modal run lean_probe.py --dir
/tmp/crossmath-pilot50-stage` (ephemeral run only; no volumes/secrets/deploys).

| iter | Modal run URL | wall (approx.) | verdict | errors / sorry / warnings |
|---|---|---|---|---|
| 1 | modal.com/apps/donniexyz888/main/ap-77K4c2GD1gKGWRM84Wpj5i | ≈4 min (warm container + `import Mathlib` load + elaboration) | **OK** | 0 / 0 / 2 (both `push_neg` deprecation notices, v4.36 prefers `push Not`) |
| 2 | modal.com/apps/donniexyz888/main/ap-ogcHrPsYMUnSPLLc839H4b | ≈4 min | **OK** | 0 / 0 / 0 |

Errors+fixes: none mathematical. Only change between iterations: `push_neg at h` →
`push Not at h` at M1.lean:63,70 (deprecation hygiene). The §4 risk items never fired:
`riemannZeta_one_sub` hypotheses discharged first try (`simp` normalized `(-(n:ℂ)).re`),
`rw [hzero, mul_zero] at hFE` worked as scripted, `push` shapes were as expected.

**Verdict: GREEN** (iteration 2 = fully clean). `#print axioms strip_confinement`:
`[propext, Classical.choice, Quot.sound]` — the standard three only; no `sorryAx`, no
project axioms.

Deliverable: `research/pilots/50/M1.lean`, 94 LoC (incl. provenance header), namespace
`CrossMath.Pilot50`, three statements (`strip_confinement`, `strip_confinement_mem`,
`strip_confinement_set`) + the axioms check. Binders actually needed: **hQRH only** —
mathlib's FE (`riemannZeta_one_sub`, RiemannZeta.lean:178) discharged the reflection inline,
so the planned `hFE` binder was unnecessary (blueprint §1 inventory, confirmed by execution);
`hTZ` was not needed because S1a carries the strip conditions in the nontrivial-zero
predicate (dropping them is M2's hTZ scope).

§5 sanity errand (pre-run): `cut -f4 research/qa/decl-index.tsv | grep -xF strip_confinement`
→ empty; substring probe `strip_confine` → empty. Name-layer is novel across all four corpora.

---

## §M2a addendum — Dirichlet binder shell (`research/pilots/50/Dirichlet.lean`)

Executed 2026-11-09, lane R2 (same session as M1). Statement: strip confinement for primitive
χ (`1/8 ≤ Re ρ ≤ 7/8` for every zero of `DirichletCharacter.LFunction χ` in the open strip)
over TWO binders: `hQRHχ` (openai `DirichletSevenEighths.lean:8–13` verbatim — imports only
Mathlib, extractable standalone per port-probe §7) and `hFEχ` (FE reflection ρ ↦ 1−ρ across
χ → χ⁻¹, zeros only, primitive χ).

**Mathlib FE inventory result (the discovery-adjacent API gap, [VERIFIED]):** mathlib HAS the
Dirichlet functional equation — `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`
(`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291`:
`completedLFunction χ (1−s) = N^(s−1/2) · rootNumber χ · completedLFunction χ⁻¹ s`) — but has
NO zero-propagation consequence at the `LFunction` level: the completed↔raw transfer exists
only as Γℝ-division lemmas (`ZMod.lean:50–51` docstring; parity-split), and there is NO
product-form analogue of `riemannZeta_one_sub` (`RiemannZeta.lean:178`). Missing decl name
for the final report: **`DirichletCharacter.LFunction_one_sub`** (a product-form Dirichlet FE
`LFunction χ⁻¹ (1−s) = c(χ,s) · LFunction χ s`, nonzero prefactor). With it, `hFEχ` would
discharge inline exactly as M1's reflection did — the shell's proof skeleton is identical to
M1's (right half = binder at ρ; left half = binder at 1−ρ for χ⁻¹; pole exclusions from
`ρ ≠ 0, 1`). Scope honesty: imprimitive χ omitted (Euler-factor bookkeeping, the paper's own
route); χ⁻¹ (not χ̄) is the FE's natural partner and needs no conjugation API.

Run record: elaborated in the combined Modal run of pilot 52 (see run log below; file staged
as `Pilot50_Dirichlet.lean`).

### §M2a run record

Executed in the combined Modal runs of pilot 52 (`/tmp/pilot52_run*.log`, staged as
`Pilot50_Dirichlet.lean`): iter 1 (ap-2sb6…, 4 errors: missing χ/ρ positional args, gone
`sub_eq_self_iff`, `hp.2`-backwards), iter 2 (ap-LRwk…, NeZero-synthesis in nested binders),
iter 3+ (ap-ogcH…-successors): **OK — 0 errors, 0 sorry, 0 warnings**;
`#print axioms strip_confinement_dirichlet` = `[propext, Classical.choice, Quot.sound]`.
Binder deltas recorded in the file header: openai's `[NeZero q]` nested-in-hypothesis form is
not elaborable (class synthesis does not consult ∀-nested instance binders during
binder-type elaboration — a v4.36 finding worth the final report), so `hQRHχ`/`hFEχ` carry
`(inst : NeZero q)` explicitly with `@`-applied `LFunction`. Elaborated ≈4 min/iter warm.
