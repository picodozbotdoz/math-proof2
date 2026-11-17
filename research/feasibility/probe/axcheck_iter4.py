#!/usr/bin/env python3
"""axcheck_iter4.py — Iteration-4 axcheck toolchain (local, pure Python; NO Modal).

Implements `qa/iter4-review/r3-verification-integrity.md` §7 (the R3 sweep upgrade,
adopted as the DEFAULT configuration by `feasibility/probe/FINAL-SWEEP-PLAN-ITER4.md`
§2). The C2-era generators stay frozen and untouched (`make_axcheck.py`,
`pilots/10/axcheck_full.py`); this script supersedes both at Iteration-4 sweep time
and closes audit findings F1 (log custody), F2 (private/lemma print coverage) and
F3a/F3b (wrapped-record joining; middle-excerpt ban) at the tool level.

Components (subcommands; `python3 -I axcheck_iter4.py <cmd> …`, run from anywhere,
absolute or repo-relative paths accepted):
  gen <src.lean> <out.lean> [--rewrite stem=Stage[,stem2=Stage2...]]
      full-coverage stage: verbatim copy + appended
      `#print axioms` tail for EVERY theorem/lemma declaration — private and
      protected included (appended-tail-in-same-file pattern: private names resolve
      from the same file; C2 precedents = 72's pilot-local 11/11 audit and 75/Pa's
      in-file 17-decl tail). Repo file untouched. --rewrite rewrites exact
      `import <stem>` lines to the sibling STAGE name before appending (the C2
      generalized sibling-import fix, `make_axcheck.py:95–106` semantics — needed
      when the staged file imports a sibling pilot module, e.g. lp/L2 imports L1 →
      `--rewrite L1=AxL1`; RedTm2 imports P11T3 → `--rewrite P11T3=AxPilot11_P11T3`).
  gate <src.lean>...          forbidden-token hard gate (exit 1 on any hit, outside
      comments): `axiom` declarations, `native_decide`, `unsafe` declarations,
      `implemented_by`, `@[extern]` (audit §7.1.3 — codifies R3's manual §4 scan).
  scan <log>...               run-log analyzer: joins wrapped axiom records before
      classification, checks every record's axiom set ⊆ {propext, Classical.choice,
      Quot.sound}, counts sorryAx, counts error lines INCLUDING `error(<code>)`
      forms, and enforces the custody rule (audit §7.3): flags "(…N more)"
      middle-excerpts and verdict-vs-persisted-records mismatches as TALLY-ONLY.
  decls <src.lean>...         declaration census (theorem/lemma × public/private).

ACCEPTANCE TESTS (audit §7.1.4) — EXECUTED 2026-11-16 by lane R3, local counts only,
against the on-disk C2 evidence (`python3 -I axcheck_iter4.py …`); measured results:

  T1 gen/decls   pilots/72/C-neg.lean → PASS: 11 decls (5 public + 6 private
     theorem); census name set == the 11 distinct names in
     pilots/72/logs/axcheck-run1.log (6 under `_private.…0.CrossMath.CNeg.*`),
     verified programmatically (empty both-way diff). gen end-to-end: verbatim
     source preserved, appended tail = 11 prints (16 `#print axioms` lines total
     — the file's own 5-print audit tail rides along in the verbatim copy).
  T2 decls       pilots/75/Pa.lean → PASS: 68 = 65 public + 3 private
     (analyticAt_finset_prod', analyticOrderAt_finset_prod', toNat_sum_finset —
     the exact three the run6-final in-file audit covers).
  T3 decls       pilots/10/L2.lean → PASS: 177 = 151 public + 26 private
     (all theorems, 0 lemmas; the 26 were axcheck_full's blind side, audit F2).
  T4 decls       pilots/30-falsify-TheoremB-h1.lean → PASS: 65 = 12 theorem +
     53 lemma, all PUBLIC — the C3 gap here is kind-based (lemma), not privacy.
  T5 gate        77 files (51 research/pilots/**/*.lean + 26 probe *.lean) →
     PASS: 0 forbidden tokens (comment-aware gate skips the compliance-header
     prose; matches the R3 manual scan, audit §4 finding 4).
  T6 scan        feasibility/probe/logs/stepB-c2.log → PASS, with a NEW
     quantification of audit F3b/F1: 719 records PERSISTED in the log
     (572 × triad + 59 × [propext, Quot.sound] + 42 × [propext] + 46 no-axioms),
     all ⊆ triad, 0 sorryAx, 1 error line (AxPilot42_M4b plain-substrate FAIL,
     by design) — but **14 of 44 stages flagged TALLY-ONLY** (verdict claims
     exceed persisted records; each also carries a "(…N more)" elision):
     01_port08/09/10, 10_M1 (106→52), 10_L2 (126→52), 11_P11T3 (71→51),
     20_M1 (38→20), 30_falsify (25→12), 32_M1 (22→16), 42_M2b (57→41),
     42_M4a (57→41), 72_M1_T1 (52→34), 72_M1_T2 (28→27), 75_Pa (82→36).
     The C2 sweep-of-record log therefore does not itself persist the evidence
     for those stages (the in-run counter + Step A carried it); this tool's
     no-excerpt custody rule (§7.3) removes the class at Iteration 4.
  T7 scan        pilots/11/logs/m2-axcheck-final.log → PASS: BOTH verdict lines
     flagged TALLY-ONLY (P11T3 claims 64, RedTm2 claims 12; the whole log
     persists 8 records) — the known F1 custody case, caught as designed;
     covering artifact per audit §8 relabel item 2 = stepB-c2.log:533–586.
  T8 gen --rewrite (added at Phase B activation, 2026-11-16): RedTm2.lean staged
     with `--rewrite P11T3=AxPilot11_P11T3` → PASS: exactly 1 import line
     rewritten, all other content byte-verbatim; plain `gen` regression OK.
     Purpose: sibling-import staging for Iteration-4 consumers (lp L2 imports L1;
     72-M1 T3 imports T1/T2) without touching frozen make_axcheck.py logic.
  T9 PRIMED-NAME FIX (lane A1, 2026-11-17): RECORD_RE + join_records' opener
     patterns widened `([^']*)` → `(.*)` (greedy, backtracks to the last quote
     before `depends on`/`does not depend`) — names ENDING IN A PRIME
     (`analyticAt_finset_prod'`, Lean prints `'name'' depends …`) broke the
     quote pairing and those records were silently skipped. Found live on
     pilots/75/logs/axcheck-full-run1.log: scan said 120 records; the fix says
     124 (the +4 = the two primed names × their two prints each), all triad,
     0 sorryAx — matching the hand-join recorded in r3-verification-tables
     §10.8's Step-B closure. Regression on the T6 C2 sweep log (stepB-c2.log):
     719 → 724 records (+5 primed-name records recovered, all ⊆ triad, 0 sorryAx,
     custody TALLY-ONLY flags unchanged — they were excerpt-based); normal names
     unaffected. Axiom lists never contain quotes, so greedy is safe.

The gen tail is APPENDED ONLY — the source file is copied verbatim; sweep-time
staging remains the bytes of record (sha256-at-sweep per FINAL-SWEEP-PLAN-ITER4 §2.4;
runners should stamp it in the stage header — see gen's emitted header).
"""
import re
import sys
from pathlib import Path

