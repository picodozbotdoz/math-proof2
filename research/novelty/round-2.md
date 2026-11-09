# Novelty verification — round 2

Lane R8, 2026-11-09. Scope: the six dossiers on disk (`research/candidates/01,02,03,10,11,12-*.md`)
— running each one's "PENDING lane R8" query list — plus PRE-CHECKS for in-flight dossiers
(E1/20 Hecke AF-proportions; 50 zero-free-strip window constants; 51 ω→word-RAM bit bridge),
and standing strategic notes. Labels: **DOSSIER-CHECKED** vs **PRE-CHECK**.

## Method additions (on top of round-1.md's note)

7. **zbMATH Open API** (works, no key): `https://api.zbmath.org/v1/document/_search?search_string=<urlencoded>&count=N`;
   parse `result[*].title.title`, `contributors.authors[].name`, `year`, `identifier` (Zbl), `links[0]` (doi).
   Good for pre-arXiv literature (1980s–2000s) that arXiv search cannot see.
8. **arXiv fulltext Q&A**: `WebFetch` on `https://arxiv.org/html/<id><version>` handles
   multi-part attribution/novelty questions well (all §1–§4 verdicts below lean on it).
9. **Local PDFs**: `pdftotext` on the sibling papers (eth `paper.pdf`, openai `paper.pdf`,
   downloaded suquark PDFs) for exact theorem-statement audits — cheap and authoritative.
10. GitHub raw fetch of other repos' PDFs (`raw.githubusercontent.com/<r>/main/papers/.../paper.pdf`)
    then `pdftotext` — how the suquark claims were audited.

---

## §1. DOSSIER-CHECKED — dossier 01 (inertial defect master identity)

