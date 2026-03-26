# @vitepress-configurar

## Papel
Criar a estrutura mínima do VitePress com templates reutilizáveis.

## Estrutura mínima
```bash
mkdir -p docs/.vitepress docs/getting-started docs/reference docs/changelog
```

## package.json
- se não existir, copie `config/package.json` para a raiz
- se existir, adicione apenas:
  - scripts `docs:dev`, `docs:build`, `docs:preview`
  - `devDependencies.vitepress`

## Config do VitePress
- copie `config/config.js` para `docs/.vitepress/config.js`
- substitua placeholders: `{NOME DO PROJETO}`, `{DESCRICAO DO PROJETO}`, `{org}`, `{repo}`

## Home
- copie `config/index.md` para `docs/index.md`
- substitua placeholders do projeto

## Dependências fora de Docker
```bash
npm install
```

## Arquivos auxiliares
Garanta estas entradas em `.gitignore`:
```gitignore
node_modules/
docs/.vitepress/dist/
docs/.vitepress/cache/
```

## Critério de pronto
- `docs/.vitepress/config.js` existe
- `docs/index.md` existe
- `package.json` tem scripts de docs
- `vitepress` está nas devDependencies

## Próximo passo
`@vitepress-iniciar`