TRIAD = {"propext", "Classical.choice", "Quot.sound"}

DECL_RE = re.compile(
    r"^(?:@\[[^\]]*\]\s+)*(?:(?:private|protected)\s+)?(theorem|lemma)\s+([^\s:({\[]+)"
)
NS_RE = re.compile(r"^(?:public\s+)?namespace\s+([A-Za-z0-9_.]+)")
SECTION_RE = re.compile(r"^(?:noncomputable\s+)?(?:public\s+)?section\b")
END_RE = re.compile(r"^end\b")

FORBIDDEN = [
    ("axiom-decl", re.compile(r"^(?:@\[[^\]]*\]\s+)*axiom\s")),
    ("unsafe-decl", re.compile(r"^unsafe\s+(?:def|theorem|lemma|abbrev|instance|opaque|structure)\b")),
    ("native_decide", re.compile(r"\bnative_decide\b")),
    ("implemented_by", re.compile(r"\bimplemented_by\b")),
    ("attr-extern", re.compile(r"@\[\s*extern\b")),
]

RECORD_RE = re.compile(r"^'(.*)'\s+(depends on axioms:.*|does not depend on any axioms\.?)\s*$")
VERDICT_RE = re.compile(r"^\[ax\]\s+(\S+?):\s+(OK|FAIL[^\n]*?);\s+axiom-lines=(\d+),\s+sorryAx-lines=(\d+)")
EXCERPT_RE = re.compile(r"^\(…(\d+) more\)")
ERROR_LINE_RE = re.compile(r":\s*error\b")
ERROR_CODE_RE = re.compile(r"error\([A-Za-z0-9_.]+\)")

# stage separators used by axcheck_probe.py-family runners
STAGE_RE = re.compile(r"^===\s+(\S+\.lean)\s*$")


