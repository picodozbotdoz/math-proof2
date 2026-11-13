# QA spot-check — research/survey/tauceti.md (main-run P1 survey, R1; never QA'd)

Lane A1, 2026-11-13 (task A1-5, orchestrator-authorized; methodology per
`qa/cycle2-qa-plan.md` §(a)–(b) recipes — direct-source checks + word-boundary greps; the
decl-index TSV was not needed for these name-known claims). Survey under audit:
`research/survey/tauceti.md` (landed 2026-11-09, INDEX row "Not yet QA'd"). Sampling: 12
claims — 8 against the tauceti checkout at its surveyed rev (`d92acc5c0`), 2 of those
double-checked at Cycle-2 donor-consumption points (DZDF/axiommath, per quota), 3 against
cited mathlib (`encore-mathlib/repo/mathlib4` @ `ff2494ea`). Scale: OK / MINOR-ERROR
(locator or count; substance holds) / WRONG (fact false as stated).

**Tally: 6 OK, 5 MINOR, 1 WRONG.** The WRONG is the survey's mathlib-PNT comparator
sentence (item 11) — conservative in the safe direction (it understates tauceti's donor
status) but false as written. All five minors are one-edit locator/count fixes; applied
2026-11-13 as inline errata (trivial-and-uncontested per the A1-5 authorization), listed in
the Disposition.

