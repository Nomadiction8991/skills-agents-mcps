# @vitepress-docker

## Papel
Configurar VitePress em ambiente Docker sem instalar Node na máquina host.
Detectar se já existe docker-compose e adicionar serviço, ou criar container standalone.

## Estratégia

```
projeto tem docker-compose.yml?
  sim → adicionar serviço docs ao compose existente
  não → criar docker-compose.docs.yml separado (não polui o compose principal)
```

## Caso 1 — adicionar ao docker-compose.yml existente

Adicionar o bloco abaixo nos `services:` do arquivo existente:

```yaml
  docs:
    image: node:20-alpine
    working_dir: /app
    volumes:
      - .:/app
    ports:
      - "5173:5173"
    command: sh -c "npm install && npm run docs:dev -- --host 0.0.0.0"
    environment:
      - NODE_ENV=development
```

## Caso 2 — criar docker-compose.docs.yml (standalone)

Criar arquivo `docker-compose.docs.yml` na raiz do projeto:

```yaml
services:
  docs:
    image: node:20-alpine
    working_dir: /app
    volumes:
      - .:/app
      - docs_node_modules:/app/node_modules
    ports:
      - "5173:5173"
    command: >
      sh -c "
        if [ ! -f node_modules/.package-lock.json ]; then
          npm install;
        fi &&
        npm run docs:dev -- --host 0.0.0.0
      "
    environment:
      - NODE_ENV=development

volumes:
  docs_node_modules:
```

## package.json mínimo (criar na raiz se não existir)

```json
{
  "name": "docs",
  "private": true,
  "scripts": {
    "docs:dev":     "vitepress dev docs --host 0.0.0.0",
    "docs:build":   "vitepress build docs",
    "docs:preview": "vitepress preview docs --host 0.0.0.0"
  },
  "devDependencies": {
    "vitepress": "^1.6.3"
  }
}
```

> Se o projeto já tem `package.json`, apenas adicionar os scripts e a devDependency.

## Comandos para iniciar

```bash
# Caso 1 — compose integrado
docker compose up docs

# Caso 2 — compose standalone
docker compose -f docker-compose.docs.yml up

# Rebuild forçado (após mudar package.json)
docker compose -f docker-compose.docs.yml up --build
```

## Acesso após iniciar

```
http://localhost:5173
```

## .gitignore — adicionar se não existir

```
node_modules/
docs/.vitepress/dist/
docs/.vitepress/cache/
```

## .dockerignore — adicionar se não existir

```
node_modules
docs/.vitepress/dist
docs/.vitepress/cache
.git
```

## Após configurar
→ @vitepress-configurar (criar config.js e estrutura de docs)
→ @vitepress-iniciar (iniciar o servidor e verificar acesso)
