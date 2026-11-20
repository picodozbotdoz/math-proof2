# Article-75 v2-candidacy dossier — the iteration-6 revision-decision input

Lane R6, unit 12, 2026-11-20 (planning-only; no fires this unit). Purpose: make the
iteration-6 OPENING editorial decision on revising `research/articles/75-abelian-assembly-zetaL-proportions.md`
one read. Everything below is against the LANDED state of that file (its internal
version: **v2, 2026-11-17**) and the GREEN evidence produced in iteration 5 by the
75-N2 arc (units 9–11, 2026-11-19/20; all logs under `research/pilots/75/logs/`).

**Naming caution (resolve at decision time).** The charter's convention ("an upgraded
theorem is revised to v2 in one versioned article, never split") uses "v2" generically
for the one-versioned-revision act. The landed file has ALREADY spent its internal
version ladder (Cycle-2 original 2026-11-14 → v1 2026-11-16 → v2 2026-11-17). The
prospective revision is therefore **the file's v3 by its internal numbering**, while
being the charter-convention's revise-in-place act (second application to this file).
Recommend the §0 change log carry "v3" and the decision text say "the charter's
revise-in-place rule, second application" — avoiding a second "v2" label on one file.

**Provenance of the evidence base (all sha256(16), worktree states = the verified
states):** `Pa.lean` d61eb0485a6ff672 (unchanged, article v2 §6 stamps it) ·
`N2-P0.lean` 1cf5cbe217c68564 · `N2-P1.lean` 396d8710d9084388 (run-31 verified) ·
`N2-P2c.lean` 2cca447d7c2a29c8 (n2-p2c-run8) · `N2-P3.lean` f9bd28c5f8f7c3d2
(n2-p3-run3) · `N2-P3e.lean` 6f6beb2065c2c511 (n2-p3e-run1) · `N2-P3V2.lean`
2613cfd241ec207f (n2-p3v2-run4) · `N2-P2d.lean` 4f978b44a98ddbbe (n2-p2d-run2).

---

## (e) NOT-A-SHIP — standing box (read first)

The prospective revision **revises rows of the one landed article; it does not add a
ship**. Charter basis (RESEARCH.md, quality-gate paragraph, verbatim): "Donor swaps,
binder discharges, certified numerics and formalization-first layers are first-class
ENGINEERING deliverables — never discoveries; an upgraded theorem is revised to v2 in
one versioned article." Consequences for iteration-6 bookkeeping:

- shipped-articles count: unchanged (75 was already shipped; no new article);
- discovery-share KPI numerator/denominator: unchanged (the Δ is engineering
  deliverables — the dictionary, the ports, the discharges — never re-billed as
  discovery content);
- knowledge-level quota (N=1, spend-only-if-executed): untouched;
- the article's DISCOVERY-CONDITIONAL kind and its S4(b) discovery grade rest on the
  statement class, which the revision does NOT change (see (d)).

If the revision were mis-billed as new discovery content, it would violate the
charter's engineering-deliverable clause and inflate the KPI — the NOT-A-SHIP line
must appear in the §0 change log of the revision itself.

---

## (a) Delta vs the landed article (v2, 2026-11-17) — row map

### A.1 Rows that DO NOT change

| landed row | why unchanged |
|---|---|
| Thm A `zetaL_assembly_landed` | the engine; untouched by N2 (Pa.lean unchanged at d61eb048) |
| Thm B `zetaL_two_thirds_conditional` | the theorem statement and proof unchanged; only its §3.3 discharge ACCOUNTING moves (A.2) |
| Thms C/D/E/E′ (distinct tier) | N2 discharges nothing on the 5/6 arm: over ℚ the distinct form is not supplied by the donor (thmE_C₀'s 3/4 < the 5/6 slot) — limitation rows for the distinct tier stand verbatim |
| Donor row `Zeta23.ThmE.thmE_A₀` | unchanged (PROVED-UNCONDITIONAL — at donor pin); its ROLE grows (it is now consumed by name through ThmEDyadic, see B.1) |
| Quadratic instance row (42 v2 Thm 1) | unchanged; optional supersession NOTE per landed §3.3's own rule ("on-pin consumers … gain supersession rows, not edits") once 42 revisits — not this revision's business |

### A.2 Rows/blocks that CHANGE

1. **§0 change log** — gains the v3 entry (this delta, dated at splice).
2. **Abstract** — one sentence changes: landed v2 says "named glue remains before ζ_L
   itself is unconditional at ℚ" (abstract) and §3.3 "(i)–(ii) … This is the article's
   carried completion, not a claim." — the glue (i)–(ii) IS NOW LANDED (dictionary +
   imprimitivity immunity = N2-a/P2-b; factorization-binder bridge = P1-M3/M3-c2 +
   P3-b). The abstract sentence must flip to the new accounting: the ℚ composition is
   proved down to the donor statement-binder, the two per-primitive classical binders,
   and the structural set. Keep ≤ 200 words (re-check at splice).
