# Knausgård as donor — forensic assessment

Lane R8, 2026-11-09. Companion to `round-3.md` §T (threat) — this file mines the *silver lining*:
whether `kristianmk/839` can accelerate our conditional pilots. All evidence from GitHub raw/API
inspections this session (no clone needed); paper 2 = arXiv:2610.08965 (+alphaXiv mirror),
repo = github.com/kristianmk/839, last push 2026-10-09.

## 1. Repo forensics

### (a) Toolchain and layout

No standalone `lean-toolchain`: the repo is a **drop-in extension of the anthropics formal-math
tree** — `lean/lakefile.additions.toml` is explicitly "Additions to zeta23/lakefile.toml"; the
build layout is zeta23 @ `fbdc36bb…` + `lean/upstream_relax.patch` + his `lean/` libraries.
Toolchain therefore **zeta23's: Lean v4.33.0-rc2, Mathlib `51e6992e`** (README, verified vs
survey §0). License: **MIT for his additions** (`/LICENSE`); patched zeta23 files remain
Apache-2.0 (`lean/LICENSE`, `lean/NOTICE`, patch header). Donor-friendly.

### (b) The patch, the six theorems, consumption, axioms

**`upstream_relax.patch`** (560 lines, 14 files, dated 2026-10-02): relaxes exactly two lower
bounds inside zeta23's five hypothesis-collection propositions — `LocalHypsCore`,
`LocalHypsCoreW`, `AdmFamily`, `WindowZeroSide`, `FactsXi`: **`b ≥ 1/2 → b ≥ 1/8`** and
**`a ≥ 1/2 → a ≥ 1/4`** ("any fixed positive lower bound suffices for every positivity/division
use … 1/8 admits rescaled windows"). Patch header: "No definition of a mathematical object is
changed, no axiom and no unproved statement is added, and the library's Challenge.lean,
ChallengeDeps.lean and Solution.lean are not touched." → **zeta23's submitted theorems remain
proved verbatim inside his build**; theorems over the five propositions become *stronger*.

**The six Mathlib-only theorems** (Challenge*.lean, sorry-by-design; Solutions proved):
`distinct_zeros_839` (N_d/N ≥ 1645064/1960733 = 0.8390045, cumulative (0,T]),
`simple_zeros_678` (≥ 0.6780091), `simple_critical_zeros_673` (N₀ˢ/N ≥ 1669159/2478195 =
0.6735382), `average_simple_and_critical_8367` (≥ 0.8367691), `simple_or_critical_8891/8893`
(≥ 0.8891609 / 0.8893150). Plus six **ceilings** (`Ceilings/`, paper Props 7.2–7.3):
`ceiling_range6/8/10/all` and `ceiling_line_range7/all`.

**Consumption of zeta23** (Solution839.lean header + README): the counting functions are
"character-for-character the definitions … of the library (`Zeta23.Ncount`, `Zeta23.Ndist`)",
with `Nsimple_eq_library … := rfl` bridges; `Window/` proves `admWindow_vProf` ("the window
lies in the window class of zeta23"); `ZetaMoments/` consumes the library's zeta-operator
moments. I.e. his theorems are stated over zeta23's own counting conventions — **drop-in
comparable with zeta23's submitted statements**.

**Axiom status** (`lean/axioms.txt`, run 2026-10-06): every *headline* theorem carries exactly
one extra axiom — `*.Local.check_passes._native.native_decide.ax_1_1` (the finite local-
inequality check is discharged by `native_decide` over a precompiled native checker; cross-
checked outside Lean by a C++ box verifier — 60,467,309 boxes — and Python). **All layer
theorems are clean** (propext/Classical.choice/Quot.sound only), including the hypothesis-form
endpoints `distinct_zeros_839_of_local`, `simple_critical_zeros_673_of_local`,
`simple_or_critical_8893_of_local` — **and all six ceiling theorems are clean** (they take
their certificates as explicit `PairCert` hypotheses). Charter note: *native_decide violates
the math-proof1 standard*, so under our rules his headline theorems are consumable only via the
clean `_of_local` layer with his certificate carried as an explicit hypothesis — precisely
zeta23's own `EnclOK` pattern (PairCeiling precedent).

### (c) His ceiling axis vs ours

His certificates (`Ceilings/Defs.lean`): `PairCertFor K θ r x₁ x₂ b` — for a kernel K and
separation θ, a **lower bound on pair energy restricted to index distance ≤ r** on labelled
θ-separated configurations (simple/double labels) in an interval of length R:
`x₁n₁ + x₂n₂ − bR − C₃ ≤ Σ_{|i−j|≤r} m_i m_j K(y_j−y_i)²`. The ladder parameter **r = 6, 7, 8,
10, All truncates WHICH PAIRS enter the energy** (monotone: `PairCertFor.mono`, `.toAll`).

Our dossier-02 axis: bandwidth k = how many *marginal data* (one-point mass s_j vs pair-mass
density s₂) a certificate consumes, over grid/window function classes (zeta23's (c₀, r)-window
certificates). His axis truncates pairs by *index distance in the configuration*; ours by
*data complexity of the statistic*. Related locality notions, **different mathematical
settings** (discrete labelled configurations + kernel vs window functions + grid data) — a
formal dictionary is a theorem-sized project, not glue. Honest positioning: *incomparable
axes*; cite, don't merge.

**Additional finds** (beyond round-3 §T): `law/` (paper §7.6) — "bounds what the method can
give **with any window**" via period-N near-CUE laws (form factor |N·S(j) − j| ≤ τ), computed
by **`law_lp.py` (an LP!)** and certified; **he reconstructed AF's unpublished period-256 law**
("Their law of period 256 is not public. This folder contains our own computation…"), matching
zeta23's constant p₀ = 0.68182868746… to 3.1×10⁻⁷, then **beating its share by 1.06×10⁻⁶**
(`deep/` stage) with the bound unchanged at **0.84093 (distinct) / 0.68185 (simple-on-line)
for all windows with V(f) ≤ 10·B(f)** (Theorem 7.7/Cor. 7.9/Table 4). This (i) independently
reproduces the 0.6818287 ceiling, (ii) answers dossier 21's A2 in the *all-windows* form, and
(iii) puts the **LP-dual computation in the toolkit (Python, unformalized)** — our dossier 02's
Theorem E (LP weak duality *in Lean*) remains unclaimed.

## 2. Donor mapping — can his library discharge our pilots faster than porting zeta23?

### (a) Pilot 42 (ζ_K 2/3 assembly): **YES — strongest donor hit.**

42's binders are Prop-parameters `Hypζ` (ε-forms of zeta23's A/B/C/D statements) and `Hypχ`
(Dirichlet analogues). Checks:
- **Conventions identical**: his counts are zeta23's own (`ChallengeDeps` defs, `rfl`-bridged) —
  the binder restatements apply verbatim.
- **Constant domination** (all cumulative forms): his `simple_critical_zeros_673` gives
  N₀ˢ/N ≥ 0.6735382 > 2/3 (discharges B) and, since N₀* ≥ N₀ˢ (distinct-on-line ⊇
  simple-on-line), also **A**; > 2−1/cMT = 0.67250 → discharges **D-ζ** (same numerator
  N₀simple). His `distinct_zeros_839` gives N_d/N ≥ 0.8390045 > 5/6 and > C₁ = 0.83625 →
  discharges **C-ζ and the MT-distinct form** (same numerator N_d). Binder absorption is
  monotone in the right direction: our conclusions are `(c−ε)·N ≤ X` with c ∈ {2/3, 5/6,
  2−1/cMT, (3−1/cMT)/2}; his hypothesis-form theorem with larger c' > c gives
  `(c−ε)N ≤ (c'−ε)N ≤ X` — **a strictly stronger discharge is absorbed for free.**
- **Hypχ**: his repo is ζ-only, but it *contains unmodified zeta23* (patch preserves Challenge
  files; Dirichlet ThmE statements remain proved there) → **building on his tree gives BOTH
  his stronger ζ theorems AND zeta23's Dirichlet statements in one dependency**.
- Two footnotes: (i) his headline theorems carry the `native_decide` axiom → under our
  charter, bind to the clean `*_of_local` layer (his local inequality as explicit hypothesis,
  EnclOK-style) or accept the external C++/Python certificates as the audit trail; (ii) his
  statements are **cumulative** (0,T] — phrase 42's `Hypζ/Hypχ` in the cumulative variant
  (zeta23 submitted both; 42's F5(iii) restates hypotheses anyway; or add the library's
  dyadic↔cumulative bridge).
- **Net**: 42's milestone 2 becomes "restating his two clean hypothesis-form theorems as
  `Hypζ`" — no zeta23 port needed at all for the ζ side; effort drops from S to S−.

### (b) Pilot 50 (hQRH): **NO.**

His content is windows/pair-energy/Gram on ζ; nothing in the 242-file tree touches zero-free
regions or quasi-RH (`riemannZeta_ne_zero_of_seven_eighths_lt_re` has no analogue there). hQRH
still must come from openai-math. No conflict either.

### (c) Dossier 20 (Hecke PaperInputs): **NO discharge — two positive externalities.**

His input remains ζ; the Hecke seams (Weil-EF, Backlund-χ, K-grade prime moments) are
untouched. Externalities: (i) his patch is an *existence proof* that zeta23's engine is
instantiable at new windows by changing only hypothesis-collections — empirical confirmation
of the PaperInputs-genericity claim 20 leans on; (ii) his `Window/admWindow_vProf` chain is a
reusable template for discharging window-admissibility (exactly the glue dossier 21 needed for
the quartic-ζ transplant — though 21 is now demoted per VERDICTS).

### (d) Pilot 22 (Tier-1 PNT): **alive — but not because of him; he has zero PNT content.**

CRITICAL cross-check, run now: mathlib PRs **#41394 (Mertens), #44062 (weights), #43238 (weak
PNT) are ALL still OPEN** (unmerged, checked this session); mathlib proper still has no
ψ(x)~x. However the ecosystem is closing from two sides: PNTAnd (AlexKontorovich) has
`MediumPNT.lean` (with `psi_eq_sum_range` etc.) and `StrongPNT.lean` deep in its 339-file tree,
and IEANTN's `Solutions/CH2.v1/PntSmooth.lean` (Tao) is actively building smoothed-PNT
machinery. **Call: Tier-1 is formally ALIVE (nobody landed ψ~x in mathlib) but its ecosystem
value is a dead man walking — three groups are converging; do not spend a pilot slot on it.**
Dossier 22's own Tier-2 framing (ψ = x + O(x^{7/8+ε}) from openai's quasi-RH) is the content.

