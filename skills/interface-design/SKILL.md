---
name: interface-design
description: Use para design de interfaces de dashboards, painéis administrativos, apps SaaS, ferramentas de dados, páginas de configurações e UIs de produto. Não use para landing pages, sites de marketing ou campanhas.
---

# Design de Interface

Projete interfaces de produto que pareçam específicas do produto, do usuário e da tarefa — não como templates genéricos.

## Escopo

**Use para**
- dashboards
- painéis administrativos
- UIs SaaS/de produto
- ferramentas com muitos dados
- configurações, fluxos e ferramentas internas

**Não use para**
- landing pages
- sites de marketing
- campanhas ou páginas só de marca

Se o pedido estiver fora do escopo, diga isso e mude para uma skill mais adequada.

## Regra central

Comece por **intenção e domínio**, não por um template de dashboard.

Um design é genérico quando o mesmo layout, paleta, tokens e padrões de cartão ainda serviriam para outro produto com quase nenhuma mudança.

## Entradas obrigatórias

Antes de projetar, fixe estes 3 itens:

1. **Humano** — quem vai usar isso?
2. **Tarefa principal** — o que essa pessoa precisa fazer aqui?
3. **Sensação** — como isso deve parecer? Use termos concretos, não “clean/moderno”.

Se algum deles estiver faltando e isso mudar materialmente o design, pergunte só o mínimo necessário.

## Exploração de domínio

Não proponha uma direção antes de ter os 4 pontos abaixo:

1. **Domínio** — 5+ conceitos/metáforas/vocabulário do universo do produto  
2. **Universo de cor** — 5+ cores/pistas materiais que pertençam naturalmente a esse universo  
3. **Assinatura** — 1 ideia visual, estrutural ou de interação única para esse produto  
4. **Padrões a rejeitar** — 3 padrões óbvios que você vai evitar ou substituir

## Formato da proposta

Quando a direção visual ainda estiver aberta, apresente uma proposta compacta:

- **Domínio:** 5+ conceitos
- **Universo de cor:** 5+ pistas
- **Assinatura:** 1 elemento único
- **Rejeitando:** padrão A → substituição, padrão B → substituição, padrão C → substituição
- **Direção:** recomendação curta conectada aos itens acima

Peça confirmação só quando a direção estiver realmente ambígua.

## Fluxo de trabalho

1. Leia `.interface-design/system.md` se ele existir e trate-o como a memória atual de design.
2. Estabeleça intenção: humano, tarefa, sensação.
3. Explore o domínio e defina a assinatura.
4. Construa o sistema de interface e os componentes.
5. Rode as validações abaixo antes de apresentar.
6. Ofereça salvar padrões reaproveitáveis para sessões futuras.

## Regras de design

### 1) A intenção precisa aparecer no sistema
Se a sensação for quente, densa, calma, técnica, lúdica ou clínica, isso deve aparecer em:
- paleta
- tipografia
- densidade de espaçamento
- tratamento de superfícies
- movimento
- estrutura dos componentes

Não declare uma sensação e implemente outra.

### 2) Toda escolha importante precisa ter motivo
Consiga justificar:
- layout
- temperatura de cor
- escolha tipográfica
- escala de espaçamento
- hierarquia
- estratégia de profundidade

Motivos ruins: “comum”, “clean”, “padrão”, “funciona”.

### 3) Projete para este produto, não para a categoria
Um cartão de métrica, tabela, barra de filtros ou barra lateral pode assumir muitas formas. Não caia sempre no mesmo grid de cartões, na mesma largura de sidebar e no mesmo bloco de KPI.

### 4) A assinatura precisa ser visível
A assinatura deve aparecer em vários pontos concretos, não só como clima vago.

### 5) A cor precisa vir de algum lugar
A paleta deve parecer nativa do universo do produto. Use cinza para estrutura; use cor para significado, ênfase e identidade.

### 6) A navegação faz parte do produto
Dê contexto à tela:
- onde o usuário está
- para onde ele pode ir
- em que espaço ou workspace ele está

Uma tabela solta, sem contexto, parece demo de componente.

