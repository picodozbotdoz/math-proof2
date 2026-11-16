# PROPOSAL (R1, iteration-4 review) — fix sheets: article 11 integration, article 73 disposition

**Proposal file — no edits to `research/articles/` yet.** All old-text quotes are
verbatim from the live files (line numbers from the 2026-11-16 reads; R1 audit
`r1-articles-editorial.md` §3 is the defect register). Evidence cells marked
**[R3-FILL]** await R3's log-trace numbers.

---

## (a) Article 11 — M2 integration fix (exact old → new)

Four edits. Together they remove the audit's BLOCKER (§7 contradicts the addendum:
`11-call-charged-reduction-calculus.md:114–118` "is not attempted here" vs `:132–134`
"PROVED") and the MAJOR changelog status block (`:7–12`), and land M2 in the body per
TEMPLATE-iter4.

### Edit 1 — status block (replaces lines 7–12)

OLD:

> **Status: Milestone 1 PROVED, kernel-verified** (mathlib `ff2494ea`, Lean `v4.36.0-rc2`;
> all declarations `[propext, Classical.choice, Quot.sound]`; no `sorry`, no `native_decide`)
> **+ M2 COMPLETE (2026-11-14; A8 formal report received)** — Theorem B(ii), the TM2
> realization, kernel-verified (`m2-run8-GREEN.log` all six files OK; `m2-axcheck-final.log`
> 76 axiom-lines, 0 sorryAx, triad-only). Of Theorem B only the word-RAM (Light-language)
> half and the M3 instantiation remain open.

NEW:

> | theorem | status | hypotheses | evidence |
> |---|---|---|---|
> | Thm 1 `Red.comp` (calls multiply, extras add) | PROVED-UNCONDITIONAL | none | [R3-FILL: axcheck-final.log line] |
> | Thm 2 `red_of_theorem_17` / `Corollary_16` repackaging | PROVED-UNCONDITIONAL | none (donor claims compiled alongside as faithfulness check) | [R3-FILL] |
> | Thm 3 acceptance: `Claim.Theorem_19_explicit M 0.00175 1` from one composition | PROVED-UNCONDITIONAL | none (donor parameter arithmetic ported verbatim) | [R3-FILL] |
> | Thm B(ii) `tm2_realized_composed` (§8) | PROVED-CONDITIONAL | EthExistsTm, EthPoly, EthIsPoly (eth interface statements as explicit binders) | [R3-FILL: m2-axcheck-final.log line] |
> | Thm B(i) word-RAM realization | open — not attempted | — | — |
> | M3 instantiation (CH20 ∘ VW13) | open — not attempted | — | — |
>
> All kernel verification on mathlib `ff2494ea`, Lean v4.36.0-rc2; axioms ⊆ {propext,
> Classical.choice, Quot.sound}; no `sorry`, no `native_decide`.

### Edit 2 — §7 first bullet (replaces lines 113–118)

OLD:

