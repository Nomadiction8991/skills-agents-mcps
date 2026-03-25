# @doc-changelog

## Papel (Diátaxis: Reference — histórico cronológico)
Registrar cada mudança relevante em linguagem de produto.
Acionado ao final de @doc-feature, @doc-fix e @doc-chore (quando relevante).

## Arquivo alvo
`docs/changelog/unreleased.md`

## Formato de entrada

```markdown
### Adicionado
- **{Domínio}**: {o que o usuário pode fazer agora} ([ver doc](../{dominio}/{arquivo}.md))

### Corrigido
- **{Domínio}**: {comportamento que agora funciona corretamente} ([ver doc](../{dominio}/{arquivo}.md))

### Alterado
- **{Domínio}**: {o que mudou no comportamento existente}

### Removido
- **{Domínio}**: {o que deixou de existir}
```

## Regras de escrita (estilo Google/Keep a Changelog)

```
✓ verbo imperativo no presente: "Adiciona", "Corrige", "Remove"
✓ linguagem de produto — descrever comportamento, não implementação
✓ sempre linkar para o doc do domínio afetado
✗ não mencionar nomes de classes, métodos, variáveis internas
✗ não usar jargão técnico sem necessidade
```

**Bom:**
```
- **Pagamentos**: split entre múltiplos recebedores agora disponível ([ver doc](../pagamentos/split.md))
- **Usuários**: validação de email aceita domínios com subdomain ([ver doc](../usuarios/index.md))
```

**Ruim:**
```
- Adiciona campo split_rules no PaymentController
- Fix no regex de email no UserRequest
```

## Ao criar uma release

```
1. renomear [Unreleased] → [vX.Y.Z] - YYYY-MM-DD em unreleased.md
2. criar docs/changelog/v{X.Y.Z}.md com o conteúdo
3. adicionar entrada em docs/changelog/index.md com link para a versão
4. criar nova seção [Unreleased] vazia em unreleased.md
```

## Estrutura do diretório changelog

```
docs/changelog/
  index.md         # lista todas as versões com links + datas
  unreleased.md    # próxima versão em construção
  v1.2.0.md        # versão fechada
  v1.1.0.md
```
