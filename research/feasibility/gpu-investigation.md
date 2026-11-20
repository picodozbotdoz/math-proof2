# GPU investigation: can GPUs help this project?

Written 2026-11-19 in session worktree `gpu-lean-theorem-proving`. This is an engineering
investigation, not a discovery. No GPU run has been made. Any GPU run needs explicit,
per-run user approval under the Modal usage guidelines in AGENTS.md, since a GPU goes beyond the
2 CPU / 4 GB default.

## 1 Short answer

- **Lean checking: no.** Lean's elaborator and kernel run only on the CPU. There is no
  GPU backend, and kernel-only verification is the project's standard of proof. A GPU
  cannot make a pilot check faster.
- **Discovery and proof search around Lean: yes, in three places** (ranked in §4):
  1. GPU embeddings for a *semantic* declaration index. This is cheap, one-time, and fixes a
     known weakness of the novelty checks.
  2. GPU numerics that try to falsify a candidate theorem before it is formalized. This is
     scouting only, never evidence.
  3. An open-weight prover model used to close leaf lemmas. Its value is unproven on our
     pin, so a small benchmark should come first.

## 2 What the current workflow is bound by (measured)

- No local GPU. The host has an Intel Xeon E3 integrated graphics controller, 4 cores and
  7 GB RAM. Any GPU would be a Modal GPU.
- Lean runs are CPU-light and latency-bound. Run-log telemetry (`pilots/*/logs`,
  `feasibility/probe/logs*`) shows `wall` at 40–150 s and `max_cpu` at 0.5–1.24 of the
  2-CPU spec. `mem` reaches 5–8.5 GB, but that is the memory-mapped Mathlib `.olean` pages
  (AGENTS.md §Modal 5), not computation. Most of the wall time goes to container start
  and import loading, not elaboration.
- Volume so far: about 50k LoC of pilot Lean and about 300 persisted run logs across 26
  pilot directories (e.g. `pilots/75/logs` 44 runs, `pilots/42/logs` 27, `pilots/10/logs` 20).
  The loop is "agent writes Lean, then a Modal check takes about 1 min". The bottleneck is
  the turnaround per check, which a GPU does not touch.
- Novelty checks are name-only. `qa/decl-index-v2.tsv` has the columns corpus / file / kind /
  name: 2,940,110 rows, 2,187,544 unique names (openai-math 2.44M rows, tauceti 242k,
  mathlib 184k, AxiomMath ≈ 52k, eth/3sum/zeta23 ≈ 22k). The index holds no statement text,
  so it cannot find the same theorem under another name. CLAUDE.md already flags a miss as
  weak evidence. The Iteration-4 quality gate (RESEARCH.md) also requires **≥ 2 nearest-miss
  rows** per article, and those are currently found by hand.
- The index also loses names. Its name pattern `[A-Za-z_][A-Za-z0-9_!?']*`
  (`qa/make-decl-index-v2.sh:62`) stops at the first `.`, so dotted names are cut down to
  their namespace: mathlib's `IsCompact.inter_riemannZetaZeros_finite` is stored as
  `IsCompact`. That affects 36,955 of 232,684 anchored mathlib headers (≈ 16 %). The script's
  caveat block does not list this. Structure fields are not indexed at all; zeta23's
  `ZetaSeam.finite_window` (`Zeta23/Statement.lean:83`) is a field. Both halves of the
  verified duplicate pair in `bridges/analytic-nt.md` §1 ("same statement, different names")
  are therefore invisible to a name search.

## 3 What exists outside (as of 2026-11, from the literature)

