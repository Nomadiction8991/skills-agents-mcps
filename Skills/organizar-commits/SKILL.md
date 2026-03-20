---
name: organizar-commits
description: "Analisar alteracoes Git ainda nao commitadas, separar mudancas em commits logicos e escrever mensagens de commit em PT-BR seguindo Conventional Commits. Usar somente quando o usuario pedir explicitamente para fazer commit, criar commits, organizar commits, preparar mensagens de commit ou invocar `$organizar-commits`; nao usar para revisao de codigo geral, explicacao de diff ou operacoes Git rotineiras."
---

# Organizar Commits

## Objetivo

Produzir um historico limpo, revisavel e semantico a partir das alteracoes ainda nao commitadas.

Analisar o diff completo antes de agir, agrupar mudancas por intencao funcional e escrever commits claros em PT-BR.

## Regra de disparo

Usar esta skill apenas com pedido explicito para lidar com commits, por exemplo:

- fazer o commit;
- criar os commits;
- organizar os commits;
- preparar mensagens de commit;
- invocar `$organizar-commits`.

Se o usuario pedir apenas analise, sugestao ou revisao, nao executar `git add` nem `git commit`. Nessa situacao, entregar a proposta de agrupamento e as mensagens finais.

## Fluxo obrigatorio

1. Executar `git status` para mapear arquivos alterados, novos, removidos e renomeados.
2. Executar `git diff` e, quando necessario, diffs por arquivo para entender o conteudo real das mudancas.
3. Separar mudancas por contexto funcional, comportamento, refatoracao, documentacao, teste ou manutencao.
4. Propor a menor quantidade de commits que preserve coesao semantica.
5. Explicar cada commit proposto: o que entra, por que essas mudancas pertencem juntas e por que ficam separadas das demais.
6. Escrever as mensagens finais no formato definido por esta skill.
7. Executar os commits somente se o pedido do usuario for explicito para criar ou aplicar commits.
8. Verificar o resultado com `git status` depois de commitar.

## Criterios de agrupamento

- Juntar arquivos diferentes no mesmo commit quando implementarem a mesma mudanca de comportamento.
- Separar correcao de bug, refatoracao, documentacao, testes e manutencao quando isso melhorar a leitura historica.
- Manter testes junto da funcionalidade nova ou corrigida quando eles existirem apenas para cobrir essa mudanca.
- Separar mudancas nao relacionadas entre si, mesmo que toquem poucos arquivos.
- Manter mudancas acopladas no mesmo commit quando separa-las quebrar consistencia, build, teste ou revisao.
- Evitar divisao mecanica por arquivo.
- Evitar commits vagos como `ajustes gerais` ou `mudancas diversas`.

## Formato de commit

Usar Conventional Commits em PT-BR:

`tipo(escopo): titulo curto`

`descricao mais detalhada explicando o que foi feito e por que`

`rodape opcional`

Tipos permitidos:

- `feat`: nova funcionalidade
- `fix`: correcao de bug
- `refactor`: refatoracao sem mudar comportamento esperado
- `docs`: documentacao
- `test`: testes
- `chore`: manutencao tecnica
- `build`: build e dependencias
- `ci`: integracao continua
- `style`: alteracoes de formatacao ou estilo sem impacto logico

## Regras de escrita

- Escrever tudo em PT-BR.
- Manter o titulo curto, objetivo e iniciado logo apos `tipo(escopo):`.
- Usar o corpo para registrar contexto, motivacao e impacto quando isso ajudar a revisao.
- Usar rodape apenas quando fizer sentido, como `Closes #123`, `Refs: #123` ou `BREAKING CHANGE: ...`.
- Preferir escopo claro e consistente com a area afetada.
- Nao inventar issue, motivacao ou impacto que nao aparecam nas mudancas ou no pedido do usuario.

## Execucao segura

Quando for necessario criar multiplos commits:

1. Separar o staging por unidade semantica com `git add` seletivo.
2. Revisar o diff staged antes de cada commit.
3. Criar o commit com titulo e corpo coerentes.
4. Repetir ate cobrir todo o conjunto planejado.
5. Confirmar o que restou sem commit ao final.

Nao incluir alteracoes nao relacionadas so porque estavam no working tree.

## Nao fazer

- Nao commitar sem pedido explicito do usuario.
- Nao assumir que cada arquivo representa uma unica intencao.
- Nao misturar mudancas independentes so para reduzir numero de commits.
- Nao separar mudancas inseparaveis apenas para aumentar granularidade.
- Nao reescrever historico existente, fazer squash ou amend sem pedido explicito.

## Resposta ao usuario

Entregar nesta ordem:

1. resumo da analise das mudancas;
2. proposta de agrupamento em commits;
3. mensagens finais de commit, com titulo, descricao e rodape se houver;
4. comandos `git add` e `git commit` sugeridos quando o pedido for apenas analise;
5. confirmacao do que foi efetivamente commitado quando o pedido incluir executar os commits.
