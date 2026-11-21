# r9-claimsregister-iter6-close-prestage — paste-ready register/verdicts rows for the iter-6 close

Lane R9 (worktree agent-09), 2026-11-21, at main `b19b3ee`. **PRE-STAGE ONLY** — the
close adds corpus content and the CLAIMS-REGISTER/VERDICTS folds happen at H's close
INDEX pass; this note carries the rows PASTE-READY (one writer per file respected — no
live file edited here). Every sha below verified at `b19b3ee` this session. Fire-gated
cells are `[PENDING-CLOSE]` and fill from the close instruments only.

## 1. CLAIMS-REGISTER rows (paste into the register's next cycle block at the close)

| # | Claim sentence | Verdict | Prior art to cite | Status |
|---|---|---|---|---|
| H4-E1 | We prove the d = 8 uniform-diagonal monomial-host no-go (the E1 band extension of the shipped 41H3 negative): no uniform-diagonal monomial host at d = 8 realizes the prescribed sign/Gram table — 11/11 theorems print-verified, the no-go pair `[propext, Quot.sound]` (leaner than triad), the four fiber finals + the zero-free pair triad, the nonRankOne witnesses and the F pullback `[propext]`. **ENGINEERING-BILLED by landing ruling: the hunt's floor rung, never standalone — the discovery payload stays the E2/F two-sided resolution (banked iter-7 behind the constraint-propagation pre-solve, charter GO `cda679ec`).** | round7-h3-battery §§1–2 + the bib cards C.6/C.7; R2's gate `r2-41h4-s1s4-gate.md` S4(iii) | Morin–Duchesne–Rasmussen–Ruelle arXiv:1409.3416 (dim-8 host, loop 0); Chernyak–Gainutdinov–Jacobsen–Saleur arXiv:2212.09696 (tr(K·) caveat in-card); Avan 1306.2927; the 41H3 battery class rows (carried) | **[PENDING-CLOSE: the G2 H4 stage + G5 drift treatment]** — evidence: `pilots/41/H4.lean` `768c6f5d6e777d25`, `H4-record.md` `95a882eb45f64ace`, logs `h4-run{1,2,3}.log` `9e216ee1`/`979a4886`/`e53b17fe`, precharter `b0eb56b94c3419c7`, presolve-charter `cda679eca1d7fd76` |
| N2-P4 | (Fire-gated row — activates only on a GREEN P4 fire before the close.) We prove the uniform-composition endpoint of the N2 line (P4): the P4-a uniform card over the canonical chain (DZDF trio + structural set + per-primitive hUnbF/hEF + hζ) and the P4-b hζ-free shape (hntopζ in B″'s ∀ρ form), discharging B′ + P2-d + the V2 substrate with rfl specializations — the every-abelian-L/ℚ uniform proportion endpoint composed from the article-75 v3/v4 realized base. | the census v3 correction stanza (seed-1 provenance: P2-b/P2-c/P3-d/N3 GREEN 2026-11-20 R6 units 9–11; article-75 v3/v4 revise-in-place); prep `candidates/iter6-seed1-n2-uniform-p4-prep.md` `22e40ab5` | DLRT 1908.04876 (scoped, per article-75's revised row); Lamzouri/ZetaZerosV2 ζ-only endpoints; Knausgård; Bansal–Maji; article-42/75 stack (the composition base) | **[PENDING-CLOSE: the P4 fire — grant-gated, NOT yet fired at `b19b3ee`; run1 = statement elaboration only (`n2-p4-run1.log`: the P4-a binder inventory + P4-b shape well-formed at pin; "statement elaboration never certifies provability — the fire does")].** If the fire lands GREEN pre-close: status PROVED-CONDITIONAL per the binder inventory; if not: the row ships as the parked-statement record (elaboration-verified, unfired). Evidence: `pilots/75/N2-P4.lean` `2210fe6e01f1e095`, `run_n2p4.py` `9ef2838da51d3bd4` |

**Non-row (INDEX only, deliberately NOT a register row):** the pilot-40 probe family
(`pilots/40/XiKPrime-stmt-probe.lean` `a0da3f42877ce404` fired-bytes `033b96a1ffc82d76`;
6 logs with provenance headers; runner pair) — an elaboration verdict, never a proof
claim (probe convention; the file's own header pre-registers the expected sorry count).
Its register-adjacent surface lives entirely in the precharter
`candidates/xi-k-prime-precharter.md` `78c344278ba7708b` (GO recorded `60bebc8`); the
close INDEX pass should row the FILE FAMILY, not mint a claim.

## 2. VERDICTS.md cross-refs (paste into the next addendum block at the close)

- **H4 (Cycle-3 row):** the E2/F two-sided posture — at battery level NEW-SUPPORTED
  (round7-h3-battery §§1–2 re-affirmed by E1's landing: the class rows stay EMPTY, now
  with the d=8 uniform-diagonal band CLOSED in the kernel); nearest misses unchanged
  (Morin–Duchesne 1409.3416 + the bib-card C.6 caveat; Chernyak et al 2212.09696 C.7;
  Avan 1306.2927; the XXZ/two-boundary genre). Risk tier: **WARM→GO** (the pre-solve
  charter `cda679ec` is the gate instrument; E1's engineering billing and the
  "discovery payload stays E2/F" line are the billing contract). Re-scope line: the
  iter-7 resumption is pre-solve-first by charter (no blind kernel fires; R2's S4(iii)
  endorsement binding).
- **N2-P4 (amends the row-75 lineage):** the uniform composition is the P4 endpoint
  family over the v3/v4-realized base — the register's row-75 scope sentence ("first
  zero-proportion … for ζ_L, every abelian extension") now carries the executed
  chain (P2-b/P2-c/P3-d/N3 GREEN; the census v3 correction stanza is the provenance
  record) with P4 as the uniform remainder: **[PENDING-CLOSE: the P4 fire verdict]**.
  Must-cite set unchanged (DLRT scoped; the ζ-only endpoints; the in-project 42/75
  stack as composition base).
- **Register hygiene cross-note (paste with whichever row activates):** the iter-6 close
  corpus additions are H4.lean + (conditionally) N2-P4.lean + the pilot-40 probe family;
  the decl-index-v3 corpus set is UNCHANGED (no new Lean corpus landed — the index's 13
  labels stand; no rebuild trigger at close per the 2026-11-21 status run).

## 3. What H folds at the close INDEX pass (checklist form)

1. The H4-E1 register row (§1) — after the G2/G5 close-gate cells fill.
2. The N2-P4 row — IFF the P4 fire lands GREEN pre-close; else the parked-statement
   wording (§1's bracketed alternative) rows the elaboration state without a claim.
3. The VERDICTS cross-refs (§2) — same conditioning.
4. The INDEX rows for the pilot-40 family (already partially rowed at `60bebc8`) —
   no register minting (§1's non-row).

— lane R9 (worktree agent-09), 2026-11-21. PRE-STAGE ONLY; no live-file edits; no
fires; no commits (H lands). All shas verified at `b19b3ee` this session.
