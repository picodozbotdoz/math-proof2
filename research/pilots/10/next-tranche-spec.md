# Pilot 10 — assembly-tranche spec: the wd↔cw walk, counter-`padM'`, `exists_tm_padded_space`

**STATUS: PROPOSAL — [CHARTER-PENDING]** (lane A6, 2026-11-14; input to iteration-4 chartering;
supersedes the one-line "next tranche" note in L2.lean's header, which this document expands).

**Framing (fixed, carried from L2's header).** This tranche is *eth-Lib-grade plumbing, not new
mathematics*: every statement below is either an eth statement with `List Unit ↦ ℕ` (the pad
becomes a binary counter — a *smaller* state), an eth closure lemma transcribed with its proof,
or a fragment construction in the pattern class of Part A's `mvB` machine (sentinel + count +
shuttle, GREEN). No claim of a theorem absent from eth is made *except the space conjunct* —
which is dossier 10's bridged contribution and is consumed verbatim from M1's GREEN
`exists_tm_space`. The value-time/word-space separation that makes everything work is L2's
GREEN `cdLoop_runsB`; nothing in this tranche re-proves it.

---

## 0. Claim discipline

In scope: D1–D6 below, ending at the headline `exists_tm_padded_space` — eth's
`exists_tm_padded` (Pad.lean:116–120) with (i) the *same* time shape
`q · (|x| + 2^(e x) + 1) ^ q`, (ii) the counter machine `padM'` in place of `padM`, and
(iii) the *new* conjunct `∀ t, SpaceWithin N x t (q · (|x|+1) ^ q)` (M1's per-prefix
discipline). Out of scope (§7): the seven `StCert*` PolyTVal certificates, the Solver
pipeline, the MainResults/k-CNF packaging, anything about `decidesTM` (optional corollary
only).

## 1. Position in the dossier-10 arc

    M1 (GREEN, exists_tm_space)   any IsPolyT Stepped machine with poly-size states runs
      │                           on eth's host TM2 in eth's time AND poly space per prefix
    L1 (GREEN, combinator agree.)  ℕ-counter combinators = eth's pad combinators (value level)
    L2 (GREEN, cdLoop_runsB +      the countdown clock: value-bounded rounds, word-bounded
      PolyTVal/polyTVal_id)        ceiling; the discipline + first cw-world certificate
    └─► THIS TRANCHE (proposed):   D1–D4 the Stepped-level assembly `padM'` + Closure subset
                                    + `exists_tm_padded_space`  (the machine-layer theorem)
                                    D5–D6 the wd↔cw walk + the certificate transfer
                                    (bridge that lets FUTURE cw-world certificates be
                                    consumed as wd-world PolyT inputs — no re-proof)
    next wave (NOT this tranche):  StCert* PolyTVal certificates over L1's combinators
                                    discharge `PolyT A'` for the Solver pipeline; then the
                                    full dossier theorem (candidates/10 §statement) via
                                    eth MainResults' shape.

The final dossier theorem's machine layer is *exactly* `exists_tm_padded_space` with the
Solver's `A'` and `e` plugged in; the counting content (`CountsWithin`, `timeMin`) is eth's and
unchanged (time is the same bound, so `ETHIsFalse` is recovered verbatim — dossier §statement).

## 2. Deliverables and statement specs (elaboration-ready)

File: `research/pilots/10/L3.lean` (working name), `import Mathlib`, one self-contained file —
the runner elaborates files independently, so it re-embeds verbatim: M1 Parts A–C (L2.lean
lines 49–2090's block, byte-identical to GREEN M1) **plus** L2 Part D (L2.lean lines 2092–end,
GREEN). New work is **Part E**. All names below resolve against that embedded substrate; `e` and
`A'` are section variables `{e : List Bool → ℕ} {A' : List Bool × ℕ → Bool}`.

### D1 — the counter padding machine (eth Pad.lean:35–40, `List Unit ↦ ℕ`)

```lean
/-- The counter padding machine: the state is the input with the counter (the virtual pad
length), or the result. One step doubles the counter, or, once it has reached 2^(e x),
applies A'. The state never materializes a list. -/
def padM' (e : List Bool → ℕ) (A' : List Bool × ℕ → Bool) : Stepped (List Bool) Bool where
  σ := (List Bool × ℕ) ⊕ Bool
  init x := .inl (x, 1)
  step s := s.elim
    (fun p => bif decide (e p.1 ≤ Nat.log2 p.2) then .inr (A' p) else .inl (p.1, 2 * p.2))
    fun b => .inr b
  out s := s.elim (fun _ => none) fun b => some b

/-- The counter machine ends after e x + 1 steps with A' (x, 2^(e x)); every state has size
at most 2|x| + e x + 4 — POLYNOMIAL in |x| + e x (eth's padM needs 2|x| + 2·2^(e x) + 3). -/
theorem padM'_runs (e : List Bool → ℕ) (A' : List Bool × ℕ → Bool) (x : List Bool) :
    (padM' e A').Runs x (e x + 1) (2 * x.length + e x + 4) (A' (x, 2 ^ e x))
```

Proof: mirror `padM_reaches` (Pad.lean:68–88) verbatim with `Nat.log2 (2 ^ k) = k`
(`Nat.log2_two_pow`) and `2 * 2 ^ k = 2 ^ (k + 1)`; the size arithmetic uses the in-file
`HasSize` instances (`size (.inl (x, n)) = 2|x| + 1 + (n.size + 1) + 1`, `n ≤ 2^k →
n.size ≤ k + 1` by `Nat.size_le.2`). The state bound is *strictly smaller* than eth's at every
node — no new induction shape.

### D2 — the Closure subset: `padM'_isPolyT` (the "eth Closure layer" of L2's header)

```lean
/-- Every part of the counter padding machine is polynomial-time if e and A' are.
(eth Pad.lean:45–52, same statement for the counter machine.) -/
theorem padM'_isPolyT (he : PolyT e) (hA' : PolyT A') : IsPolyT (padM' e A') where
  enc := (inferInstance : Enc ((List Bool × ℕ) ⊕ Bool))
  carried := (inferInstance : Carried ((List Bool × ℕ) ⊕ Bool))
  init := …
  step := …
  out := …
```

Two routes, A preferred, B the fallback (decision point after the first Modal run):

- **Route A (transcription + `fun_prop` verbatim).** M1 dropped `@[fun_prop]` from `PolyT`
  only because it did not need it. Re-add the attribute on the embedded `PolyT` and transcribe
  the closure lemmas *with* their attributes; then the three `…` fields close `by fun_prop`
  exactly as eth's do. Transcription set (eth file:lines, proofs included):
  - `PolyT.lean:62–100` — `PolyT.of`, `PolyT.congr`, `PolyT.of_wd` (of/elim already embedded);
  - `Lib/Bool.lean` decide closures (subset used by `decide (… ≤ …)` chains);
  - `Lib/Nat1.lean:290–318` — `add`, `sub`, `decide_le`, `min'`, `max'`;
  - `Lib/Nat1b.lean:84–142` — `length`, `size'`, `log2'` (`Nat.log2` is PolyT via
    `Nat.log2 n = Nat.size n - 1`, Nat1b.lean:74);
  - `Lib/Nat2.lean:68–80` — `mul` (for `2 * p.2`);
  - `Lib/List1.lean:38–66` — `comp₂` (pair-splitting composition), `reverse`, `append`;
  - `EncLemmas.lean:106–127` — the `Carried` instances (Unit/Bool/ℕ/×/⊕/Option/List) —
    **not** in the M1 layer (M1 took EncLemmas :22–90 only); `padM'`'s σ needs them; also
    transcribe the `len_nat`/`size_nat`/`len_unit`-style lemmas they reference.
- **Route B (hand-composed witnesses).** If route A's transitive Lib closure balloons, build
  only the three fields' witnesses as explicit fragments via `PolyT.of` over
  `seq`/`branch`/`pushW`/`dropF`/`dupF` (all GREEN in Part A) plus `he`'s and `hA'`'s
  fragments, `Nat.log2`-by-bits and double-by-shift as bespoke one-off fragments. Slower to
  write per lemma, zero transitive risk.

Also needed either way (pure arithmetic, no fragments):

```lean
/-- The counter machine's states are polynomial in |x| + 2 (the S-hypothesis that
`exists_tm_space` consumes). -/
theorem padM'_state_poly (he : PolyT e) : ∃ d : ℕ, ∀ x : List Bool,
    2 * x.length + e x + 4 ≤ (x.length + 2) ^ d
```

### D3 — the time absorption (eth `pad_bound`, reused with one mul-le step)

```lean
/-- Arithmetic (eth Pad.lean:98–109 transcribed verbatim). -/
theorem pad_bound (q l e : ℕ) : q * (e + 1 + 1) * (l + (2 * l + 2 * 2 ^ e + 3) + 1) ^ q ≤
    (q * 4 ^ (q + 1) + (q + 1)) * (l + 2 ^ e + 1) ^ (q * 4 ^ (q + 1) + (q + 1))

/-- The host's time for the counter machine absorbs into eth's padded shape. Our middle
factor (l + 1)^c is *smaller* than pad_bound's, so pad_bound applies directly. -/
theorem padded_time_absorb (c l e : ℕ) : c * (e + 1 + 1) * (l + 1) ^ c ≤
    (c * 4 ^ (c + 1) + (c + 1)) * (l + 2 ^ e + 1) ^ (c * 4 ^ (c + 1) + (c + 1)) :=
  (Nat.mul_le_mul_left _ (Nat.pow_le_pow_left (by omega) c)).trans (pad_bound c l e)
```

(the `Nat.pow_le_pow_left` inner fact is `l + 1 ≤ l + (2*l + 2*2^e + 3) + 1` — `omega`).

### D4 — the headline

```lean
/-- **The space-annotated `exists_tm_padded`** (dossier 10's machine-layer assembly; eth
Pad.lean:116–120 statement with the counter machine). Let e (bit strings → numbers) and
A' (bit string × counter → bit) be polynomial-time. There are a machine N with finite
alphabets and a constant q, depending on e and A' only, such that on every bit string x the
machine halts with A' (x, 2^(e x)) within q·(|x| + 2^(e x) + 1)^q steps — eth's bound, the
pad never materialized — AND at every step of its run its stacks hold at most q·(|x|+1)^q
symbols together: polynomial space in |x| ALONE, whatever 2^(e x) is. -/
theorem exists_tm_padded_space (he : PolyT e) (hA' : PolyT A') :
    ∃ (N : TM2ComputableAux Bool Bool) (q : ℕ), (∀ k, Finite (N.tm.Γ k)) ∧
      ∀ x : List Bool,
        Nonempty (TM2OutputsInTime N.tm (x.map N.inputAlphabet.invFun)
          (some ([A' (x, 2 ^ e x)].map N.outputAlphabet.invFun)) (q * (x.length + 2 ^ e x + 1) ^ q)) ∧
        ∀ t, SpaceWithin N x t (q * (x.length + 1) ^ q)
```

Proof skeleton (all steps have GREEN precedent): `padM'_isPolyT` + `padM'_state_poly` →
`exists_tm_space (padM' e A') d` (M1) instantiated with `T := e x + 1`, `S := 2|x| + e x + 4`
(`padM'_runs`); time half = `padded_time_absorb` with `q := c*4^(c+1) + (c+1)` (eth's own
final constant, Pad.lean:123); space half = `PB.bound_le` absorption, the same ending pattern
as `exists_tm_space_monitor` (GREEN, L2). Optional stretch corollary (NOT
required): `decidesTM_of_padded_space`, mirroring Pad.lean:134–148.

### D5 — the wd↔cw relabeling walk

The two codings of a counter `n` (both already defined in the embedded substrate): the host's
`wd n` (bracket-tree code of the bit list; `len n = 3·|bits n| + 2`) and the countdown loop's
`cw n` (flat run; `(cw n).length = n.size + 2`, L2). Note `wd 0 = cw 0 = [.L, .R]` — the
consumed-counter tail needs no walk at all. The walk is a two-phase sentinel-count shuttle on
stack a with b and cnt as scratch — the exact machine pattern of Part A's `mvB` (GREEN:
`mvB_runs`), applied to the deterministic grammar of the bit-list tree code
(`wd [b0..bk-1] = .L .bit b0 (.L .bit b1 (… [.L .R] .R) … .R) .R`): descend (keep the first
`.L`, shuttle the bits to b dropping the interleaved `.L`s, swallow the inner `.L .R`), then
unwind (count the closing `.R`s down on cnt, emit one `.R`, transfer b, lift the opening `.L`).

```lean
/-- wd n becomes cw n on stack a, in place: everything beneath untouched, b and cnt restored,
in O(len n) steps, never above start + K·(len n + 1) symbols. -/
def wdCw : Fr := ⟨Wl, …, wlM⟩          -- label type Wl + program wlM: new, pattern of mvM
theorem wdCw_runsB (n : ℕ) : ∃ K : ℕ, ∀ (M A B N : List Sym),
    (wdCw).RunsB none (st M (wd n ++ A) B N) (K * (len n + 1) + K)
      (st M (cw n ++ A) B N)
      (stkLen (st M (wd n ++ A) B N) + K * (len n + 1) + K)

/-- cw n becomes wd n on stack a, in place (the inverse construction). -/
def cwWd : Fr := ⟨Wl', …, wlMi⟩
theorem cwWd_runsB (n : ℕ) : ∃ K : ℕ, ∀ (M A B N : List Sym),
    (cwWd).RunsB none (st M (cw n ++ A) B N) (K * (len n + 1) + K)
      (st M (wd n ++ A) B N)
      (stkLen (st M (cw n ++ A) B N) + K * (len n + 1) + K)
```

Correctness by structural induction on the bit list, mirroring `toV`/`code` — the same
induction shape as Part A's `run_inside`/`mvB_runs` (GREEN). Word-size bridge lemmas:
`len_nat` (eth EncLemmas, transcribed in D2's set) and L2's `cw_length`.

### D6 — the certificate transfer (cw-world → wd-world)

```lean
/-- L2's cw-world certificates transfer to M1's wd-world PolyT over the pair: a PolyTVal
function of the input and the counter is polynomial-time as a function of the pair (whose
code carries the counter as a wd-subword). Composition: dup the pair word (GREEN dupF),
split it at the depth-0 boundary (a scan with the cnt-stack discipline — same pattern class
as D5), walk the counter subword wd→cw (D5), run the PolyTVal fragment, and reassemble —
the consumed counter contributes the constant word [.L,.R] either way. -/
theorem polyT_of_polyTVal {α β : Type} [Enc α] [Enc β] {f : α → ℕ → β} (h : PolyTVal f) :
    PolyT (fun p : α × ℕ => f p.1 p.2)
```

This is the one deliverable with genuine design freedom (the pair-split scan); everything else
is pattern-matched on GREEN machinery. It is NOT needed for D4 (which takes `PolyT A'` as a
hypothesis, exactly as eth takes `hA`) — its role is to make the NEXT wave (StCert* over L1's
combinators, certified in L2's `PolyTVal` form) consumable without redoing fragment work.

**Dependency order:** D2-arithmetic + D1 → D3 → D4 (headline, landable without D5/D6);
D5 → D6 independently. A charter may split D4 and D5+D6 into two landings.

## 3. Substrate inventory (pin: mathlib `ff2494ea`, v4.36.0-rc2; runner app `crossmath-pilot-32`, MODAL_USER=doz)

| Item | Source | Status |
|---|---|---|
| Fragment calculus, host, `exists_tm_space`, `SpaceWithin`, monitor form | M1 Parts A–C (embedded in L2.lean 49–2090) | GREEN, re-embed verbatim |
| `cw`, `cdFrag`, `cdLoop_runsB`, `PolyTVal`, `polyTVal_id`, `countdown_cut` | L2 Part D (L2.lean 2092–end) | GREEN, re-embed verbatim |
| `pad`, `padM`-statement skeleton, `padM_reaches` proof shape, `pad_bound` | eth `PaddedDescent/Pad.lean:30,35–40,68–109` | transcribe (≈60 LoC; M1's host-stack experience: transcribed eth proofs elaborate verbatim on the pin) |
| `PolyT.of/congr/of_wd` | eth `ToTuring/PolyT.lean:62–100` | transcribe with attributes (route A) |
| decide/`le`/`log2`/`mul`/pair closures | eth `Lib/Bool.lean` (subset), `Lib/Nat1.lean:290–318`, `Lib/Nat1b.lean:84–142`, `Lib/Nat2.lean:68–80`, `Lib/List1.lean:38–66` | transcribe with attributes (route A) |
| `Carried` instances + `len_nat`/`size_nat`/`len_unit` | eth `ToTuring/EncLemmas.lean:106–127` + referenced | **gap in M1 layer** — must transcribe |
| `Nat.log2_two_pow`, `Nat.size_le`, `Nat.lt_two_pow_self`, PB calculus | Mathlib + in-file PB (GREEN) | in place |
| axcheck generator | `pilots/10/axcheck_full.py` (section-aware as of 2026-11-14) | ready; add `AxPilot10_L3` to `make_axcheck.py` TARGETS at close |

No new Mathlib imports beyond the `import Mathlib` umbrella already used by every pilot file.

## 4. Effort grade, LoC budget, overrun guards

**Grade M** (compare: 42-M4a 1,194 LoC GREEN; M1 2,043; L2 Part D ≈ 580 new). New-LoC budget:
D1 ≈ 120; D2 ≈ 350 (route A) / ≈ 250 (route B, no attributes but bespoke fragments);
D3 ≈ 60; D4 ≈ 120; D5 ≈ 350; D6 ≈ 250 — **total ≈ 1.0–1.6k new LoC** on top of ≈ 2.6k embedded.
Modal runs: expect 3–6 to GREEN (L2 took 5 with a defect-laden draft; this starts from GREEN
substrate + eth-mirrored proofs).

**Overrun guards (stop + write diagnose note in `pilots/10/logs/`, report):**
(i) new LoC > 1.8k, or (ii) > 8 Modal runs without monotone error descent, or (iii) route A's
transcription alone exceeds 0.6k LoC → exercise route B (or split D4 / D5+D6 into separate
landings via charter amendment). Guard (iii) is a pre-authorized route switch, not a stop.

## 5. No-wall evidence trail

1. **The state sizes are polynomial by construction, not by proof.** `padM'`'s σ carries the
   counter as a `ℕ`; `size n = n.size + 1 ≤ e x + 2` while `n ≤ 2^(e x)` — linear in `e x`.
   eth's exponential enters only through the *number of doublings*, never the state. What
   `exists_tm_space`'s hypothesis `S ≤ (|x|+2)^d` consumes is exactly this (L2 header's
   "no wall" note, now discharged by D2's `padM'_state_poly`).
2. **The time bound is eth's own arithmetic.** `pad_bound` is transcribed verbatim and our
   middle factor is *smaller* (D3) — no new absorption mathematics.
3. **The walk is a GREEN machine pattern.** `mvB` (sentinel + count + shuttle, Part A,
   `mvB_runs` GREEN) applied to a deterministic grammar; its correctness induction has the
   same shape as `run_inside` (GREEN). The one new observation — `wd 0 = cw 0 = [.L,.R]` —
   removes the tail case.
4. **The closure is eth's, not ours.** Every route-A lemma ships with an eth proof; the
   corpus-wide port-probe finding (statement-port cost ≈ 0 on v4.36; FEASIBILITY-SUMMARY)
   and M1's run-1 experience (transcribed eth proofs: 0 churn) back the transcription cost
   estimate; route B caps the risk.
5. **Nothing downstream of L2 is re-proved.** The clock (`cdLoop_runsB`), the discipline
   (`PolyTVal`), and the first certificate are consumed as hypotheses/structure, GREEN.

Residual risks (named, none a wall): (a) `fun_prop` over our re-declared `PolyT` on the pin —
decided by the first run (guard iii); (b) the pair-split scan of D6 is the only genuinely new
*fragment* design — same pattern class, but budgeted separately; (c) `Carried`-instance gap is
a known, bounded transcription.

## 6. Verification protocol (unchanged from L1/L2)

Ephemeral staging `/tmp/crossmath-pilot-stage` via `run_pilot.py` (pilots/32) as
`MODAL_USER=doz` (`/home/doz/dozenv/bin/modal`, profile `semraker`); every run persisted to
`research/pilots/10/logs/l3-runN*.log` with provenance header (date, lane, file+LoC, command,
verdict); sorry-warnings = FAIL (and, per the filter caveat relayed to A1: the axcheck copy —
not the runner's sorry-filter — is the reliable sorry-detector at v4.36, since it surfaces
`sorryAx` in `#print axioms`); close-out = full axcheck via the section-aware
`axcheck_full.py` (all theorems ⊆ {propext, Classical.choice, Quot.sound}, 0 sorryAx) +
`AxPilot10_L3` TARGETS entry + blueprint §L3 run log + report for relay to A9/A1.

## 7. Explicit non-goals (next waves, pre-declared)

- The seven `StCert*` re-proofs as `PolyTVal` certificates over L1's counter combinators
  (prework §4 "needs analogues"; consumes D6) — the bulk new-work wave.
- The Solver pipeline + `CountedRoute.mainTheoremHolds` shape + the full dossier-10 theorem
  (`CountsWithin ∧ SpaceWithin` with `timeMin`) — requires the above.
- `decidesTM_of_padded_space` (3-SAT wrapper) — optional corollary of D4 only.
