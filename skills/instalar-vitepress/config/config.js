import { defineConfig } from 'vitepress'

// Ajuste os valores marcados com {PROJETO} para o seu projeto
export default defineConfig({
  title: '{NOME DO PROJETO}',
  description: '{DESCRICAO DO PROJETO}',
  lang: 'pt-BR',

  // Pasta raiz dos arquivos .md
  srcDir: '.',

  // Ignorar pasta de templates
  srcExclude: ['templates/**'],

  themeConfig: {
    nav: [
      { text: 'Inicio', link: '/' },
      { text: 'Getting Started', link: '/getting-started/' },
      { text: 'Guides', link: '/guides/' },
      { text: 'API', link: '/api/' },
      { text: 'Tecnico', link: '/technical/' },
      { text: 'Releases', link: '/releases/' },
      { text: 'Changelog', link: '/CHANGELOG' },
    ],

    sidebar: {
      '/getting-started/': [
        {
          text: 'Primeiros Passos',
          items: [
            { text: 'Visao Geral', link: '/getting-started/' },
            { text: 'Instalacao', link: '/getting-started/installation' },
            { text: 'Configuracao', link: '/getting-started/configuration' },
            { text: 'Quick Start', link: '/getting-started/quick-start' },
          ]
        }
      ],

      '/guides/': [
        {
          text: 'Guides',
          items: [
            { text: 'Visao Geral', link: '/guides/' },
            { text: 'Como Usar', link: '/guides/usage' },
            { text: 'Fluxo de Atualizacao', link: '/guides/update-flow' },
            { text: 'Troubleshooting', link: '/guides/troubleshooting' },
          ]
        }
      ],

      '/api/': [
        {
          text: 'API Reference',
          items: [
            { text: 'Visao Geral', link: '/api/' },
            {
              text: 'v1',
              collapsed: false,
              items: [
                { text: 'Introducao', link: '/api/v1/' },
                // Adicione endpoints aqui conforme criados
              ]
            }
          ]
        }
      ],

      '/technical/': [
        {
          text: 'Referencia Tecnica',
          items: [
            { text: 'Visao Geral', link: '/technical/' },
            { text: 'Arquitetura', link: '/technical/architecture' },
            { text: 'Banco de Dados', link: '/technical/database' },
            { text: 'Ambiente', link: '/technical/environment' },
          ]
        }
      ],

      '/features/': [
        {
          text: 'Features',
          items: [
            { text: 'Indice', link: '/features/' },
            // A IA adiciona novos items aqui ao criar cada feature doc
          ]
        }
      ],

      '/releases/': [
        {
          text: 'Releases',
          items: [
            { text: 'Todas as versoes', link: '/releases/' },
            // A IA adiciona cada versao aqui ao criar release doc
          ]
        }
      ],

      '/support/': [
        {
          text: 'Suporte',
          items: [
            { text: 'Visao Geral', link: '/support/' },
            { text: 'FAQ', link: '/support/faq' },
            { text: 'Problemas Conhecidos', link: '/support/known-issues' },
          ]
        }
      ],
    },

    // Busca local
    search: {
      provider: 'local'
    },

    // Links de edicao no GitHub (ajuste a URL)
    editLink: {
      pattern: 'https://github.com/{org}/{repo}/edit/main/docs/:path',
      text: 'Editar esta pagina'
    },

    // Rodape
    footer: {
      message: 'Documentacao do {NOME DO PROJETO}',
    },

    // Navegacao entre paginas
    docFooter: {
      prev: 'Anterior',
      next: 'Proximo'
    },

    outline: {
      label: 'Nesta pagina'
    },

    lastUpdated: {
      text: 'Atualizado em',
    },
  }
})
