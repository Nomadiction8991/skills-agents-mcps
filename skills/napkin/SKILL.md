---
name: napkin
description: |
  Mantenha `/napkin.md` como guia operacional do repositório. Esta skill está
  sempre ativa: leia e recure o arquivo antes de trabalhar. Guarde apenas
  regras recorrentes, acionáveis e de alto valor, em PT-BR, organizadas por
  categoria e prioridade (máx. 10 itens por categoria). Não use como log.
---

# Napkin

## Objetivo
Manter `/napkin.md` como um guia operacional reutilizável do repositório, não
como histórico de sessão.

## Sempre faça
1. No início de toda sessão, leia `/napkin.md` antes de qualquer outra ação.
   Internalize em silêncio; não anuncie a leitura.
2. Ao ler ou editar:
   - repriorize do mais importante ao menos importante;
   - una duplicados;
   - remova itens obsoletos, pontuais ou de baixo sinal;
   - mantenha só orientações recorrentes;
   - limite cada categoria a 10 itens;
   - escreva tudo em PT-BR.
3. Durante o trabalho, registre só aprendizados reutilizáveis.

## Registre apenas
- pegadinhas frequentes do repositório ou da toolchain;
- diretrizes recorrentes do usuário;
- táticas não óbvias que funcionam repetidamente.

## Não registre
- log cronológico;
- nota pontual;
- pós-mortem verboso;
- erro sem `Faça isto em vez disso`.

## Formato
Cada item deve ter:
- data `[YYYY-MM-DD]`;
- título curto;
- linha `Faça isto em vez disso:`;
- ação concreta e curta.

## Organização
- Organize por categoria.
- Ordene categorias e itens por prioridade decrescente.
- Reavalie categoria e prioridade a cada edição.
- Prefira poucos itens de alto sinal.
- Adapte as categorias ao repositório.

## Se `/napkin.md` não existir
Crie:

```markdown
# Runbook do Napkin

## Regras de Curadoria
- Repriorize a cada leitura.
- Mantenha apenas notas recorrentes e de alto valor.
- Máximo de 10 itens por categoria.
- Cada item inclui data + "Faça isto em vez disso".

## Execução e Validação
1. **[YYYY-MM-DD] Regra curta**
   Faça isto em vez disso: ação concreta e repetível.

## Shell e Confiabilidade
1. **[YYYY-MM-DD] Regra curta**
   Faça isto em vez disso: ação concreta e repetível.

## Regras do Domínio
1. **[YYYY-MM-DD] Regra curta**
   Faça isto em vez disso: ação concreta e repetível.

## Diretrizes do Usuário
1. **[YYYY-MM-DD] Diretriz**
   Faça isto em vez disso: siga exatamente esta preferência.
```

## Exemplo
```markdown
1. **[2026-02-21] `rg` falha com listas de caminhos expandidas demais**
   Faça isto em vez disso: execute `rg` nas raízes dos diretórios ou itere os arquivos com `while IFS= read -r`.
```
