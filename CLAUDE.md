# CLAUDE.md

Guia para Claude Code ao trabalhar neste repositório.

## Visão Geral

Repositório central de **skills, agents, plugins e configs compartilhados** para `Claude`, `Codex` e `Gemini`. **Não é código de produção** — é infraestrutura declarativa consumida pelas CLIs via symlinks.

Estrutura raiz:

- **`skills/`** — skills próprias + symlinks de skills vendoradas em `plugins/`
- **`agents/`** — metadados de agents (`.md` por agent)
- **`plugins/`** — plugins vendorados (caveman, claude-code-optimizer, code-review-graph, context-mode, rtk-ai)
- **`config/`** — configs compartilhadas (`GLOBAL.md`, `claude-settings.json`, `codex-marketplace.json`, `gemini-settings.json`, `caveman-config.json`)
- **`install.sh` / `install.bat`** — instalador unificado (Linux/macOS / Windows)
- **`napkin.md`** — runbook operacional (gitignored, local)
- **`README.md`** — mapa curto para GitHub

## Instalação

Comando único, detecta `claude`, `codex`, `gemini` automaticamente:

```bash
bash install.sh        # Linux/macOS
install.bat            # Windows
```

O instalador cria symlinks em `~/.claude/`, `~/.codex/`, `~/.gemini/` apontando para `skills/`, `agents/`, `config/GLOBAL.md`, settings + hooks dos plugins.

Pré-condição: rodar **dentro** do clone de `skills-agents-mcps` (validado via `git remote`).

## Skills

### Próprias (em `skills/`)

- **start-project** — scaffold de docs; consolida arquivos legados em `CLAUDE.md`
- **organizar-commits** — commits atômicos, Conventional Commits, stacked branches
- **organizar-documentacao** — reorganiza docs por Diátaxis
- **interface-design** — design system para dashboards/SaaS UIs
- **napkin** — runbook operacional em `/napkin.md`
- **php** — implementação PHP 8.3+ (Laravel/Symfony/Yii, strict types, PSR)
- **revisao perssonalizada** — revisão Laravel com histórico em `memoria.md`

### Vendoradas (symlinks → `plugins/*/skills/`)

- **caveman**: caveman, caveman-commit, caveman-help, caveman-review, compress
- **context-mode**: context-mode, context-mode-ops, ctx-doctor, ctx-insight, ctx-purge, ctx-stats, ctx-upgrade, diagnose, grill-me, grill-with-docs, improve-codebase-architecture, tdd
- **code-review-graph**: build-graph, debug-issue, explore-codebase, refactor-safely, review-changes, review-delta, review-pr

`skills/.system` reservado pelo Codex — preservar.

### Adicionar skill própria

1. `skills/<nome>/SKILL.md` com frontmatter `name`, `description`
2. Reinstalar via `bash install.sh` (symlinks já apontam para `skills/`, sem etapa extra)

### Editar skill

Editar `SKILL.md` direto. É o prompt executado pela CLI.

## Configs (`config/`)

- **`GLOBAL.md`** — link em `~/.claude/CLAUDE.md`, `~/.codex/CODEX.md`, `~/.gemini/GEMINI.md`
- **`claude-settings.json`** — link em `~/.claude/settings.json` (hooks, permissões)
- **`codex-marketplace.json`** — link em `~/.codex/marketplace.json`
- **`gemini-settings.json`** — link em `~/.gemini/settings.json`
- **`caveman-config.json`** — link em `~/.config/caveman/config.json`

Editar arquivo em `config/` → afeta todas as instalações via symlink.

## Agents (`agents/`)

Arquivos `.md` independentes: `arch-reviewer`, `doc-generator`, `migration-reviewer`, `security-scanner`, `test-writer`. Linkados em `~/.claude/agents/`.

## Plugins (`plugins/`)

Cada subdiretório é um plugin com `skills/` + `hooks/` próprios. `install.sh` linka:
- skills do plugin → `skills/<nome>` da raiz (já feito)
- hooks → `~/.claude/hooks/`, `~/.codex/hooks/`, `~/.gemini/hooks/` via `link_hooks()`
- hooks específicos por IA: `plugins/<plugin>/hooks/<claude|codex|gemini>/`

`plugins/auto-wire-hooks.js` automatiza wiring quando hooks mudam.

## Convenções

- **Git**: 1 UL (user-level intent) = 1 commit = 1 branch (ver `skills/organizar-commits/SKILL.md`)
- **Idioma**: PT-BR para usuários; inglês para nomes técnicos
- **Caveman ultra**: ativo por default (configurado em `config/caveman-config.json`)

## Regras de Domínio (de `napkin.md`)

1. **`skills/skills`** (symlink self-referencial) é artefato de erro — nunca commitar.
2. **`~/.codex/skills/.system`** reservado pelo Codex — preservar ao instalar; criar links por skill, não substituir pasta inteira.
3. **`README.md` raiz vs `docs/README.md`**: contextos diferentes. Raiz = mapa GitHub. Sem symlink forçado.
4. **`start-project`** preserva `README.md`, `napkin.md`, `INSTRUCTIONS.md` na raiz; move outros `.md` para `docs/`; cria `docs/README.md` → `../README.md`. Não sobrescreve existentes.
5. **`start-project`** termina apontando: rode `/init` em `Claude` ou `Copilot`.
6. **`instalar-skills-agents-mcps`** (legado, hoje `install.sh`) → final aponta `start-project`.

## Limitações Shell

- `rg` pode estar ausente → usar `find`, `grep`, `sed`
- `git rebase --show-current-operation` pode não existir → checar `.git/rebase-merge` / `.git/rebase-apply`
- `napkin.md` é gitignored → não confiar em diff para sincronizar; ler arquivo direto

## Preferências do Usuário

- Inglês: usuário aprendendo. Misturar PT+EN, gradualmente. Corrigir gentilmente quando errar.
- Bundled PR único > muitos pequenos para refactors aqui.
- Centralizar ativos reutilizáveis no repo; evitar contexto externo.

## Estado Atual

`docs/` **não existe** no repositório (referenciado por README.md mas ausente). VitePress não configurado. Se documentação navegável for necessária, criar via skill `organizar-documentacao` ou `instalar-vitepress` (skill desativada — ver `install.sh`).

## Links

- **Runbook**: [napkin.md](napkin.md) (gitignored, local)
- **Instalador**: [install.sh](install.sh) / [install.bat](install.bat)
- **Configs globais**: [config/GLOBAL.md](config/GLOBAL.md)

[//]: # "DR:5,explanation,0.90"
