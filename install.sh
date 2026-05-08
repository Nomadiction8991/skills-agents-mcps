#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Validate: must be inside skills-agents-mcps
if ! git -C "$REPO_ROOT" remote -v 2>/dev/null | grep -qi "skills-agents-mcps"; then
  echo "✗ Execute a partir do repositório skills-agents-mcps." >&2
  exit 1
fi

# Detect tools
HAS_CLAUDE=0; command -v claude >/dev/null 2>&1 && HAS_CLAUDE=1
HAS_CODEX=0; [ -d "$HOME/.codex" ] && HAS_CODEX=1
HAS_GEMINI=0; [ -d "$HOME/.gemini" ] && HAS_GEMINI=1

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  [ -e "$dst" ] || [ -L "$dst" ] && rm -rf "$dst"
  ln -s "$src" "$dst"
  echo "  ✓ $dst → $src"
}

CLEAN=0
for arg in "$@"; do
  case "$arg" in
    --clean) CLEAN=1 ;;
  esac
done

if [ $CLEAN -eq 1 ]; then
  echo "=== Limpeza Profunda (--clean) ==="
  echo "  → Removendo bancos de dados e logs..."
  rm -rf "$HOME/.claude/context-mode" "$HOME/.gemini/context-mode"
  rm -rf "$HOME/.claude/hooks" "$HOME/.gemini/hooks"
  echo "  → Matando processos node pendentes (best effort)..."
  pkill -f "context-mode" || true
  echo ""
fi

echo "=== Detectando Ferramentas ==="
[ $HAS_CLAUDE -eq 1 ] && echo "  [OK] Claude Code detectado" || echo "  [--] Claude Code não encontrado"
[ $HAS_CODEX -eq 1 ] && echo "  [OK] Codex detectado" || echo "  [--] Codex não encontrado"
[ $HAS_GEMINI -eq 1 ] && echo "  [OK] Gemini detectado" || echo "  [--] Gemini não encontrado"
echo ""

echo "=== Instalando Dependências de Plugins ==="
# 1. code-review-graph (Python)
if command -v python3 >/dev/null 2>&1; then
    echo "  → Configurando dependências Python (code-review-graph)..."
    python3 -m pip install -e "$REPO_ROOT/plugins/code-review-graph" --quiet || \
    python3 -m pip install mcp fastmcp tree-sitter tree-sitter-language-pack networkx watchdog --quiet || \
    echo "    aviso: falha ao instalar dependências python. Verifique o pip."
else
    echo "  [!] Python3 não encontrado. O Grafo de Conhecimento pode falhar."
fi

# 2. context-mode (Node)
if command -v npm >/dev/null 2>&1; then
    echo "  → Configurando dependências Node (context-mode)..."
    (cd "$REPO_ROOT/plugins/context-mode" && npm install --quiet) || echo "    aviso: falha no npm install do context-mode."
fi
echo ""

if [ $HAS_CLAUDE -eq 1 ] || [ $HAS_CODEX -eq 1 ] || [ $HAS_GEMINI -eq 1 ]; then
  link "$REPO_ROOT/config/caveman-config.json" "$HOME/.config/caveman/config.json"
fi

