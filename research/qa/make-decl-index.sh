#!/usr/bin/env bash
#
# make-decl-index.sh — cross-corpus Lean declaration index (Phase-3 novelty substrate).
#
# rg-scans declaration headers over six corpus roots and emits, next to this script:
#   decl-index.tsv : TSV  corpus <TAB> file <TAB> kind <TAB> name
#   (file is relative to the corpus root; rows LC_ALL=C-sorted, duplicate rows removed)
#
# Usage:
#   bash research/qa/make-decl-index.sh        # rebuild decl-index.tsv (~seconds)
#
# Novelty check for a candidate declaration NAME (Phase-3 dossiers, TEMPLATE.md):
#   cut -f4 research/qa/decl-index.tsv | grep -xF 'NAME'   # exact-name hit?
#   cut -f4 research/qa/decl-index.tsv | grep -F  'NAME'   # substring/name family
#   cut -f1 research/qa/decl-index.tsv | sort | uniq -c    # per-corpus coverage
# A miss is only weak evidence of absence — see caveats.
#
# Caveats (deliberate spec limits — for high-stakes checks rg the corpora directly):
# - ASCII names only: Greek/unicode decl names (e.g. `ε_T`, `ψ`) are NOT captured.
# - Anchored pattern: prefixed headers (`noncomputable def`, `private theorem`,
#   `protected lemma`, `partial def`, `unsafe def`, `local instance`) are NOT captured.
#   Direct fallback:
#     rg -n -w 'NAME' <roots>   # or
#     rg -n "^(noncomputable |private |protected |partial |unsafe )*(def|theorem|lemma|abbrev|instance) +NAME\b" <roots>
# - Anonymous `instance :` (no explicit name) is not captured.
# - openai-math/OAI is a single large library that includes mathlib-like trees
#   (OAI/Algebra, OAI/Analysis, …), so its rows overlap mathlib content heavily;
#   same-name hits in both corpora are expected and harmless (conservative for
#   novelty: absence still implies absence everywhere).
# - Sibling repos are read-only; this script only reads them. No builds; re-runnable.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$SCRIPT_DIR/decl-index.tsv"

PAT="^(theorem|lemma|def|abbrev|instance|class|structure|inductive|axiom)\s+([A-Za-z_][A-Za-z0-9_!?']*)"

CORPORA=(
  "mathlib|/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4/Mathlib"
  "tauceti|/home/doz/zcode-workdir/tauceti/TauCeti"
  "3sum-apsp|/home/doz/zcode-workdir/anthropics_formal-math/3sum-apsp"
  "eth|/home/doz/zcode-workdir/anthropics_formal-math/eth"
  "zeta23|/home/doz/zcode-workdir/anthropics_formal-math/zeta23"
  "openai-math|/home/doz/zcode-workdir/openai-math/lean"
)

TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

for entry in "${CORPORA[@]}"; do
  corpus="${entry%%|*}"
  root="${entry#*|}"
  if [[ ! -d "$root" ]]; then
    echo "WARN: root missing for '$corpus': $root (skipped)" >&2
    continue
  fi
  (
    cd "$root"
    rg -o --no-heading -N -g '*.lean' -r '$1 $2' "$PAT" . || true
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
