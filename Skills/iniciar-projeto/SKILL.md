---
name: iniciar-projeto
description: "DISCOVERY + AUTHORING SKILL - Entende o contexto de projetos novos ou pouco documentados a partir do que existir no repositorio, faz perguntas quando faltar base e gera ou revisa um `README.md` inicial rico, tecnico e confiavel."
---

# Iniciar Projeto

Use esta skill quando o pedido envolver iniciar um projeto, documentar um repositorio novo, gerar um `README.md` do zero, destravar um projeto vazio ou montar a primeira explicacao consistente do sistema a partir dos sinais disponiveis.

Gatilhos comuns:

- `iniciar projeto`
- `projeto novo`
- `repositorio vazio`
- `README inicial`
- `README`
- `documentacao do repositorio`
- `documentacao interna`
- `estrutura do projeto`
- `onboarding`
- `project overview`

## Perfil

- Dominio: descoberta de contexto e documentacao tecnica
- Lingua da skill: pt-BR
- Papel: analista, entrevistador e redator tecnico
- Ambito: descoberta guiada + geracao e refino de `README.md`
- Saida: markdown

## Objetivo

Descobrir o contexto de um projeto e produzir um `README.md` completo, claro e confiavel a partir da documentacao disponivel, da estrutura do codigo, dos arquivos de configuracao e, quando necessario, das respostas fornecidas pelo usuario.

Esta skill deve saber parar, perguntar e so depois escrever quando o repositorio estiver vazio, o projeto for novo ou as evidencias forem insuficientes.

O foco e fazer com que uma pessoa nova no repositorio consiga entender com rapidez:

- o que o projeto faz;
- para que ele existe;
- onde ele se encaixa no contexto do produto ou negocio, quando isso puder ser deduzido com seguranca;
- qual arquitetura aparenta adotar;
- quais tecnologias realmente compoem a solucao, como `PHP`, `HTML`, `CSS`, `JavaScript`, banco de dados e ferramentas de build;
- como instalar, executar, testar e contribuir.

## Quando interromper e perguntar ao usuario

Faca perguntas antes de gerar o `README` quando ocorrer qualquer uma destas condicoes:

- o repositorio estiver praticamente vazio;
- houver apenas `.gitignore`, `README.md` vazio, arquivos de configuracao minimos ou nenhuma base de codigo;
- o projeto parecer novo e ainda sem definicao clara de stack, finalidade ou arquitetura;
- existir pouca evidencia para deduzir o que o software faz;
- houver conflito forte entre documentacao, codigo e estrutura;
- faltar informacao essencial que nao possa ser deduzida com seguranca.

Considere o repositorio "novo" ou "vazio" quando houver um ou mais destes sinais:

- ausencia de codigo-fonte relevante;
- ausencia de manifestos principais ou de dependencias instaladas;
- ausencia de documentacao orientadora ou instrucoes de projeto;
- estrutura minima ainda sem modulos, rotas, telas, servicos ou testes;
- documentacao existente sem contexto suficiente para identificar o produto.

Nesses casos, nao tente adivinhar cedo demais. Pergunte primeiro.

## Fontes primarias

Procure e priorize evidencias nesta ordem:

1. Arquivos dentro de `.github/copilot/`, incluindo materiais como:
   - `Architecture`
   - `Code_Exemplars`
   - `Coding_Standards`
   - `Project_Folder_Structure`
   - `Technology_Stack`
   - `Unit_Tests`
   - `Workflow_Analysis`
2. Arquivos de instrucoes do Copilot, nesta ordem de preferencia:
   - `.github/copilot-instructions.md`
   - `.github/copilot/copilot-instructions.md`
   - `.github/instructions/copilot-instructions.md`

Se as fontes primarias estiverem incompletas, use apenas como apoio complementar:

- `README.md` atual
- arquivos de manifesto como `package.json`, `pyproject.toml`, `composer.json`, `Cargo.toml`, `go.mod`
- `Dockerfile`, `Makefile`, CI e scripts de setup
- arquivos de licenca como `LICENSE`

Se nem as fontes primarias nem os sinais do repositorio forem suficientes, mude para modo de descoberta e pergunte ao usuario o que falta.

## Fontes de inferencia segura

Quando a documentacao nao explicar bem o projeto, deduza informacoes apenas a partir de sinais tecnicos concretos do repositorio, por exemplo:

