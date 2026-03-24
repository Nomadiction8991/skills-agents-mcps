---
title: "Mapa da Documentacao"
type: index
---

# Mapa da Documentacao

> **Para agentes IA:** leia este arquivo antes de criar ou alterar qualquer doc.
> Este arquivo define onde cada tipo de conteudo fica e quando cada doc deve ser atualizada.

## Mapa de diretorios

| Diretorio | Conteudo | Audiencia |
|-----------|----------|-----------|
| `getting-started/` | Instalacao, configuracao, quick start | Devs novos |
| `guides/` | How-to, fluxos de uso, troubleshooting | Devs e suporte |
| `api/v{N}/` | Documentacao de endpoints por versao | Devs integradores |
| `technical/` | Arquitetura, banco, ambiente, componentes | Devs internos |
| `features/` | Uma doc por feature lancada | Devs e PM |
| `fixes/` | Uma doc por fix relevante | Devs e suporte |
| `releases/` | Uma doc por versao lancada | Todos |
| `clients/` | Docs de integracao por cliente | Cliente + suporte |
| `support/` | FAQ, problemas conhecidos, runbook | Suporte |
| `templates/` | Templates para criar novos docs | IA e devs |

## Regra: qual doc criar/atualizar por tipo de branch

| Branch | Criar | Atualizar |
|--------|-------|-----------|
| `feature/{nome}` | `features/{nome}.md` | `CHANGELOG.md` > `[Unreleased] > Added` |
| `fix/{nome}` | `fixes/fix-{nome}.md` | `CHANGELOG.md` > `[Unreleased] > Fixed` |
| `release/v{X.Y.Z}` | `releases/v{X.Y.Z}.md` | `CHANGELOG.md` — promover `[Unreleased]` → `[{X.Y.Z}]` |
| `hotfix/{nome}` | `fixes/fix-{nome}.md` | `CHANGELOG.md` + release doc mais recente |
| `refactor/{nome}` | — | Doc tecnica relevante em `technical/` |
| `docs/{topico}` | Novo `.md` no diretorio correto | `INDEX.md` se estrutura mudar |
| `chore/{nome}` | — | `technical/environment.md` se relevante |

## Convencoes de cross-reference

```
CHANGELOG.md
    └── aponta para → releases/v{X.Y.Z}.md
            └── aponta para → features/{nome}.md
                              fixes/fix-{nome}.md
                                  └── aponta de volta para → releases/v{X.Y.Z}.md
```

- Sempre usar caminhos relativos com `.md`: `[texto](../features/nome.md)`
- Campo `related` no frontmatter declara relacoes para leitura por IA
- Guides apontam para features ou technical que descrevem o que usam

## Quando atualizar o INDEX.md

- Ao adicionar novo diretorio na estrutura de docs
- Ao mudar padrao de nomenclatura de arquivos
- Ao adicionar novo tipo de branch ao workflow

## Padrao de nomenclatura de arquivos

| Tipo | Padrao | Exemplo |
|------|--------|---------|
| Feature | `{nome-da-feature}.md` | `user-authentication.md` |
| Fix | `fix-{descricao}.md` | `fix-login-timeout.md` |
| Release | `v{X.Y.Z}.md` | `v2.1.0.md` |
| Guide | `{acao}-{topico}.md` | `configure-oauth.md` |
| Meta-docs | `UPPERCASE.md` | `INDEX.md`, `CHANGELOG.md` |
| Diretorios | `kebab-case/` | `getting-started/` |
