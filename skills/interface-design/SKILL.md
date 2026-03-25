---
name: interface-design
description: Esta skill é para design de interface — dashboards, painéis administrativos, apps, ferramentas e produtos interativos. NÃO para design de marketing (landing pages, sites de marketing, campanhas).
---

# Design de Interface

Construa design de interface com precisão e consistência.

## Escopo

**Use para:** Dashboards, painéis administrativos, apps SaaS, ferramentas, páginas de configurações, interfaces de dados.

**Não use para:** Landing pages, sites de marketing, campanhas. Trate como fora do escopo desta skill.

---

# O Problema

Você vai gerar conteúdo genérico. Seu treinamento viu milhares de dashboards. Os padrões são fortes.

Você pode seguir todo o processo abaixo — explorar o domínio, nomear uma assinatura, declarar sua intenção — e ainda assim produzir um template. Cores quentes em estruturas frias. Fontes amigáveis em layouts genéricos. "Sensação de cozinha" que parece igual a todo outro app.

Isso acontece porque a intenção vive em prosa, mas a geração de código puxa de padrões. O gap entre eles é onde os padrões ganham.

O processo abaixo ajuda. Mas processo sozinho não garante precisão. Você tem que se pegar.

---

# Onde os Padrões se Escondem

Padrões não se anunciam. Eles se disfarçam como infraestrutura — as partes que parecem apenas precisar funcionar, não serem projetadas.

**Tipografia parece um recipiente.** Escolha algo legível, siga em frente. Mas tipografia não está sustentando seu design — ela É seu design. O peso de um título, a personalidade de um rótulo, a textura de um parágrafo. Estas moldam como o produto se sente antes de alguém ler uma palavra. Uma ferramenta de gerenciamento de padaria e um terminal de trading podem precisar de "tipo limpo e legível" — mas o tipo que é quente e feito à mão não é o tipo que é frio e preciso. Se você está pegando sua fonte usual, você não está projetando.

**Navegação parece andaime.** Construa a barra lateral, adicione os links, chegue ao trabalho real. Mas navegação não está ao redor do seu produto — ela É seu produto. Onde você está, onde você pode ir, o que importa mais. Uma página flutuando no espaço é uma demo de componente, não software. A navegação ensina as pessoas como pensar sobre o espaço em que estão.

**Dados parecem apresentação.** Você tem números, mostre números. Mas um número na tela não é design. A questão é: o que este número significa para a pessoa olhando para ele? O que eles vão fazer com isso? Um anel de progresso e um rótulo empilhado mostram "3 de 10" — um conta uma história, outro preenche espaço. Se você está pegando número-em-rótulo, você não está projetando.

**Nomes de tokens parecem detalhe de implementação.** Mas suas variáveis CSS são decisões de design. `--ink` e `--parchment` evocam um mundo. `--gray-700` e `--surface-2` evocam um template. Alguém lendo apenas seus tokens deve ser capaz de adivinhar que produto isto é.

A armadilha é pensar que algumas decisões são criativas e outras são estruturais. Não há decisões estruturais. Tudo é design. O momento em que você para de perguntar "por que isto?" é o momento em que padrões assumem.

---

# Intenção em Primeiro Lugar

Antes de tocar no código, responda isto. Não em sua cabeça — em voz alta, para você mesmo ou para o usuário.

**Quem é essa pessoa?**
Não "usuários." A pessoa real. Onde estão quando abrem isto? O que está em sua mente? O que fizeram 5 minutos atrás, o que farão 5 minutos depois? Uma professora às 7 da manhã com café não é um desenvolvedor debugando à meia-noite não é uma fundadora entre reuniões de investidores. Seu mundo molda a interface.

**O que eles devem accomplir?**
Não "use o dashboard." O verbo. Classificar estes envios. Encontrar o deploy quebrado. Aprovar o pagamento. A resposta determina o que lidera, o que segue, o que se esconde.

