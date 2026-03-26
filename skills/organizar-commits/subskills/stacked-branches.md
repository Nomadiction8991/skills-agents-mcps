# @stacked-branches

## Regra de base — executar ANTES de criar qualquer branch

Responder esta pergunta para cada UL:

> "Esta UL funciona, compila e faz sentido sozinha, sem nenhuma outra UL pendente?"

```
SIM → git switch main && git switch -c <tipo>/<tema>-<resumo>
NAO → git switch <branch-da-UL-que-preciso> && git switch -c <tipo>/<tema>-<resumo>
```

**Se a resposta for SIM mas você está em dúvida: é SIM. Base = main.**

### Sinais que confirmam SIM (independente → main)
- mudança isolada que não usa código criado por outra UL pendente
- doc, config, refactor que não afeta runtime de outras ULs
- feature em domínio completamente separado das outras ULs

### Sinais que confirmam NAO (dependente → branch-pai)
- importa, usa ou estende tipo/interface criado por outra UL pendente
- não compila ou quebra em runtime sem a UL anterior

### Erro mais comum — NÃO FAZER ISSO
```
# ERRADO — empilhar só porque veio depois
git switch -c feat/organizar-commits  ← sai de main ✓
git switch feat/organizar-commits
git switch -c feat/interface-design   ← sai da anterior ✗ (se forem independentes)

# CERTO — ambas independentes → ambas saem de main
git switch main && git switch -c feat/organizar-commits
git switch main && git switch -c feat/interface-design
```

## Nome de branch

```
<tipo>/<tema>-<resumo>
```

**Sem número sequencial.** O nome deve descrever a intenção, não a ordem.

```
feat/organizar-commits-workflow
feat/interface-design-skill
fix/auth-token-refresh
chore/vitepress-setup
docs/readme-estrutura
```

## Receita — passo a passo

```bash
# 1) ir para a base correta (OBRIGATÓRIO antes de -c)
git switch main                    # se independente
git switch <branch-pai>            # se dependente

# 2) criar a branch
git switch -c <tipo>/<tema>-<resumo>

# 3) stagear
git add -p                         # rastreados
git add -N <arquivo> && git add -p # novos
git add <arquivo>                  # binários/lockfiles

# 4) commitar (NUNCA usar -m para corpo detalhado)
git commit
```

## Exemplo — 3 ULs independentes (todas saem de main)

```bash
# UL 1
git switch main
git switch -c feat/organizar-commits-workflow
git add -p && git commit

# UL 2 — independente da UL1 → main também
git switch main
git switch -c feat/interface-design-skill
git add -p && git commit

# UL 3 — independente da UL1 e UL2 → main também
git switch main
git switch -c chore/vitepress-setup
git add -p && git commit
```

Grafo:
```
main
├── feat/organizar-commits-workflow  (PR → main)
├── feat/interface-design-skill      (PR → main)
└── chore/vitepress-setup            (PR → main)
```

## Exemplo — UL dependente (sai da branch-pai)

```bash
# UL base
git switch main
git switch -c feat/auth-oauth-flow
git add -p && git commit

# UL que DEPENDE da anterior (usa tipos criados por ela)
git switch feat/auth-oauth-flow
git switch -c feat/auth-2fa
git add -p && git commit
```

Grafo:
```
main
└── feat/auth-oauth-flow   (PR → main)
    └── feat/auth-2fa      (PR → feat/auth-oauth-flow)
```

## Ajustes pós-commit

```bash
git commit --amend                   # corrigir último commit
git commit --fixup=<hash>            # fixup para commit anterior
git rebase -i --autosquash <base>    # aplicar fixups
git rebase main --update-refs        # rebase em cadeia (Git 2.38+)
git push --force-with-lease          # push após rebase
```

## PR

```
branch independente → PR para main/master
branch dependente   → PR para branch-pai
```

Mergear sempre da base para o topo.
