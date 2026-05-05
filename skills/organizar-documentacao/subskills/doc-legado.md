# @doc-legado

## Papel
Normalizar markdowns já existentes em `DOCS_ROOT` quando não houver mudança nova no código para documentar.

## Quando usar
- `git status` limpo ou sem alteração documental útil;
- existem `.md` fora do escopo padrão;
- há arquivos criados por outras skills, manualmente ou em estrutura inconsistente.

## Objetivo
Ler, classificar, mover, mesclar e refatorar o conteúdo legado para caber corretamente na estrutura padrão de `DOCS_ROOT`.

## Fluxo
1. Listar markdowns em `DOCS_ROOT`.
2. Identificar arquivos fora do padrão.
3. Ler o conteúdo antes de decidir destino.
4. Classificar por domínio e tipo Diátaxis.
5. Escolher uma ação: `mover`, `mesclar`, `editar` ou `ignorar`.
6. Refatorar o markdown para encaixar no arquivo alvo.
7. Atualizar índices e links quebrados.
8. Remover duplicação óbvia.

## Como decidir o destino
- tutorial de início → `getting-started/`
- comando, parâmetro, convenção ou contrato → `reference/`
- fluxo de uso por tarefa → `{dominio}/{subtema}.md` ou `{dominio}/index.md`
- visão conceitual → `{dominio}/index.md` ou arquivo explicativo do domínio

## Regras
- Ler antes de mover.
- Não mover só pelo nome do arquivo; mover pelo conteúdo.
- Se um arquivo misturar vários assuntos, dividir por objetivo.
- Se dois arquivos cobrirem o mesmo assunto, mesclar no mais claro e estável.
- Renomear arquivos genéricos para nomes semânticos.
- Corrigir títulos, headings, links e breadcrumbs após mover.
- Preservar o conteúdo útil; remover ruído, duplicação e histórico desnecessário.
- Se a estrutura alvo não existir, chamar `@doc-estrutura`.

## Sinais de arquivo fora do padrão
- markdown solto em `DOCS_ROOT` sem justificativa;
- nome genérico ou temporário;
- conteúdo sem domínio claro;
- ausência de índice ou link de navegação;
- mistura de tutorial, referência e changelog no mesmo arquivo.

## Saída
```text
dominio: {dominio}
arquivo_alvo: {caminho final}
acao: {mover|mesclar|editar|ignorar}
subskill: @doc-legado
```
