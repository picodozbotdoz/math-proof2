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
conditional counts; 1908.04876: 45% distinct — **GRH-conditional, fixed quadratic K, T→∞**
[erratum 2026-11-13, H applying A5's P2-3 audit: v1 here said "unconditional"]). Verdict: 42's landing theorem =
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
| **70** unconditional ζ_K zero-confinement (`70-unconditional-zetaK-zero-confinement.md`, FINAL) | DOSSIER-CHECKED (r4 §3, §5.2–5.3; **clock sweep §8.1–8.3 + tracker audit §9 folded 2026-11-14**): GLUE/ECOSYSTEM per own header; per-class split holds — **ζ_K-strip (all K) is OURS** (only in-corpus formal ζ_K zero-location statement; Liu-2's uniform B♭ is informal, Lean in progress; **QuasiRiemannTracker audited 2026-11-14, NO ζ_K/Hecke-beyond-Eisenstein entries — Dirichlet-only scope, split SURVIVES**), **ζ/Dirichlet formal side CONCURRENT-AND-AHEAD**: openai tree proves 7/8 ζ/Dirichlet NOW — `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19/:29`, liu1-as-donor §4; Liu-1 repo formalizes 34999/40000; Kontorovich/quasi-rh 11/12 (README-claimed, no ζ_K); **QuasiRiemannTracker chain at 0.8733458 (2026-11-13, tri-kernel Lean+NanoDa+con-ron replay, triad axioms, r4 §9.1) — below Chang–Wang's CONDITIONAL 0.87446205 (2611.00924) since 10-26**; tracker/Liu/Kontorovich all on 4.34.1-family external pins = DO-NOT-CONSUME, statement-level only; the strip widens 1/32→1−B♭ the day Liu-2's Lean lands | artifact-grade (no discovery N) | **HOT-cluster / WARM-artifact** | Constants PARAMETRIC in θ (dossier already re-scoped; absorbs Chang–Wang AND every tracker step by re-instantiation); must-cite: CT (DZDF), Liu-1 + liubaiying101 (34999/40000), Liu-2 B♭, Chang–Wang 2611.00924 (cond. 0.87446205), Ji 2611.16665 (599/600 ζ_ℚ(i), no frontier move), QuasiRiemannTracker (0.8733458 Dirichlet frontier, tri-kernel), [Ope26a/b], XS26, Trudgian–ZA 2610.16010, Lee 2002.05456, Das–Gaba–Lee–Savalia–Wong 2506.19319 |
| **71** function-field splane-dictionary (`71-function-field-splane-dictionary.md`, FINAL; RENAMED from simple-zero-proportions) | DOSSIER-CHECKED (r4 §1 + PART-2 P2-1/2/5): (P) s-plane FF zeta + exact-pole dictionary = formal-first, classical-informal (Weil 1948; r4 §6.1); (C)/(W) proportion/density statements unclaimed (FF-2/5/6); hexagonmath FF-clean (only Boyang Hu Langlands trilogy — different layer); falsity-trap citation ANSWERED and PINNED at paper granularity (r4 P2-11: vdG–vdV Zbl 0729.11066 (1991); Cossidente–HKT Zbl 0958.11048; H–K Zbl 1043.51007; GHKT Zbl 1218.11064; HKT book chapter still [TBD vs printing]); Suzuki 2610.41115 = method-neighbor clock | primary (P): formalization-first (dictionary value); FF-EZ2-family: N as proposed (DISCOVERY-grade [HYPOTHESIS], dossier-flagged) | **WARM** (zone FF; month-scale Suzuki clock; Stacks-wall consumption risk already binder-designed) | Keep family-quantified/exclusion-based proportion shapes ONLY; nearest misses Suzuki 2610.41115, Faifman–Rudnick 0803.3534, Rudnick 0811.3649, Bui–Florea 1605.07092, Katz–Sarnak, DLRT 1908.04876 (GRH-conditional, fixed quadratic K — P2-3), Boyang Hu (hexagonmath, different layer) |
| **72** area-law-inertial-defect (`72-area-law-inertial-defect.md`, FINAL) | DOSSIER-CHECKED (r4 §2 + PART-2 P2-4): structure correctly bakes in the Kuwahara 2610.15199 no-go (literal rank concentration FALSE); P1 gap-to-inertia dictionary = formal-new, stated nowhere (AL-1/3/4 clean); P2 purity-route (α=2, linear-in-boundary-budget) NOT contradicted by literature (P2-4: no α≥1 2D Rényi area law found; residual re-check at pilot); AL-EZ3 milestone (AreaLaw2D ↔ openai `UniformAreaLaw` hypothesis) = GLUE with real consumer; C-neg certified-negative = honest | P1: formal-new (moderate); P2: N as proposed ([HYPOTHESIS], flagged); C-neg: precedent-backed (50/30 lineage) | **WARM (hard NO-GO on literal rank statements — already honored)** | Must-cite: Kuwahara 2610.15199 (both the refutation and the surviving-vN framing), Anshu–Arad–Gosset 2103.02492 + 1905.11337, Abrahamsen et al 2203.16012, OAI265 + PEPS companion, AAH; Physlib-on-pin gate before any pilot |
| **73** function-field-hecke-tate (`73-function-field-hecke-tate.md`, FINAL) | DOSSIER-CHECKED (r4 §6.2 + P2-13): Tate dictionary KNOWN-INFORMAL-ONLY (Tate 1950 / Weil BNT ch. VII / Rosen GTM 210 ch. 8–9 incl. grössencharakter) — the dossier says so itself (formalization-first, "the mathematics is 75 years old"); corpus absence TOTAL incl. the CFT-vendor extension (A1-4: 1,658-file vendor tree number-field-only, zero Tate/FunctionField/GlobalField declarations); gating claim "first formal Tate-thesis-type statement anywhere" RESOLVED by P2-13: **SUPPORTED in the function-field/rationality-dictionary scope** (arXiv 8+2 entries all irrelevant; AFP none; GitHub exactly 2 repos, both audited — DawidLipin dissertation stub + WenrongZou PhD project, BOTH number-field-only, proved-status unconfirmed) — with mandatory softening: cite WenrongZou (Nuccio/Brasca, ANR FALSE, CI) as nearest formal neighbor + clock on the "anywhere" phrasing; falsity trap correctly scoped in-dossier (kills multiplicity proportions, not rationality/entireness/nonvanishing); Suzuki = method-neighbor clock | formalization-first (dictionary value; Stacks-blocked Tier-C is binder-designed, provable on our pin) | **WARM** | Soften "anywhere" to function-field scope + WenrongZou must-cite; nearest misses Tate/Weil/Rosen (the entire informal content), Suzuki 2610.41115, DawidLipin + WenrongZou repos, Boyang Hu trilogy (different layer), dossier 71 (the t↔s dictionary it builds on); hexagonmath PASS-conditional (P2-1/P2-12) |
| **74** surprisal-moment-hierarchy-ceilings (`74-surprisal-moment-hierarchy-ceilings.md`, FINAL) | DOSSIER-CHECKED (r4 P2-6..P2-10): **load-bearing `EntropyMoments.lean:93` identification VERIFIED by this lane** — `moment p u := ∑ i, (p i)^(1-u)` verbatim (ns `PolynomialPEPS.Subvolume.MGFScalar`; `entropy` :94, `logMoment` :95, `logMoment_derivative` :128), and AreaLaw2D `MarginalTails`' first clause bounds exactly `logMoment p u` (p j·e^{−u log p j} = (p j)^{1−u} on 0 < p j) — the "two family-265 halves, one shared m_u" claim is CORRECT. ONE glue note: at u = 1 the `Real.rpow` convention counts zero eigenvalues (`moment p 1 = card ι` ≠ filtered sum) — state u ≠ 1 in T3. Literature: P2-6/7 clean (no barrier/ceiling theory for entropy functionals anywhere; PT-moment quantification 2610.36156 = genre anchor); P2-9: NO citer of AHS 2004.15009 proves class-side lower bounds on windows (Kuwahara = citer #1, connected cluster) — T1-floor positioning survives; P2-8: 2605.20509 causal bootstrap = T3 method-neighbor | transport-grade (02-pattern CONDITIONAL-CORE per own header; T3 rides the same unclaimed LP-duality layer as 02) | **WARM** | No area-law/poly-PEPS claims (Kuwahara discipline held); nearest misses: openai `EntropyMoments.lean` (calculus-not-classes, confirmed), AreaLaw2D `MarginalTails` (achieved bound, other side), AHS 2004.15009 (state-side dual), 2610.36156, 2605.20509, Hausdorff truncated moment theory; named consumer = AreaLaw2D C.3 |
| **75** abelian-assembly-zetaL-proportions (`75-abelian-assembly-zetaL-proportions.md`, FINAL) | DOSSIER-CHECKED (r4 P2-3 + P2-12): **DLRT gate RESOLVED SCOPED — Thm 1.1 fixed abelian K under GRH (o_K(1), T→∞), Cor 1.3(i) fixed quadratic K GRH-conditional asymptotic; nothing uniform over K, no Hecke/non-abelian ⇒ (P) is a NEW statement family ⇒ N 4** (flip transcribed). Liu-2 = family overlap but half-plane nonvanishing only (C3 clock, not a (P) competitor); rounds 1–3 cluster evidence ζ/Dirichlet-only stands; hexagonmath gate PASS-conditional (front page clean; **archive is ORCID-gated — H flag**; indirect negative: Liu-2 cites only CT from hexagonmath). Component-binder open core honestly named (Hecke-L proportions undischargable today); ℚ-route partially unconditional (ζ via V2, Dirichlet zeta23-conditional) | **4 (per the P2-3 flip)** | **WARM** (20/42-cluster clock; M4a unverified per dossier's own flag list) | Must-cite DLRT with corrected qualifiers (fixed K, GRH, asymptotic — §5.2(c) erratum propagates); C3 inherits 70's per-class split + parametric θ (Liu-2 clock); genuine new coverage = proportions (any base) + left-half confinement for real-place abelian L/ℚ |

**Reconciliation note (2026-11-13):** this table's rows 71–74 were zone-guessed before
the dossier files existed (previous skeleton: 71=QR-D discharge, 72=FF proportions,
73=AL, 74=reserve); they are re-mapped to the coordinator's final file↔zone mapping
(71=FF splane, 72=AL, 73=FF-EZ3, 74=AL-EZ2, 75=abelian assembly). The dropped
guessed row (QR-D discharge/donor-swap) is NOT a lost item: it lives in row 70's
per-class split + the standing notes below; the hQRH-discharge play is now upgraded
by liu1-as-donor §4 (openai's own tree proves the 7/8 ζ statement — in-corpus
discharge, G7 target 1).

**Standing notes (Cycle-2, transcribed 2026-11-13):**

1. **Dossier 22 / PNT+ upstream close-out (A1's finding, relayed):** upstream
   `AlexKontorovich/PrimeNumberTheoremAnd` @ `938912bb` (2026-11-12) PROVES StrongPNT
   (ψ = x + O(x·exp(−c√log x))) triad-clean (`StrongPNT.lean:2900`) ⇒ **22's Tier-2
   T2b is CLOSED-BY-UPSTREAM — formalization-only to recover on our pin; T2a
   (quasi-RH-conditional x^{7/8+ε}) survives as 22's only open content; row-22 claim
   narrows to T2a; STRATEGICALLY-DEAD/stop-at-M4 posture unchanged** (per
   A1-3 pntplus-glue-as-donor.md §d). Also: fork-vs-upstream Mathlib-subtree drift =
   39/75 files — any future upstream consumption is a real port, not a rebase.
2. **ZetaZeros V1 RvM is a DEF, not a theorem** (A1's triplication finding): novelty
   greps hitting V1's `RiemannVonMangoldt` must NOT read it as a proved result;
   explicit-constants RvM is contested territory (fork binder-only; upstream Kadiri
   in progress). Caveat applies to every `decl-index-v2.tsv` hit under
   `axiommath-zetazeros` (its 276 rows are challenge/scaffold-heavy).
3. **DLRT erratum (this lane, P2-3):** main-run VERDICTS §5.2(c) recorded DLRT
   1908.04876 as "unconditional 45% distinct" — the paper's Thm 1.1/Cor 1.3(i) are
   **GRH-conditional, fixed quadratic K, T→∞ asymptotic**. Propagates to
   CLAIMS-REGISTER row 42 wording ("improving DLRT-2019's 45% distinct" → add
   "GRH-conditional") and to rows 42/75 nearest-miss text. H to apply.
4. **Liu-2 clock (standing context for 70):** B♭ = 0.8748866 uniform over all number
   fields (2610.26835 v2, 2026-10-29), Lean "in progress" on [Liu26b]+[CTLean];
   every QR-D artifact claim should be dated against this landing.
5. **Clock sweep + tracker audit, folded 2026-11-14 (r4 §8 + §9; the §8.1 "Hits"
   propagation died in the 2026-11-13 outage — this note + row-70 above + r4 §5.3
   table + CLAIMS-REGISTER row 70 are the post-outage repair, reconciled to A9's
   dossier-70 standing notes):** (i) Chang–Wang 2611.00924 (10-31) moves the informal
   frontier below B♭ **conditionally only** (0.87446205, on cited uniform inputs);
   unconditional informal record unchanged (Liu-2 B♭). (ii) Ji 2611.16665 (11-12):
   ζ_ℚ(i)+ζ at 599/600, new quartic theta-kernel, weaker constant, no frontier move.
   (iii) QR-D Lean ecosystem = 13 repos incl. Kontorovich/quasi-rh (11/12 ζ+Dirichlet,
   README-claimed, no ζ_K). (iv) **QuasiRiemannTracker audit (r4 §9): site
   gtimg.github.io/QuasiRiemannTracker (NOT "quasiriemann.org"), 55 entries all
   framework-verified via tri-kernel proof replay (Lean + NanoDa 0.4.26 + con-ron,
   Comparator statement/definition/axiom checks, triad axioms, adversarial controls) —
   kernel-grade, not certificate-only; scope Dirichlet-only (ζ via principal character;
   Eisenstein-Hecke companion statements in baseline entries; the sole DedekindZeta
   mention is a Re s > 1 Euler-product identity for the fixed Eisenstein field inside
   the vendored openai sieve machinery); NO conditional-results class (Chang–Wang,
   Liu-2, CT all absent); best verified bound 0.8733458561 (continuum-anchor, 11-13,
   J. Bebel), having crossed below Chang–Wang-conditional on 10-26; Liu B_new tracked
   at the EXACT algebraic bound (1507−2√921)/1653 — refines liu1-as-donor §1's
   34999/40000 record of the public entry points; milestone "13/15 Limit of OpenAI's
   method" projects the race floor at ≈ 0.8667. Novelty impact: ζ_K split survives;
   ζ/Dirichlet constants stale-on-arrival now with a live ~daily leaderboard; no
   Cycle-2 dossier needs re-scoping beyond row-70's must-cite/constant-table updates
   (dossier 70's parametric-θ absorbs everything by re-instantiation).**
