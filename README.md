# skills-agents-mcps

Repositorio de skills compartilhadas para `Codex`, `Claude` e `Copilot`.

## Finalidade

Centralizar skills reutilizaveis para manter o mesmo conjunto de instrucoes entre CLIs.

## Para quem serve

- Quem usa essas CLIs no dia a dia.
- Quem mantem skills compartilhadas entre ambientes.

## Tipo e estado

- Tipo: repositorio de documentacao operacional.
- Estado: em uso, com skills e fluxo de instalacao documentados.
- Fora de escopo atual: MCPs estruturados no repositorio.

## Stack

- `Markdown` para skills e documentacao.
- `bash` e `PowerShell` no fluxo de instalacao.

## Integracoes e MCPs

- Uso compartilhado com `Codex`, `Claude` e `Copilot`.
- Agents estruturados: `agents/frontend-design/openai.yaml` e `agents/organizar-commits/openai.yaml`.
- MCPs estruturados: nenhum no estado atual.

## O que existe hoje

- `interface-design`
- `iniciar-projeto`
- `instalar-skills-agents-mcps`
- `napkin`
- `organizar-commits`
- `php-pro`

## Estrutura

```text
docs/
├── INSTALL.md
└── README.md -> ../README.md

skills/
├── interface-design/
├── iniciar-projeto/
├── instalar-skills-agents-mcps/
├── napkin/
├── organizar-commits/
└── php-pro/

agents/
├── frontend-design/
└── organizar-commits/
```

## Instalacao

O fluxo recomendado esta em `docs/INSTALL.md`.

## Documentacao

Rodar localmente:

```bash
npm run docs:dev
```

Acessar em: `http://localhost:5173`

## Licenca

- Nao ha `LICENSE` na raiz.
