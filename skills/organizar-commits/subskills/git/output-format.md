# @output-format

## Regra da resposta
Curto no processo, detalhado no resultado.

## Campos obrigatórios por UL

```
- nome
- objetivo
- arquivos_envolvidos
- depende_de
- pode_ir_direto_para_main: sim|nao
    sim = funciona sozinha sem qualquer outra UL pendente
    nao = usa/importa código criado por outra UL pendente
- branch                    ← formato: <tipo>/<tema>-<resumo> (SEM número)
- base_da_branch            ← main | nome-da-branch-pai
- posicao_na_stack          ← "independente" | "depende de <branch>"
- tamanho_estimado_linhas
- commit_title
- commit_body_detalhado
- ordem_do_pr
- doc_acao: criar|atualizar|nenhuma
- doc_arquivo               ← caminho relativo em docs/
- changelog_entrada         ← texto exato para unreleased.md (ou "nenhuma")
```

## Formato do nome de branch

```
✓ feat/organizar-commits-workflow
✓ feat/interface-design-skill
✓ fix/auth-token-refresh
✓ chore/vitepress-setup
✗ feat/auth/03-token-refresh    ← número proibido
✗ feat/03-organizar-commits     ← número proibido
```

## Exemplo de saída — 3 ULs independentes (todas saem de main)

UL 1
- nome: workflow de organização de commits
- objetivo: modularizar a skill de commits com subskills
- arquivos_envolvidos: SKILL.md, subskills/git/*.md
- depende_de: nenhuma
- pode_ir_direto_para_main: sim
- branch: feat/organizar-commits-workflow
- base_da_branch: main
- posicao_na_stack: independente
- tamanho_estimado_linhas: ~120 linhas
- commit_title: feat(organizar-commits): modulariza workflow em subskills
- commit_body_detalhado:
  Separa a skill em subskills por responsabilidade (git/, doc/, vitepress/).
  Adiciona fluxo de 4 fases obrigatórias no SKILL.md.
  Roda sozinha. Não depende de outras ULs pendentes.
  Risco baixo: reorganização de arquivos internos da skill.
- ordem_do_pr: PR independente → main
- doc_acao: atualizar
- doc_arquivo: docs/organizar-commits/index.md
- changelog_entrada: "- **Organizar Commits**: workflow modularizado em subskills por responsabilidade"

UL 2
- nome: skill de interface/design
- objetivo: criar skill focada em produto substituindo frontend-design
- arquivos_envolvidos: subskills/interface-design.md
- depende_de: nenhuma
- pode_ir_direto_para_main: sim
- branch: feat/interface-design-skill
- base_da_branch: main
- posicao_na_stack: independente
- tamanho_estimado_linhas: ~60 linhas
- commit_title: feat(interface-design): substitui frontend-design por skill focada em produto
- commit_body_detalhado:
  Remove referências a frontend-design.
  Cria skill interface-design com foco em design de produto.
  Roda sozinha. Não depende de nenhuma outra UL pendente.
  Risco baixo: nova skill sem impacto em código existente.
- ordem_do_pr: PR independente → main
- doc_acao: criar
- doc_arquivo: docs/interface-design/index.md
- changelog_entrada: "- **Interface Design**: nova skill substitui frontend-design"

## Exemplo — UL dependente

UL 3
- nome: 2FA depende do fluxo OAuth
- depende_de: feat/auth-oauth-flow
- pode_ir_direto_para_main: nao
- branch: feat/auth-2fa
- base_da_branch: feat/auth-oauth-flow
- posicao_na_stack: depende de feat/auth-oauth-flow
- ordem_do_pr: PR → feat/auth-oauth-flow (somente após merge daquela)
