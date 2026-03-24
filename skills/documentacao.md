# @documentacao

## Regra central
Toda UL que chega a um commit DEVE ter documentacao correspondente.
Documentacao e parte do commit — nao e opcional e nao e feita depois.

## Quando criar vs. atualizar

| Tipo de UL (CC) | Acao na doc |
|-----------------|-------------|
| `feat` | CRIAR `docs/features/{nome}.md` + atualizar `CHANGELOG.md` > `[Unreleased] > Added` |
| `fix` | CRIAR `docs/fixes/fix-{nome}.md` + atualizar `CHANGELOG.md` > `[Unreleased] > Fixed` |
| `refactor` | Atualizar doc tecnica relevante em `docs/technical/` |
| `docs` | Atualizar diretamente o arquivo `.md` alvo |
| `chore`/`build`/`ci` | Atualizar `docs/technical/environment.md` se relevante |
| `perf` | Atualizar doc tecnica relevante + CHANGELOG > `[Unreleased] > Changed` |
| Release branch | CRIAR `docs/releases/v{X.Y.Z}.md` + promover CHANGELOG `[Unreleased]` → `[{X.Y.Z}]` |
| Hotfix branch | CRIAR `docs/fixes/fix-{nome}.md` + atualizar CHANGELOG + release doc mais recente |

## Estrutura de pastas — sempre igual em qualquer projeto

```
docs/
├── INDEX.md                    # mapa da doc — entry point para IA
├── CHANGELOG.md                # Keep a Changelog format
├── getting-started/
│   ├── index.md
│   ├── installation.md
│   ├── configuration.md
│   └── quick-start.md
├── guides/
│   ├── index.md
│   ├── usage.md
│   ├── update-flow.md
│   └── troubleshooting.md
├── api/
│   ├── index.md
│   └── v{N}/
│       ├── index.md
│       └── endpoints/
│           └── {resource}.md
├── technical/
│   ├── index.md
│   ├── architecture.md
│   ├── database.md
│   └── environment.md
├── features/
│   ├── index.md
│   └── {feature-name}.md
├── fixes/
│   └── fix-{description}.md
├── releases/
│   ├── index.md
│   └── v{X.Y.Z}.md
├── clients/
│   └── index.md
├── support/
│   ├── index.md
│   ├── faq.md
│   └── known-issues.md
└── templates/
    ├── feature-template.md
    ├── fix-template.md
    ├── release-template.md
    └── guide-template.md
```

## Frontmatter obrigatorio por tipo

### feature
```yaml
---
title: "{NOME DA FEATURE}"
type: feature
date: {YYYY-MM-DD}
status: in-progress        # proposed | in-progress | stable | deprecated
version_introduced: ""
category: ""
tags: []
related: []
description: ""
---
```

### fix
```yaml
---
title: "Fix: {DESCRICAO CURTA}"
type: fix
date: {YYYY-MM-DD}
severity: medium           # critical | high | medium | low
status: resolved
version_fixed: ""
affected_versions: []
issue_ref: ""
tags: []
related: []
root_cause: ""
---
```

### release
```yaml
---
title: "Version {X.Y.Z}"
type: release
version: "{X.Y.Z}"
date: {YYYY-MM-DD}
status: current            # upcoming | current | previous | eol
highlights: []
features: []
fixes: []
previous_version: ""
breaking_changes: false
---
```

## Convencoes de cross-reference

- Sempre usar caminhos relativos com extensao `.md`
  - correto: `[User Auth](../features/user-authentication.md)`
  - errado: `[User Auth](/docs/features/user-authentication.md)`
- Direcao das referencias:
  - CHANGELOG → Release → Feature/Fix
  - Feature/Fix → Release que os incluiu (back-link)
  - Guide → Feature ou Technical que descreve o que o guide usa
- Campo `related` no frontmatter declara relacoes para leitura por IA

## Regras de nomenclatura de arquivos

