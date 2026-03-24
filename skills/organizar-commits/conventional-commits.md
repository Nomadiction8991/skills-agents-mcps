# @conventional-commits

## Estrutura
```
<tipo>[escopo]: <descricao>   ← max 72 chars, imperativo, lowercase, sem ponto
<linha em branco>
<body: o que, por que, como, dependencia, risco>
<linha em branco>
<footers: Token: valor>
```

## Tipos
Obrigatorios (spec): feat (MINOR) | fix (PATCH)
Convencionais: refactor | docs | test | chore | ci | build | style | perf

## Breaking Change — 3 formas validas
```
# Forma 1: footer
feat(api): remove campo legado
\nBREAKING CHANGE: migrar de `preco_legado` para `preco`

# Forma 2: sufixo !
feat(api)!: remove campo legado

# Forma 3: ambos
feat(api)!: remove campo legado
\nBREAKING CHANGE: migrar de `preco_legado` para `preco`
```
BC pode aparecer em qualquer tipo: chore!, refactor!, docs!

## Footers (git trailer format)
```
Fixes #42
Reviewed-by: joao@empresa.com
Co-authored-by: Maria <maria@empresa.com>
BREAKING CHANGE: descricao   ← unica excecao: espaco, nao hifen
```
Token usa `-` em vez de espaco (ex: Reviewed-by), exceto BREAKING CHANGE.

## Body detalhado — campos obrigatorios
- o que foi alterado
- por que foi alterado
- como a mudanca foi separada (hunk isolavel ou agrupado)
- depende de branch anterior? qual?
- impacto tecnico
- risco
- observacoes para review

## Splitting
Se commit se encaixa em 2+ tipos → quebrar em multiplos commits (regra da spec).
Refactoring ALWAYS em commit separado de mudanca funcional.
