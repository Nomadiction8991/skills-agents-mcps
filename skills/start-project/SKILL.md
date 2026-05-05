---
name: start-project
description: "Consolida CLAUDE.md"
---

# Iniciar Projeto

**Objetivo:** CLAUDE.md operacional PT-BR. Symlinks estrutura.

## CLAUDE.md

Repo-local PT-BR (operacional).

1. Leia existente → detecta idioma
2. Inglês → reescreva PT-BR, preserve (Architecture, Dev Commands, Key files)
3. Ausente → `/init` automático PT-BR
4. Symlinks → preserve

`/init` indisponível → crie manual. Sem commit.

## Symlinks

| Destino | Origem |
|---------|--------|
| `AGENTS.md` | `CLAUDE.md` |

1. Existe → `rm <destino>`
2. `ln -s {origem} {destino}`
3. Valide: `ls -la` → seta OK

