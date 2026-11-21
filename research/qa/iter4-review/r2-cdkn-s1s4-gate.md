# R2 — CD(K,N)→H_α dictionary-bridge S1–S4 gate (the Tier-1 seed-2 precharter; the S2 dictionary-vs-glue ruling)

Lane R2 (worktree agent-03), 2026-11-21, per the re-task (queued since `39627da`).
Instrument: the four-point strength bar (`r2-discovery-strength.md` :136–165; the
`r2-41h4-s1s4-gate.md`/`r2-p4-s1s4-gate.md` form's sibling). **Gated objects:**
`candidates/cdkn-halpha-precharter.md` @ `1ca57f08` (R6, landed) + the probe
`feasibility/probe/ProbeCDKN_Halpha.lean` @ `56713f96b2da52ac` + its log
`feasibility/probe/logs-g/probe-cdkn-halpha-runs1-4.log` @ `d7d35d3c430a9eef`,
read at main `f35d7ff`. Independent verdict; R7's parallel editorial read not
consulted. This gate rules the PRE-CHARTER (the carrier-charter decision); the
ARTICLE gate fires at draft time with the fired evidence.

## Independent verifications run by R2 this gate (not read-backs)

1. **Shas**: precharter `1ca57f08`, probe `56713f96`, log `d7d35d3c` — match the
   landed bytes.
2. **The substrate read at source** (tauceti sibling, read-only):
   `RenyiEntropy.lean:120` the def (N : ℝ) (m μ) : EReal ✓; `:167`
   `renyiEntropy_eq_neg_lintegral_rpow [SigmaFinite μ] (hN : 1 < N)` (T1's
   consumed form) ✓; `:188` nonpos ✓; `:333`/`:336` **`private def renyiGap` /
   `private theorem renyiGap_le_renyiGap`** ✓ (the privacy finding exact — the
   N-monotonicity is genuinely NOT public API); `:489`
   `tendsto_mul_renyiEntropy_add_measureReal_univ_nhds_boltzmannEntropy
   [IsFiniteMeasure μ]` (T3's engine) ✓; `:567` `distortedRenyiEntropy_anti`
   (distortion-coefficient antitone — kin only, as the precharter says) ✓.
3. **Round-2's binding rows at bytes**
   (`r9-novelty-verification-iter6-round2.md` §1 row 72 + §2 seed-2 + :94–96):
   the scoped absence ("no distribution/state Rényi-α entropy in mathlib/AFP/
   Coq — mathlib has only `Real.binEntropy`/`Real.qaryEntropy` + topological
   entropy") SURVIVED with tauceti as the nearest FORMAL kin of a different
   object class; the two sides unconnected (semantic + BM25 + exact-id at the
   2026-11-21 decl-index-v3 state, caveat-block-checked).
4. **The probe log at bytes**: the 4-run descent 9→2→2→0 (parse/notation
   classes only: `open scoped ENNReal`, `open Filter`, `open scoped Topology`,
   `Measure.univ`→`Set.univ`) ending **GREEN rc=0** — all five bridge statement
   shapes (P1/P1′/P2/P3/P4/P5) typecheck on mathlib alone; probe-convention
   sorries only, in-header. Telemetry: walls 31–82 s; run 2's OVER-mem
   7040 MB anon=0 = the authorized mmapped-mathlib class.

## The gate (four verdicts)

**S1 — statement-tier novelty with named nearest-misses: PASS.** The
dictionary equation — `TauCeti.renyiEntropy N count (pmeas p) = −Σ pᵢ^{1−1/N}`
(the measure-side object IS the classical α-power-sum at the counting
instance) — is stated nowhere in the surveyed corpora or literature (round-2's
re-confirmed absence; verified above). The bridge differentiates from BOTH
sides (no claim on tauceti's measure layer; none on article-72's scoped
distribution/quantum monotonicity line). Nearest-miss skeleton ≥2 mandatory
rows present and source-verified (★1 tauceti `renyiEntropy` — substrate and
kin, NOT a competitor; ★2 mathlib `binEntropy`/`qaryEntropy` — Shannon-binary
only; rows 3–5 Sturm/Lott–Villani/Rényi/article-72 for the informal/classical
contrasts). T1's identification is the NEW statement; T2/T3 are its instance
corollaries.

**S2 — the RULING (the honest question R6 left here): DICTIONARY-AS-DISCOVERY,
with the headline lock.** Grounds:
- The dictionary equation is an ESSENTIAL multi-corpus bridge in the strict
  sense: unstatable without BOTH sides (tauceti's measure object AND the
  classical distribution endpoint) — the same S2 shape as the 75-N2 assembly
  and the H4/F cards, and unlike the FB class (single-surface formalization)
  or the P4 cards (an application chain over one's own landed pieces).
- The honest risk is real and NAMED: each recovered fact is elementary
  standalone (T2's discrete proof is a few lines; T3's limit is classical) —
  if the article leads with "three classical facts proved", it is glue and
  bills engineering. The ruling: the article is DISCOVERY-CONDITIONAL **iff
  the headline is the IDENTIFICATION THEOREM T1** — "the classical Rényi H_α
  finite core IS the counting-instance layer of the in-corpus CD(K,N)
  theorems" — with T2/T3 as its instance corollaries. That headline is a new
  CONNECTION between corpus objects (the cross-math program's own target
  shape), and "conditional" is honest: the interpretive claim rides the
  identification, the recovered facts are instance-level. This CONFIRMS the
  census grading (MEDIUM / DISCOVERY-CONDITIONAL) and the precharter's own
  framing — ruled binding, not open.
- The 75-P4 contrast entered by R6 is apt and distinguishes correctly: there
  the application chain completed a LANDED article's stated claim (revision
  channel); here NO prior article claims the endpoint, so the statement-level
  newness carries the S1 bar on its own.

**S3 — verification surface + the private-monotonicity re-proof's weight:
PASS with the weight RULED ZERO-discovery.** The probe GREEN at the exact
statement shapes is sufficient for this gate; the article gate later owes the
fired proofs + `axcheck_full`-class coverage + printed-line evidence rows.
The re-proof ruling: T2's discrete re-proof (forced by `renyiGap`'s privacy —
verified above; tauceti read-only, no private promotion — the RIGHT
discipline) is honest engineering with ZERO discovery content: at article
time its status row presents the TRANSPORT reading (the classical
monotonicity RECOVERED as the CD(K,N) counting instance), cites the elementary
proof as certificate, and names the substrate's private chain as the
measure-side kin — never bills the re-proof as content, never bills the
recovered facts as difficulty.

**S4 — binding conditions for the carrier charter and any article (six):**
(i) **the first-fire TauCeti bootstrap** — the carrier imports
`TauCeti.RenyiEntropy` at fire 1 and REPORTS the bootstrap verdict BEFORE T1
proof work (the probe's one flagged residual; the substrate-hygiene triad
check rides that build — the standing donor gate);
(ii) **T4 (α > 1 / N < 0) stays banked** — never a blocker, never day-1;
(iii) **the headline lock** — kind DISCOVERY-CONDITIONAL; the article's kind
line/abstract LEAD with the identification theorem T1 (interface-scope in the
headline, the γ-freeze-rider pattern); T2/T3 as instance corollaries; the
recovered facts never billed as difficulty; the re-proof never billed as
content;
(iv) **wording locks** — the absence claim stays SCOPED to "no
distribution/state Rényi-α entropy" (round-2 row 72's own amendment; never
"no Rényi entropy in Lean"); tauceti cited as substrate + nearest formal kin,
never competitor; no "first" claim beyond the scoped statement-level newness;
(v) **tauceti read-only** (the re-proof, never a promotion — precharter
condition (iv) adopted verbatim);
(vi) **no quota interaction** — discovery-class, quota-free; the KPI
arithmetic at ship per the standing recompute rule; the companion-sync rule
binds any article.

## Verdict line

**GATE = PASS-AS-PRECHARTER — R6 is CHARTERABLE as carrier** at the
precharter's own scope and price (≈0.5–0.9k LoC, 6–10 runs, M-class; the
GO/NO-GO conditions (i)–(iv) all adopted into S4 above, with the first-fire
bootstrap verdict as the charter's first gate). The S2 question is RULED:
dictionary-as-discovery under the headline lock (T1 the identification
theorem; DISCOVERY-CONDITIONAL); glue only if the article ever leads with the
recovered facts — a billing failure, not a statement failure. The article gate
(S1–S4 at draft) remains R2's and fires on the fired evidence.

— lane R2 (worktree agent-03), 2026-11-21. No fires, no commits (H commits on
main; REPORT ONLY). Lineage: `r2-41h4-s1s4-gate` → `r2-p4-s1s4-gate` → this.
INDEX row owed.
