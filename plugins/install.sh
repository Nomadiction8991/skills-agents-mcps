#!/usr/bin/env bash
set -euo pipefail

PLUGINS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Instalando plugins: Claude Code ==="
for plugin_dir in "$PLUGINS_DIR"/*/; do
  [ -d "$plugin_dir" ] || continue
  name="$(basename "$plugin_dir")"
  marketplace_json="$plugin_dir/.claude-plugin/marketplace.json"

  if [ ! -f "$marketplace_json" ]; then
    echo "  [skip] $name — sem .claude-plugin/marketplace.json"
    continue
  fi

  echo "  → $name"
  claude plugin marketplace add "$plugin_dir" 2>/dev/null || true
  claude plugin install "$name" 2>/dev/null || \
    claude plugin enable "$name" 2>/dev/null || \
    echo "    aviso: verifique com 'claude plugin list'"
done

echo ""
echo "=== Instalando plugins: Codex ==="
echo "  Codex não possui CLI para instalação direta."
echo "  Configurando marketplace local em ~/.codex/marketplace.json..."

CODEX_CONFIG="$HOME/.codex"
mkdir -p "$CODEX_CONFIG"
marketplace_file="$CODEX_CONFIG/marketplace.json"

entries=""
for plugin_dir in "$PLUGINS_DIR"/*/; do
  [ -d "$plugin_dir" ] || continue
  name="$(basename "$plugin_dir")"
  codex_json="$plugin_dir/.agents/plugins/marketplace.json"
  [ -f "$codex_json" ] || continue

  entries="${entries:+$entries,}
    {\"name\": \"$name\", \"source\": {\"source\": \"local\", \"path\": \"$plugin_dir\"}}"
  echo "  → $name registrado"
done

if [ -n "$entries" ]; then
  cat > "$marketplace_file" <<JSON
{
  "plugins": [$entries
  ]
}
JSON
  echo "  Marketplace salvo em $marketplace_file"
  echo "  Abra o Codex neste repo → /plugins → busque o plugin → Install"
else
  echo "  Nenhum plugin com .agents/plugins/marketplace.json encontrado."
fi

echo ""
echo "✓ Concluído."
