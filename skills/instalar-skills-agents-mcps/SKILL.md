---
name: instalar-skills-agents-mcps
description: "WORKFLOW SKILL — Compartilha a pasta `skills` do clone atual entre Codex, Claude e Copilot."
---

# Instalar skills compartilhadas

## Objetivo
Fazer `~/.codex/skills`, `~/.claude/skills` e `~/.copilot/skills` apontarem para a pasta `skills` do clone atual.

## Escopo
- Usar apenas a pasta `skills` deste repositório.
- Não configurar `agents`, `MCPs` ou extensão do VS Code.

## Procedimento
1. Confirmar que a execução está na raiz do repositório `skills-agents-mcps`.
2. Resolver o caminho real do clone atual.
3. Confirmar que a pasta `<repo>/skills` existe. Se não existir, parar e informar o erro.
4. Para cada destino abaixo:
   - `~/.codex/skills`
   - `~/.claude/skills`
   - `~/.copilot/skills`
   aplicar estas regras:
   - se já for link simbólico, atualizar para `<repo>/skills`;
   - se existir como pasta normal, renomear para backup e criar o link;
   - se não existir, criar o link.
5. Verificar que os três destinos apontam para `<repo>/skills`.

## Regras
- Nunca assumir caminho fixo do repositório.
- Sempre usar o caminho real do clone em execução.
- Preservar conteúdo existente antes de substituir pasta normal por link.
- Limitar a configuração à pasta `skills`.
- Parar em caso de erro estrutural.

## Resposta ao usuário
Responder apenas:

> execute a skill `/iniciar-projeto` no `Claude`, no `Copilot` ou no `Codex`.
