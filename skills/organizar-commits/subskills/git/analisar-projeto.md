# @analisar-projeto

## Regra central
Nao agir sem analisar. Toda execucao comeca por aqui.
Proibido criar, mover, renomear ou commitar antes de concluir esta analise.

## Ordem de analise

### 1) Estado do repositorio
```bash
git status --short          # mudancas em aberto
git diff --stat             # arquivos alterados e volume
git log --oneline -10       # contexto recente
```

### 2) Documentacao existente
```bash
find . -name "*.md" -not -path "*/node_modules/*" -not -path "*/.git/*" | sort
```

Para cada `.md` encontrado, identificar:
- e um symlink? (`ls -la` para checar)
- qual o assunto principal?
- esta duplicado com outro arquivo?
- esta desatualizado em relacao ao codigo?
- esta no lugar certo dentro de `docs/`?

### 3) Classificar cada MD encontrado

| Situacao | Acao |
|----------|------|
| Correto e atualizado | manter |
| Correto mas desatualizado | atualizar conteudo |
| Lugar errado | mover para secao correta em `docs/` |
| Duplicado | consolidar em fonte de verdade |
| Grande demais / temas misturados | quebrar em arquivos menores |
| Orfao / ambiguo | mover para `docs/legacy/` ou `docs/reference/` |
| Symlink | nunca mover |

### 4) Nao mover estes arquivos — nunca
- `README.md`
- `INSTRUCTIONS.md`
- `CLAUDE.md`
- `AGENTS.md`
- qualquer arquivo que seja symlink

### 5) Sintese antes de agir

Antes de executar qualquer mudanca, produzir internamente:
- lista de ULs identificadas no `git status`
- lista de docs a criar, atualizar, mover, consolidar ou quebrar
- ordem de execucao proposta

So entao executar.
