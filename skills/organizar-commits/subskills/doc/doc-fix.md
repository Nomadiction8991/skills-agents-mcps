# @doc-fix

## Papel (Diátaxis: Reference — correção in-place)
Localizar o ponto exato onde o comportamento errado estava descrito.
Corrigir ali. Fix nunca cria arquivo novo.

## Localizar o ponto errado

```bash
grep -r "{comportamento ou endpoint afetado}" docs/
```

| O que encontrar | O que corrigir |
|-----------------|---------------|
| Descrição errada do comportamento | reescrever o trecho |
| Exemplo de request/response incorreto | atualizar o exemplo |
| Parâmetro com descrição errada | corrigir inline |
| Comportamento não documentado | adicionar descrição correta na seção relevante |

## Regra de escrita da correção

```
A doc descreve sempre o comportamento ATUAL e CORRETO.
Escrever como se sempre fosse assim.
Não marcar "CORRIGIDO:", não deixar versão antiga comentada.
Histórico do bug → apenas no changelog via @doc-changelog.
```

## Não fazer

```
✗ criar docs/fixes/fix-{nome}.md
✗ duplicar conteúdo correto em outro lugar
✗ deixar descrição antiga comentada no arquivo
✗ adicionar nota "antes era X, agora é Y" no corpo do doc
```

## Após corrigir
```
1. verificar se outros arquivos referenciam o comportamento corrigido
2. acionar @doc-changelog
```
