---
name: revisar-sem-commit
description: "WORKFLOW SKILL — Revisa alteracoes locais sem commit (staged, unstaged e untracked) com mentalidade de code review: encontra apenas bugs e regressões introduzidos pelo diff atual, prioriza severidade, explica cenarios de falha e segue schemas obrigatorios quando fornecidos."
---

# Revisar alteracoes sem commit

Use esta skill quando o usuario pedir review de mudancas locais ainda nao commitadas, incluindo `staged`, `unstaged` e arquivos `untracked`.

Tambem use quando o usuario disser algo como:

- "revise minhas alteracoes sem commit"
- "faça code review do que ainda nao commitei"
- "olhe staged e unstaged"
- "veja se tem bug no que eu mudei localmente"

## Objetivo

Encontrar apenas problemas que o autor provavelmente corrigiria se soubesse deles:

- bugs concretos
- regressões de comportamento
- quebras de compatibilidade
- falhas de tratamento de erro
- lacunas de validacao relevantes
- riscos claros de compatibilidade
- regressões de teste que mascaram defeitos ou deixam comportamento novo sem cobertura minima

Ignore:

- estilo, nomes e formatação
- refactors alternativos sem bug concreto
- "talvez quebre" sem apontar o caminho afetado
- problemas antigos fora do diff
- sugestões amplas de arquitetura sem defeito discreto

## Padrao de evidência

So reporte um finding quando todos os pontos abaixo forem verdadeiros:

1. O problema foi introduzido pelo diff atual.
2. O impacto e concreto em acuracia, comportamento, seguranca, performance ou manutenibilidade relevante.
3. Existe um cenario claro em que a falha ocorre.
4. O comentario pode ser curto e acionavel.
5. O autor provavelmente aceitaria corrigir se fosse avisado.

Se algum desses pontos estiver fraco, prefira nao reportar.

## Fluxo operacional

1. Rode `git status --short` para separar staged, unstaged e untracked.
2. Leia `git diff --cached --stat` e `git diff --stat` para mapear a superficie alterada.
3. Leia `git diff --cached` para staged e `git diff` para unstaged.
4. Para arquivos untracked, leia o arquivo inteiro; eles nao aparecem no diff contra `HEAD`.
5. Abra contexto adicional apenas nos arquivos tocados com `rg`, `sed -n` e `nl -ba`.
6. Entenda o comportamento anterior a partir do diff e do codigo ao redor.
7. Teste mentalmente cenarios de erro, caminhos raros, entrada vazia, valores nulos, variacoes de plataforma e impacto em chamadas vizinhas.
8. Confirme cada suspeita diretamente no codigo alterado antes de reportar.
9. Reporte apenas problemas introduzidos pela mudanca atual.

## Checklist de revisao

Passe por esta lista em cada arquivo ou bloco alterado:

- A mudanca preserva os mesmos contratos de entrada e saida?
- Algum branch deixou de tratar `null`, vazio, erro ou timeout?
- Algum nome ou caminho foi alterado sem atualizar todos os chamadores?
- Alguma validacao foi removida ou movida tarde demais?
- Existe diferenca entre ambiente local, CI, Linux, macOS, Windows, WSL ou shell?
- Algum teste novo aprova comportamento errado ou deixa um gap obvio?
- Algum arquivo novo entra no fluxo real sem aparecer no diff comparado a `HEAD`?
- Alguma mudanca aparentemente pequena altera ordem, prioridade ou fallback?

## Heuristicas fortes para findings

Prefira findings deste tipo:

- uso de caminho, variavel ou API que falha em um ambiente explicitamente suportado
- condicao invertida ou branch que passa a cair no fallback errado
- comparacao, parsing ou normalizacao que muda silenciosamente o comportamento
- teste que continua verde enquanto o caminho de producao quebra
- omissao de atualizacao em um segundo local obrigatorio
- arquivo untracked que introduz instrucao incorreta ou incompleta

Evite findings deste tipo:

- "seria melhor usar outra abordagem"
- "faltou mais teste" sem mostrar o comportamento descoberto
- "isso pode confundir" sem defeito concreto
- discussao de estilo ou preferencia pessoal

## Prioridade

Classifique por urgencia quando o formato pedir:

- `P0`: quebra universal ou bloqueio grave
- `P1`: falha importante, corrigir no proximo ciclo
- `P2`: problema real, mas nao bloqueante
- `P3`: baixo impacto

Use `P0` com muita parcimonia. A maioria dos problemas reais cai em `P1` ou `P2`.

## Como escrever findings

Cada finding deve conter:

- titulo curto com severidade quando o formato pedir
- corpo em um paragrafo
- cenario em que o bug aparece
- explicacao de por que a mudanca causa esse bug
- localizacao exata e minima dentro do diff

Escreva de forma objetiva. Soe como assistente de review, nao como autor da correcao.

## Quando nao ha findings

Se a mudanca parecer correta, diga explicitamente isso. Nao invente observacoes fracas para "preencher" a review.

Quando houver duvida relevante mas sem prova suficiente, mencione a limitacao apenas se o formato permitir texto livre. Se o formato for estruturado para findings, omita suspeitas fracas.

## Comandos uteis

```bash
git status --short
git diff --cached --stat
git diff --stat
git diff --cached
git diff
git diff --name-only --cached
git diff --name-only
rg --files
nl -ba caminho/do/arquivo | sed -n 'INICIO,FIMp'
sed -n 'INICIO,FIMp' caminho/do/arquivo
```

## Armadilhas comuns

- Arquivos `untracked` sao faceis de esquecer e podem conter a instrucao ou implementacao mais problematica.
- Mudancas staged e unstaged no mesmo arquivo exigem ler o arquivo atual e os dois diffs.
- Diffs pequenos em scripts e docs operacionais podem quebrar ambientes inteiros se o texto prometer suporte incorreto.
- Nao trate ausencia de teste como bug automaticamente; foque no comportamento nao coberto quando ele deixa a mudanca insegura.

## Formatos de saida

Se o usuario fornecer um schema obrigatorio, siga o schema exatamente.

Se o usuario nao fornecer formato, prefira:

1. findings primeiro, ordenados por severidade
2. perguntas abertas ou suposicoes depois, se existirem
3. resumo curto por ultimo

Quando o usuario pedir "review", a resposta principal deve ser a lista de problemas encontrados. Se nao houver nenhum, diga isso de forma direta.

## Meta-regra

Melhor devolver zero findings do que relatar um problema especulativo.