- extensoes e distribuicao de arquivos como `.php`, `.blade.php`, `.html`, `.css`, `.scss`, `.js`, `.ts`, `.vue`, `.jsx`, `.tsx`
- frameworks e libs declarados em manifestos e lockfiles
- estrutura de pastas como `app/`, `src/`, `templates/`, `resources/views/`, `public/`, `routes/`, `assets/`, `tests/`
- nomes de modulos, controllers, services, commands, jobs, entities, migrations e componentes
- arquivos de entrada e bootstrap como `index.php`, `artisan`, `bin/console`, `main.ts`, `vite.config.*`, `webpack.config.*`
- pipelines de CI, comandos de build, scripts de teste e automacao
- configuracoes de banco, fila, cache, Docker, nginx, Apache ou deploy

Esses sinais permitem inferencias fortes como:

- se o projeto e uma aplicacao web, API, painel administrativo, biblioteca, pacote interno ou servico backend;
- se usa `PHP` no backend e `HTML`/`CSS` no frontend;
- se ha renderizacao server-side, templates, SPA ou assets estaticos;
- se a arquitetura parece MVC, modular, monolitica, orientada a servicos ou em camadas;
- quem aparenta ser o publico principal: usuarios finais, equipe interna, integradores ou desenvolvedores.

Nao invente fatos ausentes das fontes. Se uma informacao importante nao puder ser confirmada nem deduzida com seguranca, omita do `README` ou sinalize a lacuna fora do arquivo final.

## Perguntas obrigatorias quando faltar contexto

Quando precisar perguntar, faca perguntas curtas, diretas e em texto simples. Pergunte apenas o que estiver faltando, mas cubra pelo menos os pontos essenciais abaixo em projetos novos ou vazios:

1. Qual problema este projeto vai resolver?
2. Para quem ele esta sendo feito?
3. Que tipo de projeto e esse: site, painel, API, ecommerce, automacao, biblioteca, app interno ou outro?
4. Quais tecnologias pretende usar no backend e no frontend, por exemplo `PHP`, `HTML`, `CSS`, `JavaScript`, banco de dados e framework?
5. Ha alguma preferencia de arquitetura, como MVC, camadas, modular ou API separada?
6. Como o projeto devera ser executado ou publicado?
7. Existe alguma integracao externa importante?
8. Em que idioma o `README` deve ser escrito?

Se o usuario ja tiver respondido parte disso, faca apenas perguntas complementares.

## Fluxo de trabalho do nucleo

1. Detecte se o projeto esta vazio ou mal definido.
   Verifique se ha codigo, manifestos, documentacao, estrutura funcional e sinais suficientes para deducao.
2. Pergunte ao usuario quando faltar base.
   Se o projeto for novo, vazio ou ambiguo, faca perguntas essenciais antes de escrever o `README`.
3. Mapeie as fontes disponiveis.
   Liste os arquivos relevantes encontrados em `.github/copilot` e identifique qual variante de `copilot-instructions.md` existe.
4. Extraia evidencias por topico.
   Organize mentalmente ou em notas curtas o que cada fonte informa sobre nome do projeto, objetivo, stack, arquitetura, setup, fluxo de desenvolvimento, testes e contribuicao.
5. Inspecione o repositorio para inferencia segura.
   Use manifestos, estrutura de pastas, entrypoints, tipos de arquivos e nomes de modulos para inferir finalidade, dominio, arquitetura e stack real do projeto.
6. Resolva lacunas com apoio minimo.
   Complete versoes, comandos, tecnologias e contexto de uso com manifestos e scripts do repositorio somente quando as fontes primarias nao bastarem.
7. Estruture o `README` para onboarding.
   Priorize clareza, navegacao facil, instalacao rapida e contexto suficiente para desenvolvimento.
8. Escreva com rastreabilidade.
   Cada secao precisa refletir evidencias concretas ou inferencias fortes baseadas no codigo; nao use texto generico que poderia servir para qualquer repositorio.
9. Revise antes de entregar.
   Remova repeticoes, placeholders, marketing vazio e afirmacoes sem respaldo documental.

## Estrutura recomendada do README

Use estas secoes como padrao. Adapte a ordem ou remova apenas quando nao houver base suficiente.

### 1. Nome do projeto e descricao

- Extraia o nome oficial do projeto ou repositorio.
- Resuma o proposito principal em 1 ou 2 paragrafos curtos.
- Explique o problema que o projeto resolve e para quem ele existe, sem linguagem promocional.
- Se a documentacao nao disser claramente a finalidade, deduza pelo dominio exposto em nomes de classes, rotas, modulos, telas e integracoes.

