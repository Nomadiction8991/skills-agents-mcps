# @doc-feature

## Papel (Diátaxis: How-to + Reference)
Expandir documentação existente do domínio com nova funcionalidade.
Não criar arquivo novo se o domínio já tem documentação.

## Decisão: expandir vs. criar arquivo

```
nova feature no domínio existente
  └─ conteúdo simples (≤1 tela)  → adicionar seção no index.md existente
  └─ conteúdo complexo (>1 tela) → criar {subtema}.md + linkar do index.md

domínio não existe → @doc-estrutura → voltar aqui
```

## O que escrever (voz ativa, imperativo, sem jargão interno)

Cada feature documentada deve cobrir — na ordem:

```
1. O que faz        — 1 parágrafo, linguagem de produto, não de código
2. Como usar        — fluxo principal em comportamento, não implementação
3. Endpoints        — método + rota + descrição curta (se API)
4. Parâmetros       — campos de entrada/saída relevantes para o cliente
5. Regras e limites — casos de borda, limites, comportamentos especiais
6. Exemplo mínimo   — request/response funcional copy-paste
```

## Frontmatter obrigatório no arquivo alvo

```yaml
---
title: "{Nome da Feature}"
domain: "{dominio}"
type: how-to
updated: {YYYY-MM-DD}
related:
  - docs/{dominio}/index.md
---
```

## Não escrever
- código interno, nomes de variáveis, detalhes de implementação
- "por que escolhemos esta abordagem" → vai em `decisions/`
- histórico de versão no corpo → vai no changelog via @doc-changelog

## Após escrever
```
1. atualizar docs/{dominio}/index.md → listar/linkar o novo subtema
2. atualizar README.md → se for domínio novo ou subtema principal
3. acionar @doc-changelog
```
