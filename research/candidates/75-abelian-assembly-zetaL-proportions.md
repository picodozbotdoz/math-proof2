# Candidate dossier 75 — abelian-assembly-zetaL-proportions

Lane A9 (dossier-writer), Cycle 2, 2026-11-13. **Split-out of dossier 70 Part B** per A9's
own recommendation there ("promote Part B to its own dossier once A5 weighs in" —
`research/candidates/70-unconditional-zetaK-zero-confinement.md` § Lane proposal); the
orchestrator commissioned it ahead of A5's PART-2 verdicts. Realizes A1's hook H1(a) /
A3's §(f) feeder note ("the M4 architecture generalizes verbatim … a 70-series candidate
statement no corpus has"). Built on the PROVED pilot-42 stack (`research/pilots/42/
{M1,M2a,M3,M2b,M4a}.lean`) and the DZDF donors [VERIFIED in-repo this lane]. Tags:
[VERIFIED] / [HYPOTHESIS] per claim.

**Honesty header (read first).** The candidate's claim, stated at its honest size:

- **The assembly MACHINERY is pilot 42's and is NOT claimed here**: `epsLowerCum_of_
  factorization` (`M2b.lean:1024`), the count-add layer, `EpsLowerCum_mono`, the
  defect/hCZ seaming — all GREEN and kernel-verified in this repo. What is new is the
  **statement class**: zero-proportion (and strip-confinement) theorems for **ζ_L, every
  abelian extension L/K** — the n+1-factor generalization of the quadratic landing
  theorems — plus the **component-proportion binder schema** (Hecke-L proportions as
  named EnclOK-style hypotheses: *nobody can discharge them today — that is the named
  open core and the novelty*), plus the **partially-unconditional instantiation at
  K = ℚ** (ζ-component discharged unconditionally by ZetaZerosV2 per A3's 42-M4 plan;
  Dirichlet components stay zeta23-conditional). No corpus contains any ζ_L zero
  statement of any kind ([VERIFIED], § Novelty).
- **Category: DISCOVERY-grade claim on the statement class, CONDITIONAL-CORE today** —
  the landing theorems carry component binders no donor supplies; the ℚ-route is
  unconditional in exactly one of its two component classes (the A3 "partially
  unconditional" pattern). One literature check gated the grade: whether DLRT
  arXiv:1908.04876's SDP distinct-zero proportions cover ζ_K *uniformly over K* (which
  would make the primary math-known, formalization-first) or only the Dirichlet/
  quadratic scope dossier 42 recorded — **RESOLVED 2026-11-13 by A5's PART-2 P2-3 flip:
  "DLRT 1908.04876 is SCOPED (Thm 1.1 fixed abelian K under GRH (o_K(1), T→∞); Cor 1.3(i) fixed quadratic K, GRH-conditional) — NOT uniform ⇒
  primary is NOT math-known ⇒ N stays 4" (VERDICTS C2 row 75; standing note 3's erratum
  corrects the main-run §5.2(c) reading). The primary is a new statement family.** The
  location-side corollary C3 inherits dossier 70's
  per-class split and parametric constants (Liu-2 clock).
- Also honest: at K = ℚ the *right* half of any ζ_L confinement is just DZDF@L (CT
  applies to every number field — the factorization is not needed there); the
  factorization route's genuine new coverage is (i) the proportions (any base) and
  (ii) the left half for **real-place** abelian L/ℚ, outside dossier 70-C2's
  totally-complex reach.

---

## Name

abelian-assembly-zetaL-proportions

## One-line pitch

DZDF's `dedekindAbelianQuotient`/`abelianFactorization` — ζ_L = (∏ nonprincipal Hecke
L-series of K) · ζ_K for EVERY abelian Galois L/K — turns pilot 42's proved two-factor
proportion assembly into an n+1-factor landing theorem for ζ_L (the first zero-proportion
statements for any ζ_L, conditional on component-proportion binders nobody has), with the
K = ℚ route partially unconditional (V2's C₀ > 2/3 discharges the ζ side outright per A3's
42-M4 plan; the Dirichlet components stay zeta23-conditional) and a location-side corollary
confining ζ_L's zeros to the parametric [1−θ, θ] strip for real abelian fields.

## Precise mathematical statement

**Objects (all [VERIFIED]).** DZDF donors: `dedekindAbelianQuotient`
(`DedekindZetaZeroFree/LFunctions/Dedekind/EntireAbelianQuotient.lean:13`): for abelian
Galois L/K, continuations `f_K`, `f_L` (differentiable off {1}, agreeing with
`NumberField.dedekindZeta` on ℜs > 1) and an **entire** `g` with `f_L s = g s · f_K s` for
s ≠ 1 — with `g = ∏ i, F i s` built in-proof from `rayCharacterEntire` continuations
(:26–28). `abelianFactorization` (`AbelianRayCharacterFactorization.lean:62`): ∃ n, moduli
`m i ≠ ⊥`, characters `χ i : RayClassCharacter K (m i)` with **`∀ i, m i ≠ ⊥ ∧
¬(χ i).IsPrincipal`** (so each F i is entire and CT-Corollary's pole exclusion is vacuous),
and `ζ_L(s) = (∏_i Σ'_I χ i I · N(I)^{−s}) · ζ_K(s)` for ℜs > 1. DZDF Hecke zero-free:
`heckeL_ne_zero` (`HeckeCorollary.lean:12`, 31/32); DZDF ζ_K zero-free:
`dedekindZeta_ne_zero` (`Main.lean:9`, 31/32). Pilot-42 PROVED vocabulary (this repo,
cumulative windows (0, T]): `ZeroMult`/`multOf` (= `analyticOrderNatAt`), `countCum`
(`M2b.lean:779`, N with multiplicity), `countOnCum` (:784, on-line with multiplicity),
`EpsLowerCum` (:800: ∀ε>0, ∃T₀, ∀T≥T₀, (c−ε)·countCum ≤ countOnCum),
`EpsLowerDistinctCum` (:804), `commonOnLineCum` (the C_D defect), the two-factor engine
`epsLowerCum_of_factorization` (:1024), the landing theorem `zetaK_two_thirds_landed`
(:1062) and the distinct/hCZ forms (:1081, :1121); the strip-distinct successor layer M4a
(on disk; run log pending): `distinctCountCum` (`M4a.lean:821`), `EpsLowerDistinctStripCum`
(:833), `commonStripCum`, `zetaK_distinct_five_sixths_strip_landed(_of_negligible)` with
the `hCZ′` binder. V2 (BUILDS on our pin, `axiommath-bump/logs/v2-run9.log`):
`ZetaZeros.simple_proportion_lower` (`ZetaZerosV2/ZetaZeros/Main.lean:47`, C₀ =
0.6725007… > 2/3) and `distinct_proportion_lower` (:88, C₁ = 0.8362504… > 5/6). zeta23:
the Dirichlet ThmE proportion family (`Challenge.lean:131–229`, v4.33 tree — the `hEχ`/
`hEχd` binders of pilot 42). External: Liu-1's repo (B_new = 0.8749570,
github.com/liubaiying101/Slightly-improved-…, portability unprobed — location-side
alternative only; round-4 §5.3).

