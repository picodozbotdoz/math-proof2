# The Common-Zero Seam: what zero-density engines cannot transport (analysis note)

*Dossier-grade note (knowledge-level + one paper proposition), extracted from the
2026-11-09 edition of article 20; reclassified per the Iter-4 strength bar — not an
article. Carries the `SharedMass` and `CommonZeroControl` definitions verbatim
(formerly article §2) together with the proposition that uses them.*

**Contents.**

1. **Definitions (moved from article §2).** For configurations z, w:

   - `SharedMass(T)` = Σ_{ρ on-line in the dyadic window (T, 2T]} min(z(ρ), w(ρ));
   - `CommonZeroControl z w` :⇔ ∀ η > 0, eventually SharedMass(T) ≤ η·N_{z+w}(T).

   Also S₁(T) counts on-line points that are simple zeros of both factors; N(T) is the
   dyadic with-multiplicity window count.
2. **The seam statement (paper proposition, not formalized).** Let z, w satisfy the
   5/6-distinct theorem (as ζ and L(χ_D) do, zeta23 Theorems C/E). Then for every
   ε > 0, eventually

     SharedMass(T) ≤ S₁(T) + (1/6 + ε)·N(T).

   Consequently: (a) hCZ (CommonZeroControl) at every level η > 1/6 holds unconditionally
   given the factor theorems; (b) hCZ ⇒ S₁ = o(N); (c) S₁ = o(N) together with
   density-zero multiplicity of each factor ⇒ hCZ.

   *Proof (paper).* Split SharedMass = S₁ + Σ_{shared}(min(z, w) − 1). Pointwise
   min(z, w) − 1 ≤ z − 1 on shared points, and Σ_all (z(ρ) − 1)⁺ = N_z − N_z^{d} ≤
   (1/6 + ε)N_z by the 5/6-distinct theorem (and the same for w). Summing gives the
   bound and (a). (b) holds because S₁ ≤ SharedMass. For (c), density-zero
   multiplicity of each factor makes the shared-multiple part o(N). ∎

   Status row: **PAPER-ONLY** (no decl; the v1 abstract asserted it as a result — that
   billing is retracted by the split).
3. **Why the seam is real (knowledge-level).** The certificate engine penalizes
   multiplicity through a convex function, so a merged multiplicity-2 atom costs
   exactly where the product's distinct count loses a point. S₁ is a *cross-function
   coincidence count*: a simple common zero is simple in each factor's own statistics,
   so no per-function proportion theorem constrains it. Classical zero-density
   estimates N(σ, T) ≪ T^{A(1−σ)} log^C T make shared mass with Re ρ > 7/12 + δ
   negligible (A = 12/5) but say nothing on the critical line. Heuristically
   (independent ordinates) S₁ is eventually zero; no theorem implies even S₁ = o(N).
4. **Prior work on common zeros.** Li (2012); Garunkštis–Kalpokas; Gonek's heuristics;
   Ingham; Huxley (A = 12/5). Recorded queries, nothing verified here.
5. **Consumers.** Article 42-v2 (defect + hCZ-conditional distinct bounds); article 75
   P-b (the strip-distinct arm, carried); the Montgomery–Taylor window constants for
   ζ_K (engine route, open).
6. **Open problem.** Prove S₁ = o(N) for (ζ, L(χ_D)) — or any negligibility statement
   for common on-line zeros — and the distinct/simple/window constants for ζ_K become
   reachable by the engine route.

