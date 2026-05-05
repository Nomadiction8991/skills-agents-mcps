# Testes e qualidade

Use esta referencia sempre que a tarefa incluir validacao, refactor ou entrega
final de codigo PHP.

## Gate obrigatorio

1. Rode `vendor/bin/phpstan analyse --level=9`.
2. Corrija todos os erros e avisos relevantes.
3. Rode `vendor/bin/phpunit` ou `vendor/bin/pest`.
4. Confirme cobertura minima de `80%+` quando o projeto medir cobertura.
5. So conclua a entrega depois que ambos os gates estiverem limpos.

## Estrategia de testes

- Teste unidade para regras de negocio puras e servicos.
- Teste feature/integracao para controllers, commands, filas e persistencia.
- Use doubles apenas nas bordas externas; nao esconda comportamento critico em
  mocks excessivos.
- Garanta cenarios felizes, validacao, autorizacao e falhas de negocio.

## PHPStan e contratos

- Tipos de colecao devem ser descritos com generics em `PHPDoc`.
- Corrija raiz do problema; nao silencie erros com `ignoreErrors` sem motivo
  forte.
- Se o projeto usar extensoes de framework para `PHPStan`, mantenha-as
  alinhadas com a versao do framework.

## PHPUnit e Pest

- Escolha o framework ja adotado pelo projeto; nao misture estilos sem motivo.
- Nomeie testes pelo comportamento observado.
- Extraia builders, factories e mothers quando reduzirem ruido.

## Cobertura e manutencao

- Cobertura numerica nao substitui assertividade; prefira menos testes, mas
  mais precisos.
- Ao corrigir bug, adicione um teste que falhe sem a correcao.
- Remova testes redundantes ao refatorar para manter a suite legivel.
