# Validação e Memória

Use este arquivo ao decidir o que salvar em `.interface-design/system.md`.

## Salve um padrão quando ele for:
- usado 2+ vezes
- reaproveitável no projeto
- específico o bastante para importar depois

## Formato de salvamento

```md
### Botão / Primário
- Altura: 36px
- Padding: 12px 16px
- Raio: 6px
- Fonte: 14px / 500
```

## Não salve
- experimentos pontuais
- trabalho temporário
- variantes que são melhor tratadas por props

## Antes de criar um novo padrão
- verifique se já existe algo parecido
- estenda padrões existentes antes de criar quase duplicatas

## Checagens de consistência
Se `system.md` definir valores, verifique:
- o espaçamento permanece na grade salva
- a profundidade segue a estratégia salva
- a paleta/tokens combinam com o sistema salvo
- componentes reutilizados seguem os padrões salvos