**Dossier's pending queries run**: arXiv `"rank-trace inequality"`, `"trace inequality" AND
"positive index"`, `"Frobenius" AND "multiplicity" AND "simple zeros"`; equality-case literature
(Mirsky/Carlen genre); zbMATH `trace inequality Hermitian equality`, `trace inequality Frobenius
norm rank Hermitian`; citations to AF (via the two follow-up clusters of round 1); Bhatia/Horn–Johnson
chapters (book-level, via zbMATH-class searches + knowledge — not machine-searchable here).

**Evidence**:
- **AF v2 itself (arXiv:2608.13637v2, via arXiv HTML)**: an equality case IS stated for the base
  lemma — "Equality holds if P=Π1, Q=2Π2 for orthogonal projections Π1⊥Π2 of ranks r,b" (Lemma 3.2),
  Remark 3.3 gives a variational proof reducing to `(x−1)²≥0, x²≥0, (x−2)²≥0`, and §7.2(b)
  characterizes sharpness of the downstream §6 inequalities via the extremal configuration
  "⅔N orthogonal simple on-line zeros plus ⅙N on-line doubles … the same extremal configuration
  as in Montgomery's RH argument". **No defect/slack decomposition, no five-defect identity.**
- **Lamzouri arXiv:2609.02882v2 (HTML)**: *avoids* "the finite-dimensional matrix construction
  altogether", substituting "a single Hilbert space inequality" via Bessel + Gram–Schmidt; no
  equality-case or defect analysis (only index-range splits and a²+4≥4a-type inequalities).
- Genre neighbors (equality-case analyses of trace inequalities exist as a genre): So, *equality in
  Golden–Thompson iff AB=BA* (zbMATH Zbl search hit, doi 10.1137/0613070); Carlen 2010 survey
  (already cited in mathlib); Ipsen–Saibaba 2025 (zbMATH: stable rank ‖A‖²_F/‖A‖²₂ vs rank genre
  comparison — rank-surrogates, not an energy identity). Nothing combining rank + positive index
  + Frobenius into named defects.

**Verdict**: **NEW-CLAIM-SUPPORTED** (medium-high confidence) — the exact five-defect identity and
the simultaneous-equality characterization are new as statements. Required dossier amendments:
(a) add AF Lemma 3.2's stated equality case and §7.2(b) sharpness to "nearest misses" (the dossier
currently cites only `lemmaR_tight`); (b) note A4 overlaps AF's equality case for the *base* lemma —
A4's value is the *finer five-defect* simultaneous characterization; (c) note the Lamzouri
matrix-free route: the defect identity concerns the AF/zeta23 certificate line specifically — if
that line is methodologically superseded, the identity's consumers shrink (its standalone
linear-algebra novelty stands).

## §2. DOSSIER-CHECKED — dossier 02 (bandwidth-k ceiling laws)

**Dossier's pending queries run**: AF §7.2 and Lamzouri for bandwidth-2/B₂; one-level-density
support-barrier literature (Iwaniec–Sarnak; Hughes–Miller "coupled"); citations to AF.

**Evidence**:
- **AF v2 (HTML)**: no bandwidth-2/two-point certificate, no B₂, **no open-problems section at
  all**. Crucially §1.4 *names the barrier the dossier formalizes*: "improving on 2/3 by this
  route would require pair-correlation information beyond Fourier support 1"; §7.3: if
  Montgomery's form factor were known on all support "the method would certify 100% simple zeros
  on the line". §7.2(f)'s HL*(k₀) framework is about higher *moments*, not bandwidth-two
  certificates.
- **Lamzouri (HTML)**: no bandwidth/ceiling/0.6818 content; only Remark 3.4 "C_MT is the optimal
  constant that one can obtain using our method".
- Nearest kin verified: **Iwaniec–Luo–Sarnak 2000** one-level density (verified via
  arXiv:1604.03224 abstract citing it); support-extension line arXiv:2210.15782. **Citation
  correction for the dossier**: "Hughes Miller 'zeros of L-functions coupled' (2008)" is garbled —
  the verified paper is **C. P. Hughes & S. J. Miller, "Low-lying zeros of L-functions with
  orthogonal symmetry" (2007)** (zbMATH, 2 hits under `Hughes Miller low-lying zeros`); no paper
  titled "zeros of L-functions coupled" exists in arXiv or zbMATH.

**Verdict**: **NEW-CLAIM-SUPPORTED** — the B_k hierarchy, bandwidth-2 stability calculus, and the
LP/weak-duality computability framing exist nowhere in the literature; AF motivates but does not
pose B₂ (fix the Hughes–Miller citation before triage).

## §3. DOSSIER-CHECKED — dossier 03 + 03a (compression rank–trace)

**Dossier's pending queries run**: `"law of inertia" compression`; `"positive index" monotone
congruence`; Cauchy interlacing compression; `"trace inequality" restriction/compression
Hermitian Frobenius`; `"Gram matrix" truncation inertia zeros`.

**Evidence**:
- 03a's classical status **confirmed**: n₊(BᴴTB) ≤ n₊(T) is textbook inertia theory (Sylvester's
  law of inertia; the isometric case is an immediate consequence of Cauchy interlacing — cf.
  Horn–Johnson *Matrix Analysis* ch. 4 (interlacing Thm 4.3.28 / inertia topics 4.5), the
  Ostrowski–Schneider (1962) inertia-theorem lineage). zbMATH/arXiv surface nothing more recent
  or more specific. The dossier's "glue-not-discovery" honesty note is upheld.
- **Theorem M** (compression rank–trace with *global* inertia budget): no match in arXiv, zbMATH,
  or the AF paper (which never compresses — verified §1.4/§7 contain no truncation analysis);
  AF's §7.2(b) sharpness discussion is in situ, not under compression.

**Verdict**: 03a = **KNOWN-INFORMAL-ONLY** (classical; formal-absence claim from round 1 stands —
correct as stated). Theorem M = **NEW-CLAIM-SUPPORTED** as a statement (weight as infrastructure,
per the dossier's own honesty note).

## §4. PRE-CHECK — Z3 (uniform-in-k + polynomial space ETH refutation) — CRITICAL

**Sources audited**: openai `paper.pdf` (pdftotext, Thm 1.1 p.2); openai Lean
(`SqrtLogSpace/Final.lean`, `SubexponentialSAT.lean` local read); eth `paper.pdf` (pdftotext,
Thm 1 p.2 + all 13 "space" hits); suquark/NotETHSimplified both `paper.pdf`s (downloaded +
pdftotext); unaltuzun `docs/REPORT.md` + `VERIFICATION.md` (fetched).

**Evidence — the four cells of the 2×2 (uniformity × space), plus rate:**

| Claimant | k-uniform? | space claimed? | rate | medium |
|---|---|---|---|---|
| anthropics `eth` (paper 2026-10-26, Thm 1) | **YES** (one algorithm, absolute constant, every k) | **NO** (13 "space" hits: probability/vector/graded spaces only — verified) | 2^{O(min{km/√log m, k²n·loglog n/√log n})} | TM2 (mathlib) |
| openai preprint (Thm 1.1) | no ("for every **fixed** k ≥ 2") | **YES** ((n+m)^{O_k(1)} bits) | 2^{O_k(n loglog n/√log n)}; sparse O_{k,D}(n/√log n) | bit ops (multitape PrimitiveMachine) |
| openai **Lean** (what is actually formalized) | no | yes (visited-space monitor) | **weaker**: 2^{O_k(n(loglog n)²/√log n)} (ρ(n) interpolation bound); sharper Thm-1.1 bounds have *no Lean counterpart* (unaltuzun REPORT §1) | own PrimitiveMachine + LocatedCfg.monitor |
| suquark paper 1 "One Pigeonhole" (Thm 1.1) | no — **3-SAT only** (k=3) | **YES** ("and space |φ|^{O_ε(1)}"; "formalized … down to a multitape machine, **with its time and space**") | C_ε|φ|^{O_ε(1)}2^{εn} (ε-form, no explicit rate) | multitape TM |
| suquark paper 2 "Uncrossing Wires" | no — 3-SAT | yes (formalization "with its time and space") | same ε-form | multitape TM |
| unaltuzun verify repo | — (audits openai only) | — | — | reports KERNEL-VERIFIED 2026-10-28 (build exit 0, 3 standard axioms, Comparator accepts) |

**Verdict**: **NOBODY claims the conjunction** (one machine + one constant, ∀k, min-rate, polynomial
space). Z3's novelty cell is real. Two neighboring cells are now taken and must be excluded from
any novelty phrasing: (i) *poly-space subexponential 3-SAT* (ε-rate) — suquark paper 1, paper+Lean;
(ii) *per-k poly-space explicit-rate counting* — openai paper (Lean: weaker rate but with space).
Additional context: expositions by O'Donnell [O'D26] and Kintali [Kin26] (not on arXiv — blog-level);
an Impagliazzo–Paturi–Williams examination group is pending (openai `history.md`). eth paper is not
on arXiv (title search round 1: 0). **Confidence: high.**

## §5. PRE-CHECK — E1/20 (AF-proportions for Hecke L over ℚ(√−3) / ζ_K)

**Evidence**:
- **AF v2 (HTML)**: only Dirichlet — "Theorem A holds verbatim for L(s,χ) … for any fixed
  primitive Dirichlet character χ" (Theorem B) + family average (Remark 7.2);
  Davenport–Heilbronn and Epstein zeta appear **only as control objects where RH fails**
  (§1.4, App B). No Hecke/Dedekind/Artin anywhere.
- **Lamzouri (HTML)**: ζ only; no L-functions beyond.
- **Classical nearest kin** (different shape — conditional *counts*, not unconditional
  *proportions*): Wei Zhang, arXiv:2310.07360 (Ramanujan J. 2024, doi 10.1007/s11139-024-00831-8)
  — conditional lower bound on the *number* of non-trivial simple zeros of ζ_K for quadratic K,
  assuming L⁶-Lindelöf-on-average for ζ and L(s,χ); "stronger version of Conrey–Gonek–Ghosh's
  conditional result", improving Wu–Zhao. Nothing unconditional, nothing for Hecke L proper.
- **Distinction confirmed** (per orchestrator's note): classical zero-*density* theorems
  (N(σ,T) bounds, IK04 ch. X, density hypotheses) are a different notion from AF-type
  proportion-of-simple-zeros; no density-theorem source states the proportion version.

**Verdict**: **PRE-CHECK NOVEL-SUPPORTED** — proportion version beyond ζ/Dirichlet is unstated in
the AF cluster and in the classical literature found (nearest kin: conditional counts, CGG →
Wu–Zhao → Zhang 2023). Confidence: medium-high.

## §6. PRE-CHECK — 50 (improved MT-type window constants from a zero-free strip)

**Evidence**:
- **AF v2 (HTML)**: no zero-free-strip-conditional constants anywhere. The conditional results
  are RH-shaped only: §7.3 assumes full RH (third trace via Hejhal / Rudnick–Sarnak, giving
  liminf N_d/N ≥ 0.85082); §7.1 assumes zeros "within o(1/log T) of the line". Nothing uses a
  Re s > 7/8-type strip (quasi-RH) to improve window constants.
- **Lamzouri (HTML)**: nothing (ζ only; Remark 3.4 optimality of C_MT by his method).

**Verdict**: **PRE-CHECK NOVEL-SUPPORTED** — computing window constants under openai-math's 7/8
zero-free strip (`QuasiRiemannHypothesis.lean`) is done nowhere; nearest miss = AF §7.3's
RH-conditional 0.85082. Confidence: medium-high.

## §7. PRE-CHECK — 51 (ω → word-RAM bit bridge)

**Evidence**:
- **Classical status: KNOWN.** V. Pan, *"The bit complexity of matrix multiplication and of
  related computations"* (1985), doi 10.1016/0898-1221(85)90095-1 (zbMATH Zbl 0674.68027); Pan,
  *How to multiply matrices faster* (1984, doi 10.1007/3-540-13866-8); Schönhage 1981 (*Partial
  and total matrix multiplication*, SIAM). The arithmetic→bit-complexity transfer with
  polylog(entry-size) overhead is established 1980s material and is the standing assumption of
  the modern numerical-complexity line (e.g. arXiv:2410.21550 "arithmetic and bit complexity of
  Hermitian eigenproblems").
- No *formalization* of the transfer exists (round-1 word-RAM sweep: nothing; mathlib nothing).

**Verdict**: **PRE-CHECK KNOWN-INFORMAL-ONLY** — the bridge theorem is classical (Pan 1985);
candidate 51 must be scoped as a *formalization* contribution (or folded into Z2/dossier 12 F3b),
not as new mathematics. Confidence: high.

## §8. Dossier 11 (Z1) and 12 (Z4) pending queries (run as part of this round)

- **Z1 (composable reduction theory)**: nearest formal relative found — **AFP `Cook_Levin`
  `Composing.thy`** (isabelle-prover/mirror-afp-devel): composes two TMs computing f₁, f₂ with
  time bounds, "M computing f₂∘f₁ in time O(T₁ + T₂∘T₁) (monotone T₁)" — i.e., *function*
  composition with time, in Isabelle. Distinct from Z1's Theorem A (many-call reductions with
  charging arithmetic `T' ≤ extra + calls·T` over an abstract cost semantics) — no such calculus
  found anywhere (arXiv, GitHub, AFP). **NEW-CLAIM-SUPPORTED**; add Composing.thy to nearest
  misses.