### 2. Finalidade e uso esperado

- Explique por que o projeto provavelmente existe e em que contexto ele deve ser usado.
- Diferencie, quando possivel, se ele serve para produto final, operacao interna, integracao, automacao, CMS, painel administrativo, e-commerce, API ou biblioteca.
- Se o repositorio indicar publico-alvo, registre para quem ele foi feito: usuarios finais, clientes, equipe interna ou outros desenvolvedores.

### 3. Stack de tecnologia

- Liste linguagens, frameworks, ferramentas, banco de dados, infraestrutura e runtime.
- Inclua versoes somente quando confirmadas.
- Priorize o arquivo `Technology_Stack`.
- Quando a documentacao nao listar tudo, detecte tecnologias pelo codigo e pelos manifestos.
- Deixe explicito no texto quando o stack combina backend, frontend e tooling, por exemplo `PHP` no servidor, templates `HTML`, estilos em `CSS` ou `SCSS` e assets em `JavaScript`.

### 4. Arquitetura

- Descreva a arquitetura em alto nivel.
- Explique modulos, camadas, servicos ou fluxos importantes.
- Se a documentacao for fraca, deduza a arquitetura pela organizacao das pastas e responsabilidades do codigo.
- Inclua um diagrama simples em ASCII ou Mermaid apenas se a documentacao ou a estrutura observada realmente suportarem isso.

### 5. Getting Started

- Liste pre-requisitos.
- Inclua passos de instalacao e configuracao.
- Adicione comandos reais para rodar o projeto, setup inicial, seeds, migrations ou dev server quando existirem.

### 6. Estrutura do projeto

- Resuma a organizacao de pastas e os diretorios principais.
- Priorize `Project_Folder_Structure`.
- Use bloco de codigo apenas quando a arvore fizer diferenca para entendimento.

### 7. Funcionalidades principais

- Destaque as capacidades centrais do projeto.
- Consolide informacoes vindas de varias fontes sem duplicar secoes anteriores.

### 8. Fluxo de desenvolvimento

- Resuma branch strategy, code review, deploy flow, ambientes ou rotina de trabalho quando documentados.
- Priorize `Workflow_Analysis`.

### 9. Padroes de codigo

- Resuma convencoes de estilo, arquitetura, nomenclatura, lint, formatacao e criterios de qualidade.
- Priorize `Coding_Standards`.

### 10. Testes

- Explique a estrategia de testes, ferramentas usadas e como executar a suite.
- Priorize `Unit_Tests`.

### 11. Contribuicao

- Oriente como contribuir com clareza.
- Referencie `Code_Exemplars` e `copilot-instructions.md` quando eles trouxerem expectativas praticas.

### 12. Licenca

- Inclua a licenca somente se ela estiver explicitamente documentada ou presente em `LICENSE`.

## Regras de composicao

- Prefira markdown limpo e escaneavel.
- Use headings claros e hierarquia consistente.
- Use listas apenas quando elas melhorarem leitura.
- Use blocos de codigo para comandos, configuracoes e exemplos de estrutura.
- Inclua links relativos para documentacao relevante quando isso ajudar a navegacao.
- Adicione badges apenas quando houver dados concretos para construir o badge com seguranca.
- Mantenha o texto conciso: informativo para quem chega agora, sem transformar o `README` em manual completo.

## Deve fazer

- Detectar cedo se o projeto esta vazio, novo ou ambiguo.
- Fazer perguntas objetivas ao usuario quando nao houver base suficiente para deducao segura.
- Priorizar fontes de `.github/copilot` antes de qualquer inferencia.
- Fazer inferencias apenas quando houver sinais tecnicos fortes e coerentes.
- Preservar termos tecnicos do projeto como nomes de modulos, servicos e scripts reais.
- Ajustar a lingua do `README` a partir da lingua predominante do repositorio; se nao houver sinal forte, use a lingua pedida pelo usuario.
- Incluir comandos executaveis e realistas.
- Explicar a finalidade do projeto e o contexto de uso sempre que isso puder ser deduzido com seguranca.
- Identificar e registrar as tecnologias observadas no codigo, mesmo quando a documentacao estiver incompleta.
- Tornar explicito o caminho para setup, testes e contribuicao.
- Referenciar documentacao complementar quando ela agregue contexto util.

## Nao deve fazer