**(P) Primary — the abelian-assembly landing theorem (the statement class; the
component-proportion binder schema).** For every abelian Galois L/K with the DZDF
factorization data (n, m, χ, f_K, f_L, F := fun i => F i), write `z_K :=
⟨multOf f_K, hfinK⟩` and `z i := ⟨multOf F i, hfin i⟩` (window-finiteness hypotheses;
see Feasibility), and `c* := min (c₀, Min over i of c i)`:

  (P-a) **with-multiplicity proportion:** if `EpsLowerCum z_K c₀` and `EpsLowerCum (z i)
  (c i)` for every i, then `EpsLowerCum ⟨multOf f_L, hfinL⟩ c*`.
  (P-b) **strip-distinct proportion, defect and hCZ′ forms:** if each component carries
  `EpsLowerDistinctStripCum` at its constant, then the assembled `EpsLowerDistinctStripCum
  ⟨multOf f_L, hfinL⟩ c*` holds with the pairwise `commonStripCum` defects — and the full
  form holds under the n-wise strip-common negligibility binder (the `hCZ′` schema across
  the family: every pairwise shared-strip mass is a density-zero fraction of the merged
  count).

Both are the n+1-factor generalizations of `zetaK_two_thirds_landed`
(`M2b.lean:1062`) and `zetaK_distinct_five_sixths_strip_landed(_of_negligible)` (M4a) —
same quantifier shapes, same ε-forms, hypothesis list lifted from two factors to the
abelian family. The **component-proportion binders are the open core**: for general K no
corpus has Hecke-L proportions of any strength (dossier 20's whole programme); the schema
names them precisely (`EpsLowerCum (z i) (c i)`, EnclOK posture) so any future donor
(dossier 20's engine route, a hypothetical Lamzouri-for-Hecke) discharges them slot-in.

**(C1) The conditional landing shape at the classical constants.** Instantiating (P) with
the component constants 2/3 (resp. strip-distinct 5/6): for every abelian L/K, ≥ (2/3 − ε)
of ζ_L's window zeros (with multiplicity) lie on the critical line — and the 5/6
strip-distinct defect/hCZ′ forms — given the component binders at those constants. This
is the theorem that mirrors pilot 42's landing statements one degree up the tower.

**(C2) Partially-unconditional instantiation at K = ℚ (the exact discharge accounting).**
For abelian L/ℚ: the components are ζ (the base f_ℚ) and n Dirichlet-type L(χ_i) (each
χ_i a nonprincipal `RayClassCharacter ℚ (m i)`, read as a Dirichlet character via the
ℚ ray-class dictionary — the shared glue of dossier 70-C1; imprimitive factors handled by
the Euler-correction strip-immunity lemma, dossier 70-B-cor). Then:

  - **ζ-component: discharged UNCONDITIONALLY** — V2's `simple_proportion_lower` (C₀ >
    2/3) + the count-identification glue + `EpsLowerCum_mono` + the numeral lemma
    `2/3 ≤ C₀` (A3's 42-M4 plan verbatim: `countCum_eq_zeroCount`,
    `countOnCum_eq_onLineCount`, `epsLowerCum_zeta`; window and quantifier shapes match —
    both cumulative (0, T]). Milestone M4b per A3 §(c) recommendation 1 (planned; not yet
    on disk).
  - **Dirichlet components: STAY conditional** — zeta23's ThmE Dirichlet proportions as
    `hEχ`/`hEχd` binders (A3 §(c) verdict 4: no on-pin corpus has Dirichlet-L proportion
    content; the discharge path is the zeta23 v4.33 port). **Scope precision (so no one
    mistakes the class): DZDF's and Liu-1's Dirichlet results are zero-free
    half-planes — they feed the location side (C3), never the proportions.**
  - **Landing:** for every abelian L/ℚ (cyclotomic fields ℚ(ζ_m) and all subfields
    included), `EpsLowerCum ⟨multOf f_L, hfinL⟩ (2/3)` conditional only on the
    Dirichlet-component ThmE binders + the structural set + window-finiteness — strictly
    fewer hypotheses than any prior ζ_L statement, there being no prior ζ_L statement.

**(C3) Location-side corollary at ℚ (where DZDF/Liu-1 DO bite; round-4 §5.3's exact
instantiation, parametric).** For every abelian L/ℚ **including real-place fields** (e.g.
maximal real subfields ℚ(ζ_m)⁺ — outside dossier 70-C2's totally-complex reach): every
nontrivial zero ρ of the ζ_L continuation satisfies **1−θ ≤ ρ.re ≤ θ**, parametric in θ,
with θ = 31/32 the in-corpus instantiation — conditional only on the Dirichlet reflection
binder `hFEχ` (pilot 50's one-decl donation `DirichletCharacter.LFunction_one_sub` would
kill it). Right half: component zero-free — ζ via DZDF@ℚ, each L(χ_i) via
`heckeL_ne_zero` at K = ℚ with the pole exclusion **vacuous** (`¬IsPrincipal`, per
`abelianFactorization`'s conclusion) — or, simpler, DZDF@L directly (CT applies to every
number field; recorded so the factorization is not over-credited). Left half: per-component
reflection (ζ: mathlib `riemannZeta_one_sub`, pilot 50 M1's proved pattern; Dirichlet:
`hFEχ`). Parametrically stronger external option: Liu-1's repo at B_new = 0.8749570
(portability unprobed; the [1−B♭, B♭]-clock of dossier 70 applies).

## Novelty check

Corpus side (rg, this session, exact patterns; the v2-index caveats of round-4 §0 apply to
the axiommath labels):

- **ζ_L statements of any kind, formal absence:** zeta23 proportions are ζ + Dirichlet
  only (`Challenge.lean:131–229`); V2 is ζ-only (`ZetaZerosV2` challenge layer, survey
  §1.2); DZDF has the abelian factorization but no counting and no proportions (A1 §2b:
  "a pure zero-free-region theorem"); openai has no proportions for any L (dossier 20
  §Novelty [VERIFIED]); tauceti's factorization is quadratic-only with no counting;
  mathlib has no ζ_L object. This lane, corroborating dossier 70-Part-B's greps:
  `rg -i -c 'abelian' zeta23/Zeta23/` → 0 content files; `rg -c 'EpsLower|countCum'
  axiommath/` → 0 (the assembly vocabulary exists only in this repo's pilots).
  **"≥ 2/3 on-line for ζ_L" and every other (P)-shape statement appears in no corpus.**
- **Machinery attribution (explicit, per the commissioning relay):** the two-factor
  assembly, count-add, ε-forms, and hCZ seaming are pilot 42's GREEN layer — cited as
  donors throughout, not claimed. The deltas claimed: the n+1-factor statement class, the
  component-binder schema, the ℚ-route accounting, C3's real-abelian strip.
- **Literature (dossier-level; A5 PART-2 runs when this lands — queries pre-registered):**
  - **DLRT arXiv:1908.04876** — the gating nearest miss: SDP distinct-zero proportions,
    recorded by dossier 42/round-4 FF-5 as "ζ_K distinct via SDP". **Scope question
    RESOLVED by A5's PART-2 P2-3 (2026-11-13): DLRT's Thm 1.1 is fixed ABELIAN K under
    GRH (o_K(1), T→∞) and Cor 1.3(i) fixed quadratic K, GRH-conditional asymptotic — nothing
    uniform over K, no Hecke/non-abelian ⇒ (P) is a
    VERDICTS §5.2(c) reading "unconditional 45% distinct" was wrong; cite DLRT with the
    corrected qualifiers.) Consequence for kind, per A5's row-75 re-scope: DLRT's
    GRH-conditionality makes our certificate-conditionals **closer in kind** to the
    nearest miss than an unconditional-vs-conditional gap would suggest — the honest
    comparison is hypothesis-shape-to-hypothesis-shape (their GRH binder vs our
    component-proportion binders), and ours are strictly weaker hypotheses at a weaker
    constant family.
  - **Liu-2 arXiv:2610.26835** (B♭ uniform over every K, informal, Lean in progress):
    family overlap (every abelian field) but *half-plane nonvanishing*, never
    proportions or strips — the C3 clock, not a (P) competitor.
  - **Dossier 20's R8 evidence** (AF 2608.13637, Lamzouri 2609.02882, 2608.16034,
    2609.27808): all ζ/Dirichlet — no Hecke/ζ_K/ζ_L proportions found in rounds 1–3.
  - **Trudgian–Zuniga Alterman 2610.16010** (low-lying ζ_K zeros, h(K) < 0.58): the
    ζ_K-zero side's monthly cadence, different quantity (must-cite per the QR-D row).
  - **Kuwahara-style traps: none here** — (P) is a proportion-assembly, not a
    concentration-from-gap claim; the only inherited no-go is hCZ (below).
  - **[A5 PART-2 LANDED 2026-11-13, row 75 (P2-3 + the queued ζ_L/Hecke-proportion
    queries):]** the flip quoted above resolves the gating question; hexagonmath swept
    (FF/QR-D clusters clean — only Boyang Hu, different layer); "abelian-extension
    assembly (DZDF `dedekindAbelianQuotient` + V2 donors) has no uniform-over-K
    competitor anywhere found".
- Nearest misses (summary): DLRT 1908.04876 (the gating one); Liu-2 2610.26835 (family,
  wrong quantity); dossier 20's engine route (the sibling path to Hecke proportions,
  L-effort); dossier 42/pilot 42 (the machinery and the quadratic instance);
  DZDF `abelianFactorization` (the identity, no consumer); dossier 70 Part A/C3 (the
  confinement vocabulary and the ℚ glues this dossier shares).

