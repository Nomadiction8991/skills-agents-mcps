---
title: "Skill — iniciar-projeto"
type: skill
updated: 2026-03-26
---

# iniciar-projeto

Objetivo: criar a scaffolding inicial para um projeto alvo — criar `INSTRUCTIONS.md` e `README.md` vazios quando ausentes, organizar arquivos `.md` reais da raiz para `docs/` e criar links simbólicos relativos sem sobrescrever.

Quando usar:
- Ao inicializar um repositório novo alvo que precisa padronizar documentação local.

Regras principais:
- Não sobrescrever arquivos existentes.
- Não escrever conteúdo nos arquivos vazios criados.
- Mover apenas `.md` reais, preservando `INSTRUCTIONS.md`, `README.md` e `napkin.md`.
- Criar links simbólicos relativos quando ausentes (ex.: `docs/README.md` → `../README.md`).

Arquivo fonte: `skills/iniciar-projeto/SKILL.md`