3. **§3.3 Discharge accounting** — the section's "What remains … (not proved here)"
   list is discharged except the DZDF statement-binder itself; rewrite as the two-tier
   N2 ledger (which inputs are theorems, which are named binders — mirrors (b) below).
4. **§6 Formal record** — gains the new rows of B (below) + their per-theorem
   verification blocks (R3 §5 format) + the N3 audit paragraph (c).
5. **§7 Limitations** — row 2 ("the unconditional-at-ℚ theorem is not proved here")
   rewrites to the narrower honest remainder: the DZDF statement-binder (G1-permanent,
   billed as donor consumption), per-primitive ThmEDyadic/CountsUnbounded binders,
   hfinζ/hntopζ structural; row 6 (window finiteness assumed) narrows: the Dirichlet
   component side is now discharged on-pin (`windowFinite_LFunction`, run 26); the
   ζ-side stays. Rows 1/3/4/5/7/8 stand.
6. **§9 self-audit** — re-run at splice (rule 3, 7, 10 touched; see (d)).

### A.3 The theorems that JOIN (the N2 stack — none existed at v2)

| # | joining theorem | file (sha16) | role in the article |
|---|---|---|---|
| J1 | the ℚ dictionary: `hasQDirichletDictionary` (+ `heckeTsum_eq_ratCharOf_LFunction`, `ratCharOf_eq_one_iff`, `chi_span_residue` core) | `N2-P1.lean` 396d8710 | discharges landed §3.3's glue (i) — the dictionary + L-series identification (N2-a) |
| J2 | `identity_theorem_extension` + `factorization_identity_extension` | `N2-P1.lean` 396d8710 | the half-plane → ℂ∖{1} identity transport; the hAbFacQ bridge shape |
| J3 | `dirichletFactorizationTransfer` | `N2-P1.lean` 396d8710 | the DZDF→Dirichlet-family transfer (corrected shape, the hnp FIND — landed record) |
| J4 | `windowFinite_LFunction` (P2-a) | `N2-P1.lean` 396d8710 | the component window-finiteness input — discharged for every nontrivial Dirichlet component |
| J5 | `lFunction_not_eventually_zero` + `eulerStripImmunity_changeLevel` (P2-b) | `N2-P1.lean` 396d8710 | the imprimitivity immunity — landed §3.3's "imprimitive L differs from its primitive associate by finitely many Euler factors whose zeros lie on Re s = 0" — now PROVED, not narrated |
| J6 | `thmE_dyadic_to_cumulative` + the count/window/chain infrastructure (P2-c core) | `N2-P2c.lean` 2cca447d | the donor dyadic distinct-numerator bound → cumulative with-multiplicity EpsLowerCum (the two convention deltas of landed §3.3 — distinct→with-mult a fortiori, dyadic→cumulative block-sum — now formalized) |
| J7 | `epsLowerCum_of_thmE` + `componentEpsCum_of_thmE` (P2-d) | `N2-P2d.lean` 4f978b44 | the imprimitive hEχ composition over the pin's primitive-associate API — the hEχ premise dischargeable for ANY nontrivial family |
| J8 | `zetaColumn_of_V2` + `epsLowerCum_zeta_of_V2d4` + glue (P3-d) | `N2-P3V2.lean` 2613cfd2 | the ζ-column discharge from `ZetaZeros.simple_proportion_d4` (0.6725) on the V2-import substrate |
| J9 | **`zetaL_two_thirds_landed_of_DZDF`** (P3-e — the composed N2-d card) | `N2-P3e.lean` 6f6beb20 | the headline new row: the composed statement as a theorem (conditional on the named inventory) |
| J10 | **`zetaL_two_thirds_landed_ℚ`** (the ℚ endpoint) | `N2-P3V2.lean` 2613cfd2 | the unconditional-in-the-composed-sense ζ-column endpoint (hfinζ/hntopζ only) |

