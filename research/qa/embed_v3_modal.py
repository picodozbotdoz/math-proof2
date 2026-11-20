"""embed_v3_modal.py — decl-index-v3 semantic stage: embed the exported core-corpus texts
with BAAI/bge-small-en-v1.5 (pinned revision) on ONE Modal GPU.

User approval (2026-11-21, this run class): one GPU, cpu 2.0, memory 4096 MB (the AGENTS.md
default SPEC), timeout 1 h, model download inside the container. GPU type is a fallback
list (user directive 2026-11-21, after run 1 queued ~47 min for an L4): L4 -> A10G ->
L40S -> T4; Modal takes the first type it can schedule, and run.json records the one used.
Ephemeral `modal run` (app `crossmath-embed-v3`): no volume, no secret, no deploy;
max_containers=1 so `.remote` calls can never fan out to more GPUs. Telemetry via
feasibility/probe/modal_telemetry.py (TELE_INTERVAL=10 s).

Precision: fp32 with TF32 off, so the stored vectors are directly comparable with the
numpy encoder (`decl_embed.py`) used at query time; stored as float16.

Usage (doz CLI, from the repo root):
  EMBED_TEXTS=<texts.tsv.gz from `decl_index_v3.py embed export`> \
    /home/doz/dozenv/bin/modal run research/qa/embed_v3_modal.py --out <dir>
Writes <dir>/vec.f16.npy, <dir>/tok-sample.json, <dir>/run.json; then
`decl_index_v3.py embed import <dir> --texts ... --log ...`.
"""
import hashlib
import os
import sys

import modal

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "feasibility", "probe"))
from modal_telemetry import SPEC, telemetered  # noqa: E402

MODEL = "BAAI/bge-small-en-v1.5"
REV = "5c38ec7c405ec4b44b94cc5a9bb96e735b38267a"
WEIGHTS_SHA256 = "3c9f31665447c8911517620762200d2245a2518d6e7208acc78cd9db317e21ad"
MAX_LEN, BATCH, DIM = 256, 256, 384
GPUS = ["L4", "A10G", "L40S", "T4"]  # priority order; all run this fp32 job well within memory
TEXTS = os.environ.get("EMBED_TEXTS", "")

app = modal.App("crossmath-embed-v3")

image = (
    modal.Image.debian_slim(python_version="3.12")
    .pip_install("torch==2.5.1", "transformers==4.46.3", "huggingface_hub==0.26.2", "numpy==2.1.3")
    .run_commands(
        "python -c \"from huggingface_hub import snapshot_download; "
        f"snapshot_download('{MODEL}', revision='{REV}', local_dir='/model', "
        "allow_patterns=['config.json', 'vocab.txt', 'tokenizer.json', 'tokenizer_config.json', "
        "'special_tokens_map.json', 'model.safetensors'])\"",
        "python -c \"import hashlib; h = hashlib.sha256(open('/model/model.safetensors', 'rb').read()).hexdigest(); "
        f"assert h == '{WEIGHTS_SHA256}', h; print('weights sha256 OK', h)\"",
    )
    .env({"TELE_INTERVAL": "10", "TOKENIZERS_PARALLELISM": "false", "OMP_NUM_THREADS": "2"})
    .add_local_python_source("modal_telemetry")
)
if TEXTS:
    image = image.add_local_file(TEXTS, "/data/texts.tsv.gz")


