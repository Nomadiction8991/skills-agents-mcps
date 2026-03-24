---
name: organizar-commits
version: "7.1"
description: "Separar alteracoes Git em commits atomicos com Conventional Commits e Stacked Branches."
---
# Git Workflow

## Glossario
UL=Unidade Logica | CC=Conventional Commits | SB=Stacked Branch | BC=Breaking Change

## Regra central
1 UL = 1 intencao = 1 commit = 1 branch.
Empilhar por dependencia real, nunca por arquivo, nunca por ordem de criacao.

## Fluxo obrigatorio
```
verificar_precondicoes → achar_ULs → classificar_dependencias → montar_stack → commitar
```

## REGRA DE BASE DE BRANCH — sempre ativa, sem excecao

Antes de criar qualquer branch, responder:

> "Esta UL funciona, compila e faz sentido SEM qualquer outra UL pendente?"

```
sim → base = main/master   (pode_ir_direto_para_main = sim)
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
ambas saem de main como pilhas separadas, numeracao global continua.

```
UL 1 (independente) → sai de main
UL 2 (independente) → sai de main   ← pilha paralela, nao filha da UL 1
UL 3 (depende da UL 2) → sai da branch da UL 2
```

### Erro comum a evitar
Nao empilhar ULs so porque foram criadas em sequencia.
Sequencia de criacao NAO implica dependencia.

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
- nao criar branch filha sem dependencia real e verificada
- nao empilhar por ordem de arquivo ou sequencia de criacao
- nao usar `git commit -m` para corpo detalhado
- nao mergear PRs fora de ordem na stack
- nao misturar refactoring com mudanca funcional
- nao ultrapassar ~400 linhas por UL sem justificativa
