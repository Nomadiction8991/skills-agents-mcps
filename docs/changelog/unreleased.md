---
title: "Changelog - Unreleased"
type: changelog
updated: 2026-03-26
---

# Changelog

## [Unreleased]

### Adicionado
- **Documentação**: a documentação agora tem um índice navegável próprio dentro do VitePress ([ver doc](../README.md))
- **Interface Design**: nova skill para design de interfaces substitui a skill anterior de frontend ([ver doc](../README.md))
- **Getting Started**: nova secao com guias rapidos de instalacao e configuracao ([ver doc](../getting-started/index.md))
- **Reference**: nova secao com comandos e convencoes do repositorio ([ver doc](../reference/index.md))
- **PHP Skill**: skill renomeada para nomenclatura mais simples (`php` em vez de `php-pro`)

### Corrigido
- **Estrutura de Skills**: removidos aninhamentos duplicados (`interface-design/interface-design/` → `interface-design/`)
- **Symlinks**: removido symlink auto-referencial errôneo (`skills/skills`)

### Alterado
- **Documentacao**: o README da raiz agora funciona como mapa curto do repositorio com links para toda a documentacao principal ([ver doc](../README.md))
- **Instalacao**: instruções movidas para `docs/getting-started/instalacao.md`; fluxo agora deixa explicito que a instalacao compartilhada aponta so para `skills` e termina em `iniciar-projeto` ([ver doc](../getting-started/instalacao.md))
- **Iniciar Projeto**: o bootstrap inicial agora preserva `README.md` e `napkin.md`, cria `INSTRUCTIONS.md` e organiza markdowns reais em `docs/` ([ver doc](../README.md))
- **Organizar Commits**: o workflow agora foi dividido em subskills, templates e etapas obrigatorias de documentacao antes dos commits ([ver doc](../README.md))
- **Navegacao do VitePress**: links atualizados para refletir nova estrutura de documentacao ([ver doc](../README.md))
- **PHP Skill**: skill renomeada de `php-pro` para `php` em toda documentação e referencias

### Removido
