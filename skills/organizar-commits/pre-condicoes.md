# @pre-condicoes

## Checar antes de comecar
```
git status --short                    # nao pode ter UU/AA/DD
git branch --show-current             # nao pode ser vazio (HEAD detached)
git rebase --show-current-operation   # deve ser vazio
```

## Limpar estado
```
git restore --staged .        # limpar stage
git reset HEAD~N              # desfazer N commits sem perder mudancas (se necessario)
```

## Restricao de worktree
Nao criar `git worktree` por padrao.
So usar quando o usuario pedir explicitamente esse formato.

## Config Git recomendada (uma vez por maquina)
```
git config --global rebase.updateRefs true    # rebase em cadeia automatico (Git 2.38+)
git config --global rebase.autoSquash true
git config --global interactive.singleKey true
```
