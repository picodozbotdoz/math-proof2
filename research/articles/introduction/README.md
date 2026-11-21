# Introduction companions — registry

One beginner-introduction companion per research article (17 stems), generated **after**
the 2026-11-21 external review of the article corpus (main commit `2bfe771`, which revised
all 17 parents in place) so that each companion describes the *revised* article — the
reviewer-flagged reader gaps (density/notation/no examples; wrong-field imports caused by
undefined scope) are what these files exist to close. The binding spec is
[`_SPEC.md`](_SPEC.md); the finished exemplar is
[41](41-parallelogram-defect-deformation-eight-square.md).

**Standing policy (folded in verbatim from the former marker file
`README-INTRODUCTION_IS_POST_REVIEW.md`):**

*Introduction documents are generated after review, and specifically not to be created during research loop.*

The standalone marker file is superseded by this preamble and is marked for deletion by
the orchestrator (it is tracked at HEAD; lanes do not delete it themselves).

**Companion sync (standing rule; adopted 2026-11-21 — R6's §1 verbatim,
`pilots/75/v5-companion-sync-plan.md` `03db76ef`):**

> **Companion sync (standing rule).** Each companion describes its article's current
> committed bytes. **Any revision to an article — referee set, revise-in-place,
> integrity fix, tail update — requires its same-stem companion to be re-verified
> against the revised bytes in the SAME landing family as the revision's apply.**
> If the sync cannot ride that landing, the registry row is stamped
> `stale-at-<article-sha256-16>` until the sync lands, and a stale companion is not
> cited as current. A companion never leads its article: no companion edit anticipates
> an un-landed article state — pre-plans for pending revisions live pilot-side
> (e.g. `pilots/75/v5-companion-sync-plan.md`), and the registry row's "written
> against" line is the sync witness. Sync scope = the introduction pass's
> post-revision-consistency check (claims, status strings, novelty framing, theorem
> names/counts/pointers); the non-normative marker already governs any conflict —
> this rule makes the conflict not happen.

(Adopted with no retroactive stamps: R6's audit at `7307e0c` found the 17 current rows
in sync, with stem 75 drift-pending on the v5 chain itself.)

Every companion is **non-normative**: each carries the marker *"Nothing here adds,
weakens, or replaces any claim of the article: if this file and the article ever
disagree, the article and its Lean artifacts win."* Status strings, hypothesis
inventories, and evidence pointers of record live in the articles and in
[`../README.md`](../README.md) — the `kind` column below mirrors that registry; hooks here
are descriptive only and carry no claim weight.

## Registry

