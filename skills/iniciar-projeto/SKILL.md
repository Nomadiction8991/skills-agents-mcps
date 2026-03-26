---
name: iniciar-projeto
description: "Inicializar a documentacao na raiz: consolidar `INSTRUCTIONS.md` a partir de `CLAUDE.md`, `AGENTS.md` e `.github/instructions.md` quando existirem, limpar legados, mover `.md` reais para `docs/` e criar links simbolicos relativos sem sobrescrever indevidamente."
---

# Iniciar Projeto

## Objetivo
Preparar o scaffolding inicial de documentacao e consolidar arquivos legados de instrucao em um unico `INSTRUCTIONS.md`.

## Regras criticas
- Ler conteudo apenas de `INSTRUCTIONS.md`, `CLAUDE.md`, `AGENTS.md` e `.github/instructions.md` quando existirem como arquivos reais para consolidacao.
- Fora da consolidacao acima, nao ler conteudo de outros arquivos; use apenas nome, tipo, existencia e caminho.
- Se nao houver nenhum arquivo de instrucao legado nem `INSTRUCTIONS.md`, criar `INSTRUCTIONS.md` vazio.
- Se nao houver `README.md`, criar vazio.
- Nao sobrescrever arquivos, diretorios ou links simbolicos existentes, exceto ao regravar `INSTRUCTIONS.md` durante a consolidacao dos arquivos de instrucao.
- A consolidacao deve preservar todo o conteudo encontrado em ordem deterministica: `INSTRUCTIONS.md` existente, `CLAUDE.md`, `AGENTS.md`, `.github/instructions.md`.
- Depois da consolidacao, apagar apenas os arquivos reais `CLAUDE.md`, `AGENTS.md` e `.github/instructions.md` que foram absorvidos.
- Criar aliases apenas por link simbolico relativo; nunca por copia.
- Antes de mover arquivos para `docs/`, validar todos os destinos. Se houver qualquer colisao, informar e parar sem mover nada.
- Se o ambiente bloquear criacao de symlink, informar e parar.

## Procedimento
1. Garantir a existencia de `docs/` e `.github/`.
2. Consolidar os arquivos de instrucao:
   - Se existir qualquer um entre `INSTRUCTIONS.md`, `CLAUDE.md`, `AGENTS.md` e `.github/instructions.md` como arquivo real, juntar seus conteudos na ordem definida e gravar o resultado em `INSTRUCTIONS.md`.
   - Se nenhum deles existir, criar `INSTRUCTIONS.md` vazio.
3. Garantir `README.md` vazio quando ausente.
4. Apagar `CLAUDE.md`, `AGENTS.md` e `.github/instructions.md` se existirem como arquivos reais e ja tiverem sido consolidados.
5. Criar apenas quando ausentes os links simbolicos relativos:
   - `CLAUDE.md` -> `INSTRUCTIONS.md`
   - `AGENTS.md` -> `INSTRUCTIONS.md`
   - `docs/README.md` -> `../README.md`
   - `.github/instructions.md` -> `../INSTRUCTIONS.md`
6. Listar apenas arquivos `.md` reais da raiz.
7. Ignorar `INSTRUCTIONS.md`, `README.md`, `napkin.md`, `CLAUDE.md`, `AGENTS.md`, `.github/instructions.md` e qualquer link simbolico.
8. Para cada arquivo elegivel, validar que `docs/<mesmo-nome>` nao existe.
9. Se houver conflito, informar os caminhos em conflito e encerrar sem sobrescrever.
10. Mover todos os arquivos elegiveis para `docs/`.

## Resposta ao usuario
Responder apenas:

> rode a skill `/init` no `Claude` ou no `Copilot` com o seguinte prompt:
>
> ```
> /init escreva o arquivo em PT-BR
> ```
