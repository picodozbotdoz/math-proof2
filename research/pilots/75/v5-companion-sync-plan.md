# The companion-sync rule + the intro-75 v5-sync patch plan (PREP ONLY)

*Lane R6 (worktree agent-06; intro-batch-A owner + the 75 arc), 2026-11-21 @ main
`7307e0c`. Companion to `pilots/75/v5-revision-plan.md` (`77b0d2eb`) — the same
execute-or-bank trigger and the same timeline guard apply verbatim. Three parts:
(1) the standing companion-sync rule (a registry-README preamble addendum DRAFT,
routed via the orchestrator for R7's file — this lane does NOT edit
`articles/introduction/README.md`); (2) the intro-75 v5-sync patch plan, line-level;
(3) the corpus-wide companion-drift audit at `7307e0c` (one verdict per stem).*

## 1. The standing rule — registry-README preamble addendum DRAFT (for R7 via the orchestrator)

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

Routing note: fold into `articles/introduction/README.md`'s preamble after the
standing-policy line; one INDEX-touching commit; the 17 current rows are in sync at
`7307e0c` (§3 below), so no retroactive stamps are needed at adoption.

## 2. The intro-75 v5-sync patch plan (line-level; executes on the v5 GREEN, in the v5 apply's landing family)

Base: `articles/introduction/75-abelian-assembly-zetaL-proportions.md` @ the verified
batch-A state (220 lines / 182 nonblank; sha at landing `f586b47`). Every patch below
maps 1:1 to the v5 plan's E-blocks; nothing else in the companion changes.

| v5 E-block | companion patch | the edit |
|---|---|---|
| E1 (byline v5) | header line 10 | "Written 2026-11-21 against the article's committed state (v4)." → "…(v5)." — the sync witness per the §1 rule |
| E3 (Thm U row) | §5, insert one bullet after the Thm B″ bullet | **Theorem U (the uniform ℚ-tower composition, `zetaL_two_thirds_uniform_of_thmE`).** For every abelian L/ℚ: at least (2/3 − ε) of ζ_L's zeros up to T, with multiplicity, lie on the line — the ONE composed statement, conditional on the DZDF statement-binder trio (quoted, never imported), the classical structural set, the ζ-column binder, and the two per-primitive binders hUnbF (classical unboundedness of counts) and hEF (the zeta23 donor endpoint, proved at its own pin). PROVED-CONDITIONAL. → article §3.3, Thm U |
| E3 (Thm U′ row) | §5, insert one bullet after Thm U | **Theorem U′ (`zetaL_two_thirds_uniform_ℚ`, the ζ column grounded).** The same composed statement with the ζ-column binder removed — discharged by the imported, kernel-verified ZetaZerosV2 endpoint on the V2-import substrate; the degenerate no-family instance recovers Theorem B″. PROVED-CONDITIONAL. → article §3.3, Thm U′ |
| E6 (§7 item-2 resolution) | §5's "What is *not* here" bullet | DELETE the first clause ("the composed one-application theorem over ℚ (B′ instantiated at ζ_K := ζ) — proved up to its named binders, one proof step away, not stated pending a fresh verified run (article §3.3, §7 item 2)") — the bullet retains its remaining content (the Hecke-at-general-base open core; §7 item 1) |
| E2 (artifact line) | §8 router, "Verification" line | append: `pilots/75/N2-P4.lean`, `N2-P4V2.lean` and the fire log (name at fire) after the existing `{Pa,Pb}.lean` cite |
| E3 binder vocabulary | §6 glossary, two rows | `hUnbF, hEF` — the two per-primitive binders of Thm U (classical count-unboundedness; the zeta23 donor endpoint) — example "Thm U's inputs"; `Thm U, U′` — the uniform composition pair — example "the one composed statement". (Keeps the ≤3-live-undefined-symbols rule of the spec.) |
| E7 (abstract re-count, IF triggered) | none | the companion has no abstract; its length discipline is the spec's ≤220-nonblank cap — the patches above move 182 → ≈194 nonblank, inside the cap; NO other trim needed |
| — (unchanged, state explicitly) | §1–§4, §7, §9, the marker, the §3 provenance line | no change: the worked example is substrate-independent; §4's donor paragraph already describes both consumed routes (the ThmE donor column + the V2-import ζ endpoint); the not-GRH bullet stays true; no numbers change |

**Execute-or-bank:** identical to the v5 plan §4 — GREEN pre-close ⇒ this patch rides
the v5 apply's landing family (same H batch, one commit family); close-first ⇒ the
patch banks with the chain (the companion stays v4-consistent, which remains TRUE at
the iter-6 close since the article is also v4 there; no stale stamp is needed for a
banked-before-execution sync — the stamp discipline bites only when the ARTICLE moves
and the companion does not follow in-family).

## 3. Companion-drift audit at `7307e0c` (one verdict per stem)

Method: `git log f586b47..HEAD -- research/articles/<stem>.md` (f586b47 = the last
companion landing) + content check of every hit against the companion's claims.

| stem | article edits since the companion landings | verdict |
|---|---|---|
| 01, 10, 11, 20, 22, 30, 41, 41H, 42, 50, 52, 71, 78 | none | **IN SYNC** (no article bytes moved) |
| 32 | `5238e44` (R1 integrity: Thm 5's discharged-binder note `IsCrossing ε c*` dischargeable by Thm 6; Thm 4 line ref :303→:342) | **IN SYNC** — the companion's Thm 5 bullet already reads "PROVED-UNCONDITIONAL (as a conditional statement; its crossing hypothesis is discharged by Theorem 6 on the whole range (0, ε*))" and cites no line numbers; no contradiction |
| 41H3 | `5238e44` (sha-reference update only: H3-M-candidates `7647a1f9`→`8d211d4c`, three spots) | **IN SYNC** — the companion cites `H3.lean`/`h3-s-run1.log`/`presolve/`, never the H3-M-candidates sha |
| 72 | `bbda51d` (the §4 entropy corroboration line scoped: tauceti `renyiEntropy:120` = different object class) — landed BEFORE the batch-B companion apply | **IN SYNC** — the companion carries no tauceti-corroboration echo (grep clean) |
| **75** | none yet — **PENDING v5** | **DRIFT-PENDING** — the only pending article revision in the tree; §2 above is its sync; on NOT-GREEN or bank, the companion needs nothing (article stays v4) |

Corroboration: the helper close-evidence sweep (`1c10bc4`) passed 31/31 artifacts; the
close instruments (RESEARCH.md close-out, REPORT §I6, quota stamps, README row tails)
do not touch article stems beyond the 75-v5 chain — **no other companion drift exists
or is pending at `7307e0c`**, and the referee set's 17 revisions were fully absorbed
by the verified pass (14 PASS + 7 fixes landed `9cadcbe`/`f586b47`).

— lane R6, 2026-11-21. PREP ONLY: no companion edited, no README edited (rule routed
via the orchestrator); INDEX row for this file rides H's landing with the v5 chain.
