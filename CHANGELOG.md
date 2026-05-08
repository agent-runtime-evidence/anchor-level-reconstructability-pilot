# Changelog

All notable changes to the Anchor-Level Reconstructability Pilot artefact
are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this artefact adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

The artefact version is the version recorded in `CITATION.cff`, in
`.zenodo.json`, and in `manifest.yaml` `artefact.version`. The
`manifest.yaml` `artefact.manifest_revision` field is a separate counter
that increments on every schema change to the manifest itself; that history
is detailed in `manifest.yaml` `artefact.manifest_revision_history` and is
not duplicated here.

## [Unreleased]

Nothing yet.

## [0.1.0] — 2026-05-07

Initial public release accompanying the arXiv preprint
*Property-Level Reconstructability of Agent Decisions: An Anchor-Level Pilot
Across Vendor SDK Adapter Regimes* (Solozobov, 2026).

### Added

- **Pinned anchor inputs** for ten worked-example anchors across seven regimes:
  six vendor SDK adapter regimes (AWS Bedrock Agents, LangSmith, Anthropic
  Claude tool use, OpenAI Agents, OpenTelemetry GenAI Vertex, Model Context
  Protocol), the Operational Evidence Plane vendor-neutral exemplar (with two
  variants: a generic-floor anchor and an OEP-aware mapped anchor), and the
  Replit DROP DATABASE public-record reconstruction.
- **Pinned Decision Trace Reconstructor v0.1.0 pipeline outputs** per regime:
  per-regime `fragments.json` (ingest-stage output), per-regime
  `feasibility.json` (reconstruct-stage summary), and per-regime
  `trace.jsonld` (W3C PROV-O encoded provenance graph).
- **Manifest** (`manifest.yaml`) recording artefact identity, Decision Trace
  Reconstructor and Operational Evidence Plane Zenodo content-addressed DOI
  pins, exact per-regime CLI invocations, and SHA-256 checksums for every
  anchor input, fragments output, feasibility output, and trace JSON-LD output.
- **Checksums** (`checksums.txt`) — 45-entry `shasum -a 256 -c`-format
  manifest covering every pinned pipeline artefact and release-support file
  used by the Tier A verification path.
- **Regenerator** (`reproduce_tables.py`) under Apache-2.0, regenerating
  Tables 2 and 3 of the manuscript byte-for-byte from the committed
  feasibility outputs. Includes a `--verify-checksums` flag that hashes every
  `feasibility.json` against the manifest pin before parsing.
- **Reference output** (`reference_output.md`) — committed expected output
  of the regenerator, enabling a byte-diff regression check.
- **One-command harness** (`scripts/verify_all.sh`) — installs pinned deps,
  verifies all checksums, runs the regenerator with `--verify-checksums`,
  and diffs the output against `reference_output.md`.
- **GitHub Actions CI** (`.github/workflows/verify.yml`) — runs the Tier A
  verification chain on every push and pull request.
- **Issue templates** (`.github/ISSUE_TEMPLATE/`) — erratum, reproducibility
  bug report, and an external links config for off-topic questions.
- **SPARQL examples** (`data/sparql/`) — three ready-to-run queries against
  the W3C PROV-O JSON-LD provenance graphs (policy_basis lookup, fragment-
  kind overview, per-property classification mirror).
- **Provenance** (`data/named_incidents/replit_drop_database/PROVENANCE.md`)
  — fragment-to-source mapping for the Replit DROP DATABASE public-record
  reconstruction case.
- **Strict governance score** — opaque is scored zero in this paper for
  governance-evidence purposes; Decision Trace Reconstructor's native
  `completeness_pct` field treats opaque as evidenced and is preserved
  verbatim in each `feasibility.json` for reference but is not used by the
  regenerator. Table 2's summary row is labelled
  `strict-governance-completeness pct` to disambiguate from the upstream
  native field.
- **Per-file licensing** — code, automation, query examples, and
  upstream-derived artefacts under Apache-2.0
  (`licenses/LICENSE-APACHE-2.0`); documentation and release metadata under
  CC-BY-4.0 (`licenses/LICENSE-CC-BY-4.0`); per-file SPDX-style summary in
  `LICENSE`.
- **Citation** — structured citation record in `CITATION.cff`; Zenodo deposit
  metadata in `.zenodo.json`.

### Notes

- Tier A reproducibility (regenerator-input-and-output checksum verification)
  is fully claimed and supported.
- Tier B reproducibility (from-scratch Decision Trace Reconstructor
  re-execution) is documented per regime in `manifest.yaml regimes[].command`
  but is not separately checksum-verified by this artefact.
- Pilot scope is single-annotator, anchor-sized (n=1 per cell), and
  descriptive only. The companion full benchmark on twenty to fifty real
  captured production traces per regime is a separate forthcoming artefact.

[Unreleased]: https://github.com/agent-runtime-evidence/anchor-level-reconstructability-pilot/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/agent-runtime-evidence/anchor-level-reconstructability-pilot/releases/tag/v0.1.0