- Gerar um `README` completo para projeto vazio sem antes perguntar nada ao usuario.
- Inventar arquitetura, fluxo de trabalho, cobertura de testes ou licenca.
- Confundir suposicao fraca com deducao tecnica forte.
- Adicionar badges falsos ou placeholders.
- Repetir o mesmo conteudo em secoes diferentes.
- Escrever textos vagos como "projeto escalavel e robusto" sem evidencias.
- Copiar integralmente documentacao interna longa para dentro do `README`.
- Exigir secoes vazias apenas para seguir um molde.

## Tratamento de lacunas e conflitos

- Se arquivos divergirem, priorize a fonte mais especifica e mais recente que puder ser identificada.
- Se o projeto estiver novo ou vazio, interrompa a escrita e faca perguntas de descoberta primeiro.
- Se uma secao essencial estiver parcialmente documentada, use apoio em manifestos e scripts para completar o minimo necessario.
- Se a finalidade ou arquitetura nao estiverem escritas, deduza a partir do comportamento implicado pela estrutura do projeto e pelas tecnologias presentes.
- Se ainda assim faltar evidencia, pergunte ao usuario; se nao houver resposta, omita a afirmacao do `README` e reporte a lacuna fora do arquivo final.
- Se o repositorio ja tiver um `README.md`, preserve informacoes validas e melhore estrutura, precisao e legibilidade em vez de reescrever sem necessidade.

## Heuristicas uteis de deducao

Use heuristicas simples e defensaveis:

- `composer.json` + `app/Http/Controllers` + `resources/views` sugere aplicacao web em `PHP`, possivelmente com MVC e renderizacao server-side.
- `routes/api.php` ou controllers dedicados a API sugerem backend HTTP para integracoes ou frontend separado.
- `public/`, `assets/`, `.css`, `.scss`, `.blade.php`, `.twig` ou `.html` indicam camada de apresentacao e assets visuais.
- `package.json`, `vite.config.*`, `webpack.config.*` ou `tailwind.config.*` indicam pipeline frontend complementar.
- `database/migrations`, `schema.sql` ou ORM configurado sugerem persistencia relacional.
- `Dockerfile`, `docker-compose.*`, `nginx.conf` ou CI com build/test ajudam a descrever ambiente e operacao.

Quando usar essas heuristicas, transforme-as em texto objetivo e especifico ao repositorio, nunca em afirmacoes genericas.

## Modelo de saida esperado

Quando gerar um `README.md`, entregue algo proximo desta espinha dorsal:

````md
# <Nome do Projeto>

<Descricao curta e objetiva do projeto.>

## Finalidade

<Por que o projeto existe, para quem ele serve e em que contexto deve ser usado.>

## Stack de Tecnologia

- ...

## Arquitetura

<Visao geral da arquitetura.>

## Getting Started

### Pre-requisitos

- ...

### Instalacao

```bash
<comandos reais>
```

### Configuracao

<passos necessarios>

## Estrutura do Projeto

```text
<arvore opcional>
```

## Funcionalidades Principais

- ...

## Fluxo de Desenvolvimento

<resumo pratico>

## Padroes de Codigo

- ...

## Testes

```bash
<comandos reais de teste>
```

## Contribuindo

<instrucoes objetivas>

## Licenca

<licenca, se confirmada>
````

## Checklist de qualidade

Antes de concluir, confirme:

- O `README` explica o que o projeto faz sem depender de contexto externo.
- O `README` deixa clara a finalidade do projeto e por que ele e usado, quando isso for dedutivel.
- A arquitetura descrita bate com a documentacao ou com a estrutura observada do codigo.
- As tecnologias citadas refletem o que realmente aparece no repositorio, como `PHP`, `HTML`, `CSS`, `JavaScript` e ferramentas auxiliares.
- Os comandos mostrados existem ou sao compativeis com os artefatos do repositorio.
- Nenhuma secao importante ficou genrica ou inventada.
- A ordem das secoes favorece onboarding.
- As referencias para documentacao complementar estao corretas.

## Resposta esperada ao usuario

Ao finalizar uma tarefa com esta skill:

1. Se o projeto estiver novo, vazio ou sem contexto suficiente, faca primeiro as perguntas necessarias ao usuario.
2. Gere ou atualize o `README.md` quando o pedido implicar edicao direta e houver base suficiente.
3. Entregue apenas o markdown como rascunho quando o pedido nao solicitar escrita em arquivo.
4. Informe resumidamente quais secoes foram criadas, revisadas ou removidas.
5. Aponte lacunas documentais relevantes fora do `README`, se houver.
