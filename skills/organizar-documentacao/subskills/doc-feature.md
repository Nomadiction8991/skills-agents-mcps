# @doc-feature

## Papel
Documentar funcionalidade nova ou expandida no domínio correto.

## Decisão
- Se a mudança couber como seção curta e específica, expandir `DOCS_ROOT/{dominio}/index.md`.
- Se a mudança for longa, reutilizável ou tiver fluxo próprio, criar `DOCS_ROOT/{dominio}/{subtema}.md`.
- Se o domínio não existir, chamar `@doc-estrutura` e depois continuar.

## O que cobrir
1. o que faz;
2. como usar;
3. entradas e saídas relevantes;
4. regras e limites;
5. exemplo mínimo funcional.

## Regras
- Descrever comportamento, não implementação.
- Reaproveitar material existente antes de abrir novo arquivo.
- Se criar subtema novo, atualizar o índice do domínio e `DOCS_ROOT/index.md` quando necessário.
- Registrar no changelog se houver impacto externo.
- Se o conteúdo novo estiver em arquivo legado fora do padrão, mover e refatorar em vez de duplicar.

## Template útil
- `templates/how-to-template.md`
