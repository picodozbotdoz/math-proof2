# Round-6 — dossier-41 G_q errata: independent verification (R9, wave 4)

Lane R9 (novelty/prior-art), 2026-11-19. Unit: independently verify A6's two G_q display
errata (stamped `candidates/41-q-deformed-eight-square-temperley-lieb.md`, commit `6e8ab32`)
against (a) the cited eth sources, read at the read-only sibling this session, and (b) the
mathematical content of the q-deformed eight-square definition — by exhaustive exact
enumeration over the full 8⁴ = 4096 quadruple space (plain integer arithmetic, no CAS; the
20-line transcribed definitions are quotable from this file, scripts below). Report-only: the
dossier is R1's file and the precharter/P0 are A6's — findings here feed R4/the executing
lane; nothing outside `research/novelty/round6-*` is touched.

**Verdict line (the two errata):**
1. summand `q^j` not `(−q)^j` — **CONFIRMED** (algebra + internal inconsistency with the
   dossier's own sketch; mis-print changes values on 4 of the 64 well-formed quadruples).
2. `2k+1 = |τ₁−τ₂| = gapOdd − 2·τmin` — **REFINED** (the identity is true and is what the
   τmin-factoring needs, but it corrects no printed line: the pre-erratum display already
   printed `2k+1 := |τ₁−τ₂|` — the correct form — and `gapOdd − 1` appears nowhere in the
   dossier; two sub-clauses of the erratum are also internally garbled, see §2).

**NEW FINDING (more serious than both errata, R9's own): the dossier's parity hypotheses
(P1)/(P2) are FALSE — they fail on 384 of the 448 parallelogram quadruples — so the (M)
display (original AND A6-corrected) is ill-formed on those 384, and the staged
`pilots/41/P0.lean` `MainIdentity`/`P1`/`P2` shapes are refutable as stated. A corrected
uniform statement exists and is verified below (§3).** This does not kill the candidate —
the honest (M) is a two-case (or uniform min-side) identity and (N) is untouched — but the
pilot MUST consume the §3 form, not the current one.

---

## 0. Sources checked (read-only sibling, this session)

- eth `proof/statements/EightSquareStatement.lean:37–53` — `Block` :37, `bxor` :40, `phi`
  :43–46, `sigma` :49, `Signs` :53. All as quoted in the precharter §1.1 (verbatim port
  verified line-by-line).
- eth `proof/networks/Eight/SecCrossing_Identity.lean:126–136` — `phiQ` :126–128, `phi1/2/3`
  :131–133, `phi_parts : rfl` :136; plus the parity chain `four_phi` :118,
  `phi_add_phi_bxor` :109, `phi_add_phi_shift` :178, `change_Q/1/2/3` :146/157/162/167,
  `three_changes` :172, `four_changes` :200, `seven_terms` :209, `one_add_prod` :226,
  `four_phi_odd` :240, `signs` :261. All names/line numbers verified.
- **Citation nit (report-only):** the dossier (M)-display cites eth's `p'_eq` at `:78`; the
  theorem sits at `SecCrossing_Identity.lean:76–77` (:78 is the next lemma's doc). Cosmetic.

Enumeration ground truth (transcribed verbatim from the above; τ = phi1+phi2+phi3):
`phiQ(p,q) = p₁q₁+p₁q₂+p₁q₃+p₂q₂+p₂q₃+p₃q₃`; `τ(p,q) = q₁p₂p₃+p₁q₂p₃+p₁p₂q₃`;
`phi = phiQ + τ` (`phi_parts`, checked 64/64 pairs); parallelogram quadruples =
`(p, q₁, p′, q₂)` with `p⊕q₁ = p′⊕q₂ ∧ q₁ ≠ q₂` — exactly **448** (= 8·8·7: p, q₁ free,
d := q₁⊕q₂ ≠ 0 determines p′ = p⊕d, q₂ = q₁⊕d, per eth's `p'_eq`/`q'_eq`). Sanity:
eth's `Signs` at q = 1 — 0 violations over all 448 (matches `signs` :261 being proved);
`four_phi_odd` (the phi-four-sum is odd) — 0 violations over all 448.

## 1. Erratum 1 (summand) — CONFIRMED

Claim verified: with τmin := min(τ₁,τ₂), gap := |τ₁−τ₂| = 2k+1 odd, Q1 ≡ Q2 (mod 2):

  F_q = (−1)^{Q1}(−q)^{τ1} + (−1)^{Q2}(−q)^{τ2} = (−1)^{Q1}(−q)^{τmin}(1 + (−q)^{2k+1})
      = (−1)^{Q1}(−q)^{τmin}(1 − q^{2k+1}) = (1−q)·(−1)^{Q1}(−q)^{τmin}·Σ_{j=0}^{2k} q^j.

Each step is sign algebra on odd/even exponents; the third equality is the whole point
(`2k+1` odd ⇒ `(−q)^{2k+1} = −q^{2k+1}`), and the geometric factorization
`(1−q)Σ_{j=0}^{2k}q^j = 1−q^{2k+1}` requires the POSITIVE summand. With the display's
`(−q)^j` the natural factor is `(1+q)`: `(1+q)·Σ_{j=0}^{2k}(−q)^j = 1 + q^{2k+1}` ≠ a
`(1−q)`-multiple — the (M) factorization fails. This also matches the dossier's own
Proof-sketch step 2 line ("`1 + (−q)^{2k+1} = 1 − q^{2k+1} = (1−q)Σ_{j≤2k} q^j`"), i.e. the
display contradicted the sketch — the erratum's stated basis.

Enumeration census (the "degenerate reading" note in the erratum, made exact): inside the
64 well-formed (odd-gap) quadruples, the mis-print CHANGES the value of G_q only on the
**4 quadruples with gap = 3** (k = 1: corrected sum `1+q` vs mis-printed `1−q`); on the 60
gap = 1 quadruples (k = 0) both summands give the singleton sum 1 — the mis-print is
value-invisible there, which is presumably how it survived. CONFIRMED, with the sharpening
that the mis-print is load-bearing on exactly 4/64 of the intended regime.

## 2. Erratum 2 (gap identity) — REFINED

The erratum's operative content is TRUE: `2k+1 = |τ₁−τ₂| = gapOdd − 2·τmin` with
`gapOdd := τ₁+τ₂` is an identity (`τ₁+τ₂ = 2·min + |τ₁−τ₂|`), it is what the τmin-factoring
consumes, and the precharter's `kDef := (gapOdd − 2·tauMin − 1)/2` encodes it correctly.
But as a "display mis-print" it is mis-billed, on three counts:

1. **Nothing printed is wrong.** The pre-erratum display (verified via `git show
   0e0ae4d:research/candidates/41-…md`, the erratum block was purely appended) prints
   `2k+1 := |(τ p q + τ p′ q′) − (τ p q′ + τ p′ q)|` — i.e. `|τ₁−τ₂|` directly, the correct
   form. The string `gapOdd − 1` appears nowhere in the dossier; `gapOdd` itself appears
   nowhere pre-erratum. The "corrected display" is an equivalent REFORMULATION (its only
   substantive change is erratum 1's summand).
2. **The named wrong alternative is parity-incoherent.** In the (P2) regime gapOdd is odd,
   so `gapOdd − 1` is even and can never equal the odd `2k+1` — not at τmin = 0, not
   anywhere.
3. **The agreement clause fits a different pair.** "The two agree only when τmin = 0" is
   false for (gapOdd−2τmin, gapOdd−1) (never equal) and true for the k-forms:
   k_correct = (gapOdd−2τmin−1)/2 vs k_naive = (gapOdd−1)/2 (⇔ 2k+1 = gapOdd) agree exactly
   when τmin = 0. Verified witness (gap = 1, τmin = 1): p = 000, q₁ = 001, p′ = 111,
   q₂ = 110 ⇒ Q1 = 3, τ₁ = 2, τ₂ = 1, gapOdd = 3, k_correct = 0, k_naive = 1.

Verdict: REFINED — keep the corrected display (it is correct and operationally better for
the `Polynomial ℤ` port), but the record should say "clarifying reformulation + guard
against the k = (gapOdd−1)/2 mis-reading", not "display mis-print #2".

## 3. NEW FINDING — (P1)/(P2) are false; the true statement is uniform and two-regime

The dossier asserts (P1) `Q1 ≡ Q2 (mod 2)` and (P2) "the τ-difference is odd" as
"derivable from eth's existing lemma chain — genuinely routine: same lemmas, split
conclusions", and the Lean (M) line says they are "discharged as decide-able finite facts".
**They are not derivable: both fail on 384/448 quadruples.** Exhaustive census (exact
integer arithmetic, all 448):

| regime (Q1≡Q2 mod 2, gap odd) | count | gap values |
|---|---|---|
| (true, true) — the dossier's case | 64 | gap ∈ {1 (60), 3 (4)} |
| (false, false) — P1 AND P2 both fail | 384 | gap ∈ {0 (336), 2 (48)} |

Parity-link fact (0 violations): **exactly one of (Q1+Q2), (τ₁+τ₂) is odd** on every
quadruple — that IS eth's `four_phi_odd` split through `phi_parts` (the four-sum
(Q1+Q2)+(τ₁+τ₂) ≡ 1 mod 2); nothing in eth's chain forces the split to land always on the
cubic side. Refutation witness (hand-checked): p = 000, q₁ = 000, p′ = 001, q₂ = 001 ⇒
Q1 = 1, Q2 = 0 (quadratic four-sum odd), τ₁ = τ₂ = 0 (cubic four-sum even), F_q ≡ 0.

Consequences:
- On the 384 even-gap quadruples `k` is undefined (gap−1)/2 ∉ ℕ — the G_q display (original
  and corrected) is ill-formed there; (M) as universally quantified over ALL parallelogram
  quadruples is not a well-formed statement.
- The staged `pilots/41/P0.lean` inherits this: `P1`/`P2` (:135–142) are FALSE Props (a
  kernel `decide` at core step 1 will REFUTE them), and `MainIdentity` (:126, `∀ Para`)
  with `Gq` via `kDef` (:105, Nat truncated arithmetic) FAILS on all 384 even-gap
  quadruples (gap = 0: Gq ≠ 0 but F ≡ 0; gap = 2: wrong sign and wrong factor — F needs
  the (1+q) factor and the Q-of-the-min-side sign, kDef gives a bare 1).
- **The honest theorem (verified 0 failures, 448/448, 12 evaluation points per quadruple,
  degrees ≤ 6):** for EVERY parallelogram quadruple,
  `F_q = (1−q)·G_q` with `G_q := (−1)^{Q_min}·(−q)^{τmin}·Σ_{j=0}^{gap−1} q^j`,
  where gap := |τ₁−τ₂| (any parity; gap = 0 ⇒ empty sum ⇒ G_q = 0) and `Q_min` is the
  quadratic sum of the τ-MINIMIZING side (Q1 if τ₁ ≤ τ₂, else Q2). On the 64 odd-gap
  quadruples Q_min = Q1 = Q2 and this reduces exactly to A6's corrected display; the
  case-split form is: odd gap ⇒ G_q = (−1)^{Q1}(−q)^{τmin}Σ_{j<gap}q^j; even gap > 0 ⇒
  G_q = (−1)^{Q_min}(−q)^{τmin}Σ_{j<gap}q^j (the surviving sign belongs to the min side —
  e.g. gap-2 witness p = 001, q₁ = 000, p′ = 111, q₂ = 110: Q1 = 3, Q2 = 0, τmin = 0 on
  the τ₂-side, F(2) = −3 = (1−2)·(−1)^0·(1+2) ✓).
- Derivation content: the pilot's step 1 should target the SPLIT statement actually
  supported by eth's chain — `(Q1+Q2)+(τ₁+τ₂) odd` (a one-line consequence of
  `four_phi_odd` + `phi_parts`) — from which the two regimes and the min-side sign
  fall out by parity, not (P1)/(P2).
- (N) nondegeneracy is UNAFFECTED: the odd-gap regime is nonempty (64) and G_q ≠ 0 there
  (witness p = 000, q₁ = 000, p′ = 111, q₂ = 111: Q1 = 6, τmin = 0, gap = 3,
  F(2) = −7 = (1−2)·7 — the alternation genuinely fails at q = 2).

## 4. Consumption notes (for R4 / the executing lane; none of these files is mine to edit)

1. Dossier-41: the erratum block's verdict-2 wording should be softened to
   "reformulation/guard" (R1/H via the errata channel); more importantly the (P1)(P2)
   preamble and the (M) quantifier line need a dated erratum pointing at §3 here.
2. Precharter `qa/iter4-review/a6-41-p0-precharter.md` §1.3–§1.4 + `pilots/41/P0.lean`:
   `gapOdd`/`kDef`/`Gq`/`MainIdentity`/`P1`/`P2` need the two-regime (or uniform min-side)
   amendment BEFORE the core's step-2 ring computation; the P0 elaboration run itself is
   unaffected (Prop-valued defs elaborate fine — the falsity only bites at proof time).
3. The charter's Lead-2 note ("the pilot consumes the corrected form") remains right but
   under-specified: the corrected form must be §3's, not just the summand fix.

## 5. Reproducibility (the enumeration, ~40 lines, plain Python integers)

Definitions transcribed exactly as §0; iterate all 8⁴ quadruples, keep the 448
parallelograms; compute Q1,Q2,τ1,τ2 as above; check (i) `phi_parts` 64/64, (ii) Signs 0
violations, (iii) four-sum odd 0 violations, (iv) the §1 factorization on the 64 odd-gap
quadruples, (v) the §3 uniform identity on all 448 at q ∈ {2,3,5,7,−2,−3,−5,11,13,−7,17,−11}
(certifiable: both sides have degree ≤ τmin+gap−1 ≤ 6 < 12 points), (vi) the regime/gap
censuses. Script preserved in the worktree session log; every number quoted above is one of
its outputs. No CAS, no floating point.

— lane R9 (worktree agent-09), 2026-11-19. No commits (hold for K/H per protocol).

---

## ADDENDUM 2026-11-19 (post-relay) — R4's independent convergence + the erratum-2
divergence flag

R4's 41-core pre-analysis (relayed by the coordinator this date) reached the same falsity
finding independently: counter-quad **p = 000, q₁ = 100, p′ = 100, q₂ = 000** with the
identity reading **0 = 2 at q = −1** — recomputed here and confirmed (Q1 = 0, Q2 = 1,
τ₁ = τ₂ = 0 ⇒ F(−1) = 0 while the precharter-kDef Gq gives (1−(−1))·1 = 2); it is one of
the 336 gap-0 quadruples of the §3 census. R4's corrected content — a unified defect
identity `A+B = (1−q)·aeval(GqGen)` at EVERY parallelogram quad — agrees with §3's uniform
min-side formula (my 448×12-point certificate; kernel decide still pending, both sides
treat the unified identity as UNVERIFIED until core-1's kernel verdict). R4's
stratification "odd-gap stratum = {p′ = ¬p bitwise}" is independently VERIFIED here:
odd gap ⟺ d := q₁⊕q₂ = 111 (all 64 d=111 quads odd-gap, 0 violations either direction) —
so the §3 regime census's 64-quadruple row IS exactly the bitwise-complement stratum.

**Erratum-2 divergence flag (relay instruction 3):** this file's verdict on A6's erratum 2
is REFINED (true identity, mis-billed as a display mis-print — §2), which differs from
A6's stamp. NO consumer impact on GqGen: on the odd-gap/d=111 stratum Q1 ≡ Q2, so A6's
corrected display, §3's uniform formula, and GqGen coincide exactly there; the one
load-bearing correction remains erratum 1 (summand `q^j`), where this file CONFIRMS A6.
The divergence is record-accuracy only — routed to R1/H via the errata channel, not to the
pilot. The battery-side consequences (grade the corrected identity; the empty
defect-at-parallelogram-quads nearest-miss class; headline discipline re-verified) are
folded in `round6-41-battery.md` §ADDENDUM.

— addendum R9, 2026-11-19 (same hold: no commits).
