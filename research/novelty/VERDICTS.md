# VERDICTS — novelty consolidation for Phase-4 triage

Lane R8, 2026-11-09, consolidating rounds 1–3 (+ round-4 sweeps for dossiers 30–32, landed
mid-round) of `research/novelty/round-{1,2,3}.md`. One row per dossier; the threat tier reflects
the **Knausgård clock** (arXiv:2609.33043 v1 2026-09-27; arXiv:2610.08965 + repo `kristianmk/839`
2026-10-04..09 — formal constants 0.67354/0.83900 with ceiling ladders, built on zeta23 itself;
see round-3 §T) and the **IEANTN/mathlib-PR clock** (teorth/IEANTN RvM vocabulary+stubs;
mathlib PRs #41394/#44062/#43238). Key: verdicts cite round-1 (r1), round-2 (r2), round-3 (r3).

| Dossier | Novelty verdict (source) | N-adjust vs lane proposal | Risk tier | Re-scope (one line) |
|---|---|---|---|---|
| **01** inertial-defect identity | Statement NEW (5-defect exact identity + named nonnegativity + A2/A3/A5); A4 partially contested by AF v2 Lemma 3.2 equality case + §7.2(b) sharpness; Lamzouri matrix-free caveat (r2 §1, r3 §6) | 4 → **3.5** (A4 narrowed) | **HOT** (Knausgård: overlap-correction move taken; Thm 2 competitor inequality) | Keep structural identity + tightness ONLY; drop any constant-improvement framing; cite Knausgård Thm 2 |
| **02** bandwidth-k ceilings | B_k hierarchy + LP-computability NEW as stated — but ceiling-**ladder framing** now anticipated by Knausgård `Ceilings/` (PairCert s=6,8,10,All monotone bounds, formalized, r3 §T); Hughes–Miller cite FIXED (r2 §2, r3 §T(b)) | 5 → **3.5** | **HOT** | Lead with LP weak-duality + the B₂ *pair-mass* axis + a dictionary to Knausgård's index-distance axis; never claim "first barrier theory" |
| **03** compression rank–trace (+03a) | 03a KNOWN-INFORMAL (classical Sylvester/interlacing, r2 §3 — honesty note upheld); Theorem M NEW as statement, infrastructure-grade | 3 → **3** | COLD | none (bundle with 01's shared port) |
| **10** Z3 uniform+poly-space | Conjunction (one machine ∀k + min-rate + poly space) claimed by NOBODY; suquark takes 3-SAT+space-ε-rate, openai per-k+space (Lean weaker rate), eth uniform-no-space (r2 §4, r3 §7) | 5 → **5** | COLD | Use r3 §7's exact rephrased claim wording; exclude the two taken cells explicitly |
| **11** Z1 reduction calculus | Call-charged composition NEW; nearest formal miss AFP Cook_Levin `Composing.thy` (function composition with time, not many-call reductions) (r2 §8) | 4 → **4** | COLD | none |
| **12** Z4 ε(ω_b) | ε(ω_b) function NEW; AVW paper freezes all constants (Schönhage-identity-derived); monotonicity-via-termPrime is the load-bearing proof risk (r1 §9, r2 §8) | 4 → **4** | COLD | none; flag the monotonicity-via-single-channel check at pilot |
| **20** E1 Hecke proportions | NEW-SUPPORTED: 14 AF-citers, none Hecke/ζ_K; classical kin = conditional counts only (Zhang 2310.07360, CGG, Wu–Zhao) (r2 §5, r3 §5) | 5 → **4.5** (constants stale on arrival) | **WARM** (IEANTN; AF-cluster actors may pivot to Hecke) | Value = "first Hecke/ζ_K statements", NOT record constants (ζ records already at 0.67354/0.83900 formally) |
| **21** quartic window / A2 | A2 (certificate-sup) NEW formally but **outcome B realized by Knausgård formally** (0.67354 > 0.67250, his ceilings cap his class); CCLM17 = RH-conditional different class (Zbl 1362.11078, r3 §5) | 4 → **1.5** | **HOT** | **Demote/absorb into 02** as case study; surviving kernel: sup over zeta23's own (c₀,r) class only |
| **22** quasi-RH effective PNT | Formalization-first (dossier says so; AFP PNT+Mertens exist — Eberl–Paulson; r3 §5); Tier-2 (7/8-band error term) is the content | 2 → **2** | **WARM→HOT** (mathlib PR #43238 may land PNT) | Tier-1 pilot NOW or never; real content = Tier 2 (ψ = x + O(x^{7/8+ε})) |
| **30** Hall/Parseval–boson identification | NEW-SUPPORTED: classical anchors verified (Jing 1991 vertex ops/Hall-Littlewood, Macdonald I§5, Kac–Raina); NO formalization of the identification anywhere; eth's a[r]/Q_s Parseval untraced (r4 §below) | 4 → **4** | COLD | Benkart–Pérez-Izquierdo 1998 checked: U_q(D₄)/split-octonions only — no symmetric-function graze |
| **31** BudgetedSplit meta-theorem | NEW-SUPPORTED: Schönhage asymptotic-sum + laser method + their limits confirmed classical-informal (Pan 1982/84; AVW 2307.07970/1812.08731/2010.05846); the machine-model-graded two-schema abstraction untraced (r4 §below) | 4 → **4** | COLD | none |
| **32** Rc savings frontier | Frontier-**shape** theorem NEW but **NUMERICALLY-SUPERSEDED at birth**: follow-up arXiv:2610.17420 moves D ≤ N^ε from ε < 0.1204 to **D ≤ N^0.172**; 2610.20297 improves exponents further (r1 §9, r4 §below). Knausgård does NOT subsume (different domain) | 4 → **3** | **WARM** (AVW follow-up cluster) | State Γ(ε) parametrically with the crossing point as a *parameter*, cite 0.1204 only as the v1 anchor |
| **40** ζ_K′/Ξ_K′ zeros | T2 CONTESTED (Šleževičienė 2003 Selberg-class Speiser covers ζ_K conditionally; Broughan 2009 ξ′/ξ positivity for ζ); T3 proportions NEW-SUPPORTED (r3 §1) | 4 → **3** (T2 downgraded per the dossier's own honesty note) | **WARM** | Make T3 the headline, T2 the pilot; add Šleževičienė/Broughan to nearest misses |
| **41** q-deformed eight-square | (M)+(N) NEW-narrow; object-level CONTESTED by Benkart–Pérez-Izquierdo 1998 q-composition (math/9801141); TL host (H) NEW (r3 §2) | 4 → **3.5** | COLD | Rephrase "first sign-rule/parallelogram-defect deformation"; keep (H) as the differentiator |
| **42** ζ_K 2/3 assembly | B-K corollarical formal-first (dossier honest; AF-remark risk cleared); C_D NEW-narrow vs Li 2012 + Garunkštis–Kalpokas 2013 (r3 §3) | 2 → **2** | **WARM** (same as 20) | First pilot of the cluster; soften "genuinely unstudied" for C_D; constants now 2 generations stale |
| **50** 7/8-truncated window constants | Headline REFUTED by the dossier's own engine audit (externally corroborated: no strip-conditional constants anywhere, r2 §6); S3 KNOWN via Broughan 2009 for ζ (r3 §5) | (downgraded by its own audit) | COLD | Whatever survives is the S1/S2 glue; do not pilot for constants |
| **51** ω→word-RAM bit bridge | **KNOWN-INFORMAL-ONLY** — Pan 1985 (doi 10.1016/0898-1221(85)90095-1), Schönhage 1981 (r2 §7) | — (not a dossier) | COLD | Scope as formalization-only or fold into Z2/dossier 12 F3b |
| **52** unified CCR layer | NOT-YET-LANDED; PRE-CHECK: no CCR/Heisenberg-Fock formalization found in any assistant (arXiv 0, mathlib 0; r3 §8) | TBD on landing | COLD | re-queue round 4+ |
| **60** border-rank connector | ECOSYSTEM-NOT-DISCOVERY confirmed; Laderman 1976 (Zbl 0322.65021) ✓, Schönhage 1981 ✓; border-rank-21 attribution UNCONFIRMED (r3 §4) | 1–2 → **1–2** (as intended) | COLD | Pipeline warm-up only; verify/drop the ≤21 attribution before writing |

## Round-4 sweeps (dossiers 30–32, landed 2026-11-09; queries run this session)

- **30**: zbMATH — Jing 1991 "Vertex operators and Hall-Littlewood symmetric functions" ✓,
  Shimozono–Zabrocki 2001 ✓ (the vertex-operator/symmetric-function classical layer is real);
  Kac–Raina not in zbMATH free-text (book; cite directly). Formalization: arXiv
  `"Hall inner product" + "symmetric functions" + "proof assistant"` → 0. Coordinator's
  Benkart–Pérez-Izquierdo graze question: their 1998 paper is U_q(D₄)/split-octonion
  (R-matrix/Yang–Baxter); **no symmetric-function side** — no overlap with 30.
  Verdict: NEW-CLAIM-SUPPORTED (medium-high).
- **31**: laser-method line verified live (Alman–VW arXiv:2307.07970, 2010.05846; limits
  1812.08731); Schönhage asymptotic-sum lineage = Pan 1982/1984 (zbMATH "trilinear aggregating").
  No abstract-interface/meta-theorem statement found. Verdict: NEW-CLAIM-SUPPORTED (medium).
- **32**: the AVW follow-up **arXiv:2610.17420 raises the thin-product range to D ≤ N^0.172**
  (from ε < 0.1204 in v1) and 2610.20297 improves the min-plus/APSP exponents — the frontier's
  crossing point moved within two weeks of the source paper. Knausgård's clipping inequality
  (zero-proportion domain) does not touch it (round-3 §T(b)). Verdict: frontier-theorem shape
  NEW, constants STALE — state parametrically.

## Standing flags for H

1. **Dossier 02 citation fix** (round 2 §2, round 3 §9(ii)): 'Hughes Miller "zeros of
   L-functions coupled" (2008)' does not exist → C. P. Hughes & S. J. Miller, *Low-lying zeros
   of L-functions with orthogonal symmetry* (2007).
2. **Dossier 60**: do not assert ⟨3,3,3⟩ border-rank-≤21 attribution until verified in
   BCS ch. 15 / Landsberg (round 3 §4).
3. **Survey staleness**: `research/survey/anthropics.md` §0 constants (2/3, 5/6, 0.6725,
   0.83625) are two formal generations behind (Knausgård 0.67354/0.83900 + ceilings); a one-line
   erratum pointing to round-3 §T would keep the record honest.
4. Knausgård's `upstream_relax.patch` (window-hypothesis relaxation 1/2→1/8, 1/2→1/4) is
   **positive de-risking evidence** for dossiers 20/21/42's window-glue — the zeta23 machinery
   provably accepts non-MT windows via hypothesis-collection changes only.

---

## Round 5 (final) — three clears, 2026-11-09

### 5.1 Dossier 52 (unified CCR/Fock layer) — DOSSIER-CHECKED, final

Its pending queries run (AFP full scan: no Wick/Fock/fermion/Heisenberg/occupation entry — only
`Quantum_Fourier_Transform`; arXiv `Wick formal`, `normal ordering + theorem prover`,
`CAR formalized`). **New nearest miss found**: Tooby-Smith, *"Digitalizing Wick's theorem"*
(arXiv:2505.07939, 2025; code = HEPLean/PhysLean) — Wick's theorem, its static AND
**normal-ordered** versions, formalized in Lean 4. So the *bosonic contraction/normal-ordering
instance* of N1 is formalization-first (PhysLean precedent). Still unclaimed anywhere found:
the statistics-universal ε=±1 occupation calculus, the fermionic dual-family theorem
(exterior/super analogue of the Hall duality — no formal or informal source), and the CAR
weight dictionary. Classical nearest kin: supersymmetric-oscillator folklore.
**Final verdict: NEW-CLAIM-SUPPORTED (narrow) for N1-universal/N1b-fermionic/N3; N-score
recommendation 3.5** (bosonic instance anticipated by PhysLean; the universal statement and the
fermionic side carry the novelty).

### 5.2 Re-scoped-statement clears

**(a) 32 (parametric savings frontier Γ(ε))** — searches: AVW follow-up arXiv:2610.17420 full
abstract + its repo; "savings frontier tensor rank"; Schönhage asymptotic-sum lineage (round 4).
Findings: 2610.17420 (Ruhollah Majdoddin, 130 pp., 2026-10-12) moves the range to D ≤ N^0.172
and proves a *dichotomy* (coordinatewise problems: truly-subquadratic vs OV-hard), **with its
own Lean formalization** (github.com/Majdoddin/formal-math — a fork of anthropics/formal-math
adding `thin-matrix-products/`, `xor-3xor/`, `groups/` at v4.33.1). **Nobody states a frontier
FUNCTION** — both papers state frozen constants + dichotomies. Verdict: Γ(ε) with unique
crossing + phase transition = **NEW-CLAIM-SUPPORTED** (N 3 per Round-4 table stands), with two
new nearest misses to cite (Majdoddin's 0.172 + his Lean repo) and the crossing now at ε* ≥ 0.172.

**(b) 02 (LP weak duality in Lean + pair-mass axis)** — mathlib: `Analysis/Convex/Cone/Basic.lean`
lists LP duality as an explicit **TODO** ("prove LP duality as a special case of cone duality")
— not proved in mathlib. One Lean neighbor: `makoto-yamashita/proof-on-a-homogeneous-self-dual-
interior-point-method-for-linear-programming` (2026-06, HSD interior-point for LP — a specialized
development, duality in algorithmic form, not a reusable weak-duality lemma for certificate
programs). Knausgård's `law_lp.py` is Python (unformalized). **Pair-mass axis incomparability
confirmed** definitionally: his `PairCertFor K θ r` truncates pairs by *index distance r* on
labelled θ-separated configurations (knausgaard-as-donor.md §1c); ours truncates *statistical
data complexity* (one-point mass vs pair-mass density over window/grid classes). Verdict:
**NEW-CLAIM-SUPPORTED** — Theorem E (LP weak duality in Lean, applied to ceiling programs) is
unclaimed; add Yamashita + (informal) SDP optimization of de Laat–Rolen et al. (below) as
nearest misses; the B₂ pair-mass axis statement itself remains unclaimed and incomparable.

**(c) 42 (ζ_K proportions conditional on certificate + ThmE)** — final sweep:
arXiv:2610.08965 citations (Semantic Scholar): none yet; **new must-cite nearest miss found**:
**de Laat–Rolen–Tripp–Wagner, arXiv:1908.04876 (2019), "Pair correlation for Dedekind zeta
functions of abelian extensions"** — via Montgomery pair correlation + **semidefinite-
programming optimization over windows**, they deduce for **quadratic number fields that more
than 45% of the zeros are distinct** (and interpret their optimization as interpolating between
the pair-correlation bound and the Cohn–Elkies bound). So: ζ_K *distinct-zero proportions* DO
exist in the literature — weak (45% vs our 5/6-level) and distinct-only. **Nobody states ζ_K
(or Hecke) simple/on-line proportions anywhere** (AF cluster: ζ/Dirichlet only; Zhang 2310.07360:
conditional counts; 1908.04876: unconditional 45% distinct). Verdict: 42's landing theorem =
**NEW-CLAIM-SUPPORTED** (quantitative jump 45% → 5/6-level and on-line/simple statements new);
mandatory dossier amendments: cite 1908.04876 (nearest miss, and the SDP-window-optimization
precedent), and note the assembly route's constants ride on the ζ-side donor (per
knausgard-as-donor.md, dischargable at 0.6735/0.8390-grade via his clean layer).

### 5.3 Final novelty posture (one paragraph)

Settled-safe: **10/Z3** (conjunction un-pre-empted, three-way audited), **11/Z1** and **12/Z4**
(no formal or informal counterpart; frozen-constant ecosystems), **41** (narrow (M)+(N) + TL
host, Benkart-graze bounded), **30/31** (classical anchors verified, bridge statements
untraced), **60** (ecosystem by design), **01's identity + 03's Theorem M** (structurally
distinct from everything found, including Knausgård Thm 2). Still-risky: **02** (correctly
re-scoped, but the AF-cluster is one paper away from formalizing LP/SDP window optimization —
de Laat–Rolen 2019 and law_lp.py show the idea is in the air; move fast or narrow to the
Lean-duality lemma + pair-mass dictionary), **20/40/42** (statements safe today — nobody has
touched Hecke/ζ_K proportions — but the cluster's actors (Wang, Knausgård, Lamzouri) pivot
fast, and every month of delay raises the chance a ζ_K corollary appears; 42 is the cheapest
first move and is now donor-accelerated), **52** (PhysLean is actively consuming the bosonic
side), **32** (two Lean formalizations already exist in its ecosystem; only the frontier-
function statement is ours). Overall: the zero-side constant race is lost (two formal
generations behind, per round-3 §T); the program's realizable novelty is structural (defect
identity, LP-in-Lean, incomparable-bandwidth axis), cross-L-function (Hecke/ζ_K), and
cross-model (machine-model conjunctions) — exactly the movable-ground list of round 3, now
with donor accelerants for 42 and a hard deadline culture for everything AF-adjacent.

---

## Cycle 2 addendum (SKELETON — 2026-11-13, lane A5; rows 71–74 are zone-level
pre-fills, `[incoming-dossier]` = lane A9 owns the row when the dossier lands)

Zone-level tiers from `round-4.md` PART 1 (§1–§4) + §5 QR-D precision pass. Key
cluster facts baked into the tiers: the quasi-RH constant race now has six papers in
six weeks — Ope26a 7/8 (openai preprint 2026-09-30, ζ included, Lean = sorry
challenge) → Ope26b 11/12 + Landau–Siegel corollary (10-05) → Liu-1 B_new =
0.8749570 incl. ζ (2610.12234, 10-08, **formalized**: github.com/liubaiying101/
Slightly-improved-…) → Xu–Sang 0.8748867 conditional on Ope26a inputs (2610.15291,
10-11) → Cureton–Thorner 31/32 for EVERY number field (hexagonmath 2610.00200,
10-12/14, **formalized = our DZDF donor**) → Liu-2 B♭ = 0.8748866 UNIFORM over all
number fields incl. ζ_K (2610.26835, 10-19, v2 10-29, Lean in progress on
[Liu26b]+[CTLean]). The informal frontier is already below 7/8 uniformly; Trudgian–
Zuniga Alterman 2610.16010 (low-lying zeros of ζ_K, h(K) < 0.58) shows the ζ_K-zero
side publishing monthly. Kuwahara 2610.15199 REFUTES Rényi-α<1 area laws (hence
literal rank concentration) in the unique-gapped 2D class.

| Dossier | Novelty verdict (source) | N-adjust vs lane proposal | Risk tier | Re-scope (one line) |
|---|---|---|---|---|
| **70** unconditional ζ_K zero-confinement | LANDED; honesty header says GLUE/ECOSYSTEM — "first unconditional ζ_K zero-confinement strip constants in Lean" holds today ONLY because Liu-2's Lean is unfinished; its two-sided strip widens 1/32→1−B♭ the day it lands (r4 §5.2–5.3) | TBD (A9) — artifact value, not discovery N | **HOT-cluster / WARM-artifact** (QR-D zone HOT; six-paper constant race incl. our own donor + two external Lean actors) | State strip constants parametrically; must-cite: CT (DZDF), Liu-1 + liubaiying101 repo, Liu-2 B♭, [Ope26a/b], XS26, Trudgian–ZA |
| **71** `[incoming-dossier]` QR-D discharge/donor-swap (hQRH 7/8↔31/32 weakened-binder pilots) | r4 §3 + §5.2: hQRH is TRUE informally (Liu-1 Cor 14.1); formal discharge = external Liu repo (portability unprobed) or weakened 31/32 via DZDF | TBD | **HOT-zone / formalization-first** | Never claim a zero-free improvement; value = binder hygiene + first unconditional Lean instantiations; add liubaiying101 probe to the plan |
| **72** `[incoming-dossier]` FF zone (function-field simple/distinct proportions) | r4 §1: proportion statements unclaimed (FF-2/5/6); Suzuki 2610.41115 = method-neighbor 3 weeks old; per-curve uniform shape FALSE (supersingular trap [A9 verify]); on-line component free (Weil RH) | TBD | **WARM** | Family-indexed or trace-bounded multiplicity statements only; nearest misses Faifman–Rudnick 0803.3534, Rudnick 0811.3649, Bui–Florea 1605.07092, Katz–Sarnak, DLRT 1908.04876, Suzuki 2610.41115 |
| **73** `[incoming-dossier]` AL zone (area-law/inertia cross-bridge) | r4 §2: naive "rank concentration from spectral gap" REFUTED (Kuwahara 2610.15199, S₀≥S_α ⟹ rank ≥ e^Ω(vol)); effective-rank (vN) + matrix-inequality cross-bridge shapes unclaimed, un-formalized everywhere (AL-4: 0); "first formal area law" dead (AreaLaw2D is our donor) | TBD | **WARM (with a hard NO-GO on the literal rank statement)** | Effective-rank/AGSP/ρ_A cross-bridge framings, or certified-negative dossier (à la 50); Physlib-on-our-pin feasibility gate |
| **74** `[incoming-dossier]` reserve (second FF or AL item, or QR-D consequence) | TBD on A2/A4 zoning | TBD | **WARM (default)** | Inherits the zone tier of whatever it instantiates; hexagonmath sweep mandatory if QR-D |
