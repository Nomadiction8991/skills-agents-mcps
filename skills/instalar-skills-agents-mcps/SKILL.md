---
name: instalar-skills-agents-mcps
description: "WORKFLOW SKILL — Instrui a IA a instalar o repositório skills-agents-mcps para uso compartilhado entre Codex, Claude e Copilot."
---

# Instalar o repositório skills-agents-mcps

Use esta skill como uma instrução para a IA configurar este repositório para uso compartilhado entre as CLIs **Codex**, **Claude** e **Copilot**.

O repositório pode estar clonado em qualquer lugar. A IA deve descobrir o caminho atual do repositório em execução e usar a pasta `skills` deste clone como origem. No momento, a instalação deve considerar apenas `skills`, porque ainda não há `agents` ou `MCPs` estruturados aqui.

## Objetivo

Fazer com que as CLIs `codex`, `claude` e `copilot` usem a mesma pasta de `skills` deste repositório.

## Instruções para a IA

1. Confirme que a execução está acontecendo na raiz do repositório `skills-agents-mcps`.
2. Identifique a pasta local `skills` dentro do repositório atual.
3. Use essa pasta `skills` como fonte oficial compartilhada para as CLIs.
4. Crie ou atualize os links simbólicos abaixo para apontarem para essa pasta:
   - `~/.codex/skills`
   - `~/.claude/skills`
   - `~/.copilot/skills`
5. Se algum desses caminhos já existir como pasta normal e não como link simbólico, preserve o conteúdo atual renomeando para um backup antes de criar o link.
6. Ao final, verifique se os três caminhos estão apontando para a pasta `skills` do repositório atual.

## Regras importantes

- Não assumir que o repositório está em `Documentos`, `Documents` ou qualquer outro caminho fixo.
- Sempre usar o caminho real do clone atual.
- Não mexer em pasta de extensão do VS Code.
- Limitar a configuração à pasta `skills` por enquanto.
- Se a pasta `skills` não existir, parar e informar o erro claramente.

## Resultado esperado

Após a execução, `codex`, `claude` e `copilot` devem compartilhar as mesmas `skills` a partir da pasta `skills` deste repositório.
