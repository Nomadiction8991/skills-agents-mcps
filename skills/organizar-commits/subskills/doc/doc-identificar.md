# @doc-identificar

## Papel
Roteador — determina domínio, arquivo alvo e subskill correta.
Executar ANTES de qualquer escrita na doc.

## Fluxo

```
1. extrair domínio
2. localizar na doc
3. rotear para subskill
```

### 1) Extrair domínio

Prioridade: escopo do commit → arquivos alterados → inferência

```
feat(pagamentos): ...     → pagamentos
fix(usuarios): ...        → usuarios
chore(infra): ...         → infra
feat: ...                 → inferir por arquivo alterado
  PagamentoController.php → pagamentos
  Usuario.php             → usuarios
  create_orders_table.php → orders
```

### 2) Localizar na doc

```bash
find docs/ -type f -name "*.md" | xargs grep -l "{dominio}" 2>/dev/null
```

| Resultado | Próximo passo |
|-----------|--------------|
| `docs/{dominio}/index.md` existe | arquivo alvo = esse |
| `docs/{dominio}/{subtema}.md` relevante | arquivo alvo = esse |
| Nenhum arquivo encontrado | → @doc-estrutura |

### 3) Rotear

| Tipo CC | Subskill |
|---------|---------|
| `feat` | @doc-feature |
| `fix` | @doc-fix |
| `chore` / `build` / `ci` | @doc-chore |
| `refactor` sem mudança de comportamento | atualizar só se doc existente estiver errada |
| `docs` | editar arquivo alvo diretamente |

## Saída interna

```
domínio:      pagamentos
arquivo_alvo: docs/pagamentos/split.md
subskill:     @doc-feature
```