@app.cls(image=image, gpu=GPUS, **SPEC, timeout=3600, max_containers=1, scaledown_window=60)
class Embedder:
    @modal.enter()
    def load(self):
        import gzip
        import time

        import torch
        from transformers import AutoModel, AutoTokenizer
        t = time.time()
        torch.set_num_threads(2)
        torch.backends.cuda.matmul.allow_tf32 = False
        torch.backends.cudnn.allow_tf32 = False
        self.tok = AutoTokenizer.from_pretrained("/model")
        self.model = AutoModel.from_pretrained("/model", torch_dtype=torch.float32).to("cuda").eval()
        with gzip.open("/data/texts.tsv.gz", "rt", encoding="utf-8") as fh:
            self.texts = [line.rstrip("\n").split("\t", 1)[1] for line in fh]
        self.device = torch.cuda.get_device_name(0)
        print(f"[embed] model + {len(self.texts)} texts loaded in {time.time() - t:.1f}s on "
              f"{self.device}; torch {torch.__version__}", flush=True)

    @modal.method()
    @telemetered
    def embed(self, start, end, sample_every):
        import time

        import numpy as np
        import torch
        t = time.time()
        texts = self.texts[start:end]
        order = sorted(range(len(texts)), key=lambda i: len(texts[i]))
        out = np.empty((len(texts), DIM), dtype=np.float16)
        tokens = 0
        with torch.inference_mode():
            for b in range(0, len(order), BATCH):
                idx = order[b:b + BATCH]
                enc = self.tok([texts[i] for i in idx], padding=True, truncation=True,
                               max_length=MAX_LEN, return_tensors="pt").to("cuda")
                tokens += int(enc["attention_mask"].sum())
                cls = self.model(**enc).last_hidden_state[:, 0]
                cls = torch.nn.functional.normalize(cls, dim=-1)
                out[idx] = cls.cpu().numpy().astype(np.float16)
        sample = {}
        if sample_every:
            for i in range(start, end):
                if i % sample_every == 0:
                    sample[i] = self.tok(self.texts[i], truncation=True, max_length=MAX_LEN)["input_ids"]
        stats = {"rows": len(texts), "tokens": tokens, "secs": round(time.time() - t, 1),
                 "gpu_mem_max_mb": round(torch.cuda.max_memory_allocated() / 2**20), "device": self.device}
        print(f"[embed] rows {start}..{end}: {stats}", flush=True)
        return out.tobytes(), sample, stats


@app.local_entrypoint()
def main(out: str, chunk: int = 50000, sample_every: int = 365):
    import gzip
    import json
    import time

    import numpy as np
    if not TEXTS:
        sys.exit("set EMBED_TEXTS to the exported texts .tsv.gz")
    with gzip.open(TEXTS, "rt", encoding="utf-8") as fh:
        n = sum(1 for _ in fh)
    os.makedirs(out, exist_ok=True)
    t0 = time.time()
    e = Embedder()
    parts, samples, stats = [], {}, []
    for s in range(0, n, chunk):
        b, smp, st = e.embed.remote(s, min(n, s + chunk), sample_every)
        parts.append(np.frombuffer(b, dtype=np.float16).reshape(-1, DIM))
        samples.update({str(k): v for k, v in smp.items()})
        stats.append(st)
        print(f"[local] {min(n, s + chunk)}/{n} rows", flush=True)
    V = np.concatenate(parts)
    assert V.shape == (n, DIM), V.shape
    np.save(os.path.join(out, "vec.f16.npy"), V)
    with open(os.path.join(out, "tok-sample.json"), "w", encoding="utf-8") as fh:
        json.dump(samples, fh)
    run = {"app": "crossmath-embed-v3", "gpu_requested": GPUS,
           "gpu_used": sorted({x["device"] for x in stats}), "cpu": SPEC["cpu"], "memory_mb": SPEC["memory"],
           "timeout_s": 3600, "max_containers": 1, "model": MODEL, "revision": REV,
           "precision": "fp32, TF32 off; stored float16", "max_len": MAX_LEN, "batch": BATCH,
           "rows": n, "chunks": len(stats), "tokens": sum(x["tokens"] for x in stats),
           "embed_s": round(sum(x["secs"] for x in stats), 1),
           "gpu_mem_max_mb": max(x["gpu_mem_max_mb"] for x in stats),
           "wall_s_incl_startup": round(time.time() - t0, 1),
           "texts_sha256": hashlib.sha256(open(TEXTS, "rb").read()).hexdigest()}
    with open(os.path.join(out, "run.json"), "w", encoding="utf-8") as fh:
        json.dump(run, fh, indent=1)
    print(f"[local] DONE {json.dumps(run)}", flush=True)
