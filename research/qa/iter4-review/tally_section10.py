#!/usr/bin/env python3
# tally_section10.py — [PENDING-TALLY]/[PENDING-N-TABLES] computation scaffold (A2, 2026-11-18)
# Parses research/qa/iter4-review/r3-verification-tables.md §10 (the A1-ONLY file — READ ONLY)
# and emits the close-block numbers. Assertion-heavy: FAILS LOUDLY on unknown verdict
# grammar or non-contiguous numbering; census phrases are strict-regex — sections without
# a recognized census are flagged NO-MACHINE-CENSUS for manual fold, never guessed.
# Usage: python3 -I tally_section10.py [path-to-r3-verification-tables.md]
#        (default: the MAIN tree copy, NOT the worktree's stale base)
import re, sys
from pathlib import Path

DEFAULT = Path("/home/doz/zcode-workdir/cross-math-fronttier/research/qa/iter4-review/r3-verification-tables.md")
src = Path(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT
text = src.read_text()
commit_note = "(main tree)" if src.resolve() == DEFAULT.resolve() else f"({src})"

# ---- split at the §10 live section; refuse if absent ----
m = re.search(r"^## 10\. Iteration-4 landings.*$", text, re.M)
if not m:
    sys.exit(f"TALLY-FAIL: '## 10.' section header not found in {src}")
body = text[m.start():]
# stop at the next '## ' level-2 heading if any (§10 is currently last, but stay safe)
m2 = re.search(r"^## (?!10\.)", body[m.end() - m.start():], re.M)
if m2:
    body = body[: m.end() - m.start() + m2.start()]

# ---- enumerate sections; assert contiguity 1..N ----
heads = [(mm.group(1), int(mm.group(2)), mm.group(0)) for mm in re.finditer(r"^### (10\.(\d+)) .*$", body, re.M)]
if not heads:
    sys.exit("TALLY-FAIL: no '### 10.N' subsections found")
nums = [int(h[1]) for h in heads]
if nums != list(range(1, len(nums) + 1)):
    sys.exit(f"TALLY-FAIL: §10 numbering not contiguous 1..N: {nums}")
N = len(nums)

# ---- verdict classification from heading grammar (ordered; first match wins) ----
# classes: green-triad | honest-partial | not-green-honest ; subclasses recorded for detail
def classify(heading):
    h = heading
    sub = []
    if "NOT-GREEN" in h:                  return "not-green-honest", sub
    if "M1 CHECKPOINT" in h:              return "honest-partial", sub + ["checkpoint: core GREEN-triad, closure pending"]
    if "PARTIAL GREEN" in h:              return "honest-partial", sub
    if "PROBE-CONVENTION" in h:           sub.append("probe-convention (Step-A only, never Step-B)")
    if re.search(r"print-gap closure|auditfix", h): sub.append("remediation row")
    if "donor-pin audit" in h:            sub.append("audit row")
    if "engineering" in h or "plumbing" in h: sub.append("engineering/plumbing billing")
    if "HARD STOP" in h:                  sub.append("hard-stop executed")
    if re.search(r"LANDED( GREEN)?\b", h):
        if "LANDED GREEN" not in h: sub.append('heading-variant "LANDED" (ledger FINAL-GREEN; spot-check at close)')
        return "green-triad", sub
    return None, sub  # unknown -> loud failure below

# ---- census extraction: ALL strict N/N+keyword matches per section; a section whose
# span contains cross-references to OTHER sections' censuses (e.g. §10.22's recap
# block quoting 89/89, 10/10, 15/15, 3/3) flags MULTI-CENSUS for manual pick — never
# silently first-matched ----
CENSUS = re.compile(r"(\d+)\s*/\s*(\d+)\s+(?:census decls|direct prints|direct triad|decls triad|public triad|decls|triad|printed|public theorems|theorems)")

rows, counts = [], {"green-triad": 0, "honest-partial": 0, "not-green-honest": 0}
unknown = []
for tag, num, full in heads:
    # section body span
    starts = [mm.end() for mm in re.finditer(r"^### 10\.\d+ .*$", body, re.M)]
    idx = nums.index(num)
    seg = body[starts[idx]: starts[idx + 1] if idx + 1 < len(starts) else len(body)]
    htext = re.sub(r"^### 10\.\d+\s+", "", full.strip())
    cls, sub = classify(htext)
    if cls is None:
        unknown.append((tag, htext[:120])); continue
    counts[cls] += 1
    cens_all = sorted({f"{c.group(1)}/{c.group(2)}" for c in CENSUS.finditer(seg)})
    if len(cens_all) == 1:
        cens = cens_all[0]
    elif len(cens_all) == 0:
        cens = "NO-MACHINE-CENSUS"
    else:
        cens = "MULTI-CENSUS[" + ",".join(cens_all) + "]"
    date = re.search(r"(2026-\d\d-\d\d)", htext)
    rows.append((tag, htext.split("—")[0].strip()[:34], cls, ",".join(sub) or "-",
                 date.group(1) if date else "?", cens))
if unknown:
    sys.exit("TALLY-FAIL: unparseable verdict headings (extend the grammar or fix the table):\n  " +
             "\n  ".join(f"{t}: {h}" for t, h in unknown))

# ---- triad totals: sum ONLY over unambiguous single-census sections ----
def plain(r): return re.fullmatch(r"\d+/\d+", r[5]) is not None
tot_num = sum(int(r[5].split("/")[0]) for r in rows if plain(r))
tot_den = sum(int(r[5].split("/")[1]) for r in rows if plain(r))
k = sum(1 for r in rows if plain(r))
multi = [r for r in rows if r[5].startswith("MULTI-CENSUS")]
nocens = [r for r in rows if r[5] == "NO-MACHINE-CENSUS"]

print(f"# TALLY §10 — {src.name} {commit_note} — computed 2026-11-18 (DRY-RUN; provisional until A1's final fold)")
print(f"tables-range: §10.1–§10.{N}   (N-TABLES = {N})")
print(f"verdict counts: GREEN-triad = {counts['green-triad']} · honest-partial = {counts['honest-partial']} · NOT-GREEN-honest = {counts['not-green-honest']}   (sum = {sum(counts.values())} = N ✓)")
print(f"machine triad census: {tot_num}/{tot_den} decls over {k} of {N} sections (single unambiguous N/N phrase); "
      f"{len(multi)} MULTI-CENSUS (manual pick — recap blocks quote other sections' censuses) + {len(nocens)} NO-MACHINE-CENSUS (manual fold)")
print()
print("| § | pilot | verdict class | subclasses | date | census |")
print("|---|---|---|---|---|---|")
for tag, name, cls, sub, date, cens in rows:
    print(f"| {tag} | {name} | {cls} | {sub} | {date} | {cens} |")
print()
print("Census flags (manual at close):")
for tag, name, cls, sub, date, cens in rows:
    if cens != "NO-MACHINE-CENSUS" and not plain((tag, name, cls, sub, date, cens)):
        print(f"  - {tag} {name}: {cens}")
    elif cens == "NO-MACHINE-CENSUS":
        print(f"  - {tag} {name}: NO-MACHINE-CENSUS (per-decl 'triad' cells exist; manual fold)")
