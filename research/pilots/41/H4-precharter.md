# Pilot 41-H4 PRE-CHARTER — the n ≥ 4 combination-tier unit (seed-2's post-ship residue: the d = 8 band + the TL₄ dictionary's open core)

*Lane R4 (worktree agent-08), 2026-11-21, Iteration 6 wave 2 — owner of
iter6-seed-census Tier-1 seed 2 (`novelty/iter6-seed-census.md` `e8efb887` row 2:
"the H3 n≥4 TL hunt"). **Discovery-PREP + GO/NO-GO recommendation; NO FIRES** (no
fire order requested or consumed; the one Modal run below is the statement probe —
probes are not fires). Basis: the SHIPPED article-41H3 (post-referee bytes
`cee50022107bb942`, `articles/41H3-two-fiber-rank-closure.md`) + `H3.lean`
(`833dcff84309c986`) + the banked M pre-solve (`H3-M-candidates.md`, current
`8d211d4c69cddebb` w/ the archival note; the scan of record re-runnable at
`pilots/41/presolve/`) + the round-7 battery with §M-PRE (`5f0b57cc99556d4d`).*

## 0. Scope discipline — NEW statement territory vs the shipped closure

The shipped article claims, and this unit does NOT re-derive: Thm C1 (both closed
fibers are certified Walsh tables), Thm C2 (the strand-free lifting), Thm C3 (the
d ≤ 7 two-fiber rank no-go), the q = +1 non-traciality witness, and the
CERTIFIED-NUMERIC monomial pre-solve (L ≤ 3 exhaustive / L ≤ 4 sampled, EMPTY).
Everything below lives BEYOND that boundary, in the article's own §7-open bands:

| band | shipped state | this unit's statements |
|---|---|---|
| d = 8 (the Morin–Duchesne boundary) | untouched (C3 stops at 7) | **E1** (provable now), **E2** (open) |
| d = 14 combination words | named open ("§7's open problem", S4) | **F** (certificate shape + pullback) |
| generic q | untouched (C3 is two-fiber) | **G** (the P4 rider shape) |

Wording locks inherited verbatim: host-scoped negatives only — never "no TL₄
dictionary"; the generator-word transfer holds AT δ = ±2; never "first non-tracial
functional layer on TL" (tauceti spin), never "first Hadamard–TL connection"
(Avan), never the Walsh lemma (ANF/bent literature), never "first q-deformation of
a composition algebra" (Benkart–Pérez-Izquierdo); register "elementary
certificates, nonelementary closure". Kernel-only; decide discipline per the H2/H3
substrate rules (integer arithmetic, literal-list `lsum`/`lsumV`, no Matrix.det
under decide); donor statements (dim TL₄ = 14 classical, tauceti `spinRep`) stay
binder-or-cite, never imported.

## 1. The n ≥ 4 statement set (Deliverable 1; all elaborated GREEN — §2)

File: `pilots/41/H4-probe.lean` (`bef92692230690f5`, 290 LoC, namespace
`Pilot41H4`, §0 = the H3 surface verbatim-class). Statements:

