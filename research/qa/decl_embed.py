"""decl_embed.py — numpy-only text encoder for decl-index-v3's semantic search.

Runs BAAI/bge-small-en-v1.5 (BERT, 12 layers, hidden 384, CLS pooling, L2-normalized) with
nothing but the standard library and numpy, so query-time encoding needs no compiled ML
runtime (this machine's CPU has AVX but no AVX2; prebuilt ML binaries were not an option).
The bulk embedding of the corpus runs on a GPU (`embed_v3_modal.py`, PyTorch +
Hugging Face tokenizer, fp32); `decl_index_v3.py embed parity` checks that this encoder
reproduces those vectors and token ids.

Model files are read from a local directory (config.json, vocab.txt, model.safetensors);
the safetensors format is plain tensors + a JSON header, parsed here directly — nothing
from the download is executed.
"""

import json
import os
import struct
import unicodedata

import numpy as np

MODEL_ID = "BAAI/bge-small-en-v1.5"
MODEL_REV = "5c38ec7c405ec4b44b94cc5a9bb96e735b38267a"
MODEL_SAFETENSORS_SHA256 = "3c9f31665447c8911517620762200d2245a2518d6e7208acc78cd9db317e21ad"
MODEL_DIR = os.environ.get("DECL_MODEL_DIR",
                           os.path.expanduser("~/.cache/decl-v3/models/bge-small-en-v1.5@5c38ec7c"))
MAX_LEN = 256  # wordpieces incl. [CLS]/[SEP]; the GPU job uses the same cap
QUERY_INSTRUCTION = "Represent this sentence for searching relevant passages: "

_DT = {"F32": np.float32, "F16": np.float16, "I64": np.int64}
FAST_PYTHON = "/home/doz/dozenv/bin/python"  # pip numpy with bundled OpenBLAS (measured 134 GFLOP/s here)


def blas_backend():
    """Which BLAS this process loaded. Debian's system numpy links the netlib reference
    BLAS unless an optimized one is installed (measured 3.2 GFLOP/s here, ~40x slower)."""
    try:
        with open("/proc/self/maps", encoding="utf-8", errors="replace") as fh:
            maps = fh.read().lower()
    except OSError:
        return "unknown"
    for name in ("openblas", "mkl", "blis"):
        if name in maps:
            return name
    return "reference" if "/blas/libblas.so" in maps else "unknown"


def warn_if_slow_blas(stream):
    if blas_backend() == "reference":
        print(f"WARN: numpy uses the reference BLAS (slow); for ~40x faster encoding run this with "
              f"{FAST_PYTHON} (OpenBLAS numpy)", file=stream)


def load_safetensors(path):
    with open(path, "rb") as fh:
        n = struct.unpack("<Q", fh.read(8))[0]
        header = json.loads(fh.read(n))
        base = 8 + n
        buf = np.memmap(path, dtype=np.uint8, mode="r")
    out = {}
    for name, meta in header.items():
        if name == "__metadata__":
            continue
        a, b = meta["data_offsets"]
        out[name] = np.frombuffer(buf[base + a:base + b], dtype=_DT[meta["dtype"]]).reshape(meta["shape"])
    return out


# ---------------------------------------------------------------- tokenizer (BERT uncased)

def _is_control(ch):
    if ch in "\t\n\r":
        return False
    return unicodedata.category(ch).startswith("C")


def _is_whitespace(ch):
    return ch in " \t\n\r" or unicodedata.category(ch) == "Zs"


def _is_punct(ch):
    cp = ord(ch)
    if 33 <= cp <= 47 or 58 <= cp <= 64 or 91 <= cp <= 96 or 123 <= cp <= 126:
        return True
    return unicodedata.category(ch).startswith("P")


def _is_cjk(cp):
    return (0x4E00 <= cp <= 0x9FFF or 0x3400 <= cp <= 0x4DBF or 0x20000 <= cp <= 0x2A6DF
            or 0x2A700 <= cp <= 0x2B73F or 0x2B740 <= cp <= 0x2B81F or 0x2B820 <= cp <= 0x2CEAF
            or 0xF900 <= cp <= 0xFAFF or 0x2F800 <= cp <= 0x2FA1F)


class WordPiece:
    """BertTokenizer(do_lower_case=True) behaviour: clean, CJK-split, lowercase, strip
    accents, split punctuation, greedy longest-match wordpieces."""

    def __init__(self, vocab_path):
        with open(vocab_path, encoding="utf-8") as fh:
            self.vocab = {t.rstrip("\n"): i for i, t in enumerate(fh)}
        self.unk, self.cls, self.sep = self.vocab["[UNK]"], self.vocab["[CLS]"], self.vocab["[SEP]"]

    def _basic(self, text):
        out = []
        for ch in text:
            cp = ord(ch)
            if cp == 0 or cp == 0xFFFD or _is_control(ch):
                continue
            if _is_whitespace(ch):
                out.append(" ")
            elif _is_cjk(cp):
                out.append(f" {ch} ")
            else:
                out.append(ch)
        tokens = []
        for tok in "".join(out).split():
            tok = "".join(c for c in unicodedata.normalize("NFD", tok.lower())
                          if unicodedata.category(c) != "Mn")
            cur = []
            for ch in tok:
                if _is_punct(ch):
                    if cur:
                        tokens.append("".join(cur))
                        cur = []
                    tokens.append(ch)
                else:
                    cur.append(ch)
            if cur:
                tokens.append("".join(cur))
        return tokens

    def _wordpiece(self, token):
        if len(token) > 100:
            return [self.unk]
        ids, start = [], 0
        while start < len(token):
            end, cur = len(token), None
            while start < end:
                sub = token[start:end] if start == 0 else "##" + token[start:end]
                if sub in self.vocab:
                    cur = self.vocab[sub]
                    break
                end -= 1
            if cur is None:
                return [self.unk]
            ids.append(cur)
            start = end
        return ids

    def encode(self, text, max_len=MAX_LEN):
        ids = []
        for tok in self._basic(text):
            ids.extend(self._wordpiece(tok))
            if len(ids) >= max_len - 2:
                break
        return [self.cls] + ids[:max_len - 2] + [self.sep]


