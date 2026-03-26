# @vitepress-iniciar

## Papel
Subir o servidor e validar acesso local.

## Comandos
### Node nativo
```bash
npm run docs:dev
```

### Docker com compose principal
```bash
docker compose up docs
```

### Docker com compose separado
```bash
docker compose -f docker-compose.docs.yml up
```

## Validação
```bash
curl -s -o /dev/null -w "%{http_code}" http://localhost:5173
```
Esperado: `200`.

## Correções rápidas
- porta ocupada → `npm run docs:dev -- --port 5174`
- `Cannot find module 'vitepress'` → `npm install`
- Docker sem acesso externo → confirmar `--host 0.0.0.0`
- falta `docs/index.md` ou config → voltar para `@vitepress-configurar`
