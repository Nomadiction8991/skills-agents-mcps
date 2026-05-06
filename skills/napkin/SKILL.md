---
name: napkin
triggers: [ "always" ]
description: |
  Mantém `/napkin.md` como guia operacional do repositório. Esta skill está
  sempre ativa: leia e revise o arquivo antes de trabalhar. Mantenha apenas regras
  recorrentes, acionáveis e de alto valor, em PT-BR, organizadas por categoria e
  prioridade (máx. 10 itens por categoria). Não use como log.
---

# Napkin

## Objetivo
Manter `/napkin.md` como um guia operacional reutilizável para o repositório, não como histórico de sessão.

## Sempre fazer
1. No início de cada sessão, leia `/napkin.md` antes de qualquer outra ação.
   Internalize silenciosamente; não anuncie a leitura.
2. Ao ler ou editar:
   - repriorize do mais importante para o menos importante;
   - mescle duplicados;
   - remova itens obsoletos, únicos ou de baixo sinal;
   - mantenha apenas orientações recorrentes;
   - limite cada categoria a 10 itens;
   - escreva tudo em PT-BR.
3. Durante o trabalho, registre apenas aprendizados reutilizáveis.
4. **Gatilho de Commit:** Sempre que realizar ou sugerir um commit, revise e atualize o `/napkin.md` com as lições aprendidas na tarefa.

## Registrar apenas
- armadilhas frequentes do repositório ou toolchain;
- diretrizes recorrentes do usuário;
- táticas não óbvias que funcionam repetidamente.

## Não registrar
- logs cronológicos;
- notas de uso único;
- postmortems verbosos;
- erros sem uma linha `Faça isso em vez disso:`.

## Formato
Cada item deve incluir:
- data `[AAAA-MM-DD]`;
- título curto;
- linha `Faça isso em vez disso:`;
- ação concreta e curta.

## Organização
- Organize por categoria.
- Ordene categorias e itens por prioridade descendente.
- Reavalie categoria e prioridade em cada edição.
- Prefira um pequeno número de itens de alto sinal.
- Adapte categorias ao repositório.

## Se `/napkin.md` não existir
Crie:

```markdown
# Napkin Runbook

## Curadoria de Regras
- Repriorize em cada leitura.
- Mantenha apenas notas recorrentes de alto valor.
- Máximo de 10 itens por categoria.
- Cada item deve incluir data e uma linha "Faça isso em vez disso".

## Execução e Validação
1. **[AAAA-MM-DD] Regra curta**
   Faça isso em vez disso: ação concreta e repetível.

## Confiabilidade de Shell e Comandos
1. **[AAAA-MM-DD] Regra curta**
   Faça isso em vez disso: ação concreta e repetível.

## Regras de Comportamento do Domínio
1. **[AAAA-MM-DD] Regra curta**
   Faça isso em vez disso: ação concreta e repetível.

## Diretrizes do Usuário
1. **[AAAA-MM-DD] Diretriz**
   Faça isso em vez disso: siga esta preferência exatamente.
```

## Exemplo
```markdown
1. **[2026-02-21] `rg` falha com listas de caminhos muito longas**
   Faça isso em vez disso: execute `rg` da raiz do diretório ou itere arquivos com `while IFS= read -r`.
```
