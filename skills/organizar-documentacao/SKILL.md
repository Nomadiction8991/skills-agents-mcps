---
name: organizar-documentacao
description: Organiza a documentação do projeto alvo em ./docs usando Diátaxis, leitura de mudanças via Git e normalização de arquivos legados.
version: "3.2.1"
---

# Organizar Documentação

## Objetivo
Manter a documentação do **projeto alvo** sincronizada com o código e manter `./docs` coerente mesmo quando existirem arquivos antigos, soltos ou criados por outras skills.

## Escopo
- **Alvo padrão:** `./docs` na raiz do projeto alvo.
- **Esta skill não hospeda a documentação final.**
- `templates/` contém modelos reutilizáveis.
- `examples/docs-template/` mostra uma estrutura de referência.

## Constantes
- `DOCS_ROOT = ./docs`
- `README_ROOT = ./README.md`

## Princípio operacional
**Esta skill existe para documentar alterações.**
Por isso, uma das primeiras ações deve ser sempre inspecionar o repositório com Git antes de editar qualquer documentação.

## Limite de atuação no Git
Esta skill pode **apenas ler e inspecionar** o estado do repositório para entender mudanças.

Permitido:
- `git status --short`
- `git diff --name-only`
- `git diff --stat`
- `git diff`
- `git diff --cached`
- `git log -1 --stat`
- outras leituras equivalentes

Proibido:
- criar branch
- commitar
- dar push
- dar merge
- rebase
- cherry-pick
- stash
- reset
- checkout com alteração de estado
- qualquer comando Git que altere histórico, ponteiros, staging ou working tree

Regra: usar Git só como fonte de leitura para decidir a documentação.

## Inspeção obrigatória de Git
Executar nesta ordem, adaptando ao contexto e mantendo apenas leitura:
1. `git status --short` → detectar se há trabalho candidato a documentação.
2. `git diff --name-only` → localizar arquivos afetados.
3. `git diff --stat` → estimar escopo da mudança.
4. `git diff` e/ou `git diff --cached` → entender comportamento, configuração, contrato ou fluxo alterado.
5. Se necessário, complementar com histórico recente (`git log -1 --stat`, último commit ou diff entre refs relevantes).

Regra: **não decidir a documentação só pelo nome dos arquivos alterados; ler o diff quando houver dúvida.**

## Modos de execução
### 1. Modo mudança
Use quando a inspeção de Git mostrar alteração relevante no código, config, contrato, fluxo, operação ou setup.

### 2. Modo legado
Use quando **não houver nada útil em Git para documentar**.
Neste caso, a skill deve auditar `DOCS_ROOT` e normalizar markdowns fora do escopo padrão.

## Ordem de execução
1. Inspecionar Git.
2. Verificar se existe mudança real para documentar.
3. Se houver, seguir `@doc-identificar`.
4. Se não houver, rodar `@doc-legado`.
5. Se criar ou mover arquivo, atualizar o índice local e o índice geral.
6. Atualizar changelog quando houver impacto externo.

## Roteamento por tipo de trabalho
| Situação | Subskill | Regra principal |
|---|---|---|
| `feat` | `@doc-feature` | expandir doc existente; criar subtema só se necessário |
| `fix` | `@doc-fix` | corrigir no ponto exato; não criar arquivo novo |
| `chore` / `build` / `ci` | `@doc-chore` | documentar só se mudar setup, operação ou uso |
| domínio novo | `@doc-estrutura` | criar a estrutura mínima em `DOCS_ROOT` |
| docs legados, soltos ou fora do padrão | `@doc-legado` | ler, classificar, mover, refatorar e reindexar |
| release | `@doc-changelog` | fechar `unreleased.md` e abrir nova seção |

## Estrutura padrão esperada em `DOCS_ROOT`
```text
./docs
  index.md
  changelog/
    index.md
    unreleased.md
  getting-started/
    index.md
    instalacao.md
    configuracao.md
  reference/
    index.md
    comandos.md
    convencoes.md
  {dominio}/
    index.md
    {subtema}.md
```

## O que é “fora do escopo padrão”
Tratar como candidato a normalização:
- `.md` solto em `DOCS_ROOT` sem ser `index.md`;
- arquivo em pasta errada para o tipo de conteúdo;
- arquivo com nome genérico demais (`novo.md`, `ajustes.md`, `teste.md`);
- conteúdo misturando vários objetivos no mesmo markdown;
- arquivo duplicado, sobreposto ou desalinhado com a estrutura Diátaxis;
- markdown criado por outra skill sem índice, domínio ou links corretos.

## Regras de ouro
- Escrever para o comportamento atual, não para o histórico do código.
- Um arquivo = um objetivo principal.
- Um tipo Diátaxis por arquivo: `tutorial`, `how-to`, `reference` ou `explanation`.
- Reaproveitar arquivo existente antes de criar outro.
- Fix corrige em lugar; feature pode abrir subtema novo quando o conteúdo ficar grande ou reutilizável.
- README da raiz só aponta; detalhe fica em `DOCS_ROOT`.
- Não duplicar conteúdo entre README, índice e páginas de domínio.
- Em modo legado, **ler antes de mover** e **refatorar antes de preservar estrutura ruim**.
- Em modo mudança, **inspecionar Git antes de classificar a mudança**.
- Git é somente leitura nesta skill.

## Saída esperada das subskills
Sempre decidir e retornar, mesmo que internamente:
```text
dominio: {dominio}
arquivo_alvo: {caminho}
acao: {criar|editar|mover|mesclar|ignorar}
subskill: {@doc-*}
```

## Quando ignorar
Ignorar a escrita se a mudança for apenas interna e não alterar:
- comportamento visível;
- instalação ou configuração;
- operação do sistema;
- contrato externo (API, payload, comando, fluxo).

No modo legado, ignorar apenas arquivos claramente temporários, vazios ou duplicados sem valor.

## Arquivos desta skill
- `subskills/` → regras específicas por tipo de mudança
- `templates/` → modelos prontos para gerar docs no projeto alvo
- `examples/docs-template/` → exemplo de como `./docs` pode ser organizado
- `skill-creator-integration.md` → integração com automação
