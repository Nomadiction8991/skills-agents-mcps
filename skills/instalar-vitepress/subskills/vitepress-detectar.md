# @vitepress-detectar

## Papel
Identificar o ambiente de execução antes de qualquer instalação.
Nunca instalar nada sem saber onde está.

## Sequência de detecção

### 1) Detectar Docker

```bash
# Método 1 — arquivo presente dentro de container
[ -f /.dockerenv ] && echo "docker"

# Método 2 — cgroup menciona docker/containerd
grep -qE "docker|containerd|kubepods" /proc/1/cgroup 2>/dev/null && echo "docker"

# Método 3 — docker-compose.yml existe no projeto
[ -f docker-compose.yml ] || [ -f docker-compose.yaml ] && echo "compose"
```

### 2) Detectar SO (quando não é Docker)

```bash
# Linux
uname -s | grep -qi linux && echo "linux"

# WSL dentro de Windows
uname -r | grep -qi microsoft && echo "wsl"

# macOS
uname -s | grep -qi darwin && echo "macos"

# Windows nativo (Git Bash / PowerShell)
[[ "$OS" == "Windows_NT" ]] && echo "windows"
```

### 3) Detectar Node

```bash
node --version 2>/dev/null   # retorna vX.Y.Z se existe
npm --version  2>/dev/null   # confirma npm junto
```

### 4) Detectar package.json e VitePress

```bash
[ -f package.json ]                             && echo "package.json existe"
grep -q '"vitepress"' package.json 2>/dev/null  && echo "vitepress no package.json"
[ -f docs/.vitepress/config.js ]               && echo "config.js existe"
[ -f docs/.vitepress/config.ts ]               && echo "config.ts existe"
```

## Tabela de roteamento por resultado

| Docker? | Node? | Próximo passo |
|---------|-------|--------------|
| Sim (`.dockerenv` ou cgroup) | — | → @vitepress-docker |
| Sim (só compose no projeto) | — | → @vitepress-docker |
| Não | Sim (`node -v` funciona) | → @vitepress-configurar |
| Não | Não | → @vitepress-node → @vitepress-configurar |

## Saída interna

```
ambiente:  docker | linux | wsl | macos | windows
node:      sim | nao
versao:    v20.x.x (se existir)
vitepress: configurado | nao-configurado
proximo:   @vitepress-docker | @vitepress-node | @vitepress-configurar
```
