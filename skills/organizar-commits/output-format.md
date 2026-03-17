# @output-format

## Regra da resposta
Curto no processo, detalhado no resultado.

## Campos obrigatorios por UL
```
- nome
- objetivo
- arquivos_envolvidos
- depende_de
- pode_ir_direto_para_main: sim|nao  ← sim somente se depende_de=nenhuma E nao quebra interface de ULs pendentes
- branch
- base_da_branch
- posicao_na_stack        ex: "2 de 3 (pilha A)" | "independente"
- tamanho_estimado_linhas ex: "~80 linhas"
- commit_title
- commit_body_detalhado
- ordem_do_pr
```

## Exemplo de saida

UL 1
- nome: JSON base
- objetivo: preparar estrutura de config para novo fluxo
- arquivos_envolvidos: config/pagamentos.json
- depende_de: nenhuma
- pode_ir_direto_para_main: sim
- branch: chore/config/json-base
- base_da_branch: main
- posicao_na_stack: 1 de 3 (pilha A)
- tamanho_estimado_linhas: ~30 linhas
- commit_title: chore(config): adiciona campos gateway e retry_policy
- commit_body_detalhado:
  Adiciona campos `gateway`, `timeout_ms` e `retry_policy`.
  Necessarios para o novo fluxo implementado nas ULs seguintes.
  Roda sozinha. Baixo risco: apenas adicao com valores default.
- ordem_do_pr: 1 → main/master

UL 2
- nome: leitura do novo json
- objetivo: adaptar ConfigReader para consumir novos campos
- arquivos_envolvidos: src/pagamentos/config_reader.py, tests/test_config_reader.py
- depende_de: UL 1
- pode_ir_direto_para_main: nao
- branch: refactor/pagamentos/ler-json
- base_da_branch: chore/config/json-base
- posicao_na_stack: 2 de 3 (pilha A)
- tamanho_estimado_linhas: ~90 linhas
- commit_title: refactor(pagamentos): adapta leitura para novo formato de config
- commit_body_detalhado:
  Altera ConfigReader para consumir `gateway`, `timeout_ms` e `retry_policy`.
  Sem UL 1 essa mudanca quebra ao tentar ler campos inexistentes.
  Inclui teste unitario para os 3 campos.
  Risco medio: ponto compartilhado por multiplos modulos.
- ordem_do_pr: 2 → chore/config/json-base
