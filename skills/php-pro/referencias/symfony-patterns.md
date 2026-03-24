# Padroes Symfony

Use esta referencia para implementacoes em `Symfony 6.4+` e principalmente
`Symfony 7`.

## Servicos e DI

- Prefira autowiring e autoconfigure quando o projeto seguir o padrao Symfony.
- Declare interfaces para colaboracoes externas e infraestruturas mutaveis.
- Evite acessar container diretamente fora de bootstrap ou wiring.

## HTTP, validacao e seguranca

- Use DTOs de input, `Validator` e normalizers para fronteiras HTTP.
- Controllers devem ser finos e delegar para handlers ou servicos.
- Use `Voters` para autorizacao contextual.
- Centralize regras de autenticacao no `security.yaml` e em componentes de
  seguranca.

## Doctrine e persistencia

- Mantenha entidades focadas em invariantes e estado consistente.
- Use repositories customizados apenas para consultas que realmente agregam
  valor.
- Agrupe escritas relacionadas em transacoes de aplicacao.

## Mensageria e eventos

- Use `Messenger` para tarefas assincronas, retries e integracoes externas.
- Prefira `EventSubscriber` quando houver multiplos listeners para um mesmo
  fluxo.
- Nao substitua chamadas diretas simples por eventos sem necessidade.

## CLI e observabilidade

- `Command` deve validar input cedo e delegar para servicos.
- Logue falhas de integracao com contexto suficiente para diagnostico.
- Mantenha nomes de comandos e handlers alinhados com o caso de uso.
