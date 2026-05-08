# Replit DROP DATABASE — Public-Record Provenance

This file documents the per-fragment public-record provenance for the Replit
DROP DATABASE incident reconstruction shipped at
[`fragments.json`](fragments.json) in this directory. It is the same
provenance information stated in §4 Measurement Setup (subsection
"Replit named-incident provenance") of the accompanying arXiv preprint.

The fragment manifest is **the author's reconstruction** of what is
recoverable from public-record reporting of the July 2025 Replit incident.
It is not a primary trace export from the Replit production system. The
matrix cell for the named-incident column therefore reports what a
downstream investigator can recover from the public record under the
Decision Event Schema property classification, not what the Replit
production system internally captured at the moment of the incident.

## Per-fragment source mapping

| Fragment ID | Fragment kind | Reconstruction basis |
|---|---|---|
| `replit_f000` | `agent_message` | User prompt context recovered from the contemporaneous public record. Reconstructed primarily from the OECD AI Incidents Monitor entry and the Tom's Hardware / TechTarget reports listed under "Public-record sources" below. |
| `replit_f001` | `model_generation` | Marked `internal_reasoning: opaque` in the payload. Reason: none of the public-record sources expose the model deliberation contents. This directly produces the `opaque` reasoning-trace classification in Table 2's Replit incident column. |
| `replit_f002` | `tool_call` | The `DROP DATABASE production_db` payload as reported in the contemporaneous public record. Reconstructed from the same OECD / Tom's Hardware / TechTarget set. |
| `replit_f003` | `state_mutation` | The deletion event as reported in the contemporaneous public record. Reconstructed from the same source set. |

Per-fragment timestamps are placeholders; only relative ordering reflects
the public-record sequence.

## Public-record sources

The author's reconstruction draws on three public-record sources for the
Replit DROP DATABASE incident. In the arXiv manuscript and in this
repository's accompanying citation records, these sources correspond to
library entries with the following IDs (the `library_source_id=` values in
the manuscript's `(Source: ...)` tags), each referencing the original
URL where the public-record evidence was published:

| Library source ID | Outlet | Reference |
|---|---|---|
| 4927 | OECD AI Incidents Monitor | Incident 2025-07-19-1eb1 ("Replit DROP DATABASE incident"), `https://oecd.ai/en/incidents/2025-07-19-1eb1` |
| 4928 | Tom's Hardware | Contemporaneous incident report on the Replit AI coding assistant DROP DATABASE event (July 2025), `https://www.tomshardware.com/tech-industry/artificial-intelligence/ai-coding-platform-goes-rogue-during-code-freeze-and-deletes-entire-company-database-replit-ceo-apologizes-after-ai-engine-says-it-made-a-catastrophic-error-in-judgment-and-destroyed-all-production-data` |
| 4929 | TechTarget — SearchSoftwareQuality | Analysis piece on the same incident, `https://www.techtarget.com/searchsoftwarequality/news/366627829/Replit-AI-agent-snafu-shot-across-the-bow-for-vibe-coding` |

For the human-readable secondary framing of the incident (used in §1 of the
manuscript as the opening hook), see additionally:

| Library source ID | Outlet | Reference |
|---|---|---|
| 4464 | "Towards a Science of AI Agent Reliability" (Rabanser et al., 2026 preprint) | Cites the Replit incident in passing as motivating context within a broader reliability-literature framing, `https://arxiv.org/abs/2602.11915` |

## Why this fragment manifest is useful

The Replit column in Table 2 is a **comparator column**, not a vendor
SDK regime. RQ1, RQ2, and RQ3 of the manuscript are answered on the six
vendor-regime base population (Bedrock, LangSmith, Anthropic, OpenAI,
OTLP-Vertex, MCP); the Replit column shows the matrix applied to evidence
assembled from public-domain reporting after the fact, demonstrating that
the per-property reconstructability schema is meaningful even outside a
controlled adapter-coverage demonstration.

For the same reason, the Replit column is **excluded from the strict-score
descriptive summary in Table 3**: that table reports per-property mean and
across-regime population CV over the six vendor regimes only. Including a
public-record reconstruction in that scalar summary would conflate two
fundamentally different data-generating processes.

## Caveat

The reconstruction is intentionally minimal: four fragments encode the
"agent prompted, agent deliberated opaquely, agent issued a DROP DATABASE
tool call, the database was deleted" sequence. Other dimensions of the
incident (organisational, contractual, post-incident response) are not
modelled here because they are out of scope for property-level
reconstructability under the Decision Event Schema. Readers writing
incident-analysis papers may find this minimal manifest a useful starting
point but should expect to extend it with additional fragments for their
own analyses.
