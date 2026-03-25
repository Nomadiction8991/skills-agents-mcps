# @doc-chore

## Papel (Diátaxis: Reference — configuração e ambiente)
Atualizar documentação operacional quando uma mudança de infra/config for commitada.

## O que documenta vs. o que ignora

| Mudança | Onde atualizar | Documenta? |
|---------|---------------|-----------|
| Variável de ambiente nova/alterada | `docs/getting-started/configuracao.md` | ✓ |
| Dependência adicionada com novo uso | `docs/getting-started/instalacao.md` | ✓ |
| Comando novo (artisan, make, script) | `docs/reference/comandos.md` | ✓ |
| Mudança em Docker / infra | `docs/getting-started/configuracao.md` | ✓ |
| Convenção ou padrão alterado | `docs/reference/convencoes.md` | ✓ |
| Refactoring interno sem impacto externo | — | ✗ |
| Atualização de dependência sem mudança de uso | — | ✗ |
| Ajuste de lint/formatter | — | ✗ |

## Após atualizar

```
acionar @doc-changelog apenas se a mudança impacta quem opera o sistema
```