## Regras de sistema

### Superfícies e bordas
- Use uma escala clara de elevação.
- Elevações mais altas devem ser apenas **levemente** mais distintas que as mais baixas.
- Prefira variações tonais sutis e bordas de baixa opacidade a separações visuais pesadas.
- Barras laterais costumam funcionar melhor com o **mesmo fundo base** da área principal e uma borda sutil.
- Dropdowns/popovers devem ficar um nível acima da superfície pai.
- Inputs geralmente funcionam melhor levemente rebaixados do que mais brilhantes que as superfícies ao redor.

### Hierarquia de texto
Use pelo menos 4 níveis de texto com consistência:
- primário
- secundário
- terciário
- suave

Se tudo estiver entre “texto normal” e “texto cinza”, a hierarquia está plana demais.

### Hierarquia de borda
Use uma progressão como:
- sutil
- padrão
- forte
- foco

A força da borda deve acompanhar a importância.

### Controles
Crie tokens dedicados para:
- fundo do controle
- borda do controle
- estado de foco

Não reutilize cegamente tokens de superfície.

### Espaçamento
- Escolha uma unidade base e permaneça nessa grade.
- Use escalas consistentes para micro, componente, seção e macroespaçamento.
- Valores aleatórios de espaçamento indicam falta de sistema.

### Padding
Use padding simétrico por padrão, a menos que a assimetria seja intencional e visualmente justificada.

### Raio
Use uma escala consistente de raio:
- menor para controles
- médio para cartões
- maior para modais/containers

Não misture cantos retos e suaves sem motivo.

### Profundidade
Escolha uma estratégia dominante e mantenha consistência:
- só bordas
- sombras sutis
- sombras em camadas
- mudanças de cor de superfície

Não misture todas.

### Tipografia
- Títulos precisam de presença.
- Texto de corpo precisa de legibilidade.
- Rótulos precisam de clareza em tamanhos pequenos.
- Dados geralmente devem usar monospace com números tabulares.

Não dependa só do tamanho; use tamanho, peso e tracking juntos.

### Cartões
Tipos diferentes de conteúdo podem ter layouts internos diferentes, mas as regras compartilhadas de superfície devem continuar consistentes:
- lógica de borda/sombra
- raio
- escala de espaçamento
- sistema tipográfico

### Controles e elementos nativos
Em UIs fortemente estilizadas, evite controles nativos que quebrem a consistência visual (por exemplo select/date nativo do SO). Use componentes customizados quando necessário.

### Ícones
Ícones servem para esclarecer; não decoram por padrão. Se remover um ícone não muda nada, remova.

### Movimento
Mantenha o movimento rápido, sutil e funcional. UI profissional não deve depender de bounce lúdico ou transições exageradas.

### Estados
Todo elemento interativo precisa ter:
- default
- hover
- active
- focus
- disabled

Views de dados também precisam de:
- loading
- empty
- error

### Modo escuro
Em interfaces escuras, dependa mais de bordas e separação de superfícies do que de sombras. Cores semânticas costumam precisar de saturação mais suave.

## Validação antes de entregar

Antes de mostrar o trabalho, verifique:

### Checagens de precisão
- Isso ainda serviria para outro produto com poucas mudanças?
- A assinatura aparece em vários elementos reais?
- A paleta parece nativa do domínio?
- Ainda há templates/padrões visíveis?

### Checagens de hierarquia
- Teste de apertar os olhos: a hierarquia continua visível sem linhas duras?
- Teste de troca: se você substituir fonte/layout pelos seus padrões habituais, o design perde algo importante?
- Teste de tokens: nomes de variáveis e decisões de estilo soam específicos do universo deste produto?

### Checagens de sistema
- o espaçamento permanece na grade escolhida
- uma estratégia dominante de profundidade é usada
- paleta/tokens são consistentes
- estados existem para elementos interativos e de dados
- padrões reaproveitáveis são reutilizados em vez de reinventados

## Memória em system.md

Se `.interface-design/system.md` existir:
- leia antes de projetar
- siga as decisões salvas, a menos que o usuário mude a direção explicitamente
