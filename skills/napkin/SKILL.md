---
name: napkin
description: |
  Mantenha um napkin por repositório como um guia operacional continuamente curado
  (não um log de sessão). Ativa em TODA sessão. Leia e faça a curadoria antes
  de trabalhar, mantenha apenas orientações recorrentes de alto valor,
  organize por categorias ordenadas por prioridade e limite cada categoria a
  no máximo 10 itens. O napkin fica em `/napkin.md` e deve ser escrito em
  PT-BR.
---

# Napkin

Você mantém um guia operacional em markdown por repositório, não um log cronológico. O
napkin deve ser continuamente curado para reutilização rápida em sessões
futuras.

**Esta skill está sempre ativa. Em toda sessão. Sem gatilho.**

## Início da sessão: ler e curar

Primeira coisa de toda sessão: leia `/napkin.md` antes de qualquer outra ação.
Internalize o conteúdo e aplique-o em silêncio. Não anuncie que leu. Apenas
use o que sabe.

Toda vez que ler, faça a curadoria imediatamente:

- Repriorize os itens por importância, do maior para o menor.
- Una duplicados e remova notas obsoletas ou de baixo sinal.
- Mantenha apenas orientações recorrentes e frequentes.
- Garanta que cada item tenha uma ação explícita em `Faça isto em vez disso`.
- Respeite o limite por categoria, no máximo 10 itens.
- Escreva o conteúdo de `/napkin.md` em PT-BR.

Se ainda não existir um napkin, crie em `/napkin.md`:

```markdown
# Runbook do Napkin

## Regras de Curadoria
- Repriorize a cada leitura.
- Mantenha apenas notas recorrentes e de alto valor.
- Máximo de 10 itens por categoria.
- Cada item inclui data + "Faça isto em vez disso".

## Execução e Validação (Prioridade Máxima)
1. **[YYYY-MM-DD] Regra curta**
   Faça isto em vez disso: ação concreta e repetível.

## Shell e Confiabilidade de Comandos
1. **[YYYY-MM-DD] Regra curta**
   Faça isto em vez disso: ação concreta e repetível.

## Regras de Comportamento do Domínio
1. **[YYYY-MM-DD] Regra curta**
   Faça isto em vez disso: ação concreta e repetível.

## Diretrizes do Usuário
1. **[YYYY-MM-DD] Diretriz**
   Faça isto em vez disso: siga exatamente esta preferência.
```

Adapte as categorias ao repositório, mas preserve a estrutura e a ordem de
prioridade. Não use entradas cruas no estilo diário de bordo.

## Atualizações contínuas do runbook

Atualize durante o trabalho sempre que aprender algo reutilizável.

O que entra:

- Pegadinhas frequentes ou comportamentos surpreendentes neste repositório ou cadeia de ferramentas.
- Diretrizes do usuário que afetam comportamento recorrente.
- Táticas não óbvias que funcionam repetidamente.

O que não entra:

- Notas pontuais de linha do tempo.
- Pós-mortens verbosos sem ação reutilizável.
- Logs de erro sem orientação em `Faça isto em vez disso`.

Requisitos do formato:

- Inclua a data de adição (`[YYYY-MM-DD]`).
- Inclua um título curto para a regra.
- Inclua uma linha explícita `Faça isto em vez disso:`.
- Mantenha o texto curto e orientado à ação.
- Escreva as entradas de `/napkin.md` em PT-BR.

## Política de categoria e prioridade

- Organize as notas por categoria.
- Mantenha cada categoria ordenada por importância decrescente.
- Reavalie categoria e prioridade sempre que editar.
- Máximo de 10 itens por categoria; se passar disso, remova os menos prioritários.
- Prefira menos itens de alto sinal a uma cobertura ampla.

## Regra prática

Pense no napkin como uma base viva de conhecimento para aumentar velocidade e
confiabilidade de execução no futuro, não como um arquivo de histórico.

## Exemplo de entrada

```markdown
1. **[2026-02-21] `rg` falha com listas de caminhos expandidas demais**
   Faça isto em vez disso: execute `rg` nas raízes dos diretórios ou itere os arquivos com `while IFS= read -r`.
```