| Tipo | Padrao | Exemplo |
|------|--------|---------|
| Feature | `{nome-da-feature}.md` | `user-authentication.md` |
| Fix | `fix-{descricao}.md` | `fix-login-timeout.md` |
| Release | `v{X.Y.Z}.md` | `v2.1.0.md` |
| Guide | `{acao}-{topico}.md` | `configure-oauth.md` |
| Meta | `UPPERCASE.md` | `INDEX.md`, `CHANGELOG.md` |
| Diretorios | `kebab-case/` | `getting-started/` |

## CHANGELOG.md — formato Keep a Changelog

```markdown
# Changelog

## [Unreleased]
### Added
- feat: descricao → link para feature doc
### Fixed
- fix: descricao → link para fix doc
### Changed
- refactor/perf: descricao

## [X.Y.Z] - YYYY-MM-DD
### Added
...

[Unreleased]: https://github.com/{org}/{repo}/compare/vX.Y.Z...HEAD
[X.Y.Z]: https://github.com/{org}/{repo}/compare/vX.Y.W...vX.Y.Z
```

## Ordem de operacoes no commit da UL

1. Escrever/atualizar o(s) arquivo(s) de doc
2. `git add docs/`
3. Incluir a doc no MESMO commit da UL — nunca em commit separado
   (exceto branches `docs/*`, que so alteram documentacao)

## Setup do VitePress — primeira vez no projeto

VitePress e uma ferramenta Node.js, nao PHP.
Nao vai no `composer.json` — vai no `package.json` do projeto.

### Verificar se ja esta configurado
```
# VitePress ja existe se qualquer um destes for verdadeiro:
[ -f package.json ] && grep -q "vitepress" package.json  # package.json com vitepress
[ -f docs/.vitepress/config.js ]                          # config ja criada
[ -f docs/.vitepress/config.ts ]                          # config ja criada (TS)
```

### Se NAO estiver configurado — instalar

**Caso 1: projeto Laravel que ja tem package.json (Vite/Inertia)**
```bash
npm install --save-dev vitepress
```
Adicionar scripts ao `package.json` existente:
```json
"scripts": {
  "docs:dev": "vitepress dev docs",
  "docs:build": "vitepress build docs",
  "docs:preview": "vitepress preview docs"
}
```

**Caso 2: projeto sem package.json nenhum**
```bash
npm init -y
npm install --save-dev vitepress
```
Substituir o `package.json` gerado pelo template em `vitepress/package.json`
desta skill (ajustando o nome do projeto).

### Criar a estrutura inicial de docs
```bash
mkdir -p docs/.vitepress
mkdir -p docs/getting-started docs/guides docs/api/v1/endpoints
mkdir -p docs/technical docs/features docs/fixes
mkdir -p docs/releases docs/support docs/templates docs/clients

# Copiar config base
cp {skill}/vitepress/config.js docs/.vitepress/config.js

# Copiar templates
cp {skill}/docs-templates/INDEX-template.md docs/INDEX.md
cp {skill}/docs-templates/CHANGELOG-template.md docs/CHANGELOG.md
cp {skill}/docs-templates/feature-template.md docs/templates/feature-template.md
cp {skill}/docs-templates/fix-template.md docs/templates/fix-template.md
cp {skill}/docs-templates/release-template.md docs/templates/release-template.md
```

### Ajustar o config.js para o projeto
Substituir nos campos marcados:
- `{NOME DO PROJETO}` — nome real do produto
- `{DESCRICAO DO PROJETO}` — descricao curta
- `{org}/{repo}` — usuario/org e nome do repositorio no GitHub

### Adicionar ao .gitignore do projeto
```
# VitePress
docs/.vitepress/dist
docs/.vitepress/cache
node_modules/
```

### Rodar pela primeira vez
```bash
npm run docs:dev    # abre em http://localhost:5173
npm run docs:build  # gera HTML estatico em docs/.vitepress/dist/
```

### Commit do setup inicial
```
chore(docs): adiciona VitePress e estrutura inicial de documentacao

- instala vitepress como devDependency
- cria docs/.vitepress/config.js com sidebar e nav configurados
- cria estrutura de pastas docs/
- adiciona INDEX.md e CHANGELOG.md base
- adiciona templates para feature, fix e release
```