**E1 — Thm E1, the d = 8 uniform-diagonal-κ monomial-host no-go** (P6(b) made
kernel; the hunt's first rung, provable at run-1). `table_diagLeft_nogo` /
`table_diagRight_nogo` (table-free, over any `Ring H`, EnclOK binders: zero-free
table, `NonRankOne`, torsion-free word vectors, `hmul : u p * u q = S p q • u p`
resp. `• u q`, `hdict`): associativity + the dictionary equations force the table
rank-one (left: columns of S constant, M = f ⊗ T; right: rows, M = R ⊗ f); the
2×2-minor kill contradicts `NonRankOne`. Fiber finals ×4
(`no_diagLeft/Right_dim8_sigmaRow/sigmaOne`) + the REAL micro-decides
(`sigmaRow_nonRankOne`/`sigmaOne_nonRankOne` [propext] — the certified asymmetry
pairs are exactly nonvanishing-minor witnesses; `sigma{Row,One}_zero_free` ⊆
triad). **Novelty claim:** the first kernel statement in the d = 8 boundary band
for this family — extends the battery's EMPTY class row R1(i) (obstruction-tier)
from "d ≤ 7 rank" to "d = 8 diagonal structure-constant hosts". Nearest misses:
(1) Morin-Duchesne 2015 (dimer reps, d = 2ⁿ⁻¹ = 8 at n = 4, loop value 0) —
dimension kin, no realizability question, no no-go; (2) the project's own P6
paper tier (battery-graded "NOT CLAIMABLE heuristics") — E1 is its uniform
left/right classes upgraded to kernel, the delta is the certified-fiber
instantiation + the host-class generality; (3) the low-rank/Gram folklore
(Recht-class) — the rank-one obstruction is folklore-grade, the new content is
the band placement. **Honest S1 note: E1 alone is a band extension of the
elementary register — by the S2-formality ruling precedent it is likely BELOW
the discovery bar standalone; its value is the first rung + the hunt's floor,
not a headline.**

**E2 — the d = 8 structure-constant tier (OPEN arm; Props, no verdict
claimed).** `StructureConstantDictionary M` (∃ associative structure constants N
+ functional f with Σ_r N(b,c,r)N(a,r;d) = Σ_r N(a,b,r)N(r,c;d) and Σ_r N(p,q,r)
f r = M p q — the full basis-shaped question at the boundary: is either
certified table the φ-Gram table of an 8-dimensional associative
multiplication?) + `SemigroupEvaluationTable M` (∃ associative κ, f with
f(κ p q) = M p q — the S ≡ 1 monomial subclass: semigroup/group algebras AND the
mixed-κ diagonal hosts E1 does not touch) + the unstated-questions aggregate
`diagonal8_open_questions`. **Novelty claim:** the question family is
first-mover — battery R1(iv) "constrained Gram realizability" EMPTY, M2 class
rows EMPTY, Morin-Duchesne/tauceti/XXZ rows all NOT-COVERED; a negative at this
tier is a fourth obstruction class (quota-free NEGATIVE per 78/41H/41H3
precedent); a positive is a d = 8 dictionary = DISCOVERY. Nearest misses: (1)
tauceti MarkovTrace/Spin (44-decl inventory, `spinRep :300`, tracial `:476`,
commutant class `Spin/Positive.lean:117`) — non-commutant K's and basis-tier
questions appear nowhere (M1); (2) the XXZ/two-boundary genre (Chernyak 2023
tr(K·) machinery) — spectra/correlations only, no prescribed-table question
(M2); (3) Morin-Duchesne — the d = 8 module family exists, realizability
unstated.

**F — the d = 14 combination-word certificate shape (POSITIVE arm; the
article's §7 open core).** `CombinationDictionary M` (∃ associative T on Fin 14
+ combination coefficients W + functional f with the 64 equations in the
Σ_{k,l,r} W p k · W q l · T k l r · f r form) + `dictionary_of_combination_data`
(the EnclOK pullback: given a 14-vector family in any `Ring H` multiplying by T,
the lsumV-combination words realize M through the f-pullback functional).
**Novelty claim:** the certificate shape for the article's named open problem —
the fired hunt instantiates T at the spin host's word-algebra constants
(certificate data; the archived pre-solve machinery recomputes them
exact-integer; dim-14 itself stays binder-or-cite per `Basic.lean:48–53`); a
positive ⇒ a TL₄-hosted dictionary exists (the (H) program's resurrection at
n = 4, quota-consuming DISCOVERY, S1–S4); the sector frame (S3: rank-(4,6,4)
aligned Gram decomposition) is the lead ansatz for the data. Nearest misses: (1)
the archived pre-solve (`pilots/41/presolve/` + S1–S4 findings) — monomial tier
EMPTY, combination tier explicitly unscanned; (2) Avan et al. 1306.2927 — the
Hadamard/Butson input class as candidate generator (wording lock); (3) battery
P5's constrained-Gram shape — EMPTY class.

**G — the genericity rider (P4; method-grade, never headlines).** `sigmaInt`
(the σ_q table at an integer parameter; q = ±1 recovers both certified tables by
unfolding), `GenericNoDim7 : Prop` (∃ nonzero detMpoly whose non-roots all
exclude d ≤ 7 realizations), `no_realization_dim7_generic` (the EnclOK binder
form: the determinant identity enters as `hMpoly`; L-rung cost = the eval/det
commutation). **Novelty:** battery (G4)/P4 verdict NEW-narrow method-grade;
kin: ledger §12.6's 41H 3-strand determinant analogue (−512·q·(q⁴+6q²+1),
recomputed-not-formalized — the family precedent) + mathlib
`HadamardMatrix.lean` (ambient calculus, no σ_q/TL connection).

