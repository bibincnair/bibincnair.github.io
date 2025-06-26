---
layout: post
title: Paper Reading - Attention is all you need.
tags: [nlp, transformer, attention]
---

## Overview

The "Attention is All You Need" paper by Vaswani et al. (2017) introduced the Transformer architecture, which revolutionized natural language processing by dispensing with recurrence and convolutions entirely, relying solely on attention mechanisms. This paper laid the foundation for modern large language models like GPT, BERT, and T5.

**Key Contributions:**
- Introduced the Transformer architecture based entirely on attention mechanisms
- Achieved state-of-the-art results on machine translation tasks
- Enabled parallelization during training, making it much faster than RNNs
- Established the foundation for modern pre-trained language models

## Core Ideas

### Self-Attention Mechanism

The core innovation is the **scaled dot-product attention** mechanism:

$$\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$$

Where:
- $Q$ = Query matrix (what we're looking for)
- $K$ = Key matrix (what we're comparing against)
- $V$ = Value matrix (what we actually return)
- $d_k$ = dimension of the key vectors (used for scaling)

**Why scaling by $\sqrt{d_k}$?**
- Prevents the dot products from growing too large
- Keeps the softmax function in regions where it has useful gradients
- For large $d_k$, dot products grow large in magnitude, pushing softmax into regions with extremely small gradients

### Multi-Head Attention

Instead of using a single attention function, the model uses multiple "attention heads":

$$\text{MultiHead}(Q, K, V) = \text{Concat}(\text{head}_1, ..., \text{head}_h)W^O$$

Where each head is:
$$\text{head}_i = \text{Attention}(QW_i^Q, KW_i^K, VW_i^V)$$

**Parameters:**
- $W_i^Q \in \mathbb{R}^{d_{model} \times d_k}$ (Query projection)
- $W_i^K \in \mathbb{R}^{d_{model} \times d_k}$ (Key projection)  
- $W_i^V \in \mathbb{R}^{d_{model} \times d_v}$ (Value projection)
- $W^O \in \mathbb{R}^{hd_v \times d_{model}}$ (Output projection)

**Typical dimensions:**
- $h = 8$ (number of heads)
- $d_k = d_v = d_{model}/h = 64$ (when $d_{model} = 512$)

### Transformer Blocks

#### Encoder Block
Each encoder layer consists of:

1. **Multi-Head Self-Attention**
2. **Add & Norm** (Residual connection + Layer Normalization)
3. **Feed-Forward Network**
4. **Add & Norm**

Mathematical representation:
```
x' = LayerNorm(x + MultiHeadAttention(x, x, x))
output = LayerNorm(x' + FFN(x'))
```

#### Feed-Forward Network (FFN)
$$\text{FFN}(x) = \max(0, xW_1 + b_1)W_2 + b_2$$

- Inner dimension: $d_{ff} = 2048$ (typically 4× the model dimension)
- Uses ReLU activation
- Applied to each position separately

#### Decoder Block
Each decoder layer consists of:

1. **Masked Multi-Head Self-Attention** (prevents looking at future tokens)
2. **Add & Norm**
3. **Multi-Head Cross-Attention** (attends to encoder output)
4. **Add & Norm**
5. **Feed-Forward Network**
6. **Add & Norm**

### Attention Heads

Different attention heads learn to focus on different types of relationships:

**Examples of what heads learn:**
- **Syntactic relationships**: Subject-verb agreement, noun-adjective dependencies
- **Semantic relationships**: Coreference resolution, entity relationships
- **Positional patterns**: Local vs. long-range dependencies
- **Task-specific patterns**: Different heads specialize for different aspects of the task

**Head specialization visualization:**
- Some heads focus on the previous token
- Some heads focus on rare words
- Some heads focus on delimiter tokens
- Some heads attend to semantically similar words

### Positional Encoding

Since Transformers have no inherent notion of sequence order, positional encodings are added to input embeddings:

$$PE_{(pos, 2i)} = \sin\left(\frac{pos}{10000^{2i/d_{model}}}\right)$$

$$PE_{(pos, 2i+1)} = \cos\left(\frac{pos}{10000^{2i/d_{model}}}\right)$$

Where:
- $pos$ = position in the sequence
- $i$ = dimension index
- $d_{model}$ = model dimension

**Properties of sinusoidal encoding:**
- Each dimension corresponds to a sinusoid with different wavelengths
- Allows the model to learn relative positions
- Can extrapolate to sequence lengths longer than those seen during training
- The encoding for position $pos + k$ can be represented as a linear function of the encoding for position $pos$

### Layer Normalization

Applied before each sub-layer (Pre-LN) in modern implementations:

$$\text{LayerNorm}(x) = \gamma \odot \frac{x - \mu}{\sigma} + \beta$$

Where:
- $\mu$ = mean across the feature dimension
- $\sigma$ = standard deviation across the feature dimension
- $\gamma, \beta$ = learnable parameters

## Why Transformer over Recurrent Architectures

### Computational Advantages

1. **Parallelization**: 
   - RNNs process sequences sequentially: $h_t = f(h_{t-1}, x_t)$
   - Transformers process all positions simultaneously
   - Massive speedup during training

2. **Memory Requirements**:
   - RNNs: $O(n \cdot d)$ sequential operations
   - Transformers: $O(1)$ sequential operations
   - Better GPU utilization

### Modeling Advantages

3. **Long-Range Dependencies**:
   - RNNs suffer from vanishing gradients over long sequences
   - Transformers have constant path length between any two positions
   - Direct connections via attention mechanism

4. **Information Flow**:
   - RNNs create information bottlenecks at each timestep
   - Transformers allow information to flow directly between any positions
   - No information loss through sequential processing

### Performance Comparison

| Aspect | RNN/LSTM | Transformer |
|--------|----------|-------------|
| Sequential Operations | $O(n)$ | $O(1)$ |
| Parallel Processing | No | Yes |
| Path Length | $O(n)$ | $O(1)$ |
| Memory per Layer | $O(d)$ | $O(n^2)$ |
| Training Speed | Slow | Fast |
| Long Dependencies | Weak | Strong |

### Mathematical Complexity Analysis

**Self-Attention Complexity:**
- Time: $O(n^2 \cdot d)$ where $n$ = sequence length, $d$ = model dimension
- Space: $O(n^2)$ for attention weights

**RNN Complexity:**
- Time: $O(n \cdot d^2)$ 
- Space: $O(d)$ for hidden state

**Trade-off**: Transformers are more efficient when $n < d$, which is typical for most NLP tasks.

## Model Architecture Details

### Full Architecture
- **Encoder**: 6 identical layers
- **Decoder**: 6 identical layers  
- **Model dimension**: $d_{model} = 512$
- **Attention heads**: $h = 8$
- **Feed-forward dimension**: $d_{ff} = 2048$
- **Dropout**: 0.1

### Training Details
- **Optimizer**: Adam with custom learning rate schedule
- **Learning rate**: $lr = d_{model}^{-0.5} \cdot \min(step^{-0.5}, step \cdot warmup\_steps^{-1.5})$
- **Warmup steps**: 4000
- **Label smoothing**: $\epsilon = 0.1$

## Impact and Legacy

The Transformer architecture became the foundation for:
- **BERT** (Bidirectional Encoder Representations)
- **GPT** series (Generative Pre-trained Transformers)
- **T5** (Text-to-Text Transfer Transformer)
- **Modern LLMs** (ChatGPT, Claude, LLaMA, etc.)

The paper's core insight—that attention mechanisms alone are sufficient for sequence modeling—fundamentally changed the landscape of NLP and AI.
