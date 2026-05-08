---
name: Reproducibility bug
about: Report a problem running the Tier A verification flow (checksum mismatch, regenerator failure, etc.)
title: "Bug: <short description>"
labels: [bug, needs-triage]
assignees: []
---

## Which step failed

- [ ] `python3 -m pip install -r requirements.txt`
- [ ] `shasum -a 256 -c checksums.txt`
- [ ] `python3 reproduce_tables.py`
- [ ] `python3 reproduce_tables.py --verify-checksums`
- [ ] `bash scripts/verify_all.sh`
- [ ] Other (describe below)

## Exact command and full output

```
$ <command>
<paste full output here, including any tracebacks>
```

## Environment

- OS and version: <macOS 14.5 | Ubuntu 22.04 | Windows 11 | ...>
- Python version (`python3 --version`):
- PyYAML version (`python3 -c 'import yaml; print(yaml.__version__)'`):
- shasum / sha256sum implementation (`shasum --version` or equivalent):

## Local file state

- Did you clone fresh, or modify any committed file? <fresh | modified>
- Output of `git status`:

```
<paste git status output, redacted of any private paths>
```

## Anything else

Note: from-scratch DTR re-execution (Tier B in the README) is intentionally
not checksum-verified by this package. Differences in `fragments.json` /
`feasibility.json` / `trace.jsonld` produced by re-running DTR yourself
against the same anchor inputs are NOT bugs in this repository — they
reflect Tier B variability. The `data/results/` files committed here are
pinned for Tier A reader-verification only.