| # | Claim (survey §) | Checked (command) | Evidence | Verdict |
|---|---|---|---|---|
| T1 | Corpus rev `d92acc5c0`, toolchain v4.36.0-rc2, mathlib pin `1b1ccf4b…` (§0) | `git rev-parse HEAD`; `cat lean-toolchain`; manifest parse | `d92acc5c0393646e14960dfd4972fc836aad3ebe`; `leanprover/lean4:v4.36.0-rc2`; mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` — all three exact | **OK** |
| T2 | `TauCeti.LSeries.landau` at `NumberTheory/LSeries/Landau.lean:296` (§1.1) | `grep -n "theorem landau\b"` | `Landau.lean:296 theorem landau (ha : 0 ≤ a) {σ} (habs : LSeries.abscissaOfAbsConv a = σ)…` | **OK** |
| T3 | Prime ideal theorem `primeIdealTheorem` at `ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:39` (§1.1) | `grep -n "theorem primeIdealTheorem"` | `:39 theorem primeIdealTheorem :` | **OK** |
| T4 | "All eight files with matches contain the word only inside docstrings" — zero proof sorries (§2a) | `grep -rnE "\bsorry\b" TauCeti -g '*.lean'` (word-boundary) | **7 files / 9 docstring lines**, zero in proof position; the three cited examples verbatim: `RingTheory/Huber/RingOfDefinition.lean:110` ("AINTLIB's proof is a `sorry`"), `Huber/ClosedSubmodule.lean:81` ("whose body in that development is `sorry`"), `AdicSpace/SpvOfIdeal/Spectral.lean:118` ("which is a `sorry` there"). Substance exact | **MINOR** (8 → 7 files; count slip only) |
| T5 | `zetaEntireCompletion` "(`Zeros/Completion/RiemannZeta.lean:27`)" = 2ξ (§1.1, repeated §4) | `grep -n "zetaEntireCompletion" …/RiemannZeta.lean` | def at **:33** (:14 docstring "twice Riemann's ξ-function"); `:27` is an `open` line — the tauceti-contributions bridge already issued this exact erratum (2026-11-09, H/QA) but the survey never picked it up | **MINOR** (locator; 2ξ characterization correct) |
| T6 | Quadratic factorization `ζ_K = ζ·L(s,χ_D)` at `NumberTheory/LFunctions/DedekindZeta/Quadratic.lean`; residue at `NumberField/Quadratic/DedekindZeta.lean:225` (§1.1) | `grep -rn "theorem dedekindZeta_eq_riemannZeta_mul_LFunction"` | theorem declared at `NumberTheory/NumberField/Quadratic/DedekindZeta.lean:215` (namespace `TauCeti.NumberField`); the LFunctions/…/Quadratic.lean file only references/uses it (:19, :82); residue `dedekindZeta_residue_eq_LFunction_one` at `:225` exact; identity carries `{s} (hs : 1 < s.re)` — half-plane form, as dossier 42's transfer caveat says | **MINOR** (file attribution one directory off; statement + residue pin exact) |
| T7 | "Riemann–von Mangoldt is absent here too" — no zero counting N(T) in tauceti (§4; load-bearing for Cycle 2: the RvM-triplication table and the 42-M4 donor choice, `survey/axiommath-pntplus.md` §5) | `grep -rniE "riemannVonMangoldt\|von Mangoldt formula\|zeroCount" TauCeti/NumberTheory -g '*.lean' -l` | **0 files** (the Λ-function `vonMangoldt` uses in `SumPrimePow/Mertens/…` are the arithmetic function, not zero counting) | **OK** |
| T8 | Argument principle, both forms, at `Analysis/Complex/Conformal/ArgumentPrinciple.lean:89` (§1.5; dossier 22 step-7 alternative) | `grep -n "theorem argumentPrinciple_"` in both candidate files | `argumentPrinciple_windingNumber` at `ArgumentPrinciple.lean:89` exact; `argumentPrinciple_nullHomologous` is declared at `Analysis/Contour/Argument/Cycle.lean:110` (variants `_local` :150, `_of_analyticOnNhd` :183) — the survey's single locator covers only the first | **MINOR** (second name's home file; first pin exact) |
| T9 | Sylvester inertia `Matrix.IsHermitian.signature_congr` at `Analysis/Matrix/HermitianSignature/Basic.lean:147`, over RCLike (§1.5; dossier 01/72 adjacency) | `grep -n "signature_congr" …/Basic.lean` | `:147 theorem signature_congr [DecidableEq ι] {P : Matrix ι ι 𝕜} (hP : IsUnit P.det)` (docstring :25 confirms RCLike inertia framing) | **OK** |
| T10 | `friedberg_muchnik` at `Computability/FriedbergMuchnik/Basic.lean:364`; "Mathlib has bare Turing machines; nothing of priority-argument recursion theory exists in mathlib" (§1.6) | `grep -n "theorem friedberg_muchnik"`; mathlib greps | `:364 theorem friedberg_muchnik :` exact. Mathlib half: no Friedberg/Muchnik/priority content anywhere (`grep -rln "Friedberg\|Muchnik" Mathlib/Computability` → 0) ✓, **but** mathlib @ ff2494ea is no longer "bare Turing machines": `Mathlib/Computability/TuringDegree.lean` (111 lines: `TuringReducible`, `TuringEquivalent` basics) exists | **MINOR** (mathlib-side understatement; the distinctive-donor verdict stands) |
| T11 | "mathlib has PNT only over ℚ" (§1.1, comparator for `primeIdealTheorem`); same §1.5/§4 framing | mathlib greps: `primeNumberTheorem`, ψ/π asymptotics, `PrimeCounting.lean` | mathlib @ ff2494ea has **no PNT asymptotic at all** — `PrimeCounting.lean:98,102` only `tendsto_primeCounting(')` (divergence); the only "PrimeNumberTheorem" hits are attribution headers (`Chebyshev.lean:56` "upstreamed from the PrimeNumberTheoremAnd project", `LSeries/WienerIkehara.lean:2,52` "adapted from the PrimeNumberTheoremAnd project" — the Tauberian *tool* landed, the conclusion did not). Consistent with dossier 22's verified novelty check ("no PNT asymptotic anywhere"). Companion facts OK: `Mathlib.NumberTheory.FLT.Basic` exists (statement-only, §1.2 claim) ✓; `hofer` at `Mathlib/Analysis/Hofer.lean:31` ✓ | **WRONG** (as stated; fix applied, see Disposition) |
| T12 | Cycle-2 donor-consumption point: DZDF consumes tauceti at the surveyed rev | DZDF `lakefile.toml` / manifest / `formalization.yaml` | DZDF lakefile pins `TauCeti @ d92acc5c0393646e14960dfd4972fc836aad3ebe` — **exactly the surveyed checkout rev** (same-rev donor, the Cycle-2 consumability premise); manifest stale at `c197d7bd` (recorded in `survey/axiommath.md` §3); `formalization.yaml:66–72` records the adapted-source revision `66f3330c` + pinned dep | **OK** |

## Disposition

- **WRONG (T11), fixed in place 2026-11-13 (trivial-and-uncontested, per the A1-5
  authorization):** survey §1.1 sentence "mathlib has PNT only over ℚ" → corrected to state
  mathlib has no PNT asymptotic at the surveyed pin (the ℚ case being landed piecewise from
  PNT+-derived PRs: `WienerIkehara.lean` present, conclusion absent). Inline erratum line
  added. This *strengthens* the primeIdealTheorem donor claim (tauceti generalizes a
  statement mathlib does not yet have in any form); no downstream artifact leaned on the
  false comparator in the unsafe direction (dossier 22 and the analytic-nt bridge both state
  the correct absence).
- **MINORs T4/T5/T6/T8/T10 — fixed in place 2026-11-13 (one-edit locator/count errata,
  each tagged):** T4 8→7 files; T5 `:27`→`:33` (both occurrences); T6 factorization home →
  `NumberField/Quadratic/DedekindZeta.lean:215`; T8 second argument-principle home →
  `Contour/Argument/Cycle.lean:110`; T10 "bare Turing machines" → notes
  `Computability/TuringDegree.lean` basics.
- Load-bearing Cycle-2 claims (T7 no-RvM, T12 same-rev pin, T6 factorization substance)
  verified intact; no TRIAGE/REPORT cell affected.