**Como deve parecer?**
Diga em palavras que significam algo. "Limpo e moderno" não significa nada — toda IA diz isso. Quente como um caderno? Frio como um terminal? Denso como um piso de negociação? Calmo como um app de leitura? A resposta molda cor, tipo, espaçamento, densidade — tudo.

Se você não conseguir responder estes com especificidade, pare. Pergunte ao usuário. Não adivinhe. Não use padrões.

## Cada Escolha Deve Ser Uma Escolha

Para cada decisão, você deve ser capaz de explicar POR QUE.

- Por que este layout e não outro?
- Por que esta temperatura de cor?
- Por que esta fonte?
- Por que esta escala de espaçamento?
- Por que esta hierarquia de informação?

Se sua resposta é "é comum" ou "é limpo" ou "funciona" — você não escolheu. Você usou padrões. Padrões são invisíveis. Escolhas invisíveis se compõem em saída genérica.

**O teste:** Se você trocasse suas escolhas pelas alternativas mais comuns e o design não se sentisse significativamente diferente, você nunca fez escolhas reais.

## Igualdade É Fracasso

Se outra IA, dado um prompt similar, produziria substancialmente a mesma saída — você fracassou.

Isto não é sobre ser diferente por si só. É sobre a interface emergindo do problema específico, do usuário específico, do contexto específico. Quando você projeta a partir da intenção, a igualdade se torna impossível porque nenhuma intenção é idêntica.

Quando você projeta a partir de padrões, tudo parece igual porque padrões são compartilhados.

## Intenção Deve Ser Sistêmica

Dizer "quente" e usar cores frias não é seguir através. Intenção não é um rótulo — é uma restrição que molda cada decisão.

Se a intenção é quente: superfícies, texto, bordas, acentos, cores semânticas, tipografia — tudo quente. Se a intenção é densa: espaçamento, tamanho de tipo, arquitetura de informação — tudo denso. Se a intenção é calma: movimento, contraste, saturação de cor — tudo calmo.

Verifique sua saída contra sua intenção declarada. Todo token a reforça? Ou você declarou uma intenção e depois usou padrões mesmo assim?

---

# Exploração de Domínio de Produto

É aqui que padrões são pegos — ou não.

Saída genérica: Tipo de tarefa → Template visual → Tema
Saída com precisão: Tipo de tarefa → Domínio de produto → Assinatura → Estrutura + Expressão

A diferença: tempo no mundo do produto antes de qualquer pensamento visual ou estrutural.

## Saídas Necessárias

**Não proponha nenhuma direção até que você produza todos os quatro:**

**Domínio:** Conceitos, metáforas, vocabulário do mundo deste produto. Não features — território. Mínimo 5.

**Mundo de cores:** Que cores existem naturalmente no domínio deste produto? Não "quente" ou "frio" — vá para o mundo real. Se este produto fosse um espaço físico, o que você veria? Que cores pertencem lá que não pertencem a outro lugar? Liste 5+.

**Assinatura:** Um elemento — visual, estrutural ou de interação — que poderia existir apenas para ESTE produto. Se você não conseguir nomear um, continue explorando.

**Padrões:** 3 escolhas óbvias para este tipo de interface — visuais E estruturais. Você não pode evitar padrões que não nomeou.

## Requisitos da Proposta

Sua direção deve referenciar explicitamente:
- Conceitos de domínio que você explorou
- Cores da exploração de mundo de cores
- Seu elemento de assinatura
- O que substitui cada padrão

**O teste:** Leia sua proposta. Remova o nome do produto. Alguém conseguiria identificar para que isto serve? Se não, é genérico. Explore mais a fundo.

---

# O Mandato

**Antes de mostrar ao usuário, olhe para o que você fez.**

Pergunte-se: "Se eles dissessem que isto falta precisão, o que eles significariam?"

Essa coisa que você acabou de pensar — conserte isto primeiro.

Sua primeira saída provavelmente é genérica. Isto é normal. O trabalho é pegá-lo antes que o usuário tenha que fazer.

## Os Testes

Rode estes contra sua saída antes de apresentar:

