#!/usr/bin/env bash
#
# make-decl-index-v2.sh — cross-corpus declaration index, Cycle-2 edition (v2).
#
# Extends make-decl-index.sh (DO NOT edit the original; this is the Cycle-2 variant)
# with the six AxiomMath sibling repos under /home/doz/zcode-workdir/axiommath/
# (DedekindZetaZeroFree, ZetaZerosV2, ZetaZeros, PrimeNumberTheoremAnd, Weil,
# AreaLaw2D) + the class-field-theory tree vendored inside DedekindZetaZeroFree.
# Emits, next to this script:
#   decl-index-v2.tsv : TSV  corpus <TAB> file <TAB> kind <TAB> name
#   (file relative to the corpus root; rows LC_ALL=C-sorted, duplicate rows removed)
#
# Usage:
#   bash research/qa/make-decl-index-v2.sh      # rebuild decl-index-v2.tsv (~10s)
#
# Novelty-check recipes: identical to the v1 header —
#   cut -f4 research/qa/decl-index-v2.tsv | grep -xF 'NAME'   # exact-name hit?
#   cut -f4 research/qa/decl-index-v2.tsv | grep -F  'NAME'   # substring family
#   cut -f1 research/qa/decl-index-v2.tsv | sort | uniq -c    # per-corpus coverage
# A miss is only weak evidence of absence — see caveats.
#
# Caveats — ALL v1 caveats carry over (ASCII names only; anchored pattern misses
# prefixed headers `noncomputable def`/`private theorem`/…; anonymous `instance :`
# not captured; openai-math/OAI vendors mathlib-like trees so a TSV miss is NOT
# evidence of absence in openai-math — always also run targeted rg in
# `openai-math/lean/OAI/`, `openai-math/lean/ComparatorChallenges/`, and
# `openai-math/preprints/`), PLUS these Cycle-2 caveats:
#
# - AXIOMMATH REPOS DEPEND ON MATHLIB AND EACH OTHER. Each repo's own-tree rows
#   are NOT pure "new content": distinguish a repo's own theorems from re-exports
#   / re-namespaced ports of dependencies before claiming a name is
#   axiommath-original. Same-name rows under several axiommath labels (or under
#   axiommath + mathlib) are expected and harmless for novelty (conservative:
#   absence still implies absence everywhere).
# - DedekindZetaZeroFree (axiommath-dzzf) DEPENDS ON TAUCETI: parts of TauCeti's
#   source are copied/re-namespaced inside its own tree (e.g. namespace
#   `DedekindZetaZeroFree.TauCeti`, `…LargeSieve.Vendor`) — so tauceti content
#   APPEARS TWICE in this index (once under `tauceti`, once under `axiommath-dzzf`).
# - DedekindZetaZeroFree also vendors the FiniteAbelianGlobalReciprocityv2 /
#   class-field-theory tree (1,658 .lean files). It is indexed SEPARATELY as
#   `axiommath-vendor-cft` so `axiommath-dzzf` counts stay honest; the dzzf scan
#   excludes vendor/**.
# - ZetaZerosV2 (axiommath-zetazeros-v2) carries a DIVERGENT FORK of the ZetaZeros
#   source tree under `ZetaZerosV2/ZetaZeros/` (same file names, many files
#   edited; plus new dirs Analytic/, Landau/) — so ZetaZeros names appear under
#   BOTH labels. Its manifest also pins PrimeNumberTheoremAnd; PNT+ content ported
#   onto its path shows up inside its own tree.
# - PrimeNumberTheoremAnd (axiommath-pnt) embeds an `IEANTN/` subtree (Kadiri,
#   BKLNW, CH2, eSHP, …) — Tao-IEANTN-derived content indexed as axiommath-pnt —
#   and local `Mathlib/` override files.
# - AreaLaw2D (axiommath-arealaw2d) is scanned at repo root: `AreaLaw/` (S01–S11),
#   `AreaLawForMathlib/`, `OpenAI/` (3D-cylinder audit of the openai family-265
#   statements) + Challenge/Comparator glue; it vendors openai-math-derived
#   statements under `OpenAI/`.
# - Sibling repos are read-only; this script only reads them. No builds; re-runnable.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$SCRIPT_DIR/decl-index-v2.tsv"

PAT="^(theorem|lemma|def|abbrev|instance|class|structure|inductive|axiom)\s+([A-Za-z_][A-Za-z0-9_!?']*)"

# corpus|root|optional rg exclude-glob (prefix '!', e.g. '!vendor/**')
CORPORA=(
  "mathlib|/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4/Mathlib|"
  "tauceti|/home/doz/zcode-workdir/tauceti/TauCeti|"
  "3sum-apsp|/home/doz/zcode-workdir/anthropics_formal-math/3sum-apsp|"
  "eth|/home/doz/zcode-workdir/anthropics_formal-math/eth|"
  "zeta23|/home/doz/zcode-workdir/anthropics_formal-math/zeta23|"
  "openai-math|/home/doz/zcode-workdir/openai-math/lean|"
  "axiommath-dzzf|/home/doz/zcode-workdir/axiommath/DedekindZetaZeroFree|!vendor/**"
  "axiommath-vendor-cft|/home/doz/zcode-workdir/axiommath/DedekindZetaZeroFree/vendor/class-field-theory|"
  "axiommath-zetazeros-v2|/home/doz/zcode-workdir/axiommath/ZetaZerosV2|"
  "axiommath-zetazeros|/home/doz/zcode-workdir/axiommath/ZetaZeros|"
  "axiommath-pnt|/home/doz/zcode-workdir/axiommath/PrimeNumberTheoremAnd|"
  "axiommath-weil|/home/doz/zcode-workdir/axiommath/Weil|"
  "axiommath-arealaw2d|/home/doz/zcode-workdir/axiommath/AreaLaw2D|"
)

TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

for entry in "${CORPORA[@]}"; do
  corpus="${entry%%|*}"
  rest="${entry#*|}"
  root="${rest%%|*}"
  excl="${rest#*|}"
  if [[ ! -d "$root" ]]; then
    echo "WARN: root missing for '$corpus': $root (skipped)" >&2
    continue
  fi
  rg_args=( -o --no-heading -N -g '*.lean' -r '$1 $2' )
  if [[ -n "$excl" ]]; then
    rg_args+=( -g "$excl" )
  fi
  (
    cd "$root"
    rg "${rg_args[@]}" "$PAT" . || true
  ) | awk -v c="$corpus" '{
      i = index($0, ":")
      if (i == 0) next
      path = substr($0, 1, i - 1)
      sub(/^\.\//, "", path)
      split(substr($0, i + 1), w, /[ \t]+/)
      if (w[2] != "") print c "\t" path "\t" w[1] "\t" w[2]
    }' >> "$TMP"
  echo "scanned $corpus" >&2
done

LC_ALL=C sort -u "$TMP" > "$OUT"

echo "--- decl counts by corpus:" >&2
cut -f1 "$OUT" | sort | uniq -c | sort -rn >&2
echo "total: $(wc -l < "$OUT") declarations -> $OUT" >&2
