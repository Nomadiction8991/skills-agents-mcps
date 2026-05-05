# CLAUDE.md

Guia para Claude Code (claude.ai/code) ao trabalhar com código neste repositório.

## Visão Geral

Repositório de **skills reutilizáveis** para Claude, Copilot e Codex. **NÃO é produção** — é documentação operacional com workflows, padrões e guias para assistentes de IA e desenvolvedores.

- **`skills/`** — definições executadas pelas CLIs
- **`docs/`** — documentação VitePress para usuários
- **`agents/`** — metadados de agents vinculados a skills
- **`napkin.md`** — runbook operacional com regras de alto valor
- **`package.json`** — mínimo; apenas para `npm install` executar docs localmente

## Comandos de Desenvolvimento

### Documentação

```bash
npm install                # Dependências (executa a partir da raiz)
npm run docs:dev          # Servidor de desenvolvimento (http://localhost:5173)
npm run docs:build        # Build (output em docs/.vitepress/dist)
npm run docs:preview      # Preview do build
```

Skills são arquivos declarativos — sem testes, linting ou builds.

## Arquitetura & Estrutura

### Diretório `skills/`

Cada skill contém:
- **SKILL.md** — template principal (prompt executado pelas CLIs)
- Opcional: `references/`, `scripts/`, etc.

**Skills disponíveis:**
1. **start-project** — Scaffold de documentação; consolida arquivos legados em `CLAUDE.md`
2. **instalar-skills-agents-mcps** — Symlinks em `~/.claude/skills`, `~/.copilot/skills`, `~/.codex/skills`
3. **instalar-vitepress** — Setup VitePress para repositório-alvo
4. **organizar-documentacao** — Reorganiza docs por Diátaxis (tutorial, how-to, reference, explanation)
5. **organizar-commits** — Commits atômicos com Conventional Commits + branches stacked
6. **interface-design** — Design system para dashboards, painéis admin, UIs SaaS
7. **napkin** — Runbook operacional em `/napkin.md`
8. **php** — Implementação PHP 8.3+ (Laravel, Symfony, Yii; strict types, PSR)

### Estrutura `docs/` (Diátaxis)

- **`index.md`** — Landing page
- **`README.md`** — Índice navegável (VitePress)
- **`getting-started/`** — Tutoriais e install
  - `instalacao.md` — Instruções de instalação
  - `configuracao.md` — Configuração
- **`skills/`** — Docs por skill
- **`reference/`** — Comandos, convenções, padrões
- **`changelog/`** — Releases e `unreleased.md`

### Arquivos-chave

- **`napkin.md`** — Runbook. Leia antes de qualquer tarefa. **Repriorize a cada leitura.**
- **`.vitepress/config.js`** — Config VitePress. **Após criar docs, SEMPRE configure navbar/sidebar aqui e links em índices** — documentação invisível = inútil.

## Trabalhando com Skills

### Adicionar skill novo

1. Criar `skills/<nome>/SKILL.md` com frontmatter:
   ```yaml
   ---
   name: nome-skill
   description: "Descrição breve"
   ---
   ```

2. Documentação em `docs/skills/<nome>.md`
3. Atualizar navbar/sidebar em `docs/.vitepress/config.js`
4. Linkar em `docs/skills/index.md`
5. Log em `docs/changelog/unreleased.md`

### Editar prompts

Edite `SKILL.md` diretamente. É o que usuários veem ao invocar a skill.

## Convenções do Repositório

- **Git**: 1 UL (user-level intent) = 1 commit = 1 branch (ver `skills/organizar-commits/SKILL.md`)
- **Documentação**: Diátaxis (tutorial, how-to, reference, explanation)
- **Idioma**: PT-BR para usuários; English para detalhes técnicos

## Regras de Domínio (de `napkin.md`)

1. **Visibilidade de docs** — Após criar em `./docs`, configure navbar/sidebar em `docs/.vitepress/config.js` + links em índices. Invisível = inútil.

2. **Sincronização config VitePress** — Novo `.md` em `docs/` precisa estar em `docs/.vitepress/config.js` nav/sidebar.

3. **Comportamento README.md** — `README.md` (root) = GitHub; `docs/README.md` = VitePress. Sem symlinks forçados.

4. **Flow start-project** — Ao rodar em repo-alvo:
   - Preserve `README.md` e `napkin.md` na raiz
   - Mova outros `.md` para `docs/`
   - Crie symlinks relativos: `docs/README.md` → `../README.md` e `.github/copilot-instructions.md` → `../CLAUDE.md`
   - Não sobrescreva existentes

5. **Preservação Codex** — Ao instalar, preserve `~/.codex/skills/.system` (skills internas) e crie links por nome de skill.

6. **Limitações shell** — `rg` pode não estar; use `find`, `grep`, `sed`. `git rebase --show-current-operation` pode falhar; verifique `.git/rebase-merge` ou `.git/rebase-apply`.

7. **Encerramento skills** — Final deve apontar:
   - **start-project**: "rode `/init` em Claude ou Copilot"
   - **instalar-skills-agents-mcps**: "rode `start-project`"

## Preferências-chave

- Consolide arquivos legados (AGENTS.md, .github/copilot-instructions.md) em CLAUDE.md, não separados.
- Ativos reutilizáveis centralizados vs. instruções dependentes de contexto externo.
- PR bundled único vs. muitos pequenos para refactors nesta área.
- Docs descobríveis por VitePress config — não use referências indiretas.

## Rodando docs localmente

```bash
npm install
npm run docs:dev
```

Visite `http://localhost:5173`. Hot-reload em `.md`.

## Links de Referência

- **Entry point**: [docs/index.md](docs/index.md)
- **Install**: [docs/getting-started/instalacao.md](docs/getting-started/instalacao.md)
- **Changelog (unreleased)**: [docs/changelog/unreleased.md](docs/changelog/unreleased.md)
- **Convenções**: [docs/reference/convencoes.md](docs/reference/convencoes.md)
- **Runbook operacional**: [napkin.md](napkin.md)

[//]: # (DR:4,explanation,0.85)
