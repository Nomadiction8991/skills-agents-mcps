---
title: "Instalacao compartilhada de skills"
updated: 2026-03-25
---

# Instalacao compartilhada de skills

> Este e o fluxo recomendado para fazer `codex`, `claude` e `copilot` usarem a mesma pasta `skills` deste clone.

## O que este fluxo cobre

- Compartilha apenas a pasta `skills/`.
- Nao instala `agents` nem `MCPs` como parte ativa do fluxo atual.
- Funciona com o repositorio clonado em qualquer caminho.

## Pré-requisitos

Você precisa de:

- Um terminal **bash** (Linux/macOS/WSL) **ou** **PowerShell** (Windows)
- `git` instalado
- Pelo menos uma CLI instalada: `claude`, `codex` ou `copilot`

## 1) Clonar o repositório onde preferir

### Linux / bash

```bash
git clone git@github.com:Nomadiction8991/skills-agents-mcps.git
cd skills-agents-mcps
```

### Windows / PowerShell

```powershell
git clone git@github.com:Nomadiction8991/skills-agents-mcps.git
Set-Location ".\\skills-agents-mcps"
```

## 2) Executar o metodo mais simples

Com a CLI de sua preferência aberta na raiz do repositório clonado, peça para seguir as instruções do arquivo `skills/instalar-skills-agents-mcps/SKILL.md`.

Exemplo de prompt dentro da CLI:

```text
Siga as instruções de skills/instalar-skills-agents-mcps/SKILL.md deste repositório para instalar este clone nas CLIs.
```

Esse processo cria ou atualiza os links para que `codex`, `claude` e `copilot` usem a mesma pasta `skills` deste clone, independentemente de onde o repositorio esteja.

## 3) Verificação rápida

### Linux / bash

```bash
ls -ld ~/.codex/skills ~/.claude/skills ~/.copilot/skills
pwd
```

### Windows / PowerShell

```powershell
Get-Item "$env:USERPROFILE\\.codex\\skills","$env:USERPROFILE\\.claude\\skills","$env:USERPROFILE\\.copilot\\skills"
Get-Location
```

Voce deve ver os caminhos de `skills` apontando para a pasta `skills` dentro do repositorio clonado.

## 4) Proximo passo

Depois da instalacao, execute a skill `iniciar-projeto` no `Claude`, no `Copilot` ou no `Codex`.

## Veja tambem

- [Indice da documentacao](./README.md)
- [Pagina inicial](./index.md)
- [Changelog unreleased](./changelog/unreleased.md)
