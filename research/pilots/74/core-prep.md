# Pilot 74 core-prep — T1+T2+T4 statement rung (lane A8, 2026-11-17; staging/spec only)

Charter input: dossier 74's discovery-dense core (RESEARCH.md §Iteration 4 :120–121:
"74's T1+T2+T4 discovery-dense core (T3 rides the LP layer)"). Artifacts: this note +
`research/pilots/74/T1T2T4-P0.lean` (**STAGED-NO-RUN — orchestrator gates the run**;
sorry-free Prop-def statement rung, pilot-22 `ProbeP1_PNT` house style; the declared
probe-convention sorry class is EMPTY). T3 (the LP M-core) is deliberately out of this
tranche — it shares dossier-02's unclaimed LP-duality layer (cost-sharing note stands).

## 1. Decomposition (P0 → P1 milestones)

- **P0 (this staging):** definitions (`IsSpectrum`, `supp`, `surprisal`, `S`, `mU`,
  `varK`, `W`, `Wfun`, `datum`, `CertValid`, `Bk`, `InMGFClass`, `Phi`) + the five
  statement Prop-defs (`stmt_T1a/T1b/T1c/T2/T4`) + 3 decl pins. Elaboration on
  mathlib ff2494ea = the deliverable.
- **P1-a (T1a, routine ≈60 LoC):** Cantelli over the finite spectral measure; `W`'s
  infimum via the finite threshold grid (`Real.sInf` unfolding on a `Finset`-image set).
- **P1-b (T1b):** `Var ≤ 2σ²` from the second derivative of `exp(log m_u − uS)` at 0
  (donor calculus model: OAI `logMoment_derivative` :128, `summand_derivative` :107 —
  cited, re-proved on our defs); Chernoff split at `u = 1/(2σ)` for the window.
  Constant bookkeeping for `Phi` lives here.