## Bridge analysis

- Corpora bridged: **DZDF (the general-abelian factorization + component zero-free) ×
  zeta23 (Dirichlet ThmE proportions — the constants leg) and ZetaZerosV2 (the ζ-column,
  unconditional on-pin) × the pilot-42/20 PROVED machinery in this repo (assembly engine,
  window vocabulary, binder discipline) × mathlib (`analyticOrderAt` additivity,
  `riemannZeta_one_sub`, the identity-theorem layer).**
- Why essential (no single side states or proves (P)): DZDF has the factorization but no
  counting and no proportions; zeta23/V2 have proportions but no ζ_L object and no
  factorization beyond quadratic (tauceti's, which pilot 42 consumed); the pilots' engine
  is proved only in the two-factor shape and has no source for the n-character family;
  mathlib has neither object. The three glues (n-factor order-additivity from
  `f_L = (∏ F i) · f_K`; the ℚ ray-class dictionary; Euler-immunity) exist nowhere.
- Empty-zone fit: A1 §4 H1(a) ("generalizes dossier 42's product-assembly route … to
  every abelian extension"); A3 §(f) (the named 70-series feeder); the analytic-nt
  bridge's E1 (dossier 20's zone) at its product-assembly route, one degree up the
  extension tower.

## Proof-strategy sketch

1. (S–M, the new glue) **n-factor count transfer:** from `f_L s = g s · f_K s` (s ≠ 1)
   with `g = ∏ i, F i s` (`EntireAbelianQuotient.lean:28`), `multOf f_L ρ = multOf f_K ρ +
   Σ_i multOf (F i) ρ` — pilot-42 M2a's `hfac_of_factorization` argument (order-additivity
   over products of functions analytic off {1}, `analyticOrderAt` API) iterated over
   `Fin n`; the analyticity preconditions come with the DZDF continuations (F i entire by
   nonprincipality).
