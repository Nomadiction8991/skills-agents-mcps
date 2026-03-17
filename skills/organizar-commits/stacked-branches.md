# @stacked-branches

## Regras de stack
```
branch independente → SEMPRE nasce de main/master, mas em branch propria
branch dependente   → branch da UL que ela precisa para funcionar
pilhas paralelas    → ULs independentes viram pilhas separadas em main
profundidade max    → 3–5 branches por stack
```

## Regra de branch obrigatoria
```
1 UL = 1 branch
```

- base em `main/master` significa apenas o ponto de partida
- nunca commitar uma UL diretamente em `main/master`
- nunca reutilizar a mesma branch para duas ULs diferentes, mesmo que ambas
  sejam independentes

### Decisao de base — checklist antes de git switch -c
1. Esta UL compila/funciona sem qualquer outra UL pendente? → sim = main
2. Ela importa/usa algo criado por outra UL? → sim = branch dessa UL
3. Ela so faz sentido logico apos outra UL? → sim = branch dessa UL
Se nenhum dos itens 2 ou 3 for verdadeiro: BASE = MAIN, sem excecao.

## Regra de naming
- nao usar numeracao sequencial de UL na branch
- o nome da branch deve refletir intencao e escopo, nao ordem
- se precisar indicar ordem, faca isso no PR/MR ou na saida textual, nunca no nome da branch

## Nome de branch
```
<tipo>/<tema>/<resumo>
ex: feat/auth/token-refresh
    fix/pagamentos/valor-negativo
```

## Receita de criacao — passo a passo

### 1) Determinar a base
```
se independente  → git switch main
se dependente    → git switch <branch-da-UL-pai>
```

### 2) Criar a branch a partir da base correta
```
git switch -c <tipo>/<tema>/<resumo>
```

### 2.1) Restricao de `git worktree`
Nao criar `git worktree` por padrao durante a separacao das ULs.
So usar esse formato quando o usuario pedir explicitamente.

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
git switch -c docs/geral/readme
git add -p && git commit

# UL 2 — independente → sai de main em OUTRA branch propria
git switch main
git switch -c chore/config/json-base
git add -p && git commit

# UL 3 — depende da UL 2 → sai da branch da UL 2
git switch chore/config/json-base
git switch -c feat/pagamentos/usar-json
git add -p && git commit
```

Grafo resultante:
```
main
├── docs/geral/readme           (PR → main)
└── chore/config/json-base      (PR → main)
    └── feat/pagamentos/usar-json     (PR → chore/config/json-base)
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
- MUST existir uma branch por PR/MR; nao abrir multiplas ULs a partir da mesma branch
- Botao "Squash and merge" do GitHub nao funciona para PRs intermediarios
- Comunicar posicao: "[Stack 2/3] tipo(escopo): descricao" no titulo do PR
