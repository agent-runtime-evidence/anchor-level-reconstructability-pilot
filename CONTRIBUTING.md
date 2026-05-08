# Contributing

This repository is a **frozen reproducibility artefact** for a published
arXiv preprint, not an evolving project. The Tables 2 and 3 of the
manuscript, the per-regime Decision Trace Reconstructor v0.1.0 pipeline
outputs, and the SHA-256 checksums in `checksums.txt` define the
manifest pin for the corresponding artefact version. We do not accept
changes to those pinned artefacts under that version.

What we do accept by issue or pull request:

## Errata against the matrix or against a per-regime classification

If you have read the manuscript and believe a Table 2 or Table 3 cell is
wrong (e.g., a property classified `S` should be `P`, or vice versa), open
an issue using the **Erratum or matrix cell question** template
(`.github/ISSUE_TEMPLATE/erratum.md`). Please include:

- the regime column and property row in question,
- the current category and the proposed category,
- the `fragment_id` from the relevant `data/results/<regime>/01_dtr_anchor.fragments.json`
  (or `data/named_incidents/replit_drop_database/fragments.json` for the
  Replit incident column) that supports the proposed change, and
- a short reasoning paragraph that applies the §3 Method classification rule.

If the erratum is confirmed, it will be addressed in a follow-up version of
this artefact (e.g., `v0.2.0`) and reflected in a published erratum to the
manuscript. We do not silently overwrite committed pins.

## Reproducibility bug reports

If `shasum -a 256 -c checksums.txt` fails on a fresh clone, or
`reproduce_tables.py --verify-checksums` aborts with a mismatch, or
`scripts/verify_all.sh` reports a non-zero exit code, please open an issue
using the **Reproducibility bug** template
(`.github/ISSUE_TEMPLATE/bug_report.md`) with:

- the exact command and its full output,
- your OS, Python version, PyYAML version, and shasum implementation,
- a confirmation that you cloned fresh and have not modified any committed
  file (per `git status`).

A from-scratch Decision Trace Reconstructor re-execution that produces
different `fragments.json` / `feasibility.json` / `trace.jsonld` files than
what is committed here is **not a bug in this repository** — it reflects
Tier B variability that this artefact intentionally does not checksum-verify.
The committed `data/results/` files are pinned for Tier A reader-verification
only.

## Improvements to documentation, SPARQL examples, or scripts

These are welcome by pull request. Examples:

- correcting typos in the README, CHANGELOG, or any `.md` file under
  `data/sparql/`,
- adding a SPARQL example query that exercises a different aspect of the
  W3C PROV-O JSON-LD encoding,
- improving the regenerator's stderr messaging or argparse help text,
- improving the GitHub Actions workflow or `scripts/verify_all.sh`.

Please keep pull requests minimal and scoped to a single concern. Do not
modify any committed pipeline artefact (`data/corpus/**`, `data/results/**`,
`data/named_incidents/**`) in the same PR; those are part of the manifest
pin and changing them breaks Tier A reader-verifiability for everyone who
has downloaded the artefact at the prior pin.

## What is out of scope

The following are out of scope for this repository and will be closed
without action:

- requests to extend the corpus beyond the pinned worked-example anchors;
  corpus expansion to twenty to fifty real captured production traces per
  regime is the explicit future-work item F2 in the manuscript and is the
  subject of a separate forthcoming benchmark artefact;
- requests for a second annotator κ ≥ 0.6 calibration pass; this is F1 in
  the manuscript and is the subject of the same forthcoming benchmark;
- bug reports against Decision Trace Reconstructor itself or the
  Operational Evidence Plane reference implementation; please file those
  issues in the corresponding upstream repository (see `.github/ISSUE_TEMPLATE/config.yml`
  for direct links).