- **O teste de troca:** Se você trocasse a fonte pela sua usual, alguém notaria? Se você trocasse o layout por um template de dashboard padrão, sentiria-se diferente? Os lugares onde troca não importaria são os lugares que você usou padrões.

- **O teste de apertar os olhos:** Desfoque seus olhos. Você ainda consegue perceber hierarquia? Algo está saltando bruscamente? Precisão sussurra.

- **O teste de assinatura:** Você consegue apontar cinco elementos específicos onde sua assinatura aparece? Não "a sensação geral" — componentes reais. Uma assinatura que você não consegue localizar não existe.

- **O teste de token:** Leia suas variáveis CSS em voz alta. Eles soam como que pertencem ao mundo deste produto, ou poderiam pertencer a qualquer projeto?

Se qualquer teste falhar, itere antes de mostrar.

---

# Fundações de Precisão

## Estratificação Sutil

Esta é a espinha dorsal de precisão. Independentemente da direção, tipo de produto ou estilo visual — este princípio se aplica a tudo. Você mal deve notar o sistema funcionando. Quando você olha o dashboard da Vercel, você não pensa "lindas bordas." Você apenas entende a estrutura. A precisão é invisível — é assim que você sabe que está funcionando.

### Elevação de Superfícies

Superfícies se empilham. Um dropdown fica acima de um card que fica acima da página. Construa um sistema numerado — base, depois níveis de elevação crescente. Em modo escuro, elevação maior = um pouco mais claro. Em modo claro, elevação maior = um pouco mais claro ou usa sombra.

Cada salto deve ser apenas alguns pontos percentuais de luminosidade. Você mal consegue ver a diferença isoladamente. Mas quando superfícies se empilham, a hierarquia emerge. Mudanças sussurro-quietas que você sente ao invés de ver.

**Decisões chave:**
- **Barras laterais:** Mesmo fundo da tela, não diferente. Cores diferentes fragmentam o espaço visual em "mundo da barra lateral" e "mundo do conteúdo." Uma borda sutil é separação suficiente.
- **Dropdowns:** Um nível acima da superfície-pai deles. Se ambos compartilham o mesmo nível, o dropdown se mistura ao card e estratificação é perdida.
- **Inputs:** Um pouco mais escuro que seus arredores, não mais claro. Inputs são "inset" — eles recebem conteúdo. Um fundo mais escuro sinaliza "digite aqui" sem bordas pesadas.

### Bordas

Bordas devem desaparecer quando você não está procurando por elas, mas ser encontráveis quando você precisa de estrutura. Rgba de baixa opacidade se mistura com o fundo — define arestas sem exigir atenção. Bordas hex sólidas parecem ásperas em comparação.

Construa uma progressão — nem todas as bordas são iguais. Bordas padrão, separação mais suave, bordas de ênfase, ênfase máxima para anéis de foco. Combine intensidade com a importância da borda.

**O teste de apertar os olhos:** Desfoque seus olhos na interface. Você ainda deve perceber hierarquia — o que está acima do quê, onde seções se dividem. Mas nada deve saltar para fora. Sem linhas ásperas. Sem mudanças de cor perturbadoras. Apenas estrutura quieta.

Isto separa interfaces profissionais de amadoras. Acerte isto errado e nada mais importa.

## Expressão Infinita

Cada padrão tem infinitas expressões. **Nenhuma interface deve parecer igual.**

Uma exibição de métrica pode ser um número herói, estatística inline, sparkline, medidor, barra de progresso, delta de comparação, badge de tendência, ou algo novo. Um dashboard pode enfatizar densidade, espaço em branco, hierarquia, ou fluxo de formas completamente diferentes. Até barra lateral + cards tem infinitas variações em proporção, espaçamento e ênfase.

**Antes de construir, pergunte:**
- Qual é a UMA coisa que usuários fazem mais aqui?
- Que produtos resolvem problemas similares brilhantemente? Estude-os.
- Por que esta interface sentiria-se projetada para seu propósito, não templateada?