def code_lines(src):
    """Yield (lineno, stripped_line) for lines that are NOT comments.

    Skips block-comment interiors (nesting /- … -/) and `--` line comments —
    compliance-header prose lives there (audit §4 finding 4's manual filter,
    mechanized). Block-comment OPENERS that also carry code are not expected in
    this tree's style; if one appears, the opener line is skipped conservatively.
    """
    depth = 0
    for i, line in enumerate(src.splitlines(), 1):
        s = line.strip()
        if depth > 0:
            depth += line.count("/-") - line.count("-/")
            continue
        if s.startswith("/-"):
            depth += line.count("/-") - line.count("-/")
            continue
        if s.startswith("--"):
            continue
        yield i, s


def decl_census(src):
    """[(kind, full_name, is_private, lineno)] for every theorem/lemma decl."""
    stack, out = [], []  # stack: namespace strings or None for sections
    for i, s in code_lines(src):
        m = NS_RE.match(s)
        if m:
            stack.append(m.group(1))
            continue
        if SECTION_RE.match(s):
            stack.append(None)
            continue
        if END_RE.match(s):
            if stack:
                stack.pop()
            continue
        m = DECL_RE.match(s)
        if m:
            kind, name = m.group(1), m.group(2)
            is_private = bool(re.match(r"^(?:@\[[^\]]*\]\s+)*(?:private|protected)\s", s))
            ns = [n for n in stack if n]
            out.append((kind, ".".join(ns + [name]), is_private, i))
    return out


def cmd_gen(src_path, out_path, rewrite_spec=None):
    src = Path(src_path).read_text()
    rewrites = {}
    if rewrite_spec:
        for pair in rewrite_spec.split(","):
            stem, _, stage = pair.partition("=")
            stem, stage = stem.strip(), stage.strip()
            if not stem or not stage:
                raise SystemExit(f"--rewrite expects stem=Stage pairs, got {pair!r}")
            rewrites[stem] = stage
    applied = []
    for stem, stage in rewrites.items():
        new, n = re.subn(rf"^import {re.escape(stem)}$", f"import {stage}", src, flags=re.M)
        if n:
            src = new
            applied.append(f"{stem}->{stage} ×{n}")
    decls = decl_census(src)
    names = [d[1] for d in decls]
    n_pub = sum(1 for d in decls if not d[2])
    n_priv = len(decls) - n_pub
    header = (
        f"/- axcheck_iter4 full-coverage stage: verbatim copy of {src_path} with\n"
        f"   #print axioms on ALL {len(decls)} theorem/lemma declarations\n"
        f"   ({n_pub} public + {n_priv} private/protected); repo file untouched;\n"
        f"   private names resolve from this same file (appended-tail pattern).\n"
        + (f"   Sibling-import rewrites applied: {'; '.join(applied)}.\n" if applied else "")
        + f"   Custody rule: the run log must persist every record below, or be\n"
        f"   marked tally-only + name its covering artifact. -/\n"
    )
    tail = "\n".join(f"#print axioms {n}" for n in names)
    Path(out_path).write_text(header + src + "\n" + tail + "\n")
    rw = ("; rewrites " + ", ".join(applied)) if applied else ""
    print(f"{src_path}: {len(decls)} decls ({n_pub} public + {n_priv} private) "
          f"-> {out_path}{rw}")
    return len(decls)


def cmd_gate(paths):
    hits = []
    for p in paths:
        src = Path(p).read_text()
        for i, s in code_lines(src):
            for label, rx in FORBIDDEN:
                if label in ("native_decide", "implemented_by") :
                    if rx.search(s):
                        hits.append((p, i, label, s[:90]))
                elif rx.search(s):
                    hits.append((p, i, label, s[:90]))
    if hits:
        for p, i, label, s in hits:
            print(f"FORBIDDEN-TOKEN {label} at {p}:{i}: {s}")
        print(f"gate: FAIL — {len(hits)} forbidden token(s)")
        return 1
    print(f"gate: OK — 0 forbidden tokens over {len(paths)} file(s)")
    return 0


def join_records(lines):
    """Join wrapped `#print axioms` output records.

    A record opens with `'name' depends on axioms: …` or `'name' does not depend on
    any axioms`. Continuation lines join ONLY until the axiom list's brackets balance
    (R3 §7.2.1) — never past the closing `]` — or until the next opener. Returns
    [(name, axiom_list, is_sorry, opener_lineno, joined_rest)].
    """
    records, cur = [], None  # cur = [name, rest, opener_lineno]

    def complete(rest):
        return "[" in rest and rest.count("[") - rest.count("]") <= 0

    for idx, line in enumerate(lines, 1):
        s = line.strip()
        m = re.match(r"^'(.*)'\s+depends on axioms:\s*(.*)$", s)
        noax = re.match(r"^'(.*)'\s+does not depend on any axioms", s)
        if m or noax:
            if cur:
                records.append(cur)
                cur = None
            if noax:
                records.append([noax.group(1), "", idx])
            elif complete(m.group(2)):
                records.append([m.group(1), m.group(2), idx])
            else:
                cur = [m.group(1), m.group(2), idx]
            continue
        if cur is not None:
            cur[1] = (cur[1] + " " + s).strip()
            if complete(cur[1]):
                records.append(cur)
                cur = None
    if cur:
        records.append(cur)
    out = []
    for name, rest, ln in records:
        rest = rest.strip()
        if "]" in rest:
            rest = rest[: rest.rindex("]") + 1]
        ax = [t.strip() for t in rest.strip("[]").split(",") if t.strip()]
        out.append((name, ax, "sorryAx" in rest, ln, rest))
    return out


