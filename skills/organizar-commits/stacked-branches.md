# @stacked-branches

## Regras de stack
```
branch independente → SEMPRE main/master  (mesmo que outra UL exista)
branch dependente   → branch da UL que ela precisa para funcionar
pilhas paralelas    → ULs independentes viram pilhas separadas em main
profundidade max    → 3–5 branches por stack
```

### Decisao de base — checklist antes de git switch -c
1. Esta UL compila/funciona sem qualquer outra UL pendente? → sim = main
2. Ela importa/usa algo criado por outra UL? → sim = branch dessa UL
3. Ela so faz sentido logico apos outra UL? → sim = branch dessa UL
Se nenhum dos itens 2 ou 3 for verdadeiro: BASE = MAIN, sem excecao.

## Numeracao nn
- Sequencial global por ordem de criacao (01, 02, 03...)
- Pilhas paralelas nao renumeradas: ex 01+02 na pilha A, 03 na pilha B
- Nunca renumerar ao remover UL do meio

## Nome de branch
```
<tipo>/<tema>/<nn>-<resumo>
ex: feat/auth/03-token-refresh
    fix/pagamentos/02-valor-negativo
```

## Receita de criacao — passo a passo

### 1) Determinar a base
```
se independente  → git switch main
se dependente    → git switch <branch-da-UL-pai>
```

### 2) Criar a branch a partir da base correta
```
git switch -c <tipo>/<tema>/<nn>-<resumo>
```

### 3) Stagear as mudancas da UL (ver @separar-hunks)

### 4) Commitar abrindo o editor
```
git commit               # NUNCA usar -m para corpo detalhado
git commit -F <arquivo>  # alternativa: corpo salvo em arquivo
```

### Exemplo completo — 3 ULs, 2 pilhas

Cenario: UL1 e docs (independente), UL2 e config (independente), UL3 usa a config da UL2.

```
# UL 1 — independente → sai de main
git switch main
git switch -c docs/geral/01-readme
git add -p && git commit

# UL 2 — independente → sai de main (NAO sai da UL1)
git switch main
git switch -c chore/config/02-json-base
git add -p && git commit

# UL 3 — depende da UL 2 → sai da branch da UL 2
git switch chore/config/02-json-base
git switch -c feat/pagamentos/03-usar-json
git add -p && git commit
```

Grafo resultante:
```
main
├── docs/geral/01-readme        (PR → main)
└── chore/config/02-json-base   (PR → main)
    └── feat/pagamentos/03-usar-json  (PR → chore/config/02-json-base)
```

## Ajustes pos-commit
```
git commit --amend                      # corrigir ultimo commit
git commit --fixup=<hash>               # criar fixup para commit anterior
git commit --fixup=amend:<hash>         # substituir mensagem (Git 2.32+)
git rebase -i --autosquash <base>       # aplicar fixups
```

## Rebase em cadeia (Git 2.38+)
```
git rebase main --update-refs           # atualiza toda a stack de uma vez
git push --force-with-lease <remote> <branch>
```

Limitacoes de --update-refs:
- nao atualiza branches em outro worktree
- nao atualiza remote-tracking branches nem tags

Quando branch do meio e mergeada:
```
git switch <proxima-branch>
git rebase --update-refs main
git push --force-with-lease
# repetir em cascata para branches dependentes
```

## PR ordering
```
branch independente → PR para main/master
branch dependente   → PR para branch-pai
```
- MUST mergear da base para o topo
- Botao "Squash and merge" do GitHub nao funciona para PRs intermediarios
- Comunicar posicao: "[Stack 2/3] tipo(escopo): descricao" no titulo do PR
