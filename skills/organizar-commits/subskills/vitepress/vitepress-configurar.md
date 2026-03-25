# @vitepress-configurar

## Papel
Criar ou atualizar config.js, estrutura de pastas e página inicial do VitePress.
Executar após Node disponível (nativo ou Docker).

## 1) package.json

Se não existir, criar na raiz:

```json
{
  "name": "{nome-do-projeto}-docs",
  "private": true,
  "scripts": {
    "docs:dev":     "vitepress dev docs",
    "docs:build":   "vitepress build docs",
    "docs:preview": "vitepress preview docs"
  },
  "devDependencies": {
    "vitepress": "^1.6.3"
  }
}
```

Se já existir, adicionar apenas os scripts e devDependency sem sobrescrever o restante.

## 2) Instalar dependências (fora do Docker)

```bash
npm install
```

## 3) Estrutura de pastas mínima

```bash
mkdir -p docs/.vitepress
mkdir -p docs/getting-started
mkdir -p docs/reference
mkdir -p docs/changelog
```

## 4) docs/.vitepress/config.js

Criar o arquivo. Substituir `{NOME}`, `{DESCRICAO}`, `{org}`, `{repo}`:

```js
import { defineConfig } from 'vitepress'

export default defineConfig({
  title: '{NOME DO PROJETO}',
  description: '{DESCRICAO DO PROJETO}',
  lang: 'pt-BR',
  srcDir: '.',
  srcExclude: ['templates/**', 'node_modules/**'],

  themeConfig: {
    nav: [
      { text: 'Início',        link: '/'                        },
      { text: 'Primeiros passos', link: '/getting-started/'     },
      { text: 'Referência',    link: '/reference/'              },
      { text: 'Changelog',     link: '/changelog/unreleased'    },
    ],

    sidebar: [
      {
        text: 'Primeiros passos',
        items: [
          { text: 'Visão geral',  link: '/getting-started/'          },
          { text: 'Instalação',   link: '/getting-started/instalacao' },
          { text: 'Configuração', link: '/getting-started/configuracao'},
        ]
      },
      {
        text: 'Referência',
        items: [
          { text: 'Comandos',    link: '/reference/comandos'    },
          { text: 'Convenções',  link: '/reference/convencoes'  },
        ]
      },
      {
        text: 'Changelog',
        items: [
          { text: 'Unreleased',  link: '/changelog/unreleased'  },
          { text: 'Histórico',   link: '/changelog/'            },
        ]
      },
    ],

    search:   { provider: 'local' },
    outline:  { label: 'Nesta página' },
    docFooter:{ prev: 'Anterior', next: 'Próximo' },
    lastUpdated: { text: 'Atualizado em' },

    editLink: {
      pattern: 'https://github.com/{org}/{repo}/edit/main/docs/:path',
      text: 'Editar esta página'
    },
  }
})
```

## 5) docs/index.md — página inicial

```markdown
---
layout: home

hero:
  name: "{NOME DO PROJETO}"
  text: "Documentação"
  tagline: "{DESCRICAO EM 1 LINHA}"
  actions:
    - theme: brand
      text: Primeiros passos
      link: /getting-started/
    - theme: alt
      text: Referência
      link: /reference/

features:
  - title: Instalação
    details: Como instalar e configurar o projeto.
    link: /getting-started/instalacao
  - title: Referência
    details: Comandos, convenções e padrões.
    link: /reference/comandos
  - title: Changelog
    details: O que mudou em cada versão.
    link: /changelog/unreleased
---
```

## 6) .gitignore — adicionar se não estiver

```
node_modules/
docs/.vitepress/dist/
docs/.vitepress/cache/
```

## Após configurar
→ @vitepress-iniciar
