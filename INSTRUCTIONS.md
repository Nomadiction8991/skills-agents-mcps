# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## O que é este repositório

Um repositório centralizado de **skills reutilizáveis** compartilhadas entre CLIs (`Claude`, `Codex`, `Copilot`). Armazena instruções operacionais, não código de produção.

**Stack:** Markdown (skills, documentação), bash/PowerShell (scripts de instalação).

## Estrutura

```
skills/
├── interface-design/        # Design de UIs: dashboards, apps, ferramentas
├── iniciar-projeto/         # Criar INSTRUCTIONS.md/README.md e organizar docs/ preservando README e napkin na raiz
├── instalar-skills-agents-mcps/  # Instalação unificada em todas as CLIs
├── napkin/                  # Runbook operacional continuamente curado
├── organizar-commits/       # Git workflow: ULs, branches empilhadas, CC
└── php-pro/                 # Implementação PHP 8.3+ senior

agents/
├── frontend-design/openai.yaml
└── organizar-commits/openai.yaml

.github/instructions.md      # Instruções específicas do GitHub
```

## Skills ativas em toda sessão (sem gatilho explícito)

### `napkin` — Leia na primeira ação

Antes de qualquer outra coisa, leia `/napkin.md` se existir. Internalize silenciosamente. Mantenha o napkin curado: repriorize, remova obsoleto, máx 10 itens por categoria.

## Linguagem e tom

- **PT-BR** em toda documentação e respostas.
- **Operacional:** instruções acionáveis, não filosóficas.
- **Sem ambiguidade:** regras com exceção exigem "sem exceção" explícito.

## Git workflow (`organizar-commits`)

**Regra central:** 1 UL = 1 intenção = 1 commit = 1 branch (sempre).

- Nunca commitar direto em `main/master`; toda UL independente recebe sua própria branch.
- Empilhar por dependência real, nunca por ordem de criação ou arquivo.
- Usar Conventional Commits.
- Preferência: trabalhe no mesmo diretório; só use `git worktree` se o usuário pedir explicitamente.

[Carregue `skills/organizar-commits/SKILL.md` para detalhes completos: pré-condições, sinais de dependência, modelos de commits.]

## Skills e quando usá-las

| Skill | Gatilho | Carregue quando |
|-------|---------|-----------------|
| `interface-design` | Design de UIs (dashboards, apps, ferramentas) | Design de qualquer interface (NÃO landing pages/marketing) |
| `php-pro` | Implementação PHP/Laravel/Symfony/Yii | Código PHP, tipos, PSR, PHPStan, testes |
| `napkin` | Sempre ativa | Toda sessão: leia primeiro, cuide continuamente |
| `organizar-commits` | Git workflow | Organizar mudanças em commits atômicos, branching |
| `iniciar-projeto` | Novo repo | Criar `INSTRUCTIONS.md` e `README.md` vazios quando ausentes, mover outros `.md` reais da raiz para `docs/` e criar symlinks relativos |
| `instalar-skills-agents-mcps` | Instalação de skills | Linkar este repositório em `~/.claude/skills`, `~/.codex/skills`, etc. |

## Instalação para desenvolvedores

Quando alguém clonar este repo, o fluxo é:

1. Clonar em qualquer lugar.
2. Na raiz, chamar a skill `/instalar-skills-agents-mcps` (ou ler `docs/INSTALL.md` para instruções manuais).
3. Isto cria symlinks em `~/.claude/skills` → `<repo>/skills`, etc.

Depois, qualquer CLI pode invocar skills deste repositório compartilhado.

## Regras de INSTRUCTIONS.md

- Arquivo vazio na raiz, criado por `iniciar-projeto`.
- Será preenchido pelo usuário com instruções específicas do repositório.
- Não edite nem infira conteúdo; isso é responsabilidade do proprietário do repositório.
- `README.md` deve permanecer como arquivo real na raiz.
- `docs/README.md` pode ser um link simbólico para `../README.md` após a organização inicial.
- `napkin.md` deve permanecer na raiz para a skill `napkin`.

## Não há código de teste ou build aqui

Este é um repositório de **documentação operacional**, não de código executável. Não há testes, linters, ou fluxos de CI/CD a rodarem.

## Referências de domínio

Cada skill pode carregar referências específicas. Por exemplo, `php-pro` carrega:

- `referencias/modern-php-features.md` (tipos, enums, fibers, PHP 8.1+)
- `referencias/laravel-padroes.md` (services, repositories, requests, Eloquent)
- `referencias/symfony-patterns.md` (DI, eventos, voters, Doctrine)
- `referencias/testing-quality.md` (PHPUnit, Pest, PHPStan)

[Carregue conforme o contexto da tarefa.]

## Estilo de saída

- **Breve e direto:** pule preamble, vá ao ponto.
- **Operacional:** cada regra tem ação explícita em `Faça isto em vez disso`.
- **Sem presunção:** se o usuário não foi específico, pergunte.
- **Sem cópia:** respostas são contextualizadas, não templates.

---

Para detalhes completos de cada skill, leia `skills/<skill-name>/SKILL.md`.
