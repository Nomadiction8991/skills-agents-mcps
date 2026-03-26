---
title: "Skill — instalar-skills-agents-mcps"
type: skill
updated: 2026-03-26
---

# instalar-skills-agents-mcps

Objetivo: configurar este repositório para ser a fonte compartilhada de `skills` para as CLIs `codex`, `claude` e `copilot`.

O que faz:
- Detecta a pasta `skills` no clone atual e cria/atualiza links simbólicos em `~/.codex/skills`, `~/.claude/skills` e `~/.copilot/skills` apontando para ela.
- Preserva conteúdo existente renomeando para backup se necessário.

Regras importantes:
- Não assumir caminhos fixos — sempre usar o caminho do clone atual.
- Limitar a configuração à pasta `skills`.

Arquivo fonte: `skills/instalar-skills-agents-mcps/SKILL.md`