**NUNCA produza saída idêntica.** Mesma largura de barra lateral, mesma grid de card, mesmas caixas de métrica com icon-esquerda-número-grande-rótulo-pequeno toda vez — isto sinaliza gerado por IA imediatamente. É esquecível.

A arquitetura e componentes devem emergir da tarefa e dados, executados de uma forma que pareça fresca. Os cards do Linear não parecem os do Notion. As métricas do Vercel não parecem as do Stripe. Mesmos conceitos, infinitas expressões.

## Cor Vive em Algum Lugar

Todo produto existe em um mundo. Aquele mundo tem cores.

Antes de alcançar uma paleta, gaste tempo no mundo do produto. O que você veria se caminhasse para a versão física deste espaço? Que materiais? Que luz? Que objetos?

Sua paleta deve parecer que veio DE algum lugar — não como se foi aplicada A algo.

**Além de Quente e Frio:** Temperatura é um eixo. Isto é quieto ou barulhento? Denso ou espaçoso? Sério ou brincalhão? Geométrico ou orgânico? Um terminal de negociação e um app de meditação são ambos "focados" — completamente diferentes tipos de foco. Encontre a qualidade específica, não o rótulo genérico.

**Cor Carrega Significado:** Cinza constrói estrutura. Cor comunica — status, ação, ênfase, identidade. Cor não motivada é ruído. Uma cor de acentuação, usada com intenção, bate cinco cores usadas sem pensamento.

---

# Before Writing Each Component

**Every time** you write UI code — even small additions — state:

```
Intent: [who is this human, what must they do, how should it feel]
Palette: [colors from your exploration — and WHY they fit this product's world]
Depth: [borders / shadows / layered — and WHY this fits the intent]
Surfaces: [your elevation scale — and WHY this color temperature]
Typography: [your typeface — and WHY it fits the intent]
Spacing: [your base unit]
```

This checkpoint is mandatory. It forces you to connect every technical choice back to intent.

If you can't explain WHY for each choice, you're defaulting. Stop and think.

---

# Design Principles

## Token Architecture

Every color in your interface should trace back to a small set of primitives: foreground (text hierarchy), background (surface elevation), border (separation hierarchy), brand, and semantic (destructive, warning, success). No random hex values — everything maps to primitives.

### Text Hierarchy

Don't just have "text" and "gray text." Build four levels — primary, secondary, tertiary, muted. Each serves a different role: default text, supporting text, metadata, and disabled/placeholder. Use all four consistently. If you're only using two, your hierarchy is too flat.

### Border Progression

Borders aren't binary. Build a scale that matches intensity to importance — standard separation, softer separation, emphasis, maximum emphasis. Not every boundary deserves the same weight.

### Control Tokens

Form controls have specific needs. Don't reuse surface tokens — create dedicated ones for control backgrounds, control borders, and focus states. This lets you tune interactive elements independently from layout surfaces.

## Spacing

Pick a base unit and stick to multiples. Build a scale for different contexts — micro spacing for icon gaps, component spacing within buttons and cards, section spacing between groups, major separation between distinct areas. Random values signal no system.

## Padding

Keep it symmetrical. If one side has a value, others should match unless content naturally requires asymmetry.

## Depth

Choose ONE approach and commit:
- **Borders-only** — Clean, technical. For dense tools.
- **Subtle shadows** — Soft lift. For approachable products.
- **Layered shadows** — Premium, dimensional. For cards that need presence.
- **Surface color shifts** — Background tints establish hierarchy without shadows.

Don't mix approaches.

## Border Radius

Sharper feels technical. Rounder feels friendly. Build a scale — small for inputs and buttons, medium for cards, large for modals. Don't mix sharp and soft randomly.

## Typography

Build distinct levels distinguishable at a glance. Headlines need weight and tight tracking for presence. Body needs comfortable weight for readability. Labels need medium weight that works at smaller sizes. Data needs monospace with tabular number spacing for alignment. Don't rely on size alone — combine size, weight, and letter-spacing.

## Card Layouts

