---
name: iniciar-projeto
description: "Gerar ou revisar um `README.md` curto, direto e confiavel para projeto em andamento ou ainda nao iniciado. Usar para README inicial, onboarding de repositorio e documentacao de projeto pouco documentado, ignorando caminhos cobertos por `.gitignore`, perguntando ao usuario apenas o que o repositorio nao responder com seguranca, e mantendo `CLAUDE.md`, `AGENTS.md` e `instructions.md` como links simbolicos para `README.md` quando faltarem."
---

# Iniciar Projeto

## Objetivo

Tratar `README.md` como documento central do repositorio.

Descobrir o maximo possivel pelo proprio codigo e escrever um `README.md` curto, util e confiavel. Perguntar ao usuario so no fim da descoberta, e apenas sobre lacunas essenciais.

## Perguntas que a IA deve responder primeiro

Antes de escrever ou perguntar qualquer coisa, tentar responder sozinha:

- o que o projeto e;
- para que serve;
- para quem serve;
- que tipo de sistema ele e;
- em que estado ele esta;
- o que ja existe e o que ainda falta;
- qual stack usa ou pretende usar;
- como e usado, instalado, executado ou publicado;
- quais integracoes, agents ou MCPs existem;
- o que esta fora de escopo, quando isso for importante.

Se alguma dessas respostas nao puder ser sustentada pelo repositorio, perguntar ao usuario apenas os itens em aberto.

## Regras centrais

- Ler `.gitignore` antes da descoberta e ignorar esses caminhos como exclusao dura.
- Reaproveitar o `README.md` atual quando ele tiver fatos validos.
- Inferir apenas a partir de sinais tecnicos fortes.
- Fazer o `README.md` responder as perguntas centrais de descoberta, nao apenas preencher secoes genericas.
- Nao citar no `README.md` nada que esteja coberto por `.gitignore`.
- Escrever o minimo util, sem floreio, marketing ou formalidade.
- Criar aliases de documentacao por link simbolico, nunca por copia.

## Contexto a consultar

Usar nesta ordem:

1. `.gitignore`, se existir.
2. `README.md`, se existir.
3. `.github/copilot/`.
4. `.github/copilot-instructions.md`, `.github/copilot/copilot-instructions.md`, `.github/instructions/copilot-instructions.md`.
5. Manifestos, setup e automacao: `package.json`, `pyproject.toml`, `composer.json`, `Cargo.toml`, `go.mod`, `Makefile`, `Dockerfile*`, CI e scripts.
6. Estrutura visivel do repositorio: pastas, entrypoints, rotas, controllers, services, templates, migrations, testes, assets fora do filtro de `.gitignore`.
7. `LICENSE` e documentacao complementar fora do filtro de `.gitignore`.

## Fluxo

1. Ler `.gitignore` e montar o filtro da descoberta.
2. Tratar caminhos cobertos por `.gitignore` como invisiveis para a descoberta, mesmo que estejam versionados no Git.
3. Inspecionar o repositorio visivel depois desse filtro.
4. Responder internamente a lista de perguntas centrais da skill.
5. Consolidar fatos sobre objetivo, stack, arquitetura, setup e contribuicao.
6. Decidir se ja ha base suficiente para escrever o `README.md`.
7. Se faltar contexto, usar o banco de perguntas desta skill e perguntar apenas o que continua em aberto.
8. Gerar ou revisar `README.md`.
9. Criar `CLAUDE.md`, `AGENTS.md` e `instructions.md` como links simbolicos para `README.md` se estiverem ausentes.

## Regra do filtro

Se um caminho bater em `.gitignore`, ele e seus descendentes saem da descoberta.

Isso vale mesmo quando:

- o arquivo estiver versionado no Git;
- houver referencias a ele em `git status`;
- a pasta existir fisicamente no repositorio.

Conteudo excluido por `.gitignore` nao pode ser usado para:

- inferir stack;
- listar modulos, skills, agents ou MCPs;
- descrever estrutura;
- sustentar exemplos ou fluxo de uso.

## Como decidir perguntas

- Primeiro tentar responder internamente a lista de perguntas centrais da skill.
- Projeto em andamento: extrair o maximo possivel do repositorio e perguntar apenas sobre lacunas reais.
- Projeto ainda nao iniciado: confirmar cedo que faltam evidencias e perguntar sobre problema, publico, tipo de sistema, primeira entrega, stack e operacao.
- Primeira rodada: 4 a 6 perguntas nucleares.
- Segunda rodada: apenas o complemento estritamente necessario.

Perguntar apenas quando faltar, por exemplo:

- problema que o projeto resolve;
- para quem ele existe;
- tipo de sistema;
- estado atual ou primeira entrega;
- stack pretendida;
- forma de execucao, deploy ou distribuicao;
- integracoes externas;
- escopo, fora de escopo ou criterio de sucesso;
- idioma do `README.md`.