def cmd_scan(paths):
    total_bad = 0
    for p in paths:
        text = Path(p).read_text()
        lines = text.splitlines()
        # stage split
        stages, cur_name, cur = [], "__preamble__", []
        for line in lines:
            m = STAGE_RE.match(line)
            if m:
                stages.append((cur_name, cur))
                cur_name, cur = m.group(1), []
            cur.append(line)
        stages.append((cur_name, cur))
        print(f"=== {p}")
        g_records, g_sorry, g_errors, g_errcode = [], 0, 0, 0
        stage_rec_counts = {}
        for sname, slines in stages:
            recs = join_records(slines)
            stage_rec_counts[sname] = len(recs)
            sorry = [r for r in recs if r[2]]
            bad_sets = [r for r in recs if not set(r[1]) <= TRIAD]
            err = sum(1 for l in slines if ERROR_LINE_RE.search(l))
            errcode = sum(1 for l in slines if ERROR_CODE_RE.search(l))
            excerpted = [l for l in slines if EXCERPT_RE.match(l.strip())]
            flags = []
            if sorry:
                flags.append(f"SORRYAx={len(sorry)}")
            if bad_sets:
                flags.append(f"NON-TRIAD-Sets={len(bad_sets)}")
            if excerpted:
                flags.append(f"EXCERPTED({len(excerpted)} mid-log elisions)")
            status = "OK" if not flags else "FLAG: " + ", ".join(flags)
            if sname != "__preamble__" and (recs or err or errcode or flags):
                print(f"  {sname}: records={len(recs)} errors={err}(+{errcode} coded) {status}")
            g_records += recs
            g_sorry += len(sorry)
            g_errors += err
            g_errcode += errcode
        # custody rule (audit §7.3): every verdict line's claimed axiom-records must be
        # persisted in a stage section of THIS log — else TALLY-ONLY + covering artifact.
        for l in lines:
            vm = VERDICT_RE.match(l.strip())
            if not vm:
                continue
            fname, claimed = vm.group(1), int(vm.group(3))
            persisted = stage_rec_counts.get(fname)
            if persisted is None:
                print(f"  CUSTODY {fname}: TALLY-ONLY — no stage section in this log; "
                      f"verdict claims {claimed}, whole log persists {len(g_records)} "
                      f"records — covering artifact required")
            elif claimed > persisted:
                print(f"  CUSTODY {fname}: TALLY-ONLY — verdict claims {claimed}, "
                      f"persisted {persisted} records — covering artifact required")
        dist = {}
        for _, ax, _, _, _ in g_records:
            key = "[" + ", ".join(ax) + "]" if ax else "(no axioms)"
            dist[key] = dist.get(key, 0) + 1
        print(f"  TOTAL records={len(g_records)} sorryAx={g_sorry} "
              f"errors={g_errors}+{g_errcode}(coded)")
        for k in sorted(dist, key=lambda k: -dist[k]):
            bad = "  <-- NON-TRIAD" if not set(
                [t for t in k.strip("[]").split(", ") if t]) <= TRIAD and "(no axioms)" not in k else ""
            print(f"    {dist[k]:4d} × {k}{bad}")
        total_bad += g_sorry
    return 1 if total_bad else 0


def cmd_decls(paths):
    for p in paths:
        src = Path(p).read_text()
        decls = decl_census(src)
        n_pub = sum(1 for d in decls if not d[2])
        print(f"{p}: {len(decls)} decls ({n_pub} public + {len(decls)-n_pub} private/protected)")
        for kind, name, priv, ln in decls:
            print(f"  :{ln} {'private ' if priv else ''}{kind} {name}")


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2
    cmd, args = argv[1], argv[2:]
    if cmd == "gen" and len(args) in (2, 4) and (len(args) == 2 or args[2] == "--rewrite"):
        return 0 if cmd_gen(args[0], args[1], args[3] if len(args) == 4 else None) is not None else 1
    if cmd == "gate" and args:
        return cmd_gate(args)
    if cmd == "scan" and args:
        return cmd_scan(args)
    if cmd == "decls" and args:
        cmd_decls(args)
        return 0
    print(__doc__)
    return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv))
