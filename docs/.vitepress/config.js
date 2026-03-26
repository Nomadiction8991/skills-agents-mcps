import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'skills-agents-mcps',
  description: 'Skills compartilhadas para Codex, Claude e Copilot.',
  lang: 'pt-BR',
  srcDir: '.',

  themeConfig: {
    nav: [
      { text: 'Inicio', link: '/' },
      { text: 'Guia', link: '/README' },
      { text: 'Instalacao', link: '/getting-started/instalacao' },
      { text: 'Changelog', link: '/changelog/unreleased' }
    ],

    sidebar: {
      '/changelog/': [
        {
          text: 'Changelog',
          items: [
            { text: 'Unreleased', link: '/changelog/unreleased' },
            { text: 'Historico', link: '/changelog/' }
          ]
        }
      ]
    },

    search: {
      provider: 'local'
    },

    outline: {
      label: 'Nesta pagina'
    },

    docFooter: {
      prev: 'Anterior',
      next: 'Proximo'
    },

    lastUpdated: {
      text: 'Atualizado em'
    },

    editLink: {
      pattern: 'https://github.com/Nomadiction8991/skills-agents-mcps/edit/main/docs/:path',
      text: 'Editar esta pagina'
    }
  }
})
