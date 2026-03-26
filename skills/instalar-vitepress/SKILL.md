---
name: instalar-vitepress
description: "Instala e configura VitePress automaticamente. Detecta o ambiente (Docker, Linux, WSL, Windows) e deixa a documentacao acessivel em http://localhost:5173."
---
# Instalar VitePress

## Estrutura
```
instalar-vitepress/
├── SKILL.md
├── subskills/
│   ├── vitepress-setup.md
│   ├── vitepress-detectar.md
│   ├── vitepress-node.md
│   ├── vitepress-docker.md
│   ├── vitepress-configurar.md
│   └── vitepress-iniciar.md
└── config/
    ├── config.js      ← config base do VitePress
    └── package.json   ← package.json base
```

## Quando usar

Executar quando:
- VitePress ainda nao esta configurado no projeto
- `docs/.vitepress/config.js` nao existe

Verificar antes de qualquer acao:
```bash
[ -f docs/.vitepress/config.js ] || [ -f docs/.vitepress/config.ts ]
```
Se ja existe → nao executar esta skill.

## Fluxo obrigatorio

```
@vitepress-setup
  └─ @vitepress-detectar
       ├─ Docker detectado → @vitepress-docker    → @vitepress-configurar → @vitepress-iniciar
       ├─ Node ausente     → @vitepress-node      → @vitepress-configurar → @vitepress-iniciar
       └─ Node presente    → @vitepress-configurar → @vitepress-iniciar
```

## Resultado esperado

```
✓ docs/.vitepress/config.js configurado
✓ docs/index.md criado (pagina inicial)
✓ package.json com scripts docs:dev, docs:build, docs:preview
✓ servidor acessivel em http://localhost:5173
```

## Subskills

| Subskill | Quando carregar |
|----------|----------------|
| @vitepress-setup | entry point — sempre primeiro |
| @vitepress-detectar | sempre — identifica ambiente |
| @vitepress-node | Linux/WSL/macOS sem Node instalado |
| @vitepress-docker | projeto com Docker ou docker-compose |
| @vitepress-configurar | apos Node disponivel — cria config e estrutura |
| @vitepress-iniciar | apos configurar — sobe servidor e verifica acesso |

## Nao fazer

- nao instalar Node via apt (versao desatualizada) — usar NVM
- nao instalar Node na host se projeto usa Docker — configurar container
- nao sobrescrever package.json existente — apenas adicionar scripts e devDependency
- nao executar se VitePress ja estiver configurado