> - **Machine realizations (M2).** Theorem B of the dossier — every calculus derivation is
>   realized by light-language word-RAM programs (oracle calls inlined, via
>   `Ends.callTo`/`Ends.callLast`, `ThreeSumApsp/Lang/Calls.lean:93–124`) and by a single TM2
>   machine (via eth's `PolyT` fragment calculus) — is the substantive next milestone
>   (≈ 1.5–2.5k LoC, eth slice) and is not attempted here.

NEW:

> - **Machine realizations.** The TM2 half of Theorem B — every calculus derivation
>   realized by a single machine — is proved in §8, conditional on the three eth
>   interface binders (EthExistsTm, EthPoly, EthIsPoly). The word-RAM half (light-language
>   programs with oracle calls inlined, via `Ends.callTo`/`Ends.callLast`,
>   `ThreeSumApsp/Lang/Calls.lean:93–124`) and the M3 instantiation (CH20 ∘ VW13 as one
>   composed realization, blueprint §4) remain open.

(The §7 second bullet — asymptotic forms — is unchanged.)

### Edit 3 — addendum becomes §8 (replaces lines 130–134 and renumbers nothing else)

OLD (header + opening paragraph):

> ## Cycle-2 addendum (2026-11-14): M2 — the TM2 realization (Theorem B(ii)), PROVED
>
> The open milestone of §7, realizing the calculus on actual machines (dossier 11
> Theorem B(ii)), is proved. It uses mathlib's own TM2 machines and eth's polynomial-time
> fragment calculus. Files: `research/pilots/11/P11T3.lean` (1,100 lines, 88 theorems;
> eth's machine-model tranche ported with proofs) and `research/pilots/11/RedTm2.lean`
> (421 lines).

NEW:

> ## 8. The TM2 realization (Theorem B(ii))
>
> Every derivation of the calculus is realized by a single TM2 machine. The realization
> uses mathlib's own TM2 machines and eth's polynomial-time fragment calculus, in
> `research/pilots/11/P11T3.lean` (1,100 lines, 88 theorems; eth's machine-model tranche
> ported with proofs) and `research/pilots/11/RedTm2.lean` (421 lines).

The remainder of the addendum body (cost model, interface hypotheses, the theorem
statement, companion results, proof outline, verification, "Still open") is retained as
§8 body with two register fixes: delete the trailing "**Still open.**" paragraph (its
content now lives in the rewritten §7 bullet) and keep the verification paragraph's
log facts as the §8 formal-record table instead of prose (per TEMPLATE-iter4 §6):

> | theorem | declaration | file | axioms | evidence |
> |---|---|---|---|---|
> | Thm B(ii) | `tm2_realized_composed` | `research/pilots/11/RedTm2.lean` | ⊆ triad | [R3-FILL: m2-axcheck-final.log; AxPilot11_RedTm2 sweep row] |
> | companions | `Tm2Sol.mono`, `tm2_choice`, `tm2_charging`, `composed_sum_le` | idem / `P11T3.lean` | ⊆ triad (`map_headD_sf` axiom-free) | [R3-FILL] |

### Edit 4 — README rows (both tables; see also `r1-readme-v2.md` §B/§D)

OLD main-run row (README.md:19):

> | 11 | [A Call-Charged Reduction Calculus for Fine-Grained Complexity](11-call-charged-reduction-calculus.md) | new formal framework | M1 **proved**; machine realizations open |

NEW main-run row:

> | 11 | [A Call-Charged Reduction Calculus for Fine-Grained Complexity](11-call-charged-reduction-calculus.md) | formal calculus for folklore composition, acceptance-tested on donor Theorem 19 | Thms 1–3 PROVED-UNCONDITIONAL; Thm B(ii) PROVED-CONDITIONAL (EthExistsTm, EthPoly, EthIsPoly); word-RAM half + M3 open |

OLD Cycle-2 row (README.md:46) — **deleted** (nothing append-only remains):

> | 11 | [A Call-Charged Reduction Calculus](11-call-charged-reduction-calculus.md) §Cycle-2 addendum | Theorem B(ii): TM2 realization | **proved** (on three eth interface hypotheses) |

### Optional (flag for H, not blocking): title

Title still carries donor numbering ("…with Theorem 19 of the 3SUM/APSP Refutation as
One Composition", `:1`). R1 audit called it MINOR-borderline; R2 kept it. If H wants it
dropped: "A Call-Charged Reduction Calculus for Fine-Grained Complexity, with an
Acceptance Test on the 3SUM/APSP Chain".

---

## (b) Article 73 — two-branch disposition (orchestrator picks)

Both lanes prefer branch 1 now (R1 `r1-articles-editorial.md` §3/§6; R2
`r2-discovery-strength.md` §4 item 3 "demote to dossier/pilot record until Q4"). Branch
2 is what must be true before an article exists again.

### Branch 1 — demote (recommended): dossier record replaces the article

**(b1.1) The article file** `research/articles/73-formal-tate-dictionary-function-field.md`
is retired at swap time (H executes); the record below is appended to
`research/candidates/73-function-field-hecke-tate.md` (outcome block) and cited from
`pilots/73/`.

Proposed record text:

> ### Outcome record (2026-11-16) — replaces the Cycle-2 article
>
> Demoted from article to pilot record (R1 `qa/iter4-review/r1-articles-editorial.md`
> §3/§6; R2 `qa/iter4-review/r2-discovery-strength.md` §4 item 3): the Cycle-2 tier is a
> statement layer whose two analytic theorems are one-step consequences of article 71's
> Core 1 under binders (hRat, hPur) that are never discharged; the "Tier C" status label
> was project-internal vocabulary; Q4 (rationality discharge for 𝔽_q[T]) was not
> attempted.
>
> | item | status | hypotheses | evidence |
> |---|---|---|---|
> | `FFRayClassCharacter k m` — field-for-field transplant of DZDF's number-field `RayClassCharacter` (`Challenge/DedekindZetaChallenge.lean:14–20`), archimedean clause proved vacuous (`no_real_homs`) | PROVED-UNCONDITIONAL (definition + structural lemmas `apply_span_singleton_eq_zero_iff`) | none | `pilots/73/C.lean`; [R3-FILL: axcheck-c2-final.log AxPilot73_C line] |
> | `heckeSeriesT χ ∈ ℂ⟦T⟧` — the L-series as a formal power series (defined object; Euler product a theorem, not used) | PROVED-UNCONDITIONAL (definition) | none | idem |
> | Thm 1 `hecke_continuation` — s ↦ P₁(q⁻ˢ)/P₀(q⁻ˢ) differentiable wherever P₀(q⁻ˢ) ≠ 0 | PROVED-CONDITIONAL | hRat : heckeSeriesT χ * P₀ = P₁ (identifies the quotient with the series) | idem |
> | Thm 2 `hecke_window` — no zeros of the quotient in Re s > 1/2 away from P₀-zeros | PROVED-CONDITIONAL | hRat + hPur (purity = Weil RH for the Kummer covers; never discharged) | idem |
> | Q4 rationality discharge (hRat with P₀ = 1, deg P₁ < deg m, via `monicDegreeN` bookkeeping) | OPEN — carried (est. 0.3–0.6k lines) | — | `pilots/73-prework.md` |
>
> Known non-content (recorded so it is not re-claimed): series agreement on Re s > 1 is
> not formalized; the functional equation / root number is out of scope; only 𝔽_q(T)
> with finite moduli.
>
> Re-article condition: branch 2 of `qa/iter4-review/r1-fixes-11-73.md`.

**(b1.2) README row** (replaces Cycle-2 row 73, README.md:42; lives in the v2 notes
section, `r1-readme-v2.md` §C):

> | 73 | demoted to dossier/pilot record 2026-11-16 (`candidates/73-…` outcome block) | statement layer, formalization-first | C.lean PROVED-CONDITIONAL (hRat/hPur binders); Q4 carried |

**(b1.3) Downstream pointers to update at swap time** — grep-verified 2026-11-16
(`rg -l "73-formal-tate|article 73|articles/73"`, excluding this review): the article
itself; `articles/README.md` (row 42-area, the Cycle-2 table row at README.md:42);
`research/REPORT-INPUTS-C2.md`; `research/qa/articles-novelty-signoff.md`. Articles 71
and 75 reference *dossier* 73 only (no article pointer — verified, no change needed);
`candidates/73-function-field-hecke-tate.md` is the record's destination itself.

### Branch 2 — rewrite outline: what a real "Hecke L-Series over 𝔽_q[T], I" article must contain (post-Q4)

Billing ceiling first: even with Q4 landed this remains FORMALIZATION-FIRST (R2 class
(ii); not discovery billing). The article earns its file back only if it contains all
of:

1. **Q4 as a theorem, not a hypothesis.** For χ mod m nontrivial:
   `heckeSeriesT χ * 1 = P₁` with deg P₁ < deg m — equivalently, coefficients vanish
   for n ≥ deg m, proved from `monicDegreeN` equidistribution over residue classes.
   hRat disappears from Thms 1–2 for this class; P₀ = 1.
2. **Series agreement.** f(s) = Σ_n a_n q⁻ⁿˢ for Re s > 1 (power-series evaluation at
   |q⁻ˢ| < 1), so "L-series" is earned by the object the theorems are about — closing
   the audit's framing MAJOR (current article `73-…:37–39` "continuation theorem" over
   an explicit quotient; identification-by-hypothesis admitted at `:65–68`; series
   agreement unformalized at `:172–174`).
3. **Window theorem about the L-function itself.** Thm 2 restated for L(q⁻ˢ, χ) (not
   the abstract quotient), still PROVED-CONDITIONAL on purity, with the binder named as
   the open core and its would-be source stated (AxiomMath `Weil`, behind the G6a
   59,222-job wall — priced out on our pin; statement-level citation meanwhile).
4. **Functional equation / root number**: formalized, or explicitly listed under
   limitations as not contained (no silent omission).
5. **Comparison optics fixed.** The 1/2-vs-31/32 sentence (`73-…:43–45`) is recast with
   hypothesis provenance on both sides: 1/2 is purity-as-binder (Weil RH) for function
   fields; 31/32 is DZDF's *proved* number-field constant; "optimal" only ever appears
   as "optimal given purity".
6. **Nearest-miss table (≥ 2 rows)**: WenrongZou/TateThesis (number-field Tate thesis,
   in progress — retires any "anywhere" phrasing when it lands); DZDF
   `RayClassCharacter` + `HeckeCorollary.lean:12` (31/32, number-field); Rosen GTM 210
   chs. 4, 9 (textbook source of everything); article 71 (the T↔s dictionary and Core 1
   dependency).
7. **Front matter per TEMPLATE-iter4**: kind FORMALIZATION-FIRST; per-theorem status
   rows in the closed vocabulary (no "Tier"); title carrying the surviving
   conditionality, e.g. "Hecke L-Series over 𝔽_q[T]: the Statement Layer, Conditional
   on Purity"; abstract with exact theorem + named hypotheses + scoped novelty
   ("first formal function-field ray-class character and L-series; window statements
   conditional on purity").
8. **Formal record table only** (decls, axioms, log paths — [R3-FILL] at draft time),
   line counts re-measured at final commit; Q4's own proof sketch in §5.

Cost note for the orchestrator's scheduling (from `pilots/73-prework.md`, carried in
the v1 article `:168–172`): Q4 is bookkeeping-heavy (est. 0.3–0.6k lines), series
agreement is an additional formal step on top; branch 2 is therefore an Iteration-4
mid-cycle objective at the earliest, not a re-entry condition for the current
restructure.