## 2. The statement-elaboration probe (Deliverable 2) — RUN, GREEN

- File: `pilots/41/H4-probe.lean` — probe conventions in-header (NOT A PROOF
  ARTIFACT; 8 sorry markers, one per new theorem statement, so the full binder
  structure elaborates; the 4 micro-decides are real content).
- Command (executed 2026-11-21, the established pilot-41 line):
  `STAGE=/tmp/crossmath-41-h4stage; cp …/feasibility/probe/{lean_probe.py,modal_telemetry.py} $STAGE/;
  cp H4-probe.lean $STAGE/; chmod -R a+rX $STAGE; cd $STAGE &&
  /home/doz/dozenv/bin/modal run lean_probe.py --dir .`
  (doz CLI, profile semraker, warm app `crossmath-probe`, SPEC cpu=2.0 /
  memory=4096, `LEAN_NUM_THREADS=2` via the CAP secret, telemetry @60 s,
  substrate mathlib `ff2494ea` / v4.36.0-rc2.)
- **Verdict (run 2): GREEN** — `H4-probe.lean: OK; errors=0`; 8 sorry-markers
  (probe-class); micro-decides certified in-run (`nonRankOne` ×2 = [propext],
  `zero_free` ×2 ⊆ triad). Run 1 (superseded): 3 statement-shape errors — §3's
  vector-valued sums misused the ℤ-valued `lsum`; fix = `lsumV` (AddCommGroup
  foldr). Telemetry: wall 51 s, OVER=0 (run 1: 74 s, one 5752 MB olean-mapping
  OVER-mem sample, anon=0, the documented class). Log of record:
  `pilots/41/logs/h4-probe-run1.log` (`3647f38a4de74627`, provenance header +
  verbatim transcript); fired bytes `bef92692230690f5`.

## 3. Fire plan + GO/NO-GO (Deliverable 3)

