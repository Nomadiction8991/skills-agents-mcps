# skills-agents-mcps

Base compartilhada de skills operacionais para `Codex`, `Claude` e `Copilot`.
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
- `iniciar-projeto`
- `instalar-skills-agents-mcps`
- `napkin`
- `organizar-commits`
- `php-pro`

## Fluxo recomendado

1. Abra [Instalacao compartilhada](docs/INSTALL.md).
2. Configure `codex`, `claude` e `copilot` para usar a mesma pasta `skills` deste clone.
3. Depois execute a skill `iniciar-projeto` no repositorio em que voce vai trabalhar.
4. Consulte o [changelog unreleased](docs/changelog/unreleased.md) antes de reorganizar skills ou commits.
