---
name: organizar-commits
version: "10.0"
description: "Analisar mudancas, criar documentacao e organizar commits atomicos. Inclui setup automatico do VitePress."
---
# Git Workflow

## Glossario
UL=Unidade Logica | CC=Conventional Commits | BC=Breaking Change

## Estrutura da skill
```
organizar-commits/
├── SKILL.md
├── subskills/
│   ├── git/        → analisar-projeto, pre-condicoes, separar-hunks,
│   │                 stacked-branches, conventional-commits, output-format
│   ├── doc/        → doc-readme, doc-identificar, doc-feature, doc-fix,
│   │                 doc-chore, doc-changelog, doc-estrutura
│   └── vitepress/  → vitepress-setup, vitepress-detectar, vitepress-node,
│                     vitepress-docker, vitepress-configurar, vitepress-iniciar
├── docs-templates/ → INDEX, CHANGELOG, feature, fix, release
└── vitepress/      → config.js, package.json
```

---

## FLUXO COMPLETO — executar TUDO, nesta ordem, sem pular

### FASE 1 — Análise (obrigatória)
```
1. ler README.md do projeto    → mapa de onde cada domínio está documentado
2. @analisar-projeto           → git status, git diff, entender mudanças
```

### FASE 2 — VitePress (obrigatória se não configurado)
```
3. verificar se VitePress existe:
   [ -f docs/.vitepress/config.js ] || [ -f docs/.vitepress/config.ts ]

   NÃO existe → executar AGORA:
     @vitepress-setup
       └─ @vitepress-detectar
            ├─ Docker → @vitepress-docker → @vitepress-configurar → @vitepress-iniciar
            ├─ sem Node → @vitepress-node → @vitepress-configurar → @vitepress-iniciar
            └─ com Node → @vitepress-configurar → @vitepress-iniciar

   JÁ existe → pular para Fase 3
```

### FASE 3 — Documentação (obrigatória, antes dos commits)
```
4. @doc-identificar            → domínio afetado + arquivo alvo na doc

5. por tipo de mudança:
     feat  → @doc-feature  → @doc-changelog
     fix   → @doc-fix      → @doc-changelog
     chore → @doc-chore    → @doc-changelog (se operacional)
     domínio novo → @doc-estrutura → voltar ao passo 5

6. atualizar README.md se criou arquivo novo em docs/
```

### FASE 4 — Commits (executar após doc pronta)
```
7. classificar ULs             → separar por intenção, não por arquivo
8. @stacked-branches           → criar branches e commits
```

---

## REGRA DE BASE DE BRANCH — sem exceção

> "Esta UL funciona sozinha, sem qualquer outra UL pendente?"

```
SIM → base = main/master
NÃO → base = branch da UL que ela precisa
```

**Independência é a regra. Dependência é a exceção.**
Sequência de criação NÃO implica dependência.
ULs independentes entre si → pilhas paralelas, todas saindo de main.

---

## NOME DE BRANCH — sem número sequencial

```
<tipo>/<tema>-<resumo>

✓ feat/organizar-commits-workflow
✓ feat/interface-design-skill
✓ fix/auth-token-refresh
✗ feat/auth/03-token-refresh     ← número proibido
✗ feat/03-auth                   ← número proibido
```

---

## Subskills — carregar sob demanda
| Subskill | Quando |
|----------|--------|
| @analisar-projeto | SEMPRE — fase 1 |
| @doc-identificar | SEMPRE — fase 3 |
| @doc-readme | ao ler/atualizar README |
| @doc-feature | commit feat |
| @doc-fix | commit fix |
| @doc-chore | commit chore/build/ci |
| @doc-changelog | ao final de feature/fix/chore relevante |
| @doc-estrutura | domínio sem doc ainda |
| @vitepress-setup | VitePress não configurado — fase 2 |
| @vitepress-detectar | primeiro passo do setup |
| @vitepress-node | sem Node no ambiente |
| @vitepress-docker | projeto com Docker |
| @vitepress-configurar | após Node disponível |
| @vitepress-iniciar | após configurar |
| @separar-hunks | ao dividir mudanças em ULs |
| @stacked-branches | ao criar branches e commits |
| @conventional-commits | ao escrever título/body/footer |
| @output-format | ao gerar resultado final |
| @pre-condicoes | dúvida sobre estado do repo |

---

## Não fazer — sempre ativo
- não pular nenhuma das 4 fases
- não criar branch sem verificar base (main ou dependente?)
- não usar número sequencial no nome da branch
- não empilhar ULs só porque vieram em sequência
- não criar doc sem verificar se domínio já existe
- fix nunca cria arquivo novo — corrige o existente
- não usar `git commit -m` para corpo detalhado
- não espalhar `.md` fora de `docs/` (exceto README, INSTRUCTIONS, CLAUDE, AGENTS)
