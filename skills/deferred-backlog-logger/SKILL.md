---
name: deferred-backlog-logger
description: Registre achados fora de escopo em `prompts_futuros.md` durante tarefas de análise, correção ou implementação, sem interromper o pedido principal. Use quando encontrar bugs, vulnerabilidades, inconsistências, problemas de arquitetura, performance, duplicação, código morto ou oportunidades de refatoração que não façam parte direta da tarefa atual, especialmente quando quiser manter o fluxo principal de codificação e o registro de backlog em paralelo.
---

# Deferred Backlog Logger

## Regra

Durante a tarefa atual, mantenha foco no pedido principal.

Quando estiver codificando:

- continue a implementação principal
- anote o achado fora de escopo em paralelo
- só pause se o achado bloquear a tarefa principal

Se encontrar um achado fora de escopo:

1. Não corrija agora.
2. Não interrompa o fluxo principal.
3. Registre o achado em `prompts_futuros.md` na raiz do projeto.
4. Continue imediatamente.

## Formato

Registre cada item assim:

```md
## [Pendente] Título curto do problema

- **Tipo:** bug / refatoração / segurança / performance / arquitetura / melhoria
- **Prioridade sugerida:** baixa / média / alta
- **Arquivo:** caminho/do/arquivo.ext
- **Linha aproximada:** número da linha, se possível
- **Problema encontrado:** explique de forma breve e objetiva
- **Por que não foi corrigido agora:** fora do escopo da tarefa atual
- **Prompt para executar depois:**

```prompt
Analise o arquivo `caminho/do/arquivo.ext` e corrija o seguinte problema: [descrever o problema].
Antes de alterar, explique a causa provável, mostre o plano de correção e depois aplique a alteração com cuidado para não quebrar o comportamento existente.
```
```

## Regras

- Não duplicar itens já existentes.
- Não registrar preferências pequenas de estilo.
- Só registrar achados realmente relevantes.
- Não usar o backlog como desculpa para abandonar a tarefa principal.
