# @doc-identificar

## Papel
Determinar domínio, arquivo alvo, ação e subskill antes de editar a documentação.

## Entrada
Usar nesta ordem:
1. inspeção de Git;
2. escopo do commit ou tipo de mudança;
3. arquivos alterados;
4. comportamento descrito pelo usuário;
5. estado atual de `DOCS_ROOT`.

## Inspeção mínima de Git
Executar, quando disponível, em modo somente leitura:
1. `git status --short`
2. `git diff --name-only`
3. `git diff --stat`
4. `git diff` e/ou `git diff --cached`
5. se necessário, `git log -1 --stat` ou diff entre refs relevantes

## Fluxo
1. Inspecionar Git.
2. Verificar se há mudança real para documentar.
3. Se não houver, delegar para `@doc-legado`.
4. Extrair o domínio.
5. Procurar em `DOCS_ROOT`.
6. Definir se a ação é `editar`, `criar`, `mover`, `mesclar` ou `ignorar`.
7. Rotear para a subskill correta.

## Regras
- usar Git apenas para leitura
- não criar branch, não commitar e não alterar staging ou histórico
- `feat` → `@doc-feature`
- `fix` → `@doc-fix`
- `chore` / `build` / `ci` com impacto externo → `@doc-chore`
- domínio sem doc → `@doc-estrutura`
- Git sem trabalho documental útil → `@doc-legado`
- sem impacto externo e sem legado relevante → `acao: ignorar`
- não decidir só por nome de arquivo; usar o diff para confirmar impacto

## Saída
```text
dominio: {dominio}
arquivo_alvo: {caminho ou pendente}
acao: {editar|criar|mover|mesclar|ignorar}
subskill: {@doc-*}
```
