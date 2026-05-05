# Princípios de Implementação

Use este arquivo para orientações mais profundas de implementação. A skill principal deve permanecer pequena; este arquivo carrega os detalhes.

## 1) Sistema de superfícies

Monte uma pequena escala de elevação:
- **L0** — canvas base
- **L1** — cartões/painéis no plano principal
- **L2** — dropdowns/popovers
- **L3+** — overlays empilhados só quando necessário

Diretrizes:
- elevações mais altas devem ser apenas levemente mais distintas
- mantenha a mesma família de matiz entre superfícies; em geral, mude a luminosidade, não a matiz
- bordas devem definir limites sem pedir atenção
- no modo escuro, bordas costumam importar mais que sombras

Padrões úteis:
- a barra lateral pode compartilhar o fundo principal com um divisor sutil
- o dropdown deve ficar um nível acima da superfície que o originou
- fundos de input costumam funcionar melhor como rebaixados

## 2) Arquitetura de cor

Mapeie todas as cores para um pequeno conjunto de primitivas:
- foreground
- background/surface
- border
- brand
- semantic

Não invente valores hex aleatórios por componente.

## 3) Hierarquia de texto

Use papéis de texto claros:
- primário
- secundário
- terciário
- suave

Construa a hierarquia com tamanho, peso e tracking juntos.

## 4) Espaçamento e padding

- escolha uma unidade base
- mantenha os valores nessa grade
- use escalas separadas para micro, componente, seção e macroespaçamento
- use padding simétrico por padrão

## 5) Raio e profundidade

Raio:
- pequeno = controles
- médio = cartões
- grande = containers/modais

Profundidade:
Escolha um modelo dominante:
- só bordas
- sombras sutis
- sombras em camadas
- variações de superfície

Não misture vários modelos sem intenção.

## 6) Layout específico do conteúdo

Um cartão de métrica, um cartão de configurações e um cartão de plano não devem compartilhar automaticamente o mesmo layout interno. Adapte a estrutura ao conteúdo, mantendo as regras de superfície consistentes.

## 7) Controles

Crie tokens dedicados para:
- fundo do controle
- borda do controle
- foco

Use controles customizados quando a UI nativa do sistema quebrar a consistência visual.

## 8) Apresentação de dados

- use monospace + números tabulares para alinhar dados numéricos quando útil
- trate loading, empty e error como estados de primeira classe
- cor deve esclarecer significado, não decorar

## 9) Contexto de navegação

Ancore a tela em contexto:
- localização ativa
- navegação ao redor
- contexto de workspace/usuário quando relevante

## 10) Movimento

Mantenha o movimento sutil, rápido e orientado à tarefa. Evite movimento lúdico em UIs sérias/produtivas, a menos que o produto peça isso intencionalmente.