- **Z4 (parametric savings ε(ω_b))**: AVW paper arXiv:2610.06783v1 (HTML) does **not**
  parameterize by ω — all savings constants (0.063, 0.437, 0.1204, 1/18) come from analyzing
  **Schönhage's ten-multiplication identity directly**; ω appears only as background
  ("2 ≤ ω < 2.372"; "even if ω=2, this is m^{4/3}" — about *old* bounds); Theorem 34 uses the
  rectangular μ, not ε(ω). **NEW-CLAIM-SUPPORTED** for the ε(ω_b) function — with one substantive
  caution for the dossier: the AVW savings flow from a *fixed* tensor identity, so better MM
  enters only through the `termPrime` term; the monotonicity-in-ω_b claim must be proven through
  that single channel (dossier step 2 already says this — flag it as the load-bearing check).

---

## §9. Standing strategic notes

**(i) IEANTN depreciation risk** (teorth/IEANTN: `zetaN`/`HasRvMBound` vocabulary + ZeroCount
stub + RosserSchoenfeld/Backlund solutions, per round-1 §item 2):
- **Immune**: 01, 02, 03 (pure linear algebra / certificate theory — IEANTN has no
  matrix-inequality content); 10/Z3 (uniformity+space — IEANTN is analytic NT only); 11, 12
  (complexity); the 0.6818 ceiling and Hall/Parseval-type results.
