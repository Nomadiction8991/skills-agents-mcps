# @doc-estrutura

## Papel
Criar a estrutura mínima de `DOCS_ROOT` ou de um novo domínio.

## Quando usar
- `DOCS_ROOT` não existe; ou
- o domínio ainda não tem pasta/arquivo próprio.

## Estrutura mínima
```text
DOCS_ROOT/
  index.md
  changelog/index.md
  changelog/unreleased.md
  getting-started/index.md
  reference/index.md
  {dominio}/index.md
```

## Regras
- Preferir `DOCS_ROOT/{dominio}/index.md` para domínios com mais de um assunto.
- Criar `DOCS_ROOT/{dominio}.md` só se o domínio for muito pequeno, estável e explicitamente simples.
- Não criar subpasta com um único arquivo quando um arquivo simples resolver.
- Após criar domínio novo, voltar para `@doc-feature`, `@doc-chore` ou `@doc-legado` conforme o caso.

## Templates úteis
- `templates/docs-index-template.md`
- `templates/domain-index-template.md`
- `templates/changelog-unreleased-template.md`
