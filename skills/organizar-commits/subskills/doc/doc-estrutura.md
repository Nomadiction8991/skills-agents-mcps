# @doc-estrutura

## Quando usar
Apenas quando @doc-identificar confirmar que o domínio não tem documentação.

## Decisão: arquivo simples vs. pasta

```
domínio com 1-2 conceitos        → docs/{dominio}.md
domínio com 2+ subtemas          → docs/{dominio}/index.md + docs/{dominio}/{subtema}.md
subtema com conteúdo extenso     → docs/{dominio}/{subtema}/index.md + arquivos específicos
```

Profundidade máxima: 3 níveis. Nunca criar subpasta com menos de 2 arquivos.

## Template: index.md de domínio

```markdown
---
title: "{Domínio}"
domain: "{dominio}"
type: reference
updated: {YYYY-MM-DD}
---

# {Domínio}

> [← Documentação](../index.md)

{1 parágrafo: o que este domínio faz no sistema, em linguagem de produto}

## Visão geral
{comportamento principal — sem código, sem detalhes de implementação}

## Endpoints
| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/api/{dominio}` | {descrição curta} |

## Nesta seção
- [{Subtema A}](./{subtema-a}.md) — {descrição em 1 linha}
- [{Subtema B}](./{subtema-b}.md) — {descrição em 1 linha}
```

## Estrutura raiz de referência

```
docs/
├── index.md                    # índice geral navegável (tipo llms.txt)
├── changelog/
│   ├── index.md
│   └── unreleased.md
├── getting-started/
│   ├── index.md
│   ├── instalacao.md
│   └── configuracao.md
├── reference/
│   ├── index.md
│   ├── comandos.md
│   └── convencoes.md
├── {dominio-1}/
│   └── index.md
└── {dominio-2}/
    ├── index.md
    └── {subtema}.md
```

## docs/index.md — índice geral (padrão llms.txt)

```markdown
---
title: "Documentação — {Nome do Projeto}"
updated: {YYYY-MM-DD}
---

# Documentação

> Este arquivo é o mapa da documentação.
> IA: leia aqui antes de editar qualquer arquivo.

## Domínios do sistema
- [{Domínio 1}](./{dominio-1}/index.md) — {1 linha de descrição}
- [{Domínio 2}](./{dominio-2}/index.md) — {1 linha de descrição}

## Operacional
- [Instalação](./getting-started/instalacao.md)
- [Configuração](./getting-started/configuracao.md)
- [Comandos](./reference/comandos.md)
- [Convenções](./reference/convencoes.md)

## Changelog
- [Unreleased](./changelog/unreleased.md)
- [Histórico](./changelog/index.md)
```

## Após criar estrutura nova

```
1. adicionar link em docs/index.md na seção correta
2. atualizar README.md com link para o novo domínio
3. voltar para @doc-feature para documentar a feature que acionou a criação
```
