# Changelog

## 3.2.1
- deixou explícito que a skill usa Git apenas para leitura e verificação
- proibiu branch, commit, stash, merge, rebase, reset e outras mutações no repositório
- reforçou a regra em `SKILL.md`, `README.md`, `skill-creator-integration.md` e `@doc-identificar`

## [3.2.0] - 2026-03-26
- torna obrigatória a inspeção inicial de Git antes de qualquer decisão documental
- explicita a ordem recomendada: `git status --short`, `git diff --name-only`, `git diff --stat`, `git diff` e `git diff --cached`
- reforça que a skill documenta mudanças a partir do diff e só entra em modo legado quando não houver trabalho útil em Git

## [3.1.0] - 2026-03-26
- adiciona modo legado para auditar `./docs` quando não houver mudanças no `git status`
- inclui regras para ler, mover, mesclar e refatorar markdowns fora do padrão
- atualiza roteamento e integração para normalização de documentação existente

## [3.0.0] - 2026-03-26
- separa a skill da documentação final do projeto
- troca `docs/` interno por `examples/docs-template/`
- reescreve instruções para operar sempre sobre `./docs` do projeto alvo
- remove template de fix em arquivo novo
- simplifica templates e subskills para reduzir ambiguidade e custo