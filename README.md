# skills-agents-mcps

Base compartilhada de skills operacionais para `Codex`, `Claude` e `Gemini`.
Este README e um mapa curto do repositorio e aponta para a documentacao detalhada em `docs/`.

## Resumo do sistema

- Repositorio de documentacao operacional, nao de codigo de producao.
- `skills/` e a fonte compartilhada consumida pelas CLIs suportadas.
- `agents/` publica metadados ligados a algumas skills.
- MCPs estruturados ainda nao fazem parte do escopo atual do repositorio.

## Documentacao

- [Inicio da documentacao](docs/index.md)
- [Indice da documentacao](docs/README.md)
- [Instalacao compartilhada](docs/INSTALL.md)
- [Changelog unreleased](docs/changelog/unreleased.md)
- [Historico do changelog](docs/changelog/index.md)

## Estrutura resumida

- [`skills/`](skills) contem as skills reutilizaveis publicadas no repositorio.
- [`agents/`](agents) contem os metadados de agents associados a algumas skills.
- [`docs/`](docs) concentra o guia navegavel do VitePress e o changelog.

## Skills disponiveis

- `interface-design`
- `start-project`
- `instalar-skills-agents-mcps`
- `napkin`
- `organizar-commits`
- `php`

## Instalação Rápida

1. Clone este repositório.
2. Execute o instalador unificado (Linux/macOS: `bash install.sh` | Windows: `install.bat`).
3. O script detecta automaticamente `Claude`, `Codex` e `Gemini` e configura os symlinks, plugins e hooks.

## Fluxo recomendado

1. Execute o instalador unificado na raiz do repo.
2. Configure seus agentes para usar a pasta `skills` deste clone (feito automaticamente pelo instalador).
3. Use a skill `start-project` no repositório em que você vai trabalhar.
4. Consulte o [changelog unreleased](docs/changelog/unreleased.md) antes de reorganizar skills ou commits.
