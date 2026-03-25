# @doc-readme

## Papel
README.md = mapa de navegação do projeto.
IA lê PRIMEIRO. Nunca antes de qualquer ação na doc.
Não é documentação — é índice com links.

## Estrutura obrigatória

```markdown
# {Nome do Projeto}
{1-2 linhas: o que o sistema faz, para quem}

## Domínios
### {Dominio}
- [Visão geral](docs/{dominio}/index.md)
- [{Subtema}](docs/{dominio}/{subtema}.md)

## Primeiros passos
- [Instalação](docs/getting-started/instalacao.md)
- [Configuração](docs/getting-started/configuracao.md)

## Referência
- [Comandos](docs/reference/comandos.md)
- [Convenções](docs/reference/convencoes.md)

## Changelog
- [Unreleased](docs/changelog/unreleased.md)
- [Versões anteriores](docs/changelog/index.md)
```

## Regras

```
limite: ~60 linhas — nunca virar documento completo
não duplicar: detalhe vai em docs/, README só linka
não incluir: código, exemplos longos, instruções passo-a-passo
```

## Quando atualizar

| Evento | Ação no README |
|--------|---------------|
| Novo domínio criado | + seção com link para `docs/{dominio}/index.md` |
| Novo subtema criado | + link dentro da seção do domínio |
| Domínio removido/renomeado | atualizar/remover link |
| Nova release | atualizar link de changelog |

## Como a IA navega

```
README → localizar seção do domínio → seguir link → editar arquivo alvo
                                                   → se criou arquivo novo: + link no README
```
