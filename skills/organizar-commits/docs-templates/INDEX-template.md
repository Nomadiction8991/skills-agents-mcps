---
title: "Documentação — {Nome do Projeto}"
type: index
updated: {YYYY-MM-DD}
---

# Documentação — {Nome do Projeto}

> **Para IA:** leia este arquivo antes de criar ou editar qualquer doc.
> Ele mapeia onde cada tipo de conteúdo fica e quando atualizar cada arquivo.

---

## Domínios do sistema

| Domínio | Descrição | Arquivo |
|---------|-----------|---------|
| [{Domínio 1}](./{dominio-1}/index.md) | {1 linha de descrição} | `docs/{dominio-1}/` |
| [{Domínio 2}](./{dominio-2}/index.md) | {1 linha de descrição} | `docs/{dominio-2}/` |

## Operacional

- [Instalação](./getting-started/instalacao.md)
- [Configuração](./getting-started/configuracao.md)
- [Comandos](./reference/comandos.md)
- [Convenções](./reference/convencoes.md)

## Changelog

- [Unreleased](./changelog/unreleased.md)
- [Todas as versões](./changelog/index.md)

---

## Regras de manutenção (para IA)

| Tipo de commit | Criar | Atualizar |
|---------------|-------|-----------|
| `feat({dominio})` | subtema se necessário | `docs/{dominio}/index.md` + CHANGELOG |
| `fix({dominio})` | — | trecho exato no arquivo do domínio + CHANGELOG |
| `chore` operacional | — | `getting-started/` ou `reference/` |
| `release` | `changelog/vX.Y.Z.md` | `changelog/index.md` + README |

**Nunca** criar arquivo de doc fora de `docs/` (exceto README, INSTRUCTIONS, CLAUDE, AGENTS).
