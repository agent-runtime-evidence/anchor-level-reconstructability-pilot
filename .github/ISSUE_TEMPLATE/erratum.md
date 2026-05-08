---
name: Erratum or matrix cell question
about: Report a suspected error in Table 2 / Table 3 cell, anchor input, or feasibility classification
title: "Erratum: <regime> × <property> cell looks wrong"
labels: [erratum, needs-triage]
assignees: []
---

## Cell or artefact under question

- **Regime column**: <Bedrock | LangSmith | Anthropic | OpenAI | OTLP-Vertex | MCP | OEP | Replit incident>
- **Property row**: <inputs | policy basis | operator identity | authorization envelope | reasoning trace | output action | post-condition state>
- **Current category in Table 2**: <F | P | S | O>
- **Suggested category**: <F | P | S | O>

## Reproduction

What did you run?

```
python3 reproduce_tables.py --verify-checksums
```

If your local feasibility.json differs from the committed pin, paste both
SHA-256s here so the maintainer can tell whether the discrepancy is in the
upstream Decision Trace Reconstructor v0.1.0 release artefact, the adapter
mapping configuration, or a data-corruption issue local to your machine.

## What you observed

A short description of the discrepancy. If you ran a custom DTR command,
paste the exact CLI invocation including all flags so the difference from
`manifest.yaml regimes[].command` is explicit.

## Reasoning for the proposed change

Cite the anchor input fragment(s) by `fragment_id` from the corresponding
`data/results/<regime>/01_dtr_anchor.fragments.json` file (or
`data/named_incidents/replit_drop_database/fragments.json` for the Replit
column). Explain why the proposed category better matches the §3 Method
classification rule applied to those fragments.

## Anything else

Notes that might help triage (Python version, OS, whether `shasum -c
checksums.txt` passed, whether the regenerator's `--verify-checksums`
mode flagged anything before the cell discrepancy surfaced).