| stem → companion | parent article | kind | one-line hook |
|---|---|---|---|
| [01](01-inertial-defect-master-identity.md) | [An Exact Five-Defect Identity for the Rank–Trace Inequality](../01-inertial-defect-master-identity.md) | new theorem (linear algebra) | the rank–trace gap splits into exactly five named defects, each pinned by a kernel-checked identity |
| [10](10-layers-toward-uniform-poly-space-eth-refutation.md) | [Toward One Machine for All k: Space-Certified Layers](../10-layers-toward-uniform-poly-space-eth-refutation.md) | technical record (relabeled; headline OPEN) | one machine, all clause widths, subexponential time AND polynomial space — the target stays open; the verified layer ladder is the record |
| [11](11-call-charged-reduction-calculus.md) | [A Call-Charged Reduction Calculus for Fine-Grained Complexity](../11-call-charged-reduction-calculus.md) | technical record | compose two typed reductions and the call counts multiply while the overheads add — donor Theorem 19 reproduced as one composition |
| [20](20-engine-seam-interface.md) | [An Interface Theorem for Zero-Proportion Engines](../20-engine-seam-interface.md) | technical record | the zero-density engine restated over abstract zero configurations — deliberately hollow, named hypotheses only, no consumer imports it |
| [22](22-pnt-psi-form-from-mathlib-wiener-ikehara.md) | [The PNT in ψ-Form from Mathlib's Wiener–Ikehara](../22-pnt-psi-form-from-mathlib-wiener-ikehara.md) | technical record (formalization) | mathlib's never-used Wiener–Ikehara theorem gets its first consumer: two missing links deliver ψ(x) ~ x |
| [30](30-boson-operators-second-difference-closed-form.md) | [The ETH-Appendix Operators Q_s Are Second Differences of Number Operators](../30-boson-operators-second-difference-closed-form.md) | new theorem + project-conjecture refutation | the corpus's Q_s are, up to one Kronecker term, discrete Laplacians — which is exactly why the project's Parseval conjecture fails |
| [32](32-rc-savings-frontier.md) | [The Exact Savings Frontier of the Thin-Product Certificate Class](../32-rc-savings-frontier.md) | new theorem (phase transition) | which savings the certificate family can certify at range ε: an exact frontier Γ(ε) with a unique crossing and a sharp threshold ε* ≈ 0.1204 |
| [41](41-parallelogram-defect-deformation-eight-square.md) | [A q-Deformation of the Eight-Square Sign Rule](../41-parallelogram-defect-deformation-eight-square.md) | new theorem | turn the eight-square sign dial off q = 1 and the cancellation fails by exactly (1 − q) times an explicit polynomial |
| [41H](41H-tl-realizability-transport.md) | [No Three-Strand Temperley–Lieb Dictionary at the q = −1 Fiber](../41H-tl-realizability-transport.md) | NEGATIVE | no tracial evaluation and (modulo one disclosed classical step) no 5-dimensional linear-functional realization of the sign table at q = −1 |
| [41H3](41H3-two-fiber-rank-closure.md) | [No Linear Host of Dimension at Most 7 at Either Closed Fiber](../41H3-two-fiber-rank-closure.md) | NEGATIVE | every host of dimension ≤ 7 is kernel-excluded at both closed fibers, and the monomial-word search comes back empty |
| [42](42-quadratic-dedekind-zeta-zero-proportions.md) | [Critical-Line Zero Proportions for Quadratic Dedekind Zeta Functions](../42-quadratic-dedekind-zeta-zero-proportions.md) | conditional assembly | on-line zero proportions for quadratic ζ_K assembled from a ζ column and a donor-pin χ column |
| [50](50-zero-free-regions-cannot-move-certificate-constants.md) | [What the 7/8 Half-Plane Buys](../50-zero-free-regions-cannot-move-certificate-constants.md) | technical record | why the shipped window-certificate engine's constants cannot move, stated at the engine's own scope |
| [52](52-statistics-universal-occupation-calculus.md) | [A Statistics-Universal Creation–Annihilation Calculus](../52-statistics-universal-occupation-calculus.md) | formal-first axiomatization | creation–annihilation bookkeeping that is universal over the statistics sign — with the verified (ℤ/2)² example marking where sign discipline bites |
| [71](71-splane-zeta-curve-dictionary.md) | [The s-Plane Zeta of a Curve over 𝔽_q](../71-splane-zeta-curve-dictionary.md) | FORMALIZATION-FIRST | the curve's zeta read in the s-plane under Weil-conjecture hypotheses — and why the s ≠ 1 clause is false for the Lean totalized version |
| [72](72-renyi-monotonicity-nogo-gate.md) | [A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws](../72-renyi-monotonicity-nogo-gate.md) | technical record (no-go fence) | volume law plus boundary-linear area law is self-contradictory in 2D — Kuwahara's theorem supplies the volume half as a hypothesis |
| [75](75-abelian-assembly-zetaL-proportions.md) | [Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower](../75-abelian-assembly-zetaL-proportions.md) | DISCOVERY-CONDITIONAL | two regimes of on-line proportions for ζ_L along an abelian tower — 2/3 with multiplicity, 5/6 strip-distinct — conditional on component proportions |
| [78](78-truffet-substitution-refutation.md) | [Truffet's Tropical Substitution Terminates Suboptimally](../78-truffet-substitution-refutation.md) | NEGATIVE | a bounded two-row instance where the 2026 external procedure's own substitution terminates suboptimally — kernel-verified |

## Notes

- Lane verification of the drafted set: batch B (stems 10, 11, 20, 22, 30, 32, 41H, 72)
  re-verified against the revised parents and fixed in place 2026-11-21 (lane R7);
  batch A (stems 01, 41, 41H3, 42, 50, 52, 71, 75, 78) is lane R6's unit — see the
  iteration-6 records for its verdicts.
- Each companion names its parent's revision state in its header ("written 2026-11-21
  against the article's committed state"); if an article is revised again, regenerate or
  re-verify the companion rather than letting it drift.
