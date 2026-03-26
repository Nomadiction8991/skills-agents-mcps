---
title: "Skill — organizar-commits"
type: skill
updated: 2026-03-26
---

# organizar-commits

Objetivo: analisar mudanças no repositório e organizar commits e branches atômicos seguindo Conventional Commits e Stacked Branches.

Fluxo resumido:
- @pre-condicoes → @analisar-projeto → classificar ULs por intenção → @stacked-branches → @output-format

Regras principais:
- Garantir independência das ULs (base = `main` salvo dependência explícita).
- Nomes de branch sem números sequenciais; usar `<tipo>/<tema>-<resumo>`.
- Separar por intenção, não por arquivo.

Arquivo fonte: `skills/organizar-commits/SKILL.md`