## 3. Cost of using his repo as donor

- **Build**: it is the anthropics formal-math tree at v4.33.0-rc2/Mathlib 51e6992e + additions
  + patch — i.e., **v4.33 lineage, not our v4.36**. Consuming = build our conditional binders
  *in his tree* (they are Mathlib-only statements; elaborate fine at v4.33 per R9's probe
  pattern — statement-port ≈ 0). Do NOT port his ~35k proof lines to v4.36 (proof-port is the
  cost center; pointless — the tree builds).
- **License**: MIT (his) + Apache-2.0 (zeta23 + patch lines) — compatible with our
  kernel-only, no-external-CAS posture, with attribution.
- **Charter**: the one real friction is `native_decide` in the headline theorems. Two compliant
  routes: (i) consume the clean `*_of_local` theorems with his local inequality as an explicit
  hypothesis + his C++/Python certificates + CHECKSUMS.sha256 as the external audit (the
  EnclOK precedent, already accepted in this project's ecosystem for PairCeiling); (ii) re-run
  his finite check in-kernel (`decide`/`NormNum` over 209,010-entry tables) — likely infeasible
  at scale; not recommended.
- **Stability**: everything pinned (zeta23 commit, CHECKSUMS, axioms.txt from 2026-10-06); risk
  = anthropics updating zeta23 under him (low; zeta23 is a submission-frozen artifact).

## Verdict summary

| Pilot | Discharge verdict |
|---|---|
| 42 | **YES** — his clean `*_of_local` theorems discharge `Hypζ` in every form 42 uses (A/B/C/D-ζ, cumulative), with strictly stronger constants absorbed monotonically; Dirichlet side still from zeta23 (present in his tree). Charter-compliant via hypothesis-form + external certificate. |
| 50 | **NO** — no zero-free/quasi-RH content; hQRH still from openai-math. |
| 20 | **NO** — Hecke seams untouched; positive externality: engine-instantiation template + window-glue pattern. |
| 22 | **NOT RELEVANT** (no PNT content); Tier-1 alive-but-doomed (3 open mathlib PRs + PNTAnd Medium/StrongPNT + IEANTN PntSmooth converging). |
