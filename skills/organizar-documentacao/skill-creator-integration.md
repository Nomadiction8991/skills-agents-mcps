# Integração com automação

Use esta skill para operar sobre o **projeto alvo**, não sobre a pasta da skill.

## Variáveis recomendadas
- `PROJECT_ROOT`: raiz do projeto alvo
- `DOCS_ROOT`: `${PROJECT_ROOT}/docs`
- `SKILL_ROOT`: pasta desta skill

## Fluxo mínimo
1. Inspecionar Git com `git status --short`.
2. Se houver arquivos candidatos, ler `git diff --name-only` e `git diff --stat`.
3. Ler `git diff` e/ou `git diff --cached` quando a natureza da mudança não estiver óbvia.
4. Se houver mudança útil, identificar domínio e tipo de mudança.
5. Se não houver, auditar `DOCS_ROOT` em modo legado.
6. Localizar o arquivo alvo em `DOCS_ROOT`.
7. Se necessário, criar arquivo com template em `SKILL_ROOT/templates/`.
8. Atualizar índice do domínio e `DOCS_ROOT/index.md` quando houver arquivo novo ou movido.
9. Atualizar `DOCS_ROOT/changelog/unreleased.md` quando houver impacto externo.

## Regras para automação
- Git é usado apenas para leitura e verificação.
- Nunca criar branch, commit, stash, merge, rebase, reset ou qualquer outra mutação no repositório.
- Nunca escrever a documentação final dentro de `SKILL_ROOT`.
- A inspeção de Git vem antes de qualquer classificação documental.
- Para `fix`, editar arquivo existente; não gerar novo markdown.
- Para `feat`, criar subtema novo só quando o conteúdo não couber bem no `index.md` do domínio.
- Se `DOCS_ROOT` não existir, criar a estrutura mínima com `@doc-estrutura`.
- Se Git estiver limpo, procurar markdowns fora do padrão e normalizar com `@doc-legado`.
- Ao mover arquivos, corrigir índices e links internos.
- Não documentar só com base em `git status`; usar `git diff` quando o impacto não estiver explícito.

## Exemplo de uso
```bash
PROJECT_ROOT=/caminho/do/projeto
DOCS_ROOT="$PROJECT_ROOT/docs"
SKILL_ROOT=/caminho/da/skill/organizar-documentacao

cd "$PROJECT_ROOT"
git status --short
git diff --name-only
git diff --stat

# exemplo conceitual
# a automação só lê Git; não cria branch nem commit
create-doc --target "$DOCS_ROOT/usuarios/autenticacao.md"   --template "$SKILL_ROOT/templates/how-to-template.md"
```