Also joins as supporting casts (verify whether they ride §6 rows or §3.3 prose):
`multOf_supp_iff`/`count_eq_ncountL`/`n0star_le_countOn` (J6's count-identification
pillar), `abFacQ_of_factorization` + `analyticOrderAt_lFunction_ne_top` +
`windowFinite_family` (`N2-P3.lean` f9bd28c5 — P3-b/c/P2-a-payoff), and the two
one-application transfers (`epsLowerCum_transfer` V2-side / `_plain` N2-P3e-side).

---

## (b) Status-row drafts — closed four-string vocabulary, exact binder inventories

Vocabulary (TEMPLATE-iter4, closed): `PROVED-UNCONDITIONAL` / `PROVED-CONDITIONAL` /
`CERTIFIED-NUMERIC` / `PAPER-ONLY`; substrate qualifier "**at donor pin**" REQUIRED
where the evidence lives at a foreign pin. Drafts (status cell first string =
the closed string; binder lists verbatim-eligible):

### R1 (new headline row)
> `zetaL_two_thirds_landed_of_DZDF` (`N2-P3e.lean`; the card `ZetaLRatTwoThirdsOfDZDF` of `N2-P3.lean:206`) | **PROVED-CONDITIONAL** | binders: hnp (DZDF nonprincipality, ∀ i), hfac (the DZDF abelian-factorization statement on ℜs > 1 — **donor statement-binder, G1-permanent, billed as donor consumption**), hdic (∀ i, HasQDirichletDictionary — dischargeable on-pin per member by J1), hK/hL (analyticity off {1}), hntopK/hntopL, hfinK/hfinL/hfinζ (window finiteness), hEχcum (∀-candidate-family component proportions — dischargeable per member by J7 from ThmEDyadic + CountsUnbounded at ψ i's primitive associate), hccum/hconcum (fK↔ζ count identifications — rfl when fK is the ζ-side continuation), hζ (the ζ-column at 2/3 — dischargeable on the V2 substrate by J8, with hfinζ/hntopζ) | conclusion: EpsLowerCum ⟨multOf fL, hfinL⟩ (2/3) — uniform over every abelian L/ℚ presentation

Evidence cell: `pilots/75/logs/n2-p3e-run1.log` (both decls triad; wall 100s, OVER=0).

### R2 (the ℚ endpoint)
> `zetaL_two_thirds_landed_ℚ` (`N2-P3V2.lean`) | **PROVED-CONDITIONAL** | binders: hfinζ (window finiteness of the ζ zero data — classical structural), hntopζ (∀ ρ, analyticOrderAt riemannZeta ρ ≠ ⊤ — classical structural, the M4b/M2a posture) — **no DZDF/family/hEχ premises**; the donor endpoint `ZetaZeros.simple_proportion_d4` is consumed by import and re-printed triad in-log — **on the V2-import substrate (ZetaZerosV2 built tree; mathlib ff2494ea, Lean v4.36.0-rc2)** | evidence: `pilots/75/logs/n2-p3v2-run4.log` (6/6 prints triad + donor re-print)

Substrate-qualifier note: the V2 route is the article-42-v2 precedent (same mathlib
rev; donor import, not donor pin) — recommend the explicit qualifier above rather
than bare "at donor pin", and one gloss line in §2.

### R3–R5 (the hEχ arc — engineering rows)
> `windowFinite_LFunction` (P2-a, `N2-P1.lean`) | **PROVED-UNCONDITIONAL** | scope only (χ ≠ 1) | `n2-p1-run26.log`
> `eulerStripImmunity_changeLevel` (P2-b, idem) | **PROVED-UNCONDITIONAL** | scope only (M ∣ N, χ ≠ 1) | `n2-p1-run31.log` (verdict recovered 2026-11-20; header records the dead-fire recovery)
> `thmE_dyadic_to_cumulative` (P2-c, `N2-P2c.lean`) | **PROVED-CONDITIONAL** | binders: ThmEDyadic at χ (content = `Zeta23.ThmE.thmE_A₀`, PROVED-UNCONDITIONAL — at donor pin), CountsUnbounded χ (classical zero-infinitude, Titchmarsh §5.8/Davenport ch. 9) | `n2-p2c-run8.log` (11/11 triad)
> `epsLowerCum_of_thmE` / `componentEpsCum_of_thmE` (P2-d, `N2-P2d.lean`) | **PROVED-CONDITIONAL** | binders: ThmEDyadic at ψ.primitiveCharacter + CountsUnbounded at ψ.primitiveCharacter (both per member) | `n2-p2d-run2.log` (6/6 triad)

### R6–R7 (dictionary + bridges — context rows, may ride §3.3 prose instead of the table)
> `hasQDirichletDictionary` (N2-a, `N2-P1.lean`) | **PROVED-UNCONDITIONAL** | scope only (the ℚ ray-class character data) | `n2-p1-run19.log` — billing stays FORMALIZATION-novel glue (classical per Milne; the dossier's own words) — do NOT upgrade its grade in the revision
> `zetaColumn_of_V2` (P3-d, `N2-P3V2.lean`) | **PROVED-CONDITIONAL** | binders: hntopK, hccum/hconcum, hζ | same substrate qualifier as R2 | `n2-p3v2-run3.log`

### NOT-YET-STATED (one application, flagged honestly — decision point for the editor)
The final one-application composition — P3-e's card with hζ discharged by the V2
side and hccum/hconcum by rfl at fK := riemannZeta (the full "ℚ instance of the
composed card") — is NOT a stated theorem in the corpus. It is one `exact`-chain over
R1+R2 and can be added at splice time ONLY with a fresh verified run (never splice an
unverified row). Default recommendation: leave it out of v3; the two rows R1+R2 with
their binder ledgers already give the complete honest accounting.

---

## (c) Audit citations (the N3 closure)

- **Plain-side full-coverage axcheck** — `pilots/75/logs/axcheck-n3-run1.log`: all six
  Ax-modules OK (Pa 170 / N2P0 32 / N2P1 92 / N2P3 12 / N2P2c 44 / N2-P3e 8 records);
  `axcheck_iter4.py scan` verdict: **358 records, 0 sorryAx, 0 errors; 350 × full
  triad, 4 × [propext], 4 × [propext, Quot.sound] — every record ⊆ the triad**. Stage
  generation: `axcheck_iter4.py gen --rewrite` sibling-import chain (the C2
  generalized pattern); forbidden-token gate 0 hits over 7 files; sources at the
  shas of the provenance header above.
- **V2-side full-coverage axcheck** — `pilots/75/logs/axcheck-n3v2-run1.log`:
  AxN2P3V2 OK — **48 axiom print lines, all exactly [propext, Classical.choice,
  Quot.sound], 0 sorryAx** (17-decl census + the file's own tail + the donor
  `ZetaZeros.simple_proportion_d4` re-print).
- **Per-theorem prints** (the §6 log:line cites): `n2-p1-run19.log` (P1 14/14),
  `n2-p1-run26.log` (P2-a 15/15), `n2-p1-run31.log` (P2-b 17/17), `n2-p3-run2/3.log`
  (P3-a cards; P3-b/c), `n2-p2c-run8.log` (P2-c 11/11), `n2-p3e-run1.log` (P3-e),
  `n2-p3v2-run3.log` (P3-d), `n2-p3v2-run4.log` (the ℚ endpoint),
  `n2-p2d-run2.log` (P2-d 6/6).
- **Sorry-token classifier**: every `sorry` grep hit across the 8 pilot-75 .lean
  files is header/prose (hygiene declarations and audit comments); zero proof-body
  tokens. Carried from v2: the zeta23 donor audit (`zeta23e-p0-run1.log`, five-of-five
  chain triad, 0 sorryAx) — unchanged.
- ALL runs: SPEC cpu=2.0/mem=4096, LEAN_NUM_THREADS=2, telemetry persisted in-log;
  the V2 build-phase OVER-cpu samples carry the m4b2/G2 authorized-subprocess
  disposition in their headers.

---

## (d) S1–S4 applied prospectively — where the revision could bite

- **S1 (statement novelty).** UNCHANGED BY CONSTRUCTION: the revision adds no new
  mathematical statement class — the composed N2-d statement is the article's own
  carried completion (landed §3.3 "(not proved here)" list), now with PROVED status
  rows. BITE RISK: any sentence drift toward "first unconditional" — that is a NEW
  claim requiring a fresh novelty survey. Keep the landed scoped sentence ("first
  among the corpora surveyed … first zero-proportion statements for ζ_L outside the
  quadratic case") verbatim; the upgrade is depth, not breadth.
- **S2 (essential multi-corpus bridge).** Strengthens passively: DZDF statement ×
  zeta23 × ZetaZerosV2 × mathlib × the in-repo stack are now connected by verified
  consumption chains (not just quoted). No risk.
- **S3.** Unchanged (no corpus subset produces N2-d; the dictionary/ports carry the
  real decisions — the c-trick, the count identifications, the immunity transport).
- **S4(b) — two-tier conditionality titling (the 75 precedent, the main gate).** The
  landed grade rests on "titled and abstracted as conditional — the schema is the
  discovery" (R2's ruling, quoted in `r2-discovery-strength.md` §4). POST-REVISION
  THE CONDITIONALITY IS UNCHANGED IN KIND: the composed row keeps the DZDF
  statement-binder (G1-permanent) + per-primitive binders; the ℚ endpoint keeps
  hfinζ/hntopζ. The title "… Two Tiers, Conditional on Component Proportions"
  REMAINS ACCURATE and should NOT change. BITE RISKS, concrete: (i) removing
  "Conditional on Component Proportions" from the title because components are
  "discharged" — they are discharged ONLY at the donor pin + classical binders;
  (ii) letting "unconditional-at-ℚ" (a workbench phrase meaning
  no-DZDF/family-premises) leak into title/status cells — the closed-vocabulary row
  for R2 is PROVED-CONDITIONAL(hfinζ, hntopζ); (iii) the word "landed" inside
  DECLARATION names (`zetaL_two_thirds_landed_of_DZDF`,
  `zetaL_two_thirds_landed_ℚ`) is fine in the Lean-declaration column (v2 precedent:
  `zetaL_assembly_landed`) but banned in status cells and prose titles.
- **Template §9 rules touched:** rule 3 (status rows — new rows must carry complete
  binder lists, (b) above is the draft), rule 7 (§3.3/§7/abstract must agree on the
  new remainder — rewrite all three together), rule 10 (citations — every new
  log:line cite re-verified at splice against the worktree logs; the record chain
  `pilots/75/N2-P1-record.md` §ledger is the index), rule 11 (README row 75 gains the
  counts line in the same commit — H's checklist).
- **Two-strike/KPI:** see (e) — the revision is engineering-delivery content inside a
  shipped discovery-grade article; no KPI motion.

---

## Decision block (one read)

RECOMMEND: EXECUTE the revision at iteration-6 open (the charter's revise-in-place
rule, second application; file-internal version v3): flip the §3.3/abstract
accounting sentence, join rows R1–R7 (J-list), add the (c) audit paragraph, narrow
§7 rows 2/6, re-run §9. Do NOT: change title/kind, add the NOT-YET-STATED final
composition without a fresh verified run, re-grade the dictionary, or let
"unconditional" language escape the R2 binder ledger. Alternative if the editor wants
zero article churn: bank this dossier and defer to iteration-7 — the evidence is
sha-pinned and does not rot.

— end dossier (R6 unit 12, 2026-11-20; planning-only, no fires; H-items at splice:
INDEX row for this file + the article commit's exact-file batch).
