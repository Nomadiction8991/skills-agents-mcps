# @vitepress-docker

## Papel
Rodar VitePress em Docker sem instalar Node na máquina host.

## Estratégia
- se já existir `docker-compose.yml` ou `docker-compose.yaml`, adicione um serviço `docs`
- se não existir, crie `docker-compose.docs.yml` usando o template em `config/docker-compose.docs.yml`

## Serviço recomendado
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
    command: sh -c "npm install && npm run docs:dev -- --host 0.0.0.0"
    environment:
      - NODE_ENV=development

volumes:
  docs_node_modules:
```

## Regras
- reutilize `package.json` existente; não sobrescreva
- garanta `--host 0.0.0.0`
- se usar arquivo Compose separado, prefira `docker-compose.docs.yml` para não poluir o compose principal
- depois do compose pronto, siga para `@vitepress-configurar`
