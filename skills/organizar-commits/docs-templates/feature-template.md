---
title: "{Nome da Feature}"
domain: "{dominio}"
type: how-to
updated: {YYYY-MM-DD}
related: []
---

# {Nome da Feature}

> [← {Domínio}](../index.md)

{1 parágrafo: o que esta feature faz e para que serve — linguagem de produto}

## Como usar

{fluxo principal em comportamento, não em código}

## Endpoints

| Método | Rota | Descrição |
|--------|------|-----------|
| {METHOD} | `/api/{rota}` | {descrição curta} |

## Parâmetros

| Campo | Tipo | Obrigatório | Descrição |
|-------|------|-------------|-----------|
| `{campo}` | string | sim | {descrição} |

## Regras e limites

- {regra de negócio ou limite relevante}

## Exemplo

**Request:**
```http
{METHOD} /api/{rota}
Content-Type: application/json

{
  "{campo}": "{valor}"
}
```

**Response:**
```json
{
  "{campo}": "{valor}"
}
```

## Ver também
- [{Relacionado}]({caminho-relativo}.md)
