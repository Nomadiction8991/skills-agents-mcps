# @separar-hunks

## Sinais de dependencia entre ULs
- novo campo em schema/config usado por outra UL
- mudanca de tipo/interface/assinatura
- rename/move de arquivo
- refactor-base reutilizado
- branch B nao compila sem branch A

## Tamanho de UL
- Ideal: 50–200 linhas | Maximo: ~400 linhas | Tempo de review: <60min
- Excecao: refactoring mecanico pode ter 300–500 linhas mas MUST ser commit separado

## Receita de staging
```
# 1) ler estado
git status --short && git diff && git diff --cached

# 2) stagear por tipo de arquivo:
git add -p                    # rastreados: staging parcial por hunk
git add -N <f> && git add -p  # novos: intent-to-add antes do -p
git add <f>                   # binarios/lockfiles/gerados: staging integral
git mv <orig> <dest> && git add <dest>  # rename+mudanca: sempre UL unica

# 3) quando 's' nao divide (hunks contiguos):
git add -e   # editar patch manualmente
# regras: deletar linhas '+' = nao stagear; mudar '-' para ' ' = manter remocao
# se ainda impossivel: agrupar na mesma UL e documentar no body

# 4) verificar
git diff --cached && git diff

# 5) corrigir se necessario
git restore --staged <arquivo>
```

## Tipos de arquivo
| Tipo | Comando | Regra |
|------|---------|-------|
| Rastreado | `git add -p` | staging parcial |
| Novo (untracked) | `git add -N <f> && git add -p` | quirk: -N sem add posterior = arquivo vazio no commit |
| Binario/imagem | `git add <f>` | vai inteiro para a UL que o gerou |
| Lockfile | `git add <f>` | vai para a UL-pai (quem gerou a dependencia) |
| Rename+mudanca | `git mv + git add` | sempre UL unica, nunca dividir |

## .gitattributes recomendado
```
*.png binary
*.jpg binary
*.pdf binary
```
