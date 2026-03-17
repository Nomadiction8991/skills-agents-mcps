# Instalação inicial das Skills

Este guia configura as skills do repositório `Skills` para uso com as CLIs `claude`, `codex` e `copilot`.

## Pré-requisitos

Você precisa de:

- Um terminal **bash** (Linux/macOS/WSL) **ou** **PowerShell** (Windows)
- `git` instalado
- Pelo menos uma CLI instalada: `claude` **ou** `codex` **ou** `copilot`

> Resultado esperado: as skills das CLIs ficam centralizadas e refletem no uso do Copilot via `~/.copilot/skills`.

## 1) Clonar o repositório em `Documents`

### Linux / bash

```bash
cd ~/Documents/
git clone git@github.com:Nomadiction8991/Skills.git
cd ~/Documents/Skills
```

### Windows / PowerShell

```powershell
Set-Location "$env:USERPROFILE\Documents"
git clone git@github.com:Nomadiction8991/Skills.git
Set-Location "$env:USERPROFILE\Documents\Skills"
```

---

## 2) Método mais simples (recomendado)

Com o repositório já clonado, abra a CLI de sua preferência **dentro da pasta `Skills`** e peça para executar o arquivo `unificar-skills/SKILL.md`.

Exemplo de prompt dentro da CLI:

```text
Execute as instruções de unificar-skills/SKILL.md deste repositório.
```

Esse método usa a própria IA para aplicar os links necessários.

---

## 3) Método alternativo: registrar a skill localmente na CLI

Se preferir, copie a pasta `unificar-skills` para a pasta de skills da CLI escolhida e execute a skill por comando (`/unificar-skills`).

### Linux / bash

```bash
mkdir -p ~/.codex/skills ~/.claude/skills ~/.copilot/skills
cp -R ~/Documents/Skills/unificar-skills ~/.codex/skills/
# ou copie para ~/.claude/skills/ ou ~/.copilot/skills/
```

Depois, abra a CLI escolhida e rode:

```text
/unificar-skills
```

### Windows / PowerShell

```powershell
New-Item -ItemType Directory -Path "$env:USERPROFILE\.codex\skills" -Force | Out-Null
New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude\skills" -Force | Out-Null
New-Item -ItemType Directory -Path "$env:USERPROFILE\.copilot\skills" -Force | Out-Null

Copy-Item -Recurse -Force "$env:USERPROFILE\Documents\Skills\unificar-skills" "$env:USERPROFILE\.codex\skills\"
# ou copie para .claude\skills\ ou .copilot\skills\
```

Depois, abra a CLI escolhida e rode:

```text
/unificar-skills
```

---

## 4) Método manual (sem executar a skill)

Neste modo você cria os links simbólicos manualmente para a pasta clonada.

### Linux / bash

```bash
TARGET="$HOME/Documents/Skills"
mkdir -p "$TARGET"

ln -sfn "$TARGET" "$HOME/.codex/skills"
ln -sfn "$TARGET" "$HOME/.claude/skills"
ln -sfn "$TARGET" "$HOME/.copilot/skills"
```

### Windows / PowerShell

> Abra o PowerShell como administrador (ou habilite Developer Mode no Windows para symlink sem elevação).

```powershell
$target = "$env:USERPROFILE\Documents\Skills"
New-Item -ItemType Directory -Path $target -Force | Out-Null

New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.codex\skills" -Target $target -Force | Out-Null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.claude\skills" -Target $target -Force | Out-Null
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.copilot\skills" -Target $target -Force | Out-Null
```

---

## 5) Verificação rápida

### Linux / bash

```bash
ls -ld ~/.codex/skills ~/.claude/skills ~/.copilot/skills
ls -ld ~/Documents/Skills
```

### Windows / PowerShell

```powershell
Get-Item "$env:USERPROFILE\.codex\skills","$env:USERPROFILE\.claude\skills","$env:USERPROFILE\.copilot\skills"
Get-Item "$env:USERPROFILE\Documents\Skills"
```

Você deve ver os caminhos de `skills` apontando para a pasta do clone.

---

## 6) Solução de problemas

- **`git clone` falha por permissão/chave SSH**: valide sua chave SSH no GitHub ou use URL HTTPS.
- **CLI não encontrada** (`command not found`): instale `claude`, `codex` ou `copilot` e confirme no `PATH`.
- **Falha ao criar symlink no Windows**: rode PowerShell como administrador ou habilite Developer Mode.
- **Link aponta para pasta errada**: remova o link e recrie com o caminho correto de `Documents/Skills`.
