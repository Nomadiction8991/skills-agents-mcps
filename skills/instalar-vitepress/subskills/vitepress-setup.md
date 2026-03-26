# @vitepress-setup

## Papel
Instalar e configurar VitePress automaticamente.
Detectar ambiente → rotear para subskill correta → deixar doc acessível.

## Quando usar
- Projeto sem VitePress configurado ainda
- Primeira vez que a skill de doc é usada no projeto

## Fluxo de detecção

```
1. detectar ambiente        → @vitepress-detectar
2. instalar Node se preciso → @vitepress-node
3. configurar VitePress     → @vitepress-configurar
4. iniciar servidor         → @vitepress-iniciar
```

## Checklist de verificação inicial

```bash
# VitePress já existe?
[ -f docs/.vitepress/config.js ] || [ -f docs/.vitepress/config.ts ]

# Node existe?
node --version 2>/dev/null

# Dentro de Docker?
[ -f /.dockerenv ] || grep -q docker /proc/1/cgroup 2>/dev/null

# package.json tem vitepress?
[ -f package.json ] && grep -q "vitepress" package.json
```

## Resultado esperado ao finalizar

```
✓ docs/.vitepress/config.js configurado
✓ docs/index.md criado (página inicial)
✓ servidor acessível em http://localhost:5173
✓ comando registrado para iniciar: npm run docs:dev
```

## Carregar sob demanda
| Situação detectada | Subskill |
|--------------------|---------|
| Ambiente desconhecido | @vitepress-detectar primeiro |
| Docker no projeto | @vitepress-docker |
| Linux/WSL sem Node | @vitepress-node → @vitepress-configurar |
| Node já existe | @vitepress-configurar direto |
| Já configurado | @vitepress-iniciar direto |