2. (S) **Window-finiteness:** structural hypotheses `WindowFinite (multOf ·)` for f_L and
   each F i (A3 §(f) flags no on-pin donor; the discreteness route — analytic off {1},
   nonzero ⇒ discrete zeros ⇒ window-finite — is the pilot-20 `zeroMultOf hfin` pattern;
   routine but a real obligation, carried explicitly).
3. (Routine) **The assembly:** iterate `epsLowerCum_of_factorization` (`M2b.lean:1024`) n
   times along `ZeroMult.add` associativity, with `EpsLowerCum_mono` to level all
   components at c* — engine unchanged, bookkeeping new. (P-b): the M4a strip-distinct
   mirror with pairwise `commonStripCum` defects and the n-wise `hCZ′` negligibility
   binder (`assemble_eps_defect_strip_cum` iterated).
4. (C2) **The ℚ accounting:** the ray-class dictionary + Euler-immunity (shared with
   dossier 70, proved once); ζ-side discharge per A3's 42-M4 (`countCum_eq_zeroCount` +
   `countOnCum_eq_onLineCount` + `epsLowerCum_zeta` + the numeral lemma `2/3 ≤ C₀`);
   Dirichlet components as `hEχ`/`hEχd` binders quoting zeta23's ThmE statement shapes.