A metric card doesn't have to look like a plan card doesn't have to look like a settings card. Design each card's internal structure for its specific content — but keep the surface treatment consistent: same border weight, shadow depth, corner radius, padding scale.

## Controls

Native `<select>` and `<input type="date">` render OS-native elements that cannot be styled. Build custom components — trigger buttons with positioned dropdowns, calendar popovers, styled state management.

## Iconography

Icons clarify, not decorate — if removing an icon loses no meaning, remove it. Choose one icon set and stick with it. Give standalone icons presence with subtle background containers.

## Animation

Fast micro-interactions, smooth easing. Larger transitions can be slightly longer. Use deceleration easing. Avoid spring/bounce in professional interfaces.

## States

Every interactive element needs states: default, hover, active, focus, disabled. Data needs states too: loading, empty, error. Missing states feel broken.

## Navigation Context

Screens need grounding. A data table floating in space feels like a component demo, not a product. Include navigation showing where you are in the app, location indicators, and user context. When building sidebars, consider same background as main content with border separation rather than different colors.

## Dark Mode

Dark interfaces have different needs. Shadows are less visible on dark backgrounds — lean on borders for definition. Semantic colors (success, warning, error) often need slight desaturation. The hierarchy system still applies, just with inverted values.

---

# Avoid

- **Harsh borders** — if borders are the first thing you see, they're too strong
- **Dramatic surface jumps** — elevation changes should be whisper-quiet
- **Inconsistent spacing** — the clearest sign of no system
- **Mixed depth strategies** — pick one approach and commit
- **Missing interaction states** — hover, focus, disabled, loading, error
- **Dramatic drop shadows** — shadows should be subtle, not attention-grabbing
- **Large radius on small elements**
- **Pure white cards on colored backgrounds**
- **Thick decorative borders**
- **Gradients and color for decoration** — color should mean something
- **Multiple accent colors** — dilutes focus
- **Different hues for different surfaces** — keep the same hue, shift only lightness

---

# Workflow

## Communication
Be invisible. Don't announce modes or narrate process.

**Never say:** "I'm in ESTABLISH MODE", "Let me check system.md..."

**Instead:** Jump into work. State suggestions with reasoning.

## Suggest + Ask
Lead with your exploration and recommendation, then confirm:
```
"Domain: [5+ concepts from the product's world]
Color world: [5+ colors that exist in this domain]
Signature: [one element unique to this product]
Rejecting: [default 1] → [alternative], [default 2] → [alternative], [default 3] → [alternative]

Direction: [approach that connects to the above]"

[Ask: "Does that direction feel right?"]
```

## If Project Has system.md
Read `.interface-design/system.md` and apply. Decisions are made.

## If No system.md
1. Explore domain — Produce all four required outputs
2. Propose — Direction must reference all four
3. Confirm — Get user buy-in
4. Build — Apply principles
5. **Evaluate** — Run the mandate checks before showing
6. Offer to save

---

# After Completing a Task

When you finish building something, **always offer to save**:

```
"Want me to save these patterns for future sessions?"
```

If yes, write to `.interface-design/system.md`:
- Direction and feel
- Depth strategy (borders/shadows/layered)
- Spacing base unit
- Key component patterns

### What to Save

Add patterns when a component is used 2+ times, is reusable across the project, or has specific measurements worth remembering. Don't save one-off components, temporary experiments, or variations better handled with props.

### Consistency Checks

If system.md defines values, check against them: spacing on the defined grid, depth using the declared strategy throughout, colors from the defined palette, documented patterns reused instead of reinvented.

This compounds — each save makes future work faster and more consistent.

---

# Deep Dives

For more detail on specific topics:
- `references/principles.md` — Code examples, specific values, dark mode
- `references/validation.md` — Memory management, when to update system.md
- `references/critique.md` — Post-build craft critique protocol

# Commands

- `/interface-design:status` — Current system state
- `/interface-design:audit` — Check code against system
- `/interface-design:extract` — Extract patterns from code
- `/interface-design:critique` — Critique your build for craft, then rebuild what defaulted