link_hooks() {
  local ia="$1"
  local dst_dir="$2"
  echo "Instalando hooks para $ia em $dst_dir..."
  [ -d "$dst_dir" ] || [ -L "$dst_dir" ] && rm -rf "$dst_dir"
  mkdir -p "$dst_dir"
  for plugin_dir in "$REPO_ROOT/plugins"/*/; do
    [ -d "$plugin_dir/hooks" ] || continue
    
    # 1. Hooks genéricos
    for hfile in "$plugin_dir/hooks"/*; do
      [ -f "$hfile" ] || continue
      hname="$(basename "$hfile")"
      [ "$hname" == "hooks.json" ] && continue
      ln -sf "$hfile" "$dst_dir/$hname"
    done
    
    # 2. Hooks específicos da IA (ex: plugins/rtk-ai/hooks/claude)
    local ia_hook_dir="$plugin_dir/hooks/$ia"
    if [ -d "$ia_hook_dir" ]; then
      for hfile in "$ia_hook_dir"/*; do
        [ -f "$hfile" ] || continue
        hname="$(basename "$hfile")"
        ln -sf "$hfile" "$dst_dir/$hname"
      done
    fi
  done
}

if [ $HAS_CLAUDE -eq 1 ]; then
  echo "Configurando Claude..."
  link "$REPO_ROOT/skills"                   "$HOME/.claude/skills"
  link "$REPO_ROOT/agents"                   "$HOME/.claude/agents"
  link "$REPO_ROOT/config/GLOBAL.md"           "$HOME/.claude/CLAUDE.md"
  link "$REPO_ROOT/config/claude-settings.json" "$HOME/.claude/settings.json"
  link_hooks "claude" "$HOME/.claude/hooks"
fi

if [ $HAS_CODEX -eq 1 ]; then
  echo "Configurando Codex..."
  link "$REPO_ROOT/skills"                   "$HOME/.codex/skills"
  link "$REPO_ROOT/agents"                   "$HOME/.codex/agents"
  link "$REPO_ROOT/config/GLOBAL.md"           "$HOME/.codex/CODEX.md"
  link "$REPO_ROOT/config/codex-marketplace.json" "$HOME/.codex/marketplace.json"
  link_hooks "codex" "$HOME/.codex/hooks"
fi

if [ $HAS_GEMINI -eq 1 ]; then
  echo "Configurando Gemini..."
  link "$REPO_ROOT/skills"                   "$HOME/.gemini/skills"
  # Gemini usa nomes de ferramentas diferentes, usamos a pasta gemini/
  if [ -d "$REPO_ROOT/agents/gemini" ]; then
    link "$REPO_ROOT/agents/gemini"            "$HOME/.gemini/agents"
  else
    link "$REPO_ROOT/agents"                   "$HOME/.gemini/agents"
  fi
  link "$REPO_ROOT/config/GLOBAL.md"           "$HOME/.gemini/GEMINI.md"
  link "$REPO_ROOT/config/gemini-settings.json" "$HOME/.gemini/settings.json"
  link_hooks "gemini" "$HOME/.gemini/hooks"
fi
echo ""

echo "=== Vinculando Skills/Agents dos Plugins ==="
for plugin_dir in "$REPO_ROOT/plugins"/*/; do
  [ -d "$plugin_dir" ] || continue
  pname="$(basename "$plugin_dir")"
  
  # Link skills do plugin
  if [ -d "${plugin_dir}skills" ]; then
    for sdir in "${plugin_dir}skills"/*/; do
      [ -d "$sdir" ] || continue
      sname="$(basename "$sdir")"
      [ $HAS_CLAUDE -eq 1 ] && link "$sdir" "$HOME/.claude/skills/$sname"
      [ $HAS_CODEX -eq 1 ]  && link "$sdir" "$HOME/.codex/skills/$sname"
      [ $HAS_GEMINI -eq 1 ] && link "$sdir" "$HOME/.gemini/skills/$sname"
    done
  fi

  # Link agents do plugin
  if [ -d "${plugin_dir}agents" ]; then
    for adir in "${plugin_dir}agents"/*/; do
      [ -d "$adir" ] || continue
      aname="$(basename "$adir")"
      [ $HAS_CLAUDE -eq 1 ] && link "$adir" "$HOME/.claude/agents/$aname"
      [ $HAS_CODEX -eq 1 ]  && link "$adir" "$HOME/.codex/agents/$aname"
      [ $HAS_GEMINI -eq 1 ] && link "$adir" "$HOME/.gemini/agents/$aname"
    done
  fi
done
echo ""

if [ $HAS_CLAUDE -eq 1 ]; then
  echo "=== Instalando Plugins (Claude Code Native) ==="
  PLUGINS_DIR="$REPO_ROOT/plugins"
  for plugin_dir in "$PLUGINS_DIR"/*/; do
    [ -d "$plugin_dir" ] || continue
    name="$(basename "$plugin_dir")"
    marketplace_json="$plugin_dir/.claude-plugin/marketplace.json"

    if [ ! -f "$marketplace_json" ]; then
      continue
    fi

    echo "  → $name"
    claude plugin marketplace add "$plugin_dir" 2>/dev/null || true
    claude plugin install "$name" 2>/dev/null || \
      claude plugin enable "$name" 2>/dev/null || \
      echo "    aviso: verifique com 'claude plugin list'"

    if [ -f "$plugin_dir/install.sh" ] && [ "$name" != "install.sh" ]; then
      echo "    Executando instalador interno de $name..."
      bash "$plugin_dir/install.sh" || echo "    aviso: falha no instalador de $name"
    fi
  done
  echo ""
fi

echo "=== Wiring Plugin Hooks (All Platforms) ==="
node "$REPO_ROOT/plugins/auto-wire-hooks.js"

echo ""
echo "✓ Instalação concluída. Próximo passo: /start-project em qualquer projeto."
