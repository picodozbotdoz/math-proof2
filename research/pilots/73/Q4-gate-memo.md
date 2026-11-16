# Q4 gate memo — the owed A2 recommendation: `hRat` discharge for pilot 73 (GO)

Lane A2 (R5-executing), 2026-11-17. **Decision input only — no Modal, no Lean.** This is
the recommendation the charter draft marked owed ("73-Q4 `hRat` discharge … A2's
recommendation owed", `feasibility/ITERATION4-CHARTER-DRAFT.md` :93; SCAN §1a row;
r5 backlog §13 step 0). On GO, the orchestrator authorizes the Q4 pilot (M0 below) to
whichever lane is free at this memo's landing. Companions: `pilots/73-prework.md` §2.4
(C1) + §5 (Q4 pricing), `qa/iter4-review/r5-iteration4-backlog.md` §13 (the M0 skeleton
+ fork), C.lean GREEN (`pilots/73/logs/run6-c-green.log`, ledger §9).

## 1. Recommendation: **GO**

Execute Q4 — the `(C1) hRat` discharge for the 𝔽_q(T) probe class — as a chartered
small pilot. `hPur` STAYS a binder (see §3).

## 2. The argument (r5 §13, four points, cited)

1. **Elementary mathematics.** The content is residue-class periodicity on `k[X]`:
   group monic `f` by residue class in `k[X]/(m)`; for `deg f ≥ deg m` each class
   contributes `q^{n − deg m}` degree-`n` monics uniformly, so `heckeSeriesT χ` is
   rational of the `(numerator of degree < deg m) / (1 − qT)` shape
   (`73-prework.md` §2.4 C1; Rosen GTM 210 ch. 8 territory MINUS the functional
   equation, which is out of scope). No Gauss sums, no analysis — the priced M is
   Finset-counting friction, not mathematics (`73-prework.md` §5 Q4: 0.3–0.6k LoC,
   the isolated M-risk of the 73 chain).
2. **It is R2's named upgrade path for the demoted 73 record.** R2 demoted 73 to
   "dossier/pilot record until Q4 (hRat discharge) lands" (`qa/iter4-review/
   r2-discovery-strength.md` §4 item 3); Q4-GREEN upgrades the record to a
   formalization-first technical record with one strengthened claim — "(P)(i)
   unconditional for the 𝔽_q(T) probe class: the first formal Tate-type statement
   with discharged rationality (FF scope)". Under cap-N = 1 FINAL the recommended
   outcome stays the **dossier upgrade note** (r5 §13 fork, resolved; the single
   N-slot, if spent at all, belongs to a stronger candidate).
3. **Zero donor cost, warm substrate.** 73-C is GREEN (7 theorems triad, ledger §9);
   the runner `crossmath-pilot-73` is warm from Cycle 2; Q4 consumes only mathlib +
   the carried vocabulary. Nothing gates it.
4. **Statement-class value.** It opens the Tate-dictionary's *unconditional* depth —
   `hecke_continuation` (already GREEN) applied to the produced witness makes (P)(i)
   unconditional for the probe class, converting the pilot's honest "(i)
   unconditional + (ii) conditional" posture into "(i) unconditional BY CONSTRUCTION
   at the probe, (ii) conditional everywhere" — the sharpest form the Tier-C layer
   can reach without Weil-RH-for-Kummer-covers.

## 3. Scope fence (banned at Q4; `73-prework.md` §6 R5, verbatim discipline)

No FE/root numbers (Gauss sums), no general curves C (integral closure), no sheaf
construction, no proportions (C3 fence), no Tier-A dreams — and **`hPur` is NEVER
discharged** (the §2.4 honesty correction: `hPur` for 𝔽_q[T] characters IS the RH for
the Kummer covers — deep, never a Q4 deliverable; it stays a binder in every
statement the pilot touches).

## 4. Rosen ch.-number spot-check — flag disposition (the SCAN §1c tail)

The flag ("due when a 73 pilot nears Q4/FE territory", `ITERATION4-SCAN.md` §1c) FIRES
at Q4 (Q4 territory; the FE clause is out of scope but the citation block is shared).
Disposition: **PROVISIONAL-PASSED-TO-PILOT, not blocking.** The record's provisional
pin is Rosen GTM 210 **ch. 8** (dossier 73 :95; the C2 record cites "ch. 8–9 incl. the
grössencharakter", `REPORT-INPUTS-C2.md` :127, and already carried the exact-chapter
pin as owed to A5's dossier-level re-run, :130). No local copy exists (checked this
session); per the HKT-precedent convention the Q4 file header and any artifact text
cite "Rosen GTM 210 ch. 8 (provisional pin; C2 :127–:130)" with the one-lookup
verification (zbMATH/library) performed at write-up of the dossier upgrade note.
The GO does not wait on it: the Lean content is self-contained; the citation is the
informal-provenance line only.

## 5. The pilot on GO (r5 §13 skeleton, restated for the executor)

- **M0 (kernel-checkable):**
  `theorem heckeSeriesT_rational_of_periodicity (χ : FFRayClassCharacter k m) :
    ∃ P₀ P₁ : Polynomial ℂ, P₀.eval 0 ≠ 0 ∧ heckeSeriesT χ * (P₀ : PowerSeries ℂ) = P₁`
  — the hRat witness produced explicitly.
- **Decomposition:** Q4-a residue-class partition + `q^{n−deg m}` uniformity (the
  fiddly Finset algebra); Q4-b geometric-series assembly (the `1 − qT` denominator);
  Q4-c feed the witness to C.lean's GREEN `hecke_continuation` ⇒ (P)(i) unconditional
  for the probe; Q4-d regression + full-coverage axcheck.
- **Files/runner:** `pilots/73/Q4.lean` (self-contained carry of C.lean's vocabulary;
  C.lean stays frozen GREEN); warm `crossmath-pilot-73`; [WARM] C2 minutes per run;
  guard ≤0.6k LoC, 3–5 runs; +1-policy applies if needed (four conditions, logged).
- **Acceptance:** GREEN rc=0/0/0; in-file `#print axioms` over every new declaration,
  triad-only, 0 sorryAx; zero donor imports; Rosen provisional-pin header per §4.
- **Outcome fork (resolved at N=1):** dossier upgrade note (73's pilot-outcome block
  records Q4; the scoped dictionary claim stands; no article).

— end memo (A2; the orchestrator owns the authorization + lane assignment).
