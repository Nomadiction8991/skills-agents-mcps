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
      { text: 'Skills', link: '/skills/index' },
      { text: 'Reference', link: '/reference/index' },
      { text: 'Changelog', link: '/changelog/unreleased' }
    ],

    sidebar: {
      '/getting-started/': [
        {
          text: 'Começando',
          items: [
            { text: 'Guia rápido', link: '/getting-started/index' },
            { text: 'Instalação', link: '/getting-started/instalacao' },
            { text: 'Configuração', link: '/getting-started/configuracao' }
          ]
        }
      ],
      '/skills/': [
        {
          text: 'Skills',
          items: [
            { text: 'Índice', link: '/skills/index' },
            { text: 'iniciar-projeto', link: '/skills/iniciar-projeto' },
            { text: 'instalar-skills-agents-mcps', link: '/skills/instalar-skills-agents-mcps' },
            { text: 'instalar-vitepress', link: '/skills/instalar-vitepress' },
            { text: 'interface-design', link: '/skills/interface-design' },
            { text: 'napkin', link: '/skills/napkin' },
            { text: 'organizar-commits', link: '/skills/organizar-commits' },
            { text: 'organizar-documentacao', link: '/skills/organizar-documentacao' },
            { text: 'php-pro', link: '/skills/php-pro' }
          ]
        }
      ],
      '/reference/': [
        {
          text: 'Referência',
          items: [
            { text: 'Índice', link: '/reference/index' },
            { text: 'Comandos', link: '/reference/comandos' },
            { text: 'Convenções', link: '/reference/convencoes' }
          ]
        }
      ],
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
