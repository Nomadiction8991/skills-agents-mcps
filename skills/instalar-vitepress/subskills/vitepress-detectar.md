# @vitepress-detectar

## Papel
Classificar o ambiente e definir o próximo passo.

## Checagens
```bash
# já configurado?
[ -f docs/.vitepress/config.js ] || [ -f docs/.vitepress/config.ts ]

# container ativo?
[ -f /.dockerenv ]
grep -qE "docker|containerd|kubepods" /proc/1/cgroup 2>/dev/null

# projeto usa compose?
[ -f docker-compose.yml ] || [ -f docker-compose.yaml ]

# SO base
uname -s
uname -r
printf '%s' "$OS"

# Node/npm
node --version 2>/dev/null
npm --version 2>/dev/null

# package.json / vitepress
[ -f package.json ]
grep -q '"vitepress"' package.json 2>/dev/null
```

## Roteamento
- se `docs/.vitepress/config.(js|ts)` existir → parar a skill
- se estiver dentro de container ou houver fluxo Docker/Compose como padrão do projeto → `@vitepress-docker`
- se não houver Node fora de Docker → `@vitepress-node`
- caso contrário → `@vitepress-configurar`

## Saída interna
```text
ambiente: docker | linux | wsl | macos | windows
node: sim | nao
vitepress: configurado | nao-configurado
proximo: @vitepress-docker | @vitepress-node | @vitepress-configurar | parar
```