**Run-1 (the only fire requested): E1 completion.** New file
`pilots/41/H4.lean` (self-contained — the H3-from-H2 precedent; H3.lean
untouched), content = the probe file with the 8 sorries discharged: E1's two
cancellation chains (mul↔zsmul commutation → htf cancellation → S-constancy →
rank-one → minor contradiction) + the 4 fiber finals (one-line applications) +
F's pullback witness + G left sorry-marked-out-of-scope (or stated Prop-only).
Price: ≈ 0.25–0.35k LoC total (the probe carries 290; the proofs add ~100–150);
**1–3 runs** (expected 1; one fix-loop budgeted for the zsmul-lemma-name class
— the only identified elaboration risk; the micro-decides are already
kernel-certified by the probe). Wall profile: ~60 s warm (H3's 62 s).
Risk classes: (a) lemma-name drift at the pin (`mul_zsmul`-family) — low,
`exact?`-class; (b) decide blowup — none (already discharged); (c) statement
drift — none (probe GREEN at the exact fired shapes).

**Run-2+ (NOT requested now): the E2/F pre-solve.** Before ANY further kernel
work on the open arms, a mechanical no-fire pre-solve unit (the institutionalized
M-candidates lesson): exact-integer constraint propagation over (i) the
`SemigroupEvaluationTable` systems (the 64 equations + associativity over
κ : Block → Block → Block — the equations constrain κ so tightly that
propagation, not enumeration, is the method; labeled-semigroup enumeration alone
is infeasible at order 8), (ii) the sector-frame feasibility of F
(rank-(4,6,4)-aligned Gram decompositions of the certified tables, exact
arithmetic + controls, the archived `presolve/` machinery pattern). Outcomes: a
survivor candidate ⇒ the F-fire to certify it (the DISCOVERY route); EMPTY ⇒ the
E2 no-go-escalation decision (which band to kernel-ize next). No GO request
attaches to this rung until that pre-solve lands.

**GO/NO-GO recommendation: GO for run-1 (E1), conditional.** Conditions:
(i) an explicit orchestrator fire order (this document requests ≤ 3 runs, E1
scope only — no scope creep into E2/F/G); (ii) H4.lean lands self-contained
(recommended) — if the orchestrator instead directs an H3.lean edit, the SAME
fire must extend the audit tail to the 16 unprinted helpers (§5); (iii) the
micro-decide proofs carried verbatim from the probe (no re-derivation drift).
**NO-GO:** firing any E2/F search or schema run blind (random search cannot see
the combination tier — S2/S4; the pre-solve gate comes first); firing G's L-rung
before the orchestrator rules the generic tier wanted at all (method-grade,
never headlines).

## 4. Discovery-grade posture (Deliverable 4 — the S1 input for R2's later gate)

- **New-statement territory, structurally:** each statement lives in a band the
  shipped article explicitly leaves open (§0's table); none re-derives C1–C3, the
  witness, or the pre-solve; every draft cites the shipped tier as predecessor.
  The battery's EMPTY class rows (R1(ii) dictionaries at every δ; R1(iv)
  constrained Gram; M1 corpus-NEW; M2 external rows) are the S1 inputs, and this
  unit ADDS two concrete question classes inside them (the d = 8
  structure-constant tier; the semigroup evaluation tier).
- **Two-sided, honestly weighted:** F-positive ⇒ a TL₄-hosted dictionary
  (quota-consuming DISCOVERY — the program's resurrection at n = 4); E2-negative
  ⇒ a fourth obstruction class (NEGATIVE-kind, quota-free per the 78/41H/41H3
  lineage); E1 = the floor rung (band extension, elementary register — flag it
  BELOW the standalone discovery bar, per the S2-formality ruling precedent; it
  must not be billed as a discovery alone).
- **The seed's census framing holds:** "TARGET-D two-sided; battery rows are the
  inputs" — this unit converts the post-ship residue (the combination tier +
  the untouched d = 8 band) into named, elaborated, probe-certified statements.
  The discovery payload remains the E2/F resolution; E1+G are its priced
  rungs.

## 5. Custody-rider status (tasking item; explicit)

**The H3.lean print-coverage rider is NOT discharged and still BINDS.** The
2026-11-21 option-(a) settlement (`2ea25a9`) resolved the PRE-SOLVE custody only
(ledger `VERIFICATION-LEDGER.md` §12.5, closing line verbatim: "The separate
H3.lean print-coverage rider (16 unprinted helpers at the next H3.lean edit)
remains BINDING and unaffected"). Terms: when H3.lean is next EDITED, that
edit's verification run extends the `#print axioms` tail to the 16 unprinted
public helpers (dotted-name / `axcheck_full`-class coverage), with no dedicated
run. **This unit does not edit H3.lean** (H4 is self-contained), so the rider is
not triggered here and carries. Compliance folded into the plan: (a) if run-1 is
directed as an H3.lean continuation instead, the fire includes the 16-helper
audit tail in the same run (§3 condition (ii)); (b) any future H3.lean edit
(e.g. an article-driven revision) carries the same obligation.

## 6. What H lands (on acceptance; no fires without the order)

1. `pilots/41/H4-probe.lean` (`bef92692`) + `pilots/41/logs/h4-probe-run1.log`
   (`3647f38a`) + this file — INDEX rows for all three (the pilot-41 family
   block).
2. The fire-order decision on §3's run-1 request (E1, ≤ 3 runs); on GO, the
   fired `H4.lean` + its log land per the run-1 protocol.
3. Optional tracker/brief one-liners: ORCHESTRATION-ITER6 R4 row → "seed-2
   statement unit delivered (probe GREEN); run-1 request pending".

— lane R4 (worktree agent-08), 2026-11-21. Sources this session: article-41H3
(post-referee bytes) + H3.lean + H3-record + H3-M-candidates (archival state) +
H3-precharter (`60278bd4`) + round-7 battery w/ §M-PRE (`5f0b57cc`) + seed census
(`e8efb887`) + ledger §12; the presolve archive listing. One Modal probe run
pair (statement tier; not a fire); no commits; article-41H3 not re-opened.