- **P1-c (T1c):** instantiate (b) at `σ² = 512eθB` from hMGF (constants 512/1024/√512e
  tracked; the dossier's arithmetic).
- **P1-d (T2, routine):** zero-padding injection `a ↦ a ∘ castLE`; validity transfer by
  `Finset.sum_congr` (dossier-02 Theorem D pattern).
- **P1-e (T4 assembly):** `hVarLB` discharge (explicit two-atom spectra construction —
  the genuinely new P1 lemma, still elementary) + `Real.not_isLittleO` bookkeeping +
  resolution of Q1 (below).

## 2. Binder inventory (the open cores, EnclOK naming)

| Binder | Where | Status |
|---|---|---|
| `hMGF` | `InMGFClass`, `stmt_T1c` | verbatim AreaLaw2D `MarginalTails` first clause (`Statements.lean:482–485`), transcribed onto our defs — hypothesis binder by design (the only formalized gapped-moment bound in existence; never imported) |
| `hVarLB` | `stmt_T4` | **inventoried open core** — extremal-family variance floor `κ·B ≤ Var(P B)`; P1-e discharges by two-atom construction |
| `hB` | dossier T4's crossing-count bound (`Statements.lean:480–481`) | absorbed into `InMGFClass`'s `1 ≤ B` scale framing at P0; P1-e restores the crossing-count reading when the C.3 consumer phrasing is needed |
| `u ≠ 1` side condition | void at P0 | our `mU` is the FILTERED definition (the A5 glue-note degeneracy cannot occur); recorded in the P0 header |

## 3. Census results (this session, A8; on-pin reads)

**tauceti @ d92acc5c0** (pin verified = AGENTS): `TauCeti/Analysis/Matrix/
OperatorJensen.lean` — `Matrix.conjTranspose_mul_cfc_mul_le_cfc_conjTranspose_mul_mul`
(:64, general CFC operator-Jensen) and `Matrix.PosDef.conjTranspose_mul_log_mul_le_log`
(:124, log-specialized PosDef form). Importable on our pin (same toolchain family).
**HayataGroup is NOT in tauceti** (rg over the tree: 0 hits) — the wing exists only in
physlib master (`QuantumInfo/ForMathlib/HayataGroup/TraceInequality/`:
`JensenOperatorInequality(+IImpIV/+IVtoV)` with `CondIAll/CondIVAll`,
`LownerHeinzCore/Theorem`, `LiebAndoTrace`, `OperatorGeometricMean`,
`HilbertSchmidtOperatorSpace`, `GeneralizedPerspectiveFunction`) — v4.35,
**DO-NOT-CONSUME, citation only** (gh-API-verified records: `physlib-surface.md` §6(h),
dossier rows :189–196).

**encore-mathlib @ ff2494ea (the mathlib-absent check, S1 evidence):**
- Rényi: ZERO entropy API — the only hits are the Erdős–Rényi random-graph NAMING
  debate (`Probability/Combinatorics/BinomialRandomGraph/Defs.lean:28–35`, docstrings).
- `relativeEntropy` / `sandwiched` / `traceFunctional`: rg over `Mathlib/` = **0 files**.
- von-Neumann / matrix entropy: 0 in `LinearAlgebra/Matrix/`; `Analysis/VonNeumannAlgebra`
  is operator algebras (unrelated); `InformationTheory/` = classical Shannon/KL
  (`KullbackLeibler`, `Hamming`, `Coding`) — measure-level, no trace form.
- Substrate present: `Real.negMulLog` (`Analysis/SpecialFunctions/Log/NegMulLog.lean:164`
  — re-verified), `Real.exp/log/sqrt`, `Finset` sum calculus; `Analysis/Convex/
  Separation.lean` reserved for T3 (not this tranche).
- **Conclusion:** `m_u`, `W_ε`, the certificate class, `B_k`, and ANY quantum-entropy
  trace functional are **mathlib-absent** — scope rule 1 satisfied ("mathlib-absent",
  never "Lean-ecosystem-absent"; physlib's `Sᵥₙ`/DPI wing is the ecosystem counterweight
  and a must-cite nearest-miss, not a blocker).

**OAI donor (statement-level citation, Liu-1 convention; v4.34.1 DO-NOT-CONSUME):**
`PEPSSubvolume/EntropyMoments.lean` re-verified this session — `moment :93`
(`∑ i, (p i)^(1-u)`), `entropy :94` (`∑ Real.negMulLog`), `logMoment :95`. Our `mU`
differs only by filtering (void at every window used; P0 header records the note).

## 4. The three week1-agenda row-7 scope rules — application status

1. **Entropy object wording:** applied — P0 phrases everything as p-indexed sums over
   `Real.negMulLog`/`Real.exp`; all record text says "mathlib-absent". Any charter or
   article phrasing must keep this (physlib `QuantumInfo/Entropy/VonNeumann.lean` exists
   ecosystem-side).
2. **Sandwiched-Rényi DPI must-cite:** latent at P0 (`m_u` is NOT a trace functional);
   physlib `QuantumInfo/Entropy/DPI.lean` (`sandwichedRelRentropy`,
   `sandwichedTraceFunctional`, Frank–Lieb notes) is a nearest-miss cite in the record
   chain NOW, and becomes MANDATORY in any artifact header the moment a P1+ restatement
   phrases `m_u` as trace functionals of the state (the families are distinct:
   sandwiched two-state Rényi vs single-spectrum moments — dossier :181–185).
3. **Proof-engine choice:** recorded, decision deferred to P1 route design — tauceti
   `OperatorJensen.lean` (:64/:124, importable) vs physlib HayataGroup wing
   (citation-only, v4.35). P1's spectral-step route MUST cite both (rule verbatim).

## 5. Open statement-design question (P1 input)

**Q1 (T4's class restriction):** the dossier's "B₁(W_ε) ≥ √((1−ε)/ε·Var) on the
hMGF-class is achieved" can be read (i) class-restricted-ceiling (sup over certificates
valid against class spectra only — needs a class-indexed `B_k` variant) or (ii)
per-spectrum floor-achieved (the P0 shape: T1a instantiated along the family). P0
transcribes shape (ii) + the not-littleO tightness; P1-e resolves Q1 with the dossier
owner (A4) before any T4 proof work, since (i) changes `B_k`'s definition site.

## 6. Effort class + run recommendation (r5 sizing method)

- **P0 run:** C1 statement probe — closure `import Mathlib`, 1 elaboration job, warm
  probe-batch class, **3–4 min**; no Modal surface beyond the existing kit. Elaboration
  risks (low): `sInf`/`sSup` total-function usage on `Set ℝ`, `=o[atTop]` notation
  (global, same family as `=O` — G9's `open Filter` lesson applied in-file), `Fin k`
  sum shapes. Expected verdict: OK, 0 errors, 0 sorry-warnings.
  **EXECUTED 2026-11-17 (orchestrator-approved; runs 1–2): run 1 FAIL (12 errors — two
  UNANTICIPATED classes: 10× `dependsOnNoncomputable` on the data defs; `j + 1`
  elaborating in `Fin k` — the anticipated sInf/sSup-totality and `=o[atTop]` risks did
  NOT bite) → one-line-class fix (`noncomputable` ×10 + exponent `((j : ℕ) + 1)`) →
  run 2 GREEN: OK rc=0 errors=0 sorry-warnings=0, wall 43 s (one container preemption
  restart at t=5 s, input unchanged, both telemetry segments in the log). Evidence:
  `logs/t1t2t4-p0-run1.log`, `logs/t1t2t4-p0-run2-fix.log`; verdict fold in
  `74-P0-record.md`.**
- **P1 core (dossier feasibility §): S** — ≈0.6–1k LoC, zero new analytic API (Cantelli/
  Chernoff in finite dress; T2 injection routine; T4 assembly elementary once hVarLB
  lands). Single SPEC function, minutes-class per file on a warm per-pilot app
  (73/75-clone), 2–4 runs expected per milestone per the r5 guard pattern.
- **T3 (NOT chartered here): +M** — the LP layer ≈0.5–1k on top, cost-shared with
  dossier 02 (both draw on the same unclaimed LP-duality layer; mathlib has none —
  cone-separation route only).
- **Run recommendation:** fire P0 on the next approved probe batch (auto-glob route,
  stage name `ProbeG74T1T2T4P0.lean` or equivalent — same mapping convention as
  T2a-P0's `ProbeGT2aP0.lean`); one run + one fix-retry per the standing card shape;
  log → `research/pilots/74/logs/t1t2t4-p0-run1.log` with the standard provenance
  header. **Gated: orchestrator approval required (this staging is STAGED-NO-RUN).**

— lane A8, 2026-11-17. Sources: dossier 74 (all); week1-agenda row 7; tauceti +
encore-mathlib + openai-math read-only censuses (this session); `physlib-surface.md` §6;
`a8-week1-validation.md` §4 sizing method. No Modal runs.
