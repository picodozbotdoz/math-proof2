# Dossier-41 amendment DRAFT (for H to fold into `research/candidates/41-q-deformed-eight-square-temperley-lieb.md` — R9's file; lane R4 does not edit the dossier directly)

*Origin: pilot-41 core S–M execution (lane R4, 2026-11-19), kernel-certified on mathlib
`ff2494ea` / v4.36.0-rc2 (`research/pilots/41/Core.lean`, GREEN run 9,
`logs/core-run9.log`; this draft per the orchestrator's requirements (2)–(4) of
2026-11-19). Claim discipline unchanged (first sign-rule/parallelogram-defect
deformation; NEVER first q-deformation — Benkart–Pérez-Izquierdo 1998 owns the
q-composition object level).*

## A. Dated correction: what the P0 statement set got wrong, and what survives

**[CORRECTION 2026-11-19, lane R4 — machine-certified]** The P0 precharter
(`qa/iter4-review/a6-41-p0-precharter.md` §1.4) stated (P1), (P2) as standalone
universals over ALL parallelogram quads, and (M) as an unconditional parallelogram
identity. All three are FALSE as stated. Kernel-certified refutations
(`Core.lean` §1, decide/norm_num, axiom-lean): witness quad **p = 000, q1 = 100,
p′ = 100, q2 = 000** (a valid parallelogram: 000⊕100 = 100⊕000 = 100, q1 ≠ q2):

- **P1 fails**: Q1 = phiQ p q1 + phiQ p′ q2 = 0 but Q2 = phiQ p q2 + phiQ p′ q1 = 1
  (`P1_refuted`, zero axioms).
- **P2 fails**: gapOdd = τ1 + τ2 = 0, even (`P2_refuted`).
- **MainIdentity-as-universal fails**: at R = ℤ, q = −1 the equation reads 0 = 2
  (`MainIdentity_refuted`).

**What survives, strengthened (all kernel-proved, triad-clean, `Core.lean` §6):**

