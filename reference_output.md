Table 2. Per-property by per-regime reconstructability matrix at anchor scale (n=1 per cell).
Letter codes: F (fully fillable), P (partially fillable), S (structurally unfillable), O (opaque).
The strict-governance-completeness pct row uses the strict governance score F=1.0, P=0.5, S=0.0, O=0.0 averaged over the seven property classes per column. The label distinguishes this paper's score from DTR's native completeness_pct field, which treats opaque as evidenced.

| Property | Bedrock | LangSmith | Anthropic | OpenAI | OTLP-Vertex | MCP | OEP | Replit incident |
|---|---|---|---|---|---|---|---|---|
| inputs | F | F | F | F | F | P | F | P |
| policy basis | F | F | S | F | S | S | F | S |
| operator identity | F | F | F | F | F | S | F | F |
| authorization envelope | F | F | F | F | S | F | F | S |
| reasoning trace | O | O | O | O | O | O | S | O |
| output action | F | F | F | F | F | F | F | F |
| post-condition state | F | S | F | F | S | P | F | P |
| **strict-governance-completeness pct** | **85.7** | **71.4** | **71.4** | **85.7** | **42.9** | **42.9** | **85.7** | **42.9** |

Table 3. Strict-score descriptive summary across the six vendor SDK regimes.
Per-property category counts (F/P/S/O) over the six vendor-regime columns are the primary categorical view; mean and CV are secondary scalar summaries under the strict governance score F=1.0, P=0.5, S=0.0, O=0.0.
CV = population standard deviation divided by mean (n=6 denominator; not n-1).
A different non-compensatory scoring rule could change the scalar summaries (mean, CV) without changing the categorical category-count columns.

| Property | F | P | S | O | Mean (vendor regimes only) | CV across regimes |
|---|---|---|---|---|---|---|
| inputs | 5 | 1 | 0 | 0 | 0.92 | 0.20 |
| policy basis | 3 | 0 | 3 | 0 | 0.50 | 1.00 |
| operator identity | 5 | 0 | 1 | 0 | 0.83 | 0.45 |
| authorization envelope | 5 | 0 | 1 | 0 | 0.83 | 0.45 |
| reasoning trace | 0 | 0 | 0 | 6 | 0.00 | N/A (mean = 0) |
| output action | 6 | 0 | 0 | 0 | 1.00 | 0.00 |
| post-condition state | 3 | 1 | 2 | 0 | 0.58 | 0.77 |
