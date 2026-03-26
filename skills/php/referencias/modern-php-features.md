# PHP moderno

Use esta referencia quando a tarefa depender de recursos de `PHP 8.1+` e
principalmente `PHP 8.3+`.

## Prioridades

- Comece todo arquivo com `declare(strict_types=1);`.
- Prefira `final`, `readonly`, promoted properties e tipos explicitos.
- Substitua strings magicas por `enum`, `value objects` e classes pequenas.
- Use `match`, `nullsafe operator` e `first-class callables` quando isso
  reduzir ambiguidade.

## Tipagem e modelagem

- Evite arrays genericos para trafego interno; use DTOs e objetos de valor.
- Tipos anulaveis devem ser intencionais e refletir regra de negocio.
- Use `backed enums` para estados persistidos ou interoperacao com APIs.
- Encapsule invariantes no construtor ou em factories nomeadas.

## Atributos e metadados

- Use atributos quando o framework ou a biblioteca ja os suportarem
  nativamente.
- Nao replique configuracao em comentario e atributo ao mesmo tempo.
- Prefira atributos para validacao, serializacao e roteamento quando isso
  reduzir configuracao espalhada.

## Concorrencia e fibers

- Fibers sao uteis para bibliotecas assicronas; nao introduza sem necessidade.
- Em workloads I/O-bound, planeje a compatibilidade com `ReactPHP`, `Amp` ou
  `Swoole` antes de abstrair interfaces.
- Evite chamadas bloqueantes em loops de eventos.

## Qualidade

- Trate avisos deprecados como divida tecnica a ser removida no mesmo fluxo.
- Mantenha compatibilidade com a menor versao de PHP suportada pelo projeto.
- Ao usar recursos novos, documente a motivacao em comentario curto ou no PR.
