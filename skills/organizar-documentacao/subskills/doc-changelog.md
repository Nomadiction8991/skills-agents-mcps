# @doc-changelog

## Papel
Registrar mudanças relevantes em `DOCS_ROOT/changelog/unreleased.md`.

## Quando usar
- feature com impacto externo;
- fix com impacto externo;
- chore que muda setup, operação ou uso.

## Seções padrão
- `Adicionado`
- `Corrigido`
- `Alterado`
- `Removido`

## Regras
- Descrever comportamento em linguagem de produto.
- Linkar para o arquivo de documentação quando fizer sentido.
- Não citar classes, métodos ou detalhes internos.

## Release
Ao fechar versão:
1. mover conteúdo de `unreleased.md` para `vX.Y.Z.md`;
2. atualizar `changelog/index.md`;
3. recriar a seção `Unreleased` vazia.