5. (S) **(C3):** right half by component zero-free (or DZDF@L directly — state both,
   credit the factorization only for the left half); left half by per-component
   reflection: the ζ argument is pilot 50 M1's lines verbatim; the Dirichlet argument is
   pilot 50's `hFEχ` binder consumption; constants parametric in θ with 31/32 =
   `heckeL_ne_zero`'s instantiation and B_new = the external Liu-1 option.
6. (Packaging) **Landing theorems in the M2b/M4a shapes** — binder lists mirroring
   `zetaK_two_thirds_landed` (`M2b.lean:1062`): structural set (analyticity, order ≠ ⊤),
   `hfin*`, the factorization datum (from `abelianFactorization`, imported or
   binder-quoted per the G1 gate), the component-proportion binders, conclude.

**Hardest step:** 1's iteration bookkeeping plus step 2's finiteness obligations — both
S–M; no new analysis anywhere (that is the point: the analytic content is deliberately
quarantined into the component binders).

## Feasibility

Preliminary, R9's F0–F6 shape; the pilot-42 stack exists and is GREEN (M1/M2a/M3/M2b;
M4a on disk with run log pending — treat as unverified until a log lands, per the
log-rescue convention).

- F0: (P-a) + (C1) at 2/3 as the pilot entry; (P-b) after M4a's verification;
  (C2)/(C3) as the discharge/accounting milestones.
