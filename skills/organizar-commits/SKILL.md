---
name: organizar-commits
version: "7.5"
description: "Separar alteracoes Git em commits atomicos com Conventional Commits e Stacked Branches."
---
# Git Workflow

## Glossario
UL=Unidade Logica | CC=Conventional Commits | SB=Stacked Branch | BC=Breaking Change

## Regra central
1 UL = 1 intencao = 1 commit = 1 branch.
Empilhar por dependencia real, nunca por arquivo, nunca por ordem de criacao.

## REGRA DE BRANCH — sempre ativa, sem excecao

Mesmo quando a UL e independente e a base correta e `main/master`, ainda assim
ela MUST ter branch propria para abrir PR/MR.

```
base = main/master  !=  commit direto em main/master
base = branch-pai   !=  reaproveitar a branch-pai para outra UL
```

Se existem 3 ULs, existem 3 branches, mesmo que as 3 sejam independentes de
`main`.

## Fluxo obrigatorio
```
verificar_precondicoes → achar_ULs → classificar_dependencias → montar_stack → criar_branch_da_UL → commitar
```

## Preferencia operacional
Por padrao, trabalhe no mesmo diretório e evite criar `git worktree`.
So usar `git worktree` se o usuario pedir explicitamente.

## REGRA DE BASE DE BRANCH — sempre ativa, sem excecao

Antes de criar qualquer branch, responder:

> "Esta UL funciona, compila e faz sentido SEM qualquer outra UL pendente?"

```
sim → base = main/master   (mas ainda cria branch propria da UL)
nao → base = branch da UL da qual ela depende
```

### Sinais de dependencia real (base NAO pode ser main)
- usa campo/tipo/interface criado por outra UL pendente
- importa arquivo criado ou movido por outra UL pendente
- teste que so passa se outra UL ja foi aplicada
- logica que quebra em runtime sem a UL anterior

### Sinais de independencia (base PODE ser main)
- mudanca isolada que nao toca codigo de outras ULs pendentes
- docs, configs, scripts que nao afetam runtime de outras ULs
- fix de bug em area nao relacionada a outras ULs pendentes
- refactoring mecanico (rename, move) que nao e usado por outras ULs

### Pilhas paralelas — quando existem
Se duas ULs sao independentes entre si E independentes de main:
ambas saem de main como pilhas separadas, sem numeracao obrigatoria no nome.

```
UL A (independente) → sai de main
UL B (independente) → sai de main   ← pilha paralela, nao filha da UL A
UL C (depende da UL B) → sai da branch da UL B
```

### Erro comum a evitar
Nao empilhar ULs so porque foram criadas em sequencia.
Sequencia de criacao NAO implica dependencia.

Tambem nao commitar UL independente direto em `main/master` so porque a base
correta dela e `main/master`.

## Modulos disponiveis (ler sob demanda)
| Modulo | Quando carregar |
|--------|----------------|
| @pre-condicoes | antes de comecar qualquer operacao |
| @separar-hunks | ao dividir mudancas em ULs |
| @stacked-branches | ao criar/gerenciar a pilha de branches |
| @conventional-commits | ao escrever titulo/body/footer |
| @output-format | ao gerar o resultado final |

## Nao fazer (sempre ativo)
- nao misturar assuntos no mesmo commit
- nao separar por arquivo; separar por intencao
- nao commitar UL diretamente em `main/master`; sempre criar branch propria
- nao incluir numero sequencial de UL no nome da branch; use nomes curtos e descritivos
- nao criar `git worktree` sem pedido explicito do usuario
- nao criar branch filha sem dependencia real e verificada
- nao empilhar por ordem de arquivo ou sequencia de criacao
- nao usar `git commit -m` para corpo detalhado
- nao mergear PRs fora de ordem na stack
- nao misturar refactoring com mudanca funcional
- nao ultrapassar ~400 linhas por UL sem justificativa
