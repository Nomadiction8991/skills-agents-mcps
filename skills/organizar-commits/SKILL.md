---
name: organizar-commits
description: "Analisa mudancas no repositorio e organiza commits atomicos com Conventional Commits e Stacked Branches."
---
# Organizar Commits

## Estrutura
```
organizar-commits/
├── SKILL.md
└── subskills/
    ├── analisar-projeto.md
    ├── pre-condicoes.md
    ├── separar-hunks.md
    ├── stacked-branches.md
    ├── conventional-commits.md
    └── output-format.md
```

## Fluxo obrigatorio

```
1. @pre-condicoes      → verificar estado do repo antes de qualquer acao
2. @analisar-projeto   → git status, git diff, entender mudancas
3. classificar ULs     → separar por intencao, nao por arquivo
4. @stacked-branches   → definir bases, criar branches e commits
5. @output-format      → gerar resultado final
```

## REGRA DE BASE DE BRANCH — sem excecao

> "Esta UL funciona sozinha, sem qualquer outra UL pendente?"

```
SIM → base = main/master
NAO → base = branch da UL que ela precisa
```

Independencia e a regra. Dependencia e a excecao.
Sequencia de criacao NAO implica dependencia.
ULs independentes entre si → pilhas paralelas, todas saindo de main.

## NOME DE BRANCH — sem numero sequencial

```
<tipo>/<tema>-<resumo>

✓ feat/organizar-commits-workflow
✓ fix/auth-token-refresh
✓ chore/vitepress-setup
✗ feat/auth/03-token-refresh    ← numero proibido
✗ feat/03-auth                  ← numero proibido
```

## Subskills

| Subskill | Quando carregar |
|----------|----------------|
| @pre-condicoes | sempre — primeiro passo |
| @analisar-projeto | sempre — segundo passo |
| @separar-hunks | ao dividir mudancas em ULs |
| @stacked-branches | ao criar branches e commits |
| @conventional-commits | ao escrever titulo/body/footer |
| @output-format | ao gerar resultado final |

## Nao fazer

- nao criar branch sem verificar base (main ou dependente?)
- nao usar numero sequencial no nome da branch
- nao empilhar ULs so porque vieram em sequencia
- nao misturar assuntos no mesmo commit
- nao separar por arquivo; separar por intencao
- nao criar branch filha sem dependencia real verificada
- nao usar `git commit -m` para corpo detalhado
