import { defineConfig } from 'vitepress'

export default defineConfig({
  title: '{NOME DO PROJETO}',
  description: '{DESCRICAO DO PROJETO}',
  lang: 'pt-BR',
  srcDir: '.',
  srcExclude: ['templates/**', 'node_modules/**'],

  themeConfig: {
    nav: [
      { text: 'Início', link: '/' },
      { text: 'Primeiros passos', link: '/getting-started/' },
      { text: 'Referência', link: '/reference/' },
      { text: 'Changelog', link: '/changelog/unreleased' }
    ],

    sidebar: [
      {
        text: 'Primeiros passos',
        items: [
          { text: 'Visão geral', link: '/getting-started/' },
          { text: 'Instalação', link: '/getting-started/instalacao' },
          { text: 'Configuração', link: '/getting-started/configuracao' }
        ]
      },
      {
        text: 'Referência',
        items: [
          { text: 'Comandos', link: '/reference/comandos' },
          { text: 'Convenções', link: '/reference/convencoes' }
        ]
      },
      {
        text: 'Changelog',
        items: [
          { text: 'Unreleased', link: '/changelog/unreleased' },
          { text: 'Histórico', link: '/changelog/' }
        ]
      }
    ],

    search: { provider: 'local' },
    outline: { label: 'Nesta página' },
    docFooter: { prev: 'Anterior', next: 'Próximo' },
    lastUpdated: { text: 'Atualizado em' },
    editLink: {
      pattern: 'https://github.com/{org}/{repo}/edit/main/docs/:path',
      text: 'Editar esta página'
    }
  }
})