| Tool class | Examples | GPU need | Fit for this project |
|---|---|---|---|
| Whole-proof prover LLMs | Goedel-Prover-V2 8B / 32B (MiniF2F 84.6 % pass@32 for 8B); OProver-32B (preprint, MiniF2F 93.3 % / PutnamBench 11.3 % pass@32); DeepSeek-Prover-V2 7B / 671B; Kimina-Prover 72B | 8B: one 24–48 GB GPU; 32B: an 80 GB GPU (bf16) | **Uncertain.** These are trained on competition maths and older Lean pins (the Goedel-V2 repo uses Lean 4.9). SorryDB (arXiv 2603.02668) finds that specialized provers generalize worse to real projects than agentic frontier LLMs. |
| Premise selection / semantic search | LeanHammer (neural premise selector + Zipperposition/Duper; 33–40 % of Mathlib test theorems); LeanSearch v2 (embedding + reranker, open source, API at leansearch.net); graph-augmented retrieval (arXiv 2510.23637) | Embedding the corpus once: GPU. Queries: CPU | **Good fit**, but our corpora (openai-math, tauceti, AxiomMath, zeta23) are not in any public index. We would have to embed them ourselves. |
| Tactic copilots | LeanCopilot (CTranslate2; optional CUDA) | Optional | Low. Its premise retriever uses a fixed old Mathlib snapshot. |
| Search-then-verify discovery | AlphaEvolve (closed) / OpenEvolve (open); Georgiev–Gómez-Serrano–Tao–Wagner, arXiv 2511.02864 | LLM calls + evaluation | Matches the "numerics find, kernel proves" split the charter already uses. |

Modal GPU list prices (third-party aggregators, to be checked on Modal's own page before any
run): L4 ≈ $0.80/h, L40S ≈ $1.95/h, A100-80GB ≈ $2.50/h, H100 ≈ $3.95/h, billed per second.

## 4 Ranked options

### 4.1 Semantic declaration index (recommended first)

