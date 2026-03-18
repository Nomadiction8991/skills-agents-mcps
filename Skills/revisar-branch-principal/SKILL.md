---
name: revisar-branch-principal
description: "WORKFLOW SKILL — Revisa a branch atual contra a branch principal (`main`, `master`, `origin/main` ou `origin/master`) como se fosse um PR: escolhe a base correta, calcula o merge-base, inspeciona apenas o diff da branch e reporta bugs concretos introduzidos por ela."
---

# Revisar branch contra a principal

Use esta skill quando o usuario pedir review da branch atual contra `main`, `master`, `origin/main` ou a branch principal equivalente.

Tambem use quando o pedido soar como:

- "revise minha branch"
- "compare com a principal"
- "faça review do PR local"
- "veja o que essa branch quebra"

## Objetivo

Revisar o diff da branch como se fosse um PR:

- identificar bugs introduzidos pela branch
- ignorar divida tecnica antiga fora do diff
- priorizar regressões funcionais, riscos concretos e faltas de validacao
- considerar impacto em codigo, testes, scripts e configuracao tocados pela branch

## Escolha da branch base

Resolva a base nesta ordem, salvo instrucao explicita do usuario:

1. `origin/main`
2. `origin/master`
3. `main`
4. `master`

Se nenhuma existir, pergunte de forma curta qual e a branch principal ou descubra por convencao local se o repositorio deixar isso obvio.

Nao faca `git fetch` por padrao. Use apenas refs locais, a menos que o usuario peca dados mais recentes ou aprove a atualizacao do remoto.

## Fluxo

1. Identifique a branch atual com `git branch --show-current`.
2. Resolva a branch base usando a ordem acima.
3. Calcule `merge-base` entre `HEAD` e a base escolhida.
4. Revise `git diff <merge-base>...HEAD --stat` para mapear a superficie alterada.
5. Leia o diff completo da branch.
6. Abra contexto adicional apenas nos arquivos tocados.
7. Compare o comportamento novo contra o comportamento anterior implicito no diff.
8. Revise tambem testes alterados, fixtures, scripts de build e configuracoes tocadas.
9. Reporte apenas problemas que surgem por causa da branch.

## Padrao de evidência

So reporte um finding quando houver:

- ligacao clara com uma linha ou bloco do diff
- cenario reproduzivel ou fortemente deterministico
- explicacao de impacto real
- razoavel confianca de que isso nao e intencional

Se um problema depender de pressuposto nao demonstrado, nao reporte como bug.

## Regras praticas

- Se o repositorio remoto puder estar desatualizado, use as refs locais primeiro; so faca `fetch` se o usuario pedir ou aprovar.
- Nao misture review do diff com audit geral do repositorio.
- Nao reporte estilo, nomenclatura ou preferencia pessoal sem defeito concreto.
- Se houver testes alterados, verifique se cobrem o comportamento novo ou se mascaram regressao.
- Se a branch tocar migracoes, contratos publicos, CLIs ou docs operacionais, avalie o efeito real no fluxo prometido ao usuario.
- Em PRs grandes, mapeie primeiro arquivos de alto risco e aprofunde nesses pontos antes de cobrir detalhes menores.

## Checklist de revisao

Para cada area alterada, passe por esta lista:

- A branch quebra compatibilidade com chamadores ou configuracoes existentes?
- Algum fallback deixou de ser alcancado ou passou a ser alcancado cedo demais?
- A comparacao com `merge-base` mostra arquivo novo que precisa de outro ajuste relacionado?
- Existe inconsistência entre codigo de producao e testes atualizados?
- Mudancas em scripts, docs operacionais ou comandos prometem suporte que o codigo nao cumpre?
- Existe impacto em ambientes suportados diferentes, como Linux, macOS, Windows, WSL, CI ou shells distintos?
- Algum rename, move ou alteracao de contrato deixou referencias antigas para tras?
- Ha sinais de que a branch corrige um caminho mas esquece outro equivalente?

## Heuristicas fortes para findings

Prefira findings deste tipo:

- branch muda selecao de caminho, base, versao ou prioridade e cai no alvo errado
- suporte declarado a um ambiente deixa de funcionar por causa do novo diff
- testes foram ajustados para passar, mas a logica de producao continua incorreta
- arquivo novo ou refatorado ignora um segundo local obrigatorio
- mudanca na branch altera sem querer o comportamento default de um comando, API ou rotina

Evite:

- "o PR esta grande"
- "faltou benchmark" sem problema de performance demonstrado
- "seria melhor dividir"
- sugestoes de refactor sem defeito objetivo

## Comandos uteis

```bash
git branch --show-current
git rev-parse --verify origin/main
git rev-parse --verify origin/master
git rev-parse --verify main
git rev-parse --verify master
git merge-base HEAD origin/main
git diff "$(git merge-base HEAD origin/main)"...HEAD --stat
git diff "$(git merge-base HEAD origin/main)"...HEAD
git diff "$(git merge-base HEAD origin/main)"...HEAD --name-only
git log --oneline "$(git merge-base HEAD origin/main)"..HEAD
nl -ba caminho/do/arquivo | sed -n 'INICIO,FIMp'
```

Se a base real nao for `origin/main`, substitua o nome da ref nos comandos acima.

## Priorizacao

Quando o formato pedir severidade:

- `P0`: bloqueante ou quebra geral
- `P1`: urgente
- `P2`: importante, mas pode esperar
- `P3`: baixo impacto

Use `P0` apenas quando a branch, por si so, introduzir quebra grave e ampla. Na pratica, a maioria dos findings validos sera `P1` ou `P2`.

## Como escrever findings

Cada finding deve:

- apontar o problema, nao a solucao completa
- explicar por que a branch introduz a falha
- mencionar o cenario necessario para ela acontecer
- usar localizacao curta e precisa dentro do diff
- manter tom objetivo e sem floreio

Se o usuario fornecer schema de saida, siga o schema exatamente. Se nao fornecer, entregue findings primeiro e resumo curto depois.

## Casos especiais

- Se a branch atual tiver mudancas nao commitadas, considere se o pedido e review da branch inteira ou tambem do worktree. Na duvida, foque no diff da branch e mencione a limitacao se isso afetar o resultado.
- Se houver merge commit, rebase parcial ou base ambigua, o `merge-base` continua sendo a referencia principal para evitar misturar historico que nao pertence ao PR.
- Se a branch alterar apenas testes, confirme se houve mudanca correspondente de comportamento ou se os testes passaram a aceitar algo errado.

## Quando nao ha findings

Se a branch parecer correta dentro do diff revisado, diga isso explicitamente. Nao invente observacoes fracas para preencher a review.

## Saida esperada

Produza findings curtos, com contexto suficiente para o autor agir rapido e com foco total no que a branch introduziu. A qualidade da review vem da precisao, nao da quantidade.