## Banco de perguntas

Usar so para o que o repositorio nao respondeu com seguranca.

### Perguntas nucleares

Comecar pelas mais relevantes:

1. Qual problema este projeto resolve?
2. Quem vai usar ou se beneficiar dele?
3. Que tipo de sistema e esse: site, painel, API, automacao, ecommerce, app interno, biblioteca ou outro?
4. O que ja existe hoje e o que ainda falta?
5. Qual e a primeira entrega esperada?
6. Quais tecnologias ou ferramentas pretende usar?
7. Como isso deve ser executado, publicado ou distribuido?
8. Em que idioma o `README.md` deve ser escrito?

### Se o projeto ja esta em andamento

Perguntar apenas o que o codigo nao deixar claro:

- O que ja funciona hoje?
- O que ainda esta em construcao?
- Quem usa hoje ou quem deve usar quando estiver pronto?
- Existe algum jeito real de instalar, rodar ou testar que nao aparece no repositorio?
- Ha algum modulo, integracao ou restricao importante que o codigo nao revela bem?
- O que deveria ficar fora de escopo no `README.md`?

### Se o projeto ainda nao comecou

Perguntar o basico para montar o primeiro README:

- Por que esse projeto precisa existir?
- Que dor, tarefa ou processo ele melhora?
- Quem e o publico principal?
- Qual sera o formato inicial: web, mobile, backend, CLI, automacao ou pacote interno?
- Existe preferencia de stack, arquitetura, banco ou hospedagem?
- Existe integracao externa obrigatoria desde o inicio?

### Perguntas complementares

Usar so se ainda forem necessarias:

- Como voce vai saber que o projeto deu certo?
- O que entra obrigatoriamente na primeira versao?
- O que esta fora de escopo agora?
- Existe alguma tecnologia obrigatoria ou proibida?
- Ha restricoes de seguranca, compliance, custo ou licenca?
- Quais sistemas externos fazem parte da solucao?
- Ha MCPs, agents ou integracoes relevantes em uso ou planejados?
- Existe legado, processo manual ou migracao envolvidos?
- Quem vai manter o projeto?
- Existe algum padrao de contribuicao ou revisao que deva entrar no `README.md`?

### Regra pratica

- O que a IA conseguiu responder sozinha vira `README.md`.
- O que ficou sem resposta vira pergunta ao usuario.
- Nao pergunte algo que o repositorio ja respondeu com seguranca.

## Forma do README

Fazer o `README.md` responder, do jeito mais curto possivel, as perguntas centrais da skill:

- o que o projeto e;
- para que serve;
- para quem serve;
- que tipo de sistema ele e;
- em que estado ele esta;
- qual stack usa ou pretende usar;
- como e usado, instalado, executado ou publicado, se isso for relevante;
- quais integracoes, agents ou MCPs existem;
- o que esta fora de escopo, quando isso mudar a leitura do projeto.

Usar apenas secoes com base suficiente. Bons nomes curtos:

- titulo e descricao curta;
- finalidade;
- para quem serve;
- tipo e estado;
- stack;
- integracoes ou MCPs;
- estrutura;
- instalacao ou execucao;
- testes, contribuicao e licenca.

Se o repositorio sugerir MCPs, agents ou integracoes e nao houver nenhum estruturado, deixar isso explicito em uma linha. Nao usar `Uso rapido` ou `Regras do repo` como secoes padrao, a menos que esse seja o jeito mais curto de responder algo realmente importante.

## Regra de escrita

- Preferir bullets curtos e paragrafos de 1 ou 2 linhas.
- Cortar qualquer frase que nao ajude a entender, instalar, usar ou contribuir.
- Evitar repeticao e secoes de enfeite.
- Nao transformar o `README.md` em manual completo.

## Regras dos links simbolicos

Se os arquivos abaixo nao existirem na raiz, criar links simbolicos relativos apontando para `README.md`:

- `CLAUDE.md`
- `AGENTS.md`
- `instructions.md`

Nao sobrescrever arquivo existente. Nao substituir link simbolico existente. Se o ambiente impedir symlink, informar claramente em vez de copiar o arquivo.

## Nao fazer

- perguntar cedo por falta de investigacao;
- inventar stack, arquitetura, testes, licenca ou fluxo;
- citar artefatos cobertos por `.gitignore`;
- criar secoes so para seguir molde;
- copiar o `README.md` para `CLAUDE.md`, `AGENTS.md` ou `instructions.md`.

## Resposta ao usuario

Ao finalizar:

1. informar se o `README.md` foi criado ou revisado;
2. resumir o que foi simplificado, adicionado ou removido;
3. informar se os links simbolicos foram criados ou ja existiam;
4. listar perguntas pendentes ou lacunas restantes, se houver.