# ---------------------------------------------------------------- encoder

def _erf(x):
    # Abramowitz & Stegun 7.1.26, |error| < 1.5e-7 (numpy has no vectorized erf)
    s = np.sign(x)
    a = np.abs(x)
    t = 1.0 / (1.0 + 0.3275911 * a)
    y = 1.0 - (((((1.061405429 * t - 1.453152027) * t) + 1.421413741) * t - 0.284496736) * t
               + 0.254829592) * t * np.exp(-a * a)
    return s * y


def _gelu(x):
    return 0.5 * x * (1.0 + _erf(x / np.sqrt(2.0)))


def _layer_norm(x, w, b, eps):
    mu = x.mean(-1, keepdims=True)
    var = ((x - mu) ** 2).mean(-1, keepdims=True)
    return (x - mu) / np.sqrt(var + eps) * w + b


class Encoder:
    def __init__(self, model_dir=MODEL_DIR):
        if not os.path.exists(os.path.join(model_dir, "model.safetensors")):
            raise FileNotFoundError(f"model files missing in {model_dir} (see decl_embed.py header)")
        with open(os.path.join(model_dir, "config.json"), encoding="utf-8") as fh:
            cfg = json.load(fh)
        self.h, self.heads = cfg["hidden_size"], cfg["num_attention_heads"]
        self.eps, self.n_layers = cfg["layer_norm_eps"], cfg["num_hidden_layers"]
        self.tok = WordPiece(os.path.join(model_dir, "vocab.txt"))
        w = load_safetensors(os.path.join(model_dir, "model.safetensors"))
        f32 = lambda k: np.asarray(w[k], dtype=np.float32)  # noqa: E731
        self.word, self.pos = f32("embeddings.word_embeddings.weight"), f32("embeddings.position_embeddings.weight")
        self.typ = f32("embeddings.token_type_embeddings.weight")
        self.eln = (f32("embeddings.LayerNorm.weight"), f32("embeddings.LayerNorm.bias"))
        self.layers = []
        for i in range(self.n_layers):
            p = f"encoder.layer.{i}."
            qkv_w = np.concatenate([f32(p + f"attention.self.{n}.weight") for n in ("query", "key", "value")]).T.copy()
            qkv_b = np.concatenate([f32(p + f"attention.self.{n}.bias") for n in ("query", "key", "value")])
            self.layers.append((
                qkv_w, qkv_b,
                f32(p + "attention.output.dense.weight").T.copy(), f32(p + "attention.output.dense.bias"),
                f32(p + "attention.output.LayerNorm.weight"), f32(p + "attention.output.LayerNorm.bias"),
                f32(p + "intermediate.dense.weight").T.copy(), f32(p + "intermediate.dense.bias"),
                f32(p + "output.dense.weight").T.copy(), f32(p + "output.dense.bias"),
                f32(p + "output.LayerNorm.weight"), f32(p + "output.LayerNorm.bias")))

    def _forward(self, ids, mask):
        B, T = ids.shape
        H, nh = self.h, self.heads
        dh = H // nh
        x = self.word[ids] + self.pos[:T][None] + self.typ[0][None, None]
        x = _layer_norm(x, *self.eln, self.eps)
        bias = (1.0 - mask[:, None, None, :]) * np.float32(-1e9)
        for qkv_w, qkv_b, ow, ob, l1w, l1b, iw, ib, fw, fb, l2w, l2b in self.layers:
            qkv = x @ qkv_w + qkv_b
            q, k, v = (qkv[..., j * H:(j + 1) * H].reshape(B, T, nh, dh).transpose(0, 2, 1, 3) for j in range(3))
            att = q @ k.transpose(0, 1, 3, 2) / np.float32(np.sqrt(dh)) + bias
            att = np.exp(att - att.max(-1, keepdims=True))
            att /= att.sum(-1, keepdims=True)
            ctx = (att @ v).transpose(0, 2, 1, 3).reshape(B, T, H)
            x = _layer_norm(x + ctx @ ow + ob, l1w, l1b, self.eps)
            x = _layer_norm(x + _gelu(x @ iw + ib) @ fw + fb, l2w, l2b, self.eps)
        cls = x[:, 0]
        return cls / np.linalg.norm(cls, axis=1, keepdims=True)

    def encode(self, texts, batch=16):
        """L2-normalized float32 vectors, one per text (CLS pooling, like the GPU job)."""
        encoded = [self.tok.encode(t) for t in texts]
        out = np.empty((len(texts), self.h), dtype=np.float32)
        order = sorted(range(len(texts)), key=lambda i: len(encoded[i]))
        for b in range(0, len(order), batch):
            idx = order[b:b + batch]
            T = max(len(encoded[i]) for i in idx)
            ids = np.zeros((len(idx), T), dtype=np.int64)
            mask = np.zeros((len(idx), T), dtype=np.float32)
            for r, i in enumerate(idx):
                ids[r, :len(encoded[i])] = encoded[i]
                mask[r, :len(encoded[i])] = 1.0
            out[idx] = self._forward(ids, mask)
        return out