1. **(M-corrected, `mainCor`)**: for EVERY parallelogram quad and every CommRing R
   with unit q:
   σ_q(p,q1)σ_q(p′,q2) + σ_q(p,q2)σ_q(p′,q1) = (1−q) · aeval q (GqGen),
   where **GqGen := (−1)^{Q_small}·(−X)^{τmin}·Σ_{j<|τ1−τ2|} X^j** — the geometric
   factor has length |τ1−τ2| = gapOdd − 2·τmin (NOT the P0's 2·kDef+1 off-stratum),
   with Q_small the quadratic sum of the smaller-τ side; empty sum (τ1 = τ2) gives
   defect 0.
2. **(M-stratum, `mainStratum`)**: ON the odd-gap stratum, GqGen = the dossier's G_q
   exactly (`Gq_eq_GqGen_on_stratum`) — i.e. **the dossier's (M) display is exactly
   right where its own conditional meant it** ("provided the two parity facts hold").
3. **Stratum characterization (`stratumComplement`, decide-certified, zero axioms)**:
   the odd-gap stratum is precisely the ANTIPODAL parallelograms {p′ = ¬p bitwise}
   (bxor p p′ = 111). Off it: τ1 ≡ τ2 (mod 2), and the defect is 0 when τ1 = τ2
   (**q-rigidity**, `qRigid`: the classical alternation survives EVERY q there), or
   an even-length geometric sum when |τ1−τ2| ≥ 2 (e.g. p = 101, q1 = 101, p′ = 011,
   q2 = 011: A + B = 1 − q²).
4. **(N′) closed (`SigmaQ_Signs_all_q_refuted`, [propext])**: the family is
   NONdegenerate — at the antipodal quad p = 110, q1 = 110, p′ = 001, q2 = 001 the
   alternation value at q = −1 is 2 ≠ 0 (`alternation_fails_at_q_minus_one`,
   [propext]). The F5(ii) degenerate-branch descope is DEAD; the F4-effort estimate
   held (~600 LoC, 9 warm runs incl. 5 fix-loops).
5. **Anchor + bridge re-proved in-pilot** (`signs_anchor`, `bridge_axiom`,
   [propext, Quot.sound]): eth's Signs via the same route eth itself uses
   (four-summability-parity → (−1)^m + (−1)^n = 0), with decide replacing the
   chg/lin congruence chain; and the corrected-⇒classical regression
   `mainCor_one_implies_signs` (triad-clean).

## B. Provenance framing (the (a)-vs-(b) ruling, requirement (4))

The falsity is **(a) the P0 precharter's universal-SHAPING — NOT the eth source**.
The three-way quote:

1. **eth's actual parity fact** — `SecCrossing_Identity.lean:240–242`:
   ```
   theorem four_phi_odd (p q : Block) {d : Block} (h : d ≠ (false, false, false)) :
       Odd (phi p q + phi (bxor p d) (bxor q d) + phi p (bxor q d) + phi (bxor p d) q)
   ```
   — the TOTAL four-sum is odd. eth states NO (P1)/(P2) split; `signs` (:261–266)
   derives Signs from four_phi_odd via `neg_one_pow_add_neg_one_pow` (:244–255,
   "(−1)^m + (−1)^n = 0 if m + n is odd"). The pilot's `ethParity` is exactly
   four_phi_odd re-parametrized (decide-certified), and `signs_anchor` mirrors eth's
   own route. **Every eth-originated statement in the P0 (the verbatim port surface
   Block/bxor/phi/sigma/Signs, phiQ/phi1-3, phi_parts) is TRUE** — Signs is re-proved.
2. **The dossier's (M)** — `candidates/41-…md:76–90`: stated CONDITIONALLY — "For all
   blocks … **provided** the two parity facts hold: (P1) Q1 ≡ Q2 (mod 2) … and (P2)
   the τ-difference is odd." The conditional reading is CORRECT and now a THEOREM
   (MainIdentityStratum). The dossier's G_q display needed its 2026-11-18 errata
   (already stamped) AND this stratum-conditional — both now carried.
3. **The P0 precharter's over-strengthening** — `a6-41-p0-precharter.md` §1.4:
   "(P1) the quadratic parity fact (decide-able over the 4096 quadruples)" and "(M)
   the main identity (evaluated form…)" as Para-universals — the layer where the
   falsity entered. The decide the precharter invoked, when actually run, REFUTED
   its own universal (runs 1–2 of the core log).

**Billing consequence (findings only; no pre-billing per requirement (4)):** this is
a spec-shaping defect in the precharter layer, not a port erratum and not an eth
defect. The DISCOVERY content (unified defect identity + antipodal stratification +
nondegeneracy) is intact and kernel-proved; the novelty battery (R9, round-6-41)
should target the CORRECTED identity per the orchestrator's note.

## C. Suggested dossier edit skeleton (for H/R9 to typeset)

- Stamp `[CORRECTION 2026-11-19, lane R4]` on the (M) block (like the 2026-11-18
  ERRATUM block): universal form false (witness quad above); corrected = the
  stratum-conditional (verbatim MainIdentityStratum) + the unified GqGen identity.
- Add to the "Precise mathematical statement" section: GqGen, the antipodal
  characterization, q-rigidity, and the q = −1 nondegeneracy witness (value 2).
- F5(ii): mark the degenerate branch CLOSED (refuted).
- F4: record actuals (~600 LoC, GREEN run 9; logs core-run1..9).
- Verification block: mathlib ff2494ea, v4.36.0-rc2, warm crossmath-probe,
  `pilots/41/Core.lean` GREEN sha 921bc43cbd06d252 (full
  921bc43cbd06d252dbc796c79b734529a1dd1e02d7097b0e8efb3fdc41adf269),
  0 sorry, 0 sorryAx, triad-or-leaner audit in-file.

— lane R4, 2026-11-19.
