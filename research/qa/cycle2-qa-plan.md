# QA plan — Cycle 2 (pre-registered 2026-11-13, lane H)

Pre-registered BEFORE Cycle-2 artifacts land, to avoid post-hoc sampling bias. Modeled on the
main-run `qa/*-spotcheck.md` discipline: sampled claims checked against sources with exact
commands; every item records **Claim / Checked (command) / Evidence (file:line) / Verdict**;
scale **OK / MINOR-ERROR / WRONG** (MINOR = locator/cosmetic, substance holds; WRONG = the
claimed fact is false as stated). Results are appended to this file as **Parts 1..N** as
artifacts land. **No pass executes before this plan is committed** (commit at the next batch,
even if no artifact has landed yet). Watch-level disk signals (e.g. an uncommitted green run
log) are NOT QA evidence — only landed artifacts + their own claims are checked.

Roots (read-only): `AX = /home/doz/zcode-workdir/axiommath` (`DedekindZetaZeroFree`,
`ZetaZerosV2`, `ZetaZeros`, `PrimeNumberTheoremAnd`, `Weil`, `AreaLaw2D`); mathlib =
`/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4`; tauceti, openai-math, anthropics as in
the main-run spot-checks. Index: `qa/decl-index-v2.tsv` (corpus ⟶ file ⟶ kind ⟶ name; labels
`axiommath-{dzzf,vendor-cft,zetazeros-v2,zetazeros,pnt,weil,arealaw2d}` + the six main-run
labels).

## (a) Sampling quotas per artifact

| # | Artifact (owner) | Quota | Mandatory mix |
|---|---|---|---|
| Q1 | `survey/axiommath.md` (A1) | 12 claims | ≥2 per repo (all six); ≥4 **axiom-hygiene** claims — `#print axioms` / `native_decide` / sorry findings verified directly in the donor repos, not against the survey's own text |
| Q2 | `bridges/function-field.md` (A2) | 10 claims | ≥5 file:line citations into `axiommath/` sources (Weil / ZetaZerosV2 / dzzf trees); ≥2 literature nearest-misses verified via the cited sources |
| Q3 | `bridges/area-law.md` (A4) | 10 claims | ≥5 file:line citations into `axiommath/AreaLaw2D` or the openai family-265 sources; ≥2 literature nearest-misses verified via the cited sources |
| Q4 | `novelty/axiommath-as-donor.md` (A3) | 10 claims | **every** DISCHARGES/PARTIAL verdict re-checked: donor decl exists with the claimed shape (direct-source), AND the consumer binder matches what the pilot actually assumes |
| Q5 | dossiers 70–74 (A9), each | 8 claims | ≥3 novelty-side grep-evidence checks (re-run the dossier's own absence searches); ≥2 statement-precision checks against donor/pilot sources |
| Q6 | pilot artifacts: 10-L1/L2, 52, 20 close-out, 50-M3, 42-M4 | all final logs | log-vs-claim consistency: provenance headers present on every log; `#print axioms` output matches the claimed verdict; **zero `sorryAx` anywhere**; logs persisted under `pilots/*/logs/` (never /tmp-only) |

## (b) Recipe commands

Reusing the v2 index (`TSV=research/qa/decl-index-v2.tsv`; run from repo root):

    # exact-name presence, corpus-wide (novelty absence check)
    cut -f4 "$TSV" | grep -xF 'DeclName'
    # substring / name-family
    cut -f4 "$TSV" | grep -F  'DeclName'
    # which corpora carry the name — the namespace-vendoring check, run before ANY "corpus X has Y" claim
    awk -F'\t' '$4=="DeclName"{print $1}' "$TSV" | sort | uniq -c
    # name anywhere under an axiommath label?
    awk -F'\t' '$1 ~ /^axiommath-/ && $4=="DeclName"' "$TSV"
    # one repo's own-tree rows (then direct-source the file)
    awk -F'\t' '$1=="axiommath-weil"' "$TSV" | head

Direct-source checks (the TSV is an index, never evidence of provability):

    rg -n "^(theorem|lemma|def|abbrev) +DeclName" $AX/Weil -g '*.lean'
    sed -n 'START,ENDp' PATH/FILE.lean          # verify quoted line ranges exactly
    rg -n "sorry|native_decide" $AX/<Repo> -g '*.lean'          # hygiene sweep
    rg -n "#print axioms" $AX/<Repo> pilots/<NN>/ -g '*.lean'   # axiom-report sites

Caveats — v1 caveats carry over (ASCII names only; `noncomputable def`/`private theorem`
prefixed headers and anonymous `instance :` rows missed; openai-math vendors mathlib-like
trees, so a TSV miss is NOT evidence of absence in openai-math — also `rg` directly in
`openai-math/lean/OAI/`, `openai-math/lean/ComparatorChallenges/`, `openai-math/preprints/`;
preprints are never indexed), PLUS the Cycle-2 caveats (from the v2 script header):

- **AxiomMath repos re-export mathlib/TauCeti content. A TSV hit in an axiommath tree is NOT
  evidence the repo proves it** — check the file's own namespace and imports before any
  originality claim. Same-name rows under several labels (or axiommath + mathlib) are expected
  and harmless for novelty: absence still implies absence everywhere (conservative direction);
  presence needs namespace disambiguation.
- `axiommath-dzzf` excludes `vendor/**` (the class-field-theory tree is indexed separately as
  `axiommath-vendor-cft`, 1,658 files — do not credit dzzf with vendor content); dzzf also
  carries re-namespaced TauCeti source (`DedekindZetaZeroFree.TauCeti`, `…LargeSieve.Vendor`)
  — tauceti content appears twice in the index.
- `axiommath-zetazeros-v2` contains a divergent fork of the ZetaZeros tree (same file names)
  plus ported PNT+ modules on its path — ZetaZeros names appear under both labels.
- `axiommath-pnt` embeds an `IEANTN/` subtree and local `Mathlib/` overrides.
- `axiommath-arealaw2d` vendors openai-math-derived statements under `OpenAI/`.

## (c) Execution trigger table

| Pass | Trigger (artifact landing) | Execute | Quota |
|---|---|---|---|
| P1 | `survey/axiommath.md` | survey spot-check | Q1 |
| P2 | `bridges/function-field.md` | bridge spot-check | Q2 |
| P3 | `bridges/area-law.md` | bridge spot-check | Q3 |
| P4 | `novelty/axiommath-as-donor.md` | donor-verdict re-check | Q4 |
| P5a–P5e | each of `candidates/7{0..4}-*.md` | dossier spot-check | Q5 (8 each) |
| P6a | pilot-10 L1 final state (A6) | log-vs-claim audit | Q6 |
| P6b | pilot-10 L2 final state (A6) | log-vs-claim audit | Q6 |
| P6c | pilot-52 fix-or-close verdict + final logs (A8) | log-vs-claim audit | Q6 |
| P6d | pilot-20 close-out evidence (A8) | log-vs-claim audit (incl. rescued M1 record) | Q6 |
| P6e | 50-M3 (if GO after A3/A7) | log-vs-claim audit | Q6 |
| P6f | 42-M4 (if GO after A3/A7) | log-vs-claim audit | Q6 |

Rules: H executes each pass as its trigger lands (poll + orchestrator relays); results append
below as Parts 1..N with date + tally line up front, one Part per pass; no pass runs before
this plan's commit. Verdicts route to the orchestrator (and STATUS via the relay); fixes
follow the main-run convention — H applies authorized errata only on H-maintained files,
researcher files are fixed by their owning lane. A WRONG verdict on a load-bearing claim
blocks the artifact's TRIAGE/REPORT cell until resolved.
