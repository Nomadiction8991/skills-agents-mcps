title: "Instalação"
updated: 2026-03-26

# Instalação

As instruções principais de instalação estão abaixo — movidas para este arquivo para manter a documentação de uso localizada em `getting-started`.

Resumo rápido:

1. Clone o repositório
2. Execute o fluxo descrito em `skills/instalar-skills-agents-mcps/SKILL.md` para criar links nas CLIs
3. Verifique os links em `~/.codex/skills`, `~/.claude/skills` e `~/.copilot/skills`

Se precisar de passos específicos para seu ambiente (Windows/WSL/Docker), consulte a seção apropriada neste mesmo arquivo.

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

## 2) Executar o método mais simples

Com a CLI de sua preferência aberta na raiz do repositório clonado, peça para seguir as instruções do arquivo `skills/instalar-skills-agents-mcps/SKILL.md`.

Exemplo de prompt dentro da CLI:

```text
Siga as instruções de skills/instalar-skills-agents-mcps/SKILL.md deste repositório para instalar este clone nas CLIs.
```

Esse processo cria ou atualiza os links para que `codex`, `claude` e `copilot` usem a mesma pasta `skills` deste clone, independentemente de onde o repositório esteja.

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

Você deve ver os caminhos de `skills` apontando para a pasta `skills` dentro do repositório clonado.

## 4) Próximo passo

Depois da instalação, execute a skill `iniciar-projeto` no `Claude`, no `Copilot` ou no `Codex`.

## Veja também

- [Índice da documentação](../README.md)
- [Página inicial](../index.md)
- [Changelog unreleased](../changelog/unreleased.md)