- **Exposed**: any candidate whose headline is "first RvM / first Weil-EF / first zero counting
  in mathlib" — i.e., the zeta23 donor claims of survey §4, and the RvM/EF *components* of
  E1/E2/E3. If IEANTN lands RvM+EF first, E1's *feasibility* improves (generic machinery to
  instantiate) but its "first" framing narrows to "first for Hecke"; the pure donation plays
  ("RvM into mathlib") lose their window. Action: sequence any RvM-donation pilot early or
  retarget it as "zeta23 ↔ IEANTN bridge" (their `HasRvMBound` predicate is already a compatible
  interface).
**(ii) mathlib zeta-area race** (PRs #41394 Mertens theorems [open], #44062 prime + von Mangoldt
weights [open], #43238 weak PNT [open], #43233 Wiener–Ikehara [merged]; new files HardyZ,
ZetaZeros, WienerIkehara): exposed are the in-flight analytic-NT dossiers numbered 22/60
(E3-class "first PNT-with-error / Chebyshev–Mertens donation" plays) — the FromPNTPlus port's
value decays as #41394/#44062 land, and "mathlib's first PNT" dies with #43238. E3 should be
scoped to what mathlib will still lack: the *effective error term* (ψ(x) = x + O(x^{7/8+ε}))
and the openai 7/8 quasi-RH input. Rank-1/2 items are unaffected.
**(iii) Octonion donation surface** (round-1 item 11): opportunistic, S-effort, zero depreciation
risk — mathlib has quaternions only (`Mathlib/Algebra/Quaternion.lean`), no octonions/Cayley–
Dickson; the theorem exists in AFP (`Octonions/Octonions.thy:363 multiplicative_norm_octo`) and
the sign form in eth (`Eight.signs`). Not a discovery; a goodwill donation that exercises the
cross-corpus port machinery cheaply.

