---
title: "Skill — instalar-vitepress"
type: skill
updated: 2026-03-26
---

# instalar-vitepress

Objetivo: automatizar a instalação e configuração do VitePress para a documentação do projeto, detectando ambiente (Docker, Node, WSL, Windows) e criando a estrutura mínima (`docs/.vitepress/config.js`, `docs/index.md`, `package.json` com scripts).

Quando usar:
- Quando `docs/.vitepress/config.js` (ou `.ts`) não existir.

Fluxo resumido:
- Detectar ambiente → configurar (ou usar Docker) → adicionar scripts no `package.json` → iniciar/verificar servidor em `http://localhost:5173`.

Arquivo fonte: `skills/instalar-vitepress/SKILL.md`
