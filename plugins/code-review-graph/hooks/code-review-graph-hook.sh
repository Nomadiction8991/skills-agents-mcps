#!/bin/bash
# Wrapper for code-review-graph hooks
# Ensures the command is run even if not in PATH

PLUGIN_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
export PYTHONPATH="$PLUGIN_ROOT:$PYTHONPATH"

# Try global command first
if command -v code-review-graph >/dev/null 2>&1; then
    code-review-graph "$@"
# Try running as python module
else
    # Check if dependencies exist
    if python3 -c "import fastmcp, tree_sitter" >/dev/null 2>&1; then
        python3 -m code_review_graph.cli "$@"
    else
        echo "[code-review-graph] Erro: dependências não encontradas. Execute: pip install code-review-graph" >&2
        exit 1
    fi
fi
