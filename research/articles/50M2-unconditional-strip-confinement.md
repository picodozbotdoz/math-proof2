# Unconditional Strip Confinement for ζ and Dirichlet L: Discharging the hQRH Binder

*cross-math-fronttier research article 50-M2 (Cycle 2) · DRAFT 2026-11-14 · grows
article 50 (main run, Part II: binder-conditional strip confinement) and dossier 70
(`70-unconditional-zetaK-zero-confinement.md`, Part A) · spec `research/pilots/
50-M2-31-32-spec.md` · pilot 50's proved shell `research/pilots/50/{M1,Dirichlet}.lean`*

**Status: DRAFT — route decision pending.** The pilot has not launched at draft time; the
preferred route R1 is gated on the G7b axiom audit at the donor pin ([G7b]), and the
landing verdict slot is [VERDICT:50-M2-R1]. Everything decided — the parametric theorem
statements, the three-route discharge map, the G1b build verdict, and the Liu-1
constant-story audit — is written out below; only the executed-run paragraphs carry
slots.

---

## Abstract

Pilot 50 (main run) proved, kernel-verified, that a zero-free half-plane input "ζ ≠ 0 for
Re s > θ (s ≠ 1)" yields two-sided strip confinement of every nontrivial zero to
[1−θ, θ] — with the half-plane input left as the `hQRH` binder at θ = 7/8. The binder is
TRUE informally (Liu arXiv:2610.12234 Cor 14.1 transfers zero-freeness at 0.8749570 to
every Dirichlet L including ζ), but no formal discharge existed on our pin. Cycle 2 maps
and prices every discharge route. **R1 (preferred):** openai-math's own in-corpus tree
PROVES the ζ/Dirichlet 7/8 statements now (`OAI/NumberTheory/DirichletL/
Nonvanishing.lean:19/:29`) — the blocker was always the 2,924-file port, never
existence; an in-corpus statement binder or targeted extraction discharges pilot 50's
literal 7/8 shell with zero constant degradation. **R2:** AxiomMath DZDF's
Cureton–Thorner theorem gives 31/32 for every number field — strictly weaker than 7/8,
so it discharges the *weakened* binders (strip [1/32, 31/32]), unconditionally; probe G1b
showed the direct DZDF build FAILS on our pin (62 errors / 11 vendored-CFT modules),
fixing R2 as statement-level. **R3:** Liu-1's external Lean repo formalizes
B_new = 0.8749570 with exact-arithmetic certificates; our hygiene sweep resolved its
constant story (below) and R3 runs as a statement-binder at the proved rational
B_r = 34999/40000. Whichever route lands, the pilot's theorems re-instantiate at the
route's constant with zero new proofs — the parametric θ-statement is the design that
makes the cluster clock harmless.

## 1. Introduction

