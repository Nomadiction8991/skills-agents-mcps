---
title: "Skill — organizar-documentacao"
type: skill
updated: 2026-03-26
---

# organizar-documentacao

Objetivo: manter `./docs` coerente com o código, auditar e normalizar markdowns legados e documentar alterações detectadas via Git.

Modos:
- Modo mudança: quando há diffs relevantes no Git — seguir `@doc-identificar`.
- Modo legado: quando não há mudanças no Git — auditar e normalizar `DOCS_ROOT`.

Regras principais:
- Git é somente leitura; usar `git status`, `git diff` e `git log` para decidir ações.
- Um arquivo = um objetivo; um tipo Diátaxis por arquivo.
- Atualizar changelog quando houver impacto externo.

Arquivo fonte: `skills/organizar-documentacao/SKILL.md`
