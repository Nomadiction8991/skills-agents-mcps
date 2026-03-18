# Instalação unificada de Skills, MCPs e Agents

> Este é o método recomendado para instalar e manter `skills`, `MCPs` e `agents` em uma única base para várias CLIs. O repositório pode ser clonado em qualquer lugar.

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
Set-Location ".\skills-agents-mcps"
```

## 2) Executar o método mais simples

Com a CLI de sua preferência aberta na raiz do repositório clonado, peça para seguir as instruções do arquivo `Skills/instalar-skills-agents-mcps/SKILL.md`.

Exemplo de prompt dentro da CLI:

```text
Siga as instruções de Skills/instalar-skills-agents-mcps/SKILL.md deste repositório para instalar este clone nas CLIs.
```

Esse processo cria ou atualiza os links para que `codex`, `claude` e `copilot` usem a mesma pasta `Skills` deste clone, independentemente de onde o repositório esteja.

## 3) Verificação rápida

### Linux / bash

```bash
ls -ld ~/.codex/skills ~/.claude/skills ~/.copilot/skills
pwd
```

### Windows / PowerShell

```powershell
Get-Item "$env:USERPROFILE\.codex\skills","$env:USERPROFILE\.claude\skills","$env:USERPROFILE\.copilot\skills"
Get-Location
```

Você deve ver os caminhos de `skills` apontando para a pasta `Skills` dentro do repositório clonado.
