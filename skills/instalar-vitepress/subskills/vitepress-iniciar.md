# @vitepress-iniciar

## Papel
Iniciar o servidor VitePress e confirmar que está acessível.
Adaptar o comando ao ambiente detectado.

## Comandos por ambiente

### Linux / macOS / WSL (Node nativo)

```bash
npm run docs:dev
# acesso: http://localhost:5173
```

### Docker — compose integrado

```bash
docker compose up docs
# acesso: http://localhost:5173
```

### Docker — compose standalone

```bash
docker compose -f docker-compose.docs.yml up
# acesso: http://localhost:5173
```

### Windows nativo (sem WSL)

```powershell
npm run docs:dev
# acesso: http://localhost:5173
```

## Verificação após iniciar

```bash
# confirmar que o servidor está respondendo
curl -s -o /dev/null -w "%{http_code}" http://localhost:5173
# deve retornar: 200
```

Se retornar erro de conexão, aguardar 5-10 segundos (VitePress demora para compilar na primeira vez).

## Problemas comuns

| Erro | Causa | Solução |
|------|-------|---------|
| `EADDRINUSE: address already in use` | porta 5173 ocupada | `npm run docs:dev -- --port 5174` |
| `Cannot find module 'vitepress'` | deps não instaladas | `npm install` |
| Docker: `connection refused` | `--host` ausente | garantir `--host 0.0.0.0` no comando |
| `docs/index.md not found` | estrutura não criada | → @vitepress-configurar |

## Acesso quando publicado online

```
Ambiente local:     http://localhost:5173
VPS/servidor:       http://{IP-DO-SERVIDOR}:5173
Build estático:     npm run docs:build
                    serve docs/.vitepress/dist/ com nginx/apache
```

## Parar o servidor

```bash
Ctrl+C   # encerra o processo
```

## Adicionar ao README do projeto

Após tudo funcionando, adicionar no `README.md`:

```markdown
## Documentação

Rodar localmente:
\`\`\`bash
npm run docs:dev
\`\`\`
Acessar em: http://localhost:5173
```
