# Async PHP

Use esta referencia quando a tarefa envolver concorrencia, streaming,
workloads I/O-bound ou infraestrutura orientada a eventos em PHP.

## Quando usar

- Filas, workers e jobs concorrentes.
- WebSockets, SSE, long polling ou stream processing.
- Integracoes com alto volume de I/O em `Redis`, HTTP, filas ou sockets.

## Ferramentas

- `ReactPHP`: loop de eventos e I/O assincrono em servicos long-running.
- `Swoole`/`OpenSwoole`: servidores de alta concorrencia e corrotinas.
- `Fibers`: base de composicao para bibliotecas modernas; use com moderacao.

## Regras de implementacao

- Isole codigo bloqueante atras de interfaces para trocar estrategia depois.
- Nao compartilhe estado mutavel entre tarefas concorrentes sem coordenacao.
- Defina timeouts, retries e circuit breakers para chamadas externas.
- Propague cancelamento e falhas de forma explicita.

## Integridade e observabilidade

- Garanta idempotencia em jobs reprocessaveis.
- Registre metricas de throughput, latencia e falhas por tipo de tarefa.
- Para filas, documente politica de retry, dead-letter e limite de tentativas.

## Testes

- Cubra timeouts, retries, cancelamentos e cenarios de falha de rede.
- Em streams, valide backpressure e encerramento correto de recursos.