- **What:** extract each declaration's header (signature up to `:=`, plus its docstring)
  from the corpus roots in `make-decl-index-v2.sh`, embed it with a small open embedding
  model on one GPU, and store the vectors with the TSV. Queries ("ideal norm sum over
  primes below x, bounded by …") then run on CPU with a flat index.
- **Why:** it turns the name-only novelty check into a similarity search. The top hits
  across all 13 corpus labels become the candidate nearest-miss rows the quality gate asks
  for. It also gives premise retrieval over our own corpora, which no public tool indexes.
- **Cost (estimate):** about 2.2M headers × about 150 tokens ≈ 330M tokens. With a model
  under 1B parameters, that is on the order of 1–3 h on one L4 / L40S, about $1–6, one-time.
  Restricting it to the deduplicated non-vendored corpora cuts this a lot. Extraction and
  queries are CPU-only.
- **Limits:** a hit is a lead, never evidence of provability or absence. The existing
  decl-index caveat block applies, and every claim still needs a direct-source `rg` check.
  Regex header extraction misses some forms (the same blind spots as `make-decl-index.sh`).

- **Status (2026-11-19): CPU stage built as decl-index-v3** (`qa/decl_index_v3.py`). It has
  4,636,995 rows over the 13 corpora (4,615,148 distinct statement texts, 731,232 of them
  outside openai-math), built locally in 3 min 8 s. It covers every live v2 row: all 2,452
  v2 rows it lacks are comment or docstring text, classified automatically by `coverage`.
  A curated clue overlay (`qa/decl-enrich-v3.tsv`: alias / keyword / description /
  see-also) adds better names without editing declarations. The embedding stage has not
  been built and needs a GPU-run approval. Suggested order: core corpora first
  (about 0.73M texts), openai-math later or on demand. Clues are embedded as extra vectors
  per declaration, so adding one is a CPU job.
- **2026-11-20, v3.1:** the TSV and the statements JSONL are replaced by one SQLite file
  (1.69 GB: files and namespaces stored once, porter-stemmed BM25 full-text index). Its
  export is byte-identical to the v3.0 TSV. Queries take about 0.2–0.8 s (3.6 s for a
  single very common word) at about 25 MB RAM, against 8–34 s scans before. Embeddings
  will key on the per-declaration `sha` text fingerprint.
- **2026-11-20:** decl-index v1/v2 RETIRED. v3 is the canonical index (workflow in
  CLAUDE.md and AGENTS.md; `status` catches staleness against the corpus checkouts).

### 4.2 Falsify-before-formalize numerics (scouting only)

- **What:** run large batched random or adversarial searches on the GPU (PyTorch
  `linalg`, batched eigendecompositions, gradient-based tensor decomposition) against a
  candidate's *statement*, before any Lean effort goes in.
- **Where it fits:** the linear-algebra cluster (01 inertial-defect identity, 02 bandwidth-k
  ceilings, 03 compression rank-trace: matrix inequalities over many random instances) and
  the tensor cluster (60 border-rank connector, 30-style operator identities). Pilot 30's
  Theorem B was refuted in the kernel only after a pilot was set up
  (`pilots/30-note.md` §2). A numeric sweep would have flagged it earlier. Exact-rational
  witnesses found by search, such as a counterexample or a low-rank decomposition, can
  then be checked in the kernel with `decide` / `norm_num`, without `native_decide`.
- **Rule fit:** numerics are discovery aids only. Under the charter, certified numerics are
  engineering deliverables and never discoveries, and nothing numeric enters an article as
  proof.
- **Caveat:** for small matrices, CPU numpy inside the 2 CPU / 4 GB default is often
  enough. The GPU only pays off for very large sweeps (more than about 10⁶ instances) or
  for decomposition search. Decide per candidate.

### 4.3 Open-weight prover as a leaf-lemma closer — DROPPED (user decision 2026-11-19: too inefficient for the expected gain)

- **What:** serve Goedel-Prover-V2-8B (or OProver-32B) with vLLM on a Modal GPU. Feed it
  the small `sorry` leaves of a pilot blueprint, sample k proofs each, and check every
  candidate in Lean in the normal CPU containers. It closes routine leaves
  (inequalities, `Finset` sums, algebra); the agent keeps the structure.
- **Why benchmark first:** our pin is Lean v4.36.0-rc2 / Mathlib `ff2494ea`. Model
  training data is far older, so lemma names will have drifted, and our goals use project
  definitions the models have never seen. SorryDB is the closest evidence that this
  matters.
- **Proposed benchmark:** take about 20 leaf lemmas that are *already proved* in pilots
  (ground truth known), replace each proof with `sorry`, run pass@32 with the 8B model on
  one L40S, and check in Lean. Report the success rate on our pin. Estimated cost: well
  under $5 of GPU, plus about 640 Lean checks. Those checks need a *batched or warm*
  checker (§5), because 640 checks at about 1 min each would cost more than the GPU part.
- **Scale up** only if the closed-leaf rate makes it cheaper than the agent closing the
  same leaves.

### Not recommended

- A GPU for Lean elaboration or the kernel (not possible).
- Fine-tuning or training a prover (cost and scope; the research object is new maths,
  not prover engineering).
- Very large models (DeepSeek-Prover-V2-671B, Kimina-72B), which need multi-GPU nodes for
  results the 8B/32B models match or beat.

## 5 The bigger win is CPU-side

Since checks are latency-bound (§2), the faster loop is a **warm Lean checker**: a
persistent Lean REPL with Mathlib already imported, kept alive in a Modal class or
container pool, taking many files or snippets per container start. It still uses the
2 CPU / 4 GB default. It speeds up every pilot, and §4.3 needs it as a prerequisite. Open
REPL servers for batched Lean verification exist (e.g. Project Numina's Kimina Lean
Server). Check one's toolchain compatibility before adopting it.

## 6 Sources

- Goedel-Prover-V2 model cards: https://huggingface.co/Goedel-LM/Goedel-Prover-V2-8B ,
  https://huggingface.co/Goedel-LM/Goedel-Prover-V2-32B
- OProver: https://arxiv.org/html/2605.17283
- SorryDB: https://arxiv.org/abs/2603.02668
- LeanHammer premise selection: https://arxiv.org/pdf/2506.07477v2
- LeanSearch v2: https://arxiv.org/pdf/2605.13137
- Graph-augmented premise selection: https://arxiv.org/html/2510.23637v2
- LeanCopilot: https://arxiv.org/html/2404.12534v3
- AlphaEvolve maths at scale: https://arxiv.org/abs/2511.02864
- Modal GPU prices (aggregator): https://www.spheron.network/blog/modal-gpu-pricing-2026-per-second-billing/
