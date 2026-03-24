# Padroes Laravel

Use esta referencia para implementacoes em `Laravel 10+` e especialmente
`Laravel 11`.

## Arquitetura

- Controllers devem orquestrar; regra de negocio fica em servicos ou actions.
- `FormRequest` deve concentrar autorizacao e validacao de entrada.
- `API Resources` devem formatar saida externa; evite expor modelos crus.
- Repositorios sao uteis quando houver troca de storage, consultas complexas
  recorrentes ou isolamento de dominio. Nao crie abstractions vazias.

## Eloquent

- Prefira scopes, casts e accessors pequenos a logica repetida em controllers.
- Declare `fillable`/`guarded`, `casts` e relacoes explicitamente.
- Use eager loading para evitar `N+1`.
- Para escrita complexa, encapsule transacoes no servico.

## Servicos e jobs

- Injete dependencias pelo construtor; nao esconda colaboracoes em facades.
- Use `Jobs` para tarefas demoradas, reprocessaveis ou I/O-bound.
- Para fluxos reutilizaveis, prefira uma classe de servico unica por caso de
  uso em vez de helper functions globais.

## HTTP e seguranca

- Valide tudo com `FormRequest`, DTO ou validator dedicado.
- Hash de senha deve usar `Hash::make()`.
- Use policies/gates para autorizacao e resources para controlar o payload.
- Nunca concatene SQL; use query builder, Eloquent ou bindings.

## Testes

- Cubra servicos com testes unitarios e endpoints com testes de feature.
- Use factories e `RefreshDatabase` quando o projeto seguir o fluxo padrao.
- Em APIs, teste validacao, autorizacao e formato do JSON.