- F1 mathlib entry points: `analyticOrderAt`/`analyticOrderNatAt` (`Analytic/Order.lean`),
  `le_analyticOrderAt_add` (:228) and the product-shape additivity pilot 42 already
  wraps, `riemannZeta_one_sub` (`RiemannZeta.lean:178`), the discreteness pattern
  (`ZetaZeros.lean:68`), `Finset.sum`/`Min` bookkeeping.
- F2 donor lemmas: DZDF `dedekindAbelianQuotient`/`abelianFactorization`/
  `rayCharacterEntire` (`EntireAbelianQuotient.lean:13`,
  `AbelianRayCharacterFactorization.lean:62,13`), `heckeL_ne_zero`
  (`HeckeCorollary.lean:12`), `dedekindZeta_ne_zero` (`Main.lean:9`). **Consumption
  route, hard-coded (A1-4's one-line answer, `survey/axiommath-cft-vendor.md`, read
  this lane): BINDER-FIRST is the route** — quote the factorization as
  `hFac : ∀ s ≠ 1, f_L s = (∏ i, F i s) * f_K s ∧ (analyticity datum)`, the
  42-M2a `hfac`/EnclOK pattern, with **zero DZDF and zero vendor imports** and
  discharge deferred to a G1-cleared build; the **import route is
  [blocked-until-G1]** — nothing of DZDF (the vendored CFT tree included) builds on
  our pin today, no rebuild is recorded post-bump, and DZDF's triad-only audit claim
  predates the bump (on-pin `#print axioms` of the two headlines remains unrun —
  A3 §0 residual). Importing would drag the ~136-file DZDF closure + TauCeti + the
  v4.35/vendor chain (A1-4 §(c)/(d)). Statement layer elaborates on our pin (bump
  run 1) — the binder fallback is not a concession but the designed route. V2
  `simple_proportion_lower`/`distinct_proportion_lower` (`Main.lean:47,88` — BUILDS
  on-pin); zeta23 ThmE Dirichlet statements (port at ≈0 cost per the corpus-wide
  finding; proofs are the v4.33 tree); pilot 42's GREEN layers (the engine, the
  structural lemmas, the M4a strip vocabulary).
