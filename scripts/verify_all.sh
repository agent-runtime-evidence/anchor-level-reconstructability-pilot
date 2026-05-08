#!/usr/bin/env bash
# Tier A reproducibility verification harness.
# Runs the full check chain a reader is expected to run on a fresh clone:
#   1. ensure pinned regenerator dependencies are available
#   2. verify SHA-256 of every pinned anchor input, fragments output,
#      feasibility output, and W3C PROV-O JSON-LD provenance graph
#   3. run the regenerator with built-in checksum verification
#   4. byte-diff regenerator output against the committed reference output
#
# Exit code 0 = all Tier A checks passed (Tables 2 and 3 are byte-identical
# to the manuscript and every pinned artefact matches its pin).
# Any non-zero exit code aborts before the next step; the failing step is
# named in stderr.
#
# Usage:
#   bash scripts/verify_all.sh            (from the repository root)
#
# License: Apache-2.0

set -euo pipefail

# Re-anchor to the repository root no matter where the script is invoked from.
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$( cd "${SCRIPT_DIR}/.." && pwd )"
cd "${REPO_ROOT}"

step() {
  printf "\n\033[1m==> %s\033[0m\n" "$1"
}

REQUIRED_PYYAML="6.0.3"

step "1/4  Ensure pinned regenerator dependency is available (PyYAML ${REQUIRED_PYYAML})"
installed_version="$(python3 -c "import yaml; print(yaml.__version__)" 2> /dev/null || true)"
if [[ "${installed_version}" == "${REQUIRED_PYYAML}" ]]; then
  echo "PyYAML ${installed_version} already importable; skipping pip install."
else
  if [[ -n "${installed_version}" ]]; then
    echo "PyYAML ${installed_version} importable, but ${REQUIRED_PYYAML} is pinned; installing requirements.txt."
  else
    echo "PyYAML not importable; installing requirements.txt."
  fi
  if ! python3 -m pip install --quiet -r requirements.txt; then
    cat >&2 <<'EOF'
FAIL: could not install requirements.txt automatically.

If you are on a managed Python (Homebrew, system, etc.) and pip refuses
to install into the system site-packages (PEP 668), choose one of:

  - Use a virtual environment:
      python3 -m venv .venv
      source .venv/bin/activate
      python3 -m pip install -r requirements.txt
      bash scripts/verify_all.sh

  - Or pass --break-system-packages explicitly (at your own risk):
      python3 -m pip install --break-system-packages -r requirements.txt
EOF
    exit 1
  fi
fi

installed_version="$(python3 -c "import yaml; print(yaml.__version__)" 2> /dev/null || true)"
if [[ "${installed_version}" != "${REQUIRED_PYYAML}" ]]; then
  echo "FAIL: PyYAML ${REQUIRED_PYYAML} is required, but ${installed_version:-none} is importable after installation." >&2
  exit 1
fi

step "2/4  Verify SHA-256 checksums for every pinned artefact"
shasum -a 256 -c checksums.txt

step "3/4  Run regenerator with built-in --verify-checksums on feasibility outputs"
python3 reproduce_tables.py --verify-checksums > /tmp/regen_actual.txt

step "4/4  Diff regenerator output against committed reference_output.md"
if diff -q /tmp/regen_actual.txt reference_output.md > /dev/null; then
  echo "OK: regenerator output is byte-identical to reference_output.md"
else
  echo "FAIL: regenerator output diverges from reference_output.md" >&2
  diff /tmp/regen_actual.txt reference_output.md >&2 || true
  exit 1
fi

printf "\n\033[1;32mAll Tier A checks passed.\033[0m\n"
printf "Tables 2 and 3 in /tmp/regen_actual.txt match the manuscript byte-for-byte.\n"
