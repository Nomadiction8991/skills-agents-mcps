# Padroes Yii

Use esta referencia quando a tarefa envolver `Yii`, `Yii2`, modulos MVC,
`ActiveRecord`, `RBAC`, console commands ou componentes reutilizaveis.

## Arquitetura

- Controllers devem coordenar request/response; regra de negocio fica em
  services, domain handlers ou componentes dedicados.
- Prefira separar formularios (`Form Models`) de entidades persistidas quando
  validacao de entrada e persistencia tiverem responsabilidades diferentes.
- Use modulos para delimitar contexto funcional e reduzir acoplamento entre
  areas grandes do sistema.

## Models e persistencia

- Use `ActiveRecord` quando o projeto ja segue esse estilo e o ganho de
  produtividade compensar o acoplamento ao ORM.
- Para regras complexas, extraia services e repositories em vez de inflar
  models com logica demais.
- Declare rules, labels, casts e cenarios de forma explicita.
- Encapsule transacoes de escrita no servico de aplicacao quando o caso de uso
  envolver varias entidades.

## Componentes e DI

- Registre colaboracoes reutilizaveis como components ou servicos
  configuraveis, nao como helpers globais.
- Injete dependencias pelo construtor sempre que o contexto permitir.
- Evite acessar `Yii::$app` profundamente em regra de negocio; restrinja esse
  acesso a camadas de infraestrutura ou adaptacao.

## HTTP e seguranca

- Valide entrada com `Form Models`, filtros e rules especificas.
- Escape de saida deve ser intencional nas views e payloads montados manualmente.
- Use query builder, `ActiveQuery` ou comandos parametrizados para evitar
  injecao de SQL.
- Configure autenticacao, autorizacao e `RBAC` de forma centralizada.

## Console, filas e integracoes

- `Console Controllers` devem validar parametros cedo e delegar para servicos.
- Para jobs assincronos, mantenha handlers idempotentes e observaveis.
- Integracoes externas devem ter timeout, retry e logging com contexto.

## Testes

- Cubra services e form models com testes unitarios.
- Cubra controllers, modulos e integracoes com testes funcionais ou de
  integracao conforme a stack do projeto.
- Ao corrigir bug em comportamento de model ou scenario, adicione um teste
  reproduzindo o fluxo real.