## §10. Summary table

| § | Candidate | Check type | Verdict | Confidence |
|---|---|---|---|---|
| 1 | 01 inertial-defect identity | DOSSIER-CHECKED | NEW-CLAIM-SUPPORTED (add AF Lemma 3.2 equality case + §7.2(b) to nearest misses; Lamzouri caveat) | med-high |
| 2 | 02 bandwidth-k ceilings | DOSSIER-CHECKED | NEW-CLAIM-SUPPORTED (AF motivates, does not pose B₂; fix Hughes–Miller cite → "Low-lying zeros…" 2007) | high |
| 3 | 03a inertia pullback | DOSSIER-CHECKED | KNOWN-INFORMAL-ONLY (classical; glue) — dossier honesty note upheld | high |
| 3 | 03 Theorem M | DOSSIER-CHECKED | NEW-CLAIM-SUPPORTED (statement-level; infrastructure weight) | med-high |
| 4 | 10 / Z3 uniform+poly-space | PRE-CHECK | NOVEL-SUPPORTED — conjunction claimed by nobody; exclude suquark (3-SAT+space, ε-rate) and openai (per-k+space) cells from phrasing | high |
| 5 | E1/20 Hecke proportions | PRE-CHECK | NOVEL-SUPPORTED — AF/Lamzouri Dirichlet/ζ-only; classical kin = conditional counts (Zhang 2310.07360; CGG; Wu–Zhao) | med-high |
| 6 | 50 7/8-strip constants | PRE-CHECK | NOVEL-SUPPORTED — AF §7.3 is RH-conditional only; no strip-conditional constants anywhere | med-high |
| 7 | 51 ω→bit bridge | PRE-CHECK | KNOWN-INFORMAL-ONLY — Pan 1985 (doi 10.1016/0898-1221(85)90095-1); scope as formalization only | high |
| 8 | 11 / Z1 reduction calculus | DOSSIER-CHECKED | NEW-CLAIM-SUPPORTED (nearest miss: AFP Cook_Levin Composing.thy — function composition, not call-charged reductions) | med-high |
| 8 | 12 / Z4 ε(ω_b) | DOSSIER-CHECKED | NEW-CLAIM-SUPPORTED (AVW freezes constants, Schönhage-identity-derived; monotonicity-via-termPrime is the load-bearing check) | med-high |
