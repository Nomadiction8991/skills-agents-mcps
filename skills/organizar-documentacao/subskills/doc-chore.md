# @doc-chore

## Papel
Atualizar documentação operacional quando a mudança afetar setup, operação ou uso.

## Documentar quando mudar
- instalação;
- configuração;
- comandos;
- convenções operacionais;
- infraestrutura com impacto para quem instala ou opera.

## Ignorar quando for apenas interno
- refactor sem impacto externo;
- troca de dependência sem mudança de uso;
- ajuste de lint, formatter ou organização interna.

## Arquivos comuns
- `DOCS_ROOT/getting-started/instalacao.md`
- `DOCS_ROOT/getting-started/configuracao.md`
- `DOCS_ROOT/reference/comandos.md`
- `DOCS_ROOT/reference/convencoes.md`

## Regra extra
Se houver documentação operacional antiga fora do padrão, preferir mover e refatorar esse material em vez de criar página paralela.
