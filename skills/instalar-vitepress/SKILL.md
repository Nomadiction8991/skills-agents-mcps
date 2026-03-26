---
name: instalar-vitepress
description: "Configura VitePress em projeto ainda sem docs/.vitepress/config.(js|ts). Detecta ambiente, instala dependências no local correto e publica em http://localhost:5173."
---
# Instalar VitePress

## Objetivo
Deixar a documentação mínima do projeto funcionando com VitePress.

## Use quando
- `docs/.vitepress/config.js` e `docs/.vitepress/config.ts` não existem
- o projeto ainda não tem estrutura inicial de docs

## Não use quando
- VitePress já está configurado; nesse caso apenas ajuste ou inicie a doc existente
- a tarefa é só editar conteúdo dentro de `docs/`

## Guarda inicial
```bash
[ -f docs/.vitepress/config.js ] || [ -f docs/.vitepress/config.ts ]
```
Se o comando passar, não execute esta skill.

## Fluxo
1. `@vitepress-detectar`
2. Se Docker/container → `@vitepress-docker`
3. Se sem Node fora de Docker → `@vitepress-node`
4. `@vitepress-configurar`
5. `@vitepress-iniciar`

## Regras críticas
- Detecte o ambiente antes de instalar qualquer coisa.
- Fora de Docker, prefira NVM para Linux/WSL; não use `apt` para Node.
- Em fluxo Docker, não instale Node na máquina host.
- Preserve `package.json` existente; adicione apenas o que faltar.
- Use os templates em `config/` em vez de reescrever arquivos longos no prompt.
- Crie só a estrutura mínima necessária.
- Em Docker, exponha o dev server com `--host 0.0.0.0`.
- Seja idempotente: evite sobrescrever arquivos já válidos.

## Subskills
- `@vitepress-detectar`: decide o caminho de execução
- `@vitepress-node`: instala Node quando faltar fora de Docker
- `@vitepress-docker`: configura execução via Compose/container
- `@vitepress-configurar`: cria estrutura, scripts e templates
- `@vitepress-iniciar`: sobe e valida o servidor