- F3 missing glue: (a) n-factor order-additivity iteration — new, S–M; (b)
  window-finiteness obligations — new, S (discreteness route) or carried as structural
  binders; (c) the ℚ ray-class dictionary + Euler-immunity — shared with dossier 70
  (S–M, prove once); (d) [named open core] the component-proportion binders — **stay
  binders by design**; discharge paths are dossier 20's engine (L) or a future
  Lamzouri-for-Hecke; (e) the hCZ′ n-wise negligibility — inherits `pilots/20-hCZ-NOTE.md`'s
  verdict (not provable today) for the full distinct forms.
- F4 Effort: **M** (≈ 500–2k LoC over the existing pilot-42 stack: iteration +
  dictionary + landing packaging; no new analysis).
- F5 Risks: (i) the G1 gate on DZDF (binder fallback keeps (P) landable — the
  factorization datum is one hypothesis); (ii) **the DLRT scope question — RESOLVED by
  A5's P2-3 (not uniform; N stays 4); residual risk only in the chapter-level precision
  of the corrected citation**; gates the
  novelty grade (pre-registered for A5 PART-2); (iii) zeta23 Dirichlet port needed for
  any future *full* discharge of (C2) — until then the ℚ-route is honestly
  partially-unconditional only; (iv) M4a unverified (log pending) — (P-b) waits on it;
  (v) the C3 clock (Liu-2's Lean would parametrically supersede the strip constants —
  the θ-statement absorbs it); (vi) window conventions all cumulative (0, T] here — a
  dyadic-window variant would need pilot 20's translation layer (not planned).
- F6: kernel-only, math-proof1 standard; Modal probe infra; pilot-42's runners are the
  template (`research/pilots/32/run_pilot.sh` pattern for staged files).

## Significance

If the component binders are ever discharged (dossier 20's engine route, or a
Lamzouri-for-Hecke), this is the first zero-density theorem for Dedekind zeta of
non-quadratic number fields — in any formal system — and the cheap sibling of dossier
20's L-effort programme (product assembly instead of engine instantiation). Even
conditional, (P) + (C2) deliver the first ζ_L statements in Lean with a precise,
donor-slot-in open core (the binder schema), and (C3) extends unconditional confinement
to real abelian fields no other route reaches. The 42-for-abelian upgrade is also the
cleanest demonstration that the pilot-42 assembly layer is reusable infrastructure — the
main run's "engine reusability" thesis, one tower up.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (A9, non-binding, post-PART-2 revision):** Novelty **4** (DLRT scope
RESOLVED by A5's P2-3 flip — "NOT uniform ⇒ primary is NOT math-known ⇒ N stays 4";
formal-new + first ζ_L statements + the binder schema), Significance **4** (first
non-quadratic ζ_K/ζ_L proportion route; reusable-assembly demonstration; real-abelian
confinement bonus), Effort **2–3 (M over the GREEN stack; no new analysis)** — rank ≈
5.3–6.7 at N4 (4×4÷3 to 4×4÷2). [A5 LANDED: N-adjust "4 (per flip rule)"; tier WARM.] Sequencing: pilot (P-a)+(C1) at 2/3 after G1 (or
binder-postured immediately); M4b (the V2 ζ-side discharge) per A3's recommendation
independently of this dossier. Honest category: **DISCOVERY-grade claim on the statement
class (gated by the DLRT scope check), CONDITIONAL-CORE today — the component-proportion
binders are the named open core nobody has; the assembly machinery is pilot 42's and is
not claimed.**