The main run left a clean conditional artifact: pilot 50's `strip_confinement`
(`M1.lean:44/:75/:85`) and `strip_confinement_dirichlet` (`Dirichlet.lean:40`), proved
with the zero-free input as an explicit Prop binder. Cycle 2's donor registration turned
the binder into a three-route decision problem, and the surrounding 2026 quasi-RH cluster
(six-plus papers in six weeks; dossier 70's clock-sweep standing notes: Liu-1, Liu-2
B♭ = 0.8748866 uniform, Chang–Wang 2611.00924 conditionally at 0.8744620, Ji 2611.16665
quartic 599/600, a 13-repo Lean ecosystem — and the GTimG/QuasiRiemannTracker, audited
2026-11-14: **tri-kernel verified** (Lean + NanoDa + con-ron replay, triad axioms, per
round-4 §9), Dirichlet-only, with the **formal Dirichlet frontier now at 0.8733458561**
(Bebel, continuum-anchor, 11-13) — below even Chang–Wang's conditional 0.87446205) made
dating every claim mandatory. This
article records the discharge map and its two settled verdicts (G1b, the Liu-1 constant
audit), states the theorems at their honest per-class strength, and leaves the R1 landing
slot open.

**Honesty (per-class, per dossier 70's A5-confirmed split).** For ζ/Dirichlet at
7/8-or-better, **no "first" is claimed**: the openai tree proves 7/8 in-corpus, Liu-1's
repo formalizes 34999/40000 (with the tracker independently replaying the exact
algebraic B_new = (1507−2√921)/1653 on its own vendored tree), Kontorovich/quasi-rh
README-claims 11/12, and the tracker's verified catalogue carries the class frontier at
0.8733458561 — this article's
value there is the posture upgrade (conditional shell → unconditional landing) and the
discharge engineering, not discovery. For ζ_K and Hecke-all-K, the two-sided strip at
31/32 is the first formal ζ_K zero-location statement anywhere (the 13-repo sweep AND
the 2026-11-14 tracker audit found no ζ_K artifact — the tracker is Dirichlet-only at
every layer, its sole ζ_K-adjacent declaration being an Euler-product identity for one
fixed cubic field, `DyadicColumns.lean:245`) — an
ECOSYSTEM/GLUE-grade first, on the Liu-2 clock (the strip widens to [1−B♭, B♭] the day
his Lean lands; absorbed by the parametric statement).

## 2. Setting

Pilot 50's proved shell, verbatim vocabulary: `IsNontrivialZeroP50` (`M1.lean:33`),
`strip_confinement` (:44) and set/window forms (:75, :85) — all parameterized in the
binder's constant θ; the Dirichlet shell (`Dirichlet.lean:40–46`) with the reflection
input `hFEχ` (mathlib lacks the product-form Dirichlet FE — pilot 50 M2a's one-decl
finding, `DirichletCharacter.LFunction_one_sub`; it stays a binder in every route).
Route donors: R1 `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19/:29`
(`DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re` and the ζ instance);
R2 DZDF `dedekindZeta_ne_zero` (`DedekindZetaZeroFree/Main.lean:9`) + `heckeL_ne_zero`
(`HeckeCorollary.lean:12`); R3 the external repo's `CombinedPaperVerification` headlines
at `B_r = 34999/40000` (`CombinedPaperVerification.lean:16`).

## 3. Main results (the landing targets, parametric in θ)

**(P) ζ, unconditional.** Every nontrivial zero ρ of `riemannZeta` satisfies
1−θ ≤ Re ρ ≤ θ — with θ = 7/8 under R1, θ = 34999/40000 under R3. Right half: the
route's zero-free statement. Left half: `riemannZeta_one_sub` (`RiemannZeta.lean:178`) —
proved, never a binder.

**(C1) Dirichlet L, one binder left.** For every Dirichlet character χ mod q: same strip
for L(·, χ)'s non-pole zeros, conditional only on `hFEχ`.

**(C2/C3) ζ_K and Hecke L at 31/32 (R2's own family).** Totally complex K: two-sided
strip for every CT continuation of ζ_K via DZDF's Hecke functional equation at the
trivial character (zero binders); primitive finite-order χ: same via the nonprincipal FE
and the conjugate character. **(C4)** every K: one-sided floor Re ρ ≤ 31/32 (CT alone).

**Glue (the K = ℚ dictionary, shared with dossier 70/75).** (i) ℤ-ideal collapse:
`NumberField.dedekindZeta ℚ s = LSeries (fun _ => 1) s` (fiber-by-norm count = 1);
(ii) `zeta_eq_tsum_one_div_nat_cpow` (`RiemannZeta.lean:207`); (iii) identity-theorem
transfer off the half-plane (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, the
DZDF-internal route, z₀ = 2). For C1, the Dirichlet ↔ `RayClassCharacter ℚ (q)`
dictionary (narrow ray class group of ℚ mod q ≅ (ℤ/q)ˆ; total positivity kills the
sign).

## 4. The three routes — decided state

**R2 (settled: statement-level).** Probe G1b (`research/feasibility/
axiommath-donor-probes.md` §G1b): direct DZDF build on our pin **FAIL** — lake scheduled
the full 29,261-job closure and broke at the vendored class-field-theory tree (62 unique
errors / 11 modules). DZDF is a statement-level donor; the Challenge statements elaborate
clean (`axiommath-bump/logs/run1.log`). R2's binders quote the CT statements (already
elaboration-validated); no import.

**R3 (settled: constant story resolved, statement-binder only).** The liubaiying101
repo's README constant 0.874957069799 IS Lean's `B_new = (1507 − 2√921)/1653` exactly
(`CombinedPaperVerification.lean:19` — the ~5e-10 delta was the paper's decimal); the
public entry deliberately uses the weakened exact rational `B_r = 34999/40000` (:16),
with `boundary_order : B_new < B_r ∧ B_r < 7/8` PROVED (:44) and the headline theorems
consuming B_r (:103). Full-tree hygiene (A1's sweep, `research/novelty/
liu1-hygiene-sweep.md`): 0 sorry, 0 axiom declarations, 22/22 expected names, triad-clean
by construction. Replay caveat: no `vendor/` ships — `verify.py` needs manual population
of 2,925 `vendor/OAI` modules at openai/math `adc7f124` (closure manifest pins them).
Refinement (tracker audit, round-4 §9): the QuasiRiemannTracker independently replayed
the EXACT algebraic bound (1507−2√921)/1653 on its own vendored tree ("proved in Lean",
entry `liu-20261008`) — third-party kernel-grade confirmation one tier above the public
entry's B_r. R3 therefore runs as a statement-binder quoting the B_r headlines — no
portability probe needed for the landing, one optional for the literal-7/8 question.

**R1 (preferred; gated).** The openai tree proves the 7/8 ζ/Dirichlet statements NOW
(`Nonvanishing.lean:19/:29`; A5's audit + `novelty/liu1-as-donor.md` §4). Gate: **[G7b]**
— the donor-pin axiom audit of those two theorems (run16, died in the outage, re-queued;
this is the gate for R1's kernel-facing hygiene claim). Landing: [VERDICT:50-M2-R1].

## 5. Formal verification

**Landed (evidence):** pilot 50's M1/Dirichlet shells GREEN + triad (main run,
`axcheck-final.log`); DZDF Challenge statements elaborate on-pin (bump run 1); G1b
verdict (above); Liu-1 hygiene sweep (above); G7 pins the external repo's exact pins.

**Pending (slots):** [G7b] (donor-pin axiom audit of the OAI 7/8 theorems);
[VERDICT:50-M2-R1] (route R1 executed: runs, LoC, thm count, axcheck, GREEN/FAIL);
final per-class constants line (fills from whichever route(s) land).

## 6. Relation to prior work

- **Article 50** (main run): Part I (zero-free regions cannot move certificate
  constants) + the conditional shell this article discharges.
- **Dossier 70 Part A** (Cycle 2): the full statement set + per-class novelty split +
  clock-sweep standing notes (Chang–Wang conditional frontier; Ji; the 13-repo Lean
  landscape incl. Kontorovich/quasi-rh 11/12 ζ+Dirichlet with NO ζ_K; tracker audit
  pending) — the cluster context is recorded there and controls every dating claim here.
- **Liu arXiv:2610.12234** (+ repo), **Liu arXiv:2610.26835** (B♭ uniform, Lean in
  progress), **Xu–Sang 2610.15291**, **[Ope26a/b]** (7/8, 11/12 preprints + sorry
  challenge), **CT hexagonmath 2610.00200** (= our DZDF donor), **Chang–Wang
  arXiv:2611.00924** (conditional-only sub-B♭), **Ji arXiv:2611.16665** (599/600,
  ℚ(i), no frontier move), **GTimG/QuasiRiemannTracker** (audited 2026-11-14, round-4
  §9: tri-kernel verified, Dirichlet-only, formal frontier 0.8733458561 = Bebel's
  continuum-anchor of 11-13 — the leapfrog fact of the race): the cluster — nothing
  below B♭ unconditionally; nothing formal for ζ_K.
- Classical anchors: Hadamard–de la Vallée Poussin (σ ≥ 1 − c/log|t| confines zeros left
  of any fixed 31/32-type line for large |t|; Broughan 2009) — Part A's ζ/Dirichlet
  statements are math-known, strictly weaker than HdV for large |t|; the packaging (a
  fixed uniform strip, all zeros, formal, binder-free) is the deliverable.

## 7. Limitations and open problems

- `hFEχ` survives every route (the one-decl donation `LFunction_one_sub` would kill it —
  flagged, not built).
- The two-sided ζ_K strip stays totally-complex-only (DZDF's FE restriction; real places
  need Γℝ factors — open seam, donation-grade).
- The clock: Liu-2's Lean landing parametrically supersedes the 31/32 instantiation;
  a validated Chang–Wang would move the informal-only frontier (both absorbed by the
  θ-statement; the dossier-70 standing notes carry the revisit triggers).

## References

- `research/candidates/70-unconditional-zetaK-zero-confinement.md` (Part A + standing
  notes); `research/pilots/50-M2-31-32-spec.md`; `research/pilots/50/` (M1, Dirichlet);
  article 50. axiommath `DedekindZetaZeroFree` (`Main.lean:9`, `HeckeCorollary.lean:12`,
  `Challenge/DedekindZetaChallenge.lean:30–34`). openai-math
  `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19/:29`.
  github.com/liubaiying101/Slightly-improved-zero-free-half-planes-for-the-quasi-Riemann-hypothesis
  (`CombinedPaperVerification.lean:16,19,44,103`; `research/novelty/liu1-hygiene-sweep.md`).
  `research/feasibility/axiommath-donor-probes.md` §G1b/§G7. Liu arXiv:2610.12234,
  arXiv:2610.26835; Xu–Sang arXiv:2610.15291; Chang–Wang arXiv:2611.00924; Ji
  arXiv:2611.16665; CT hexagonmath 2610.00200; Broughan 2009.
