---
name: iniciar-projeto
description: "Criar `INSTRUCTIONS.md` e `README.md` vazios na raiz quando ausentes, organizar `.md` em `docs/` preservando `README.md` e `napkin.md` na raiz, e criar links simbolicos relativos sem sobrescrever."
---

# Iniciar Projeto

## Regras — sem excecao
- Nao ler o conteudo dos arquivos do repositorio para inferir contexto; so verificar existencia, tipo e nome dos caminhos necessarios para o scaffolding inicial.
- Nao escrever conteudo dentro de `INSTRUCTIONS.md` nem de `README.md`; se precisarem ser criados, devem ficar vazios.
- Nao sobrescrever arquivos ou links simbolicos existentes.
- Criar aliases apenas por link simbolico relativo — nunca por copia.
- Antes de mover arquivos, validar colisoes de destino em `docs/`; se houver conflito, informar e parar.
- Se o ambiente bloquear symlink, informar e parar.

## Fluxo

1. Se `INSTRUCTIONS.md` nao existir na raiz, criar arquivo vazio.
2. Se `README.md` nao existir na raiz, criar arquivo vazio.
3. Se `docs/` nao existir na raiz, criar a pasta.
4. Identificar apenas os arquivos `.md` reais da raiz. Ignorar `INSTRUCTIONS.md`, `README.md`, `napkin.md` e qualquer link simbolico ja existente.
5. Antes de mover, verificar se cada arquivo `.md` real da raiz que sera movido tem destino livre em `docs/<mesmo-nome>`. Se algum destino ja existir, informar conflito e parar sem sobrescrever.
6. Mover para `docs/` todos os arquivos `.md` reais da raiz, exceto `INSTRUCTIONS.md`, `README.md` e `napkin.md`.
7. Se `.github/` nao existir, criar a pasta.
8. Criar os links simbolicos abaixo apenas quando ausentes:
   - `CLAUDE.md` -> `INSTRUCTIONS.md`
   - `AGENTS.md` -> `INSTRUCTIONS.md`
   - `docs/README.md` -> `../README.md`
   - `.github/instructions.md` -> `../INSTRUCTIONS.md`

## Resposta ao usuario

Ao finalizar, responder apenas:

> rode a skill `/init` no `Claude` ou no `Copilot` com o seguinte prompt:
>
> ```
> /init escreva o arquivo em PT-BR
> ```
