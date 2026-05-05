---
name: code-reviewer-laravel
description: Realiza revisão profunda de código PHP/Laravel identificando erros lógicos, code smells, vulnerabilidades de segurança e problemas de performance. Mantém histórico acumulativo em memoria.md para evitar repetição de análises e documenta todos os problemas encontrados em erros-encontrados.md com severidade e recomendações. Use quando precisar revisar código Laravel, auditar projetos, validar lógica de negócio, ou quando encontrar bugs recorrentes. Especialmente útil para código legado ou em fase de onboarding técnico.
---

# Code Reviewer Laravel

Skill especializada em revisão de código PHP com Laravel, mantendo histórico acumulativo de análises e catalogando problemas sistematicamente.

## Visão Geral

Esta skill automatiza a revisão profunda de projetos Laravel/PHP através de:
- **Análise Lógica**: Fluxos de negócio, validações, regras de acesso
- **Code Smells**: Duplicação, complexidade, padrões ruins
- **Segurança**: SQL injection, XSS, CSRF, exposição de dados sensíveis
- **Performance**: N+1 queries, loops ineficientes, cache não utilizado
- **Memória Acumulativa**: Evita redundância e detecta padrões recorrentes

## Como Usar

### Iniciando uma Revisão

1. **Prepare o diretório** com código PHP/Laravel a revisar
2. **Inicialize os arquivos de rastreamento**:
   - `memoria.md` - Histórico de análises (criar se não existir)
   - `erros-encontrados.md` - Catálogo de problemas (criar se não existir)

3. **Execute a revisão com contexto claro**:
   ```
   Revise o código em [caminho] focando em [tipos: lógica/segurança/performance/todos]
   ```

### Fluxo da Análise

#### Passo 1: Consultar Memória
- Leia `memoria.md` para ver o que já foi analisado
- Identifique padrões recorrentes
- Evite análises duplicadas

#### Passo 2: Examinar Código
Analise os arquivos procurando por:

**Erros Lógicos**
- Condições contraditórias
- Validações faltantes
- Estados inconsistentes
- Fluxo de autorização inadequado
- Race conditions potenciais

**Code Smells**
- Métodos muito longos (>50 linhas)
- Classes com muitas responsabilidades
- Parâmetros excessivos (>5)
- Duplicação de código
- Comentários que explicam código confuso
- Variáveis com nomes genéricos

**Vulnerabilidades de Segurança**
- SQL Injection (queries não preparadas)
- Mass Assignment sem proteção
- CSRF desprotegido
- XSS em views
- Dados sensíveis em logs/cache
- Autenticação/autorização quebrada
- Exposição de stack traces em produção
- Senhas em strings literais

**Problemas de Performance**
- N+1 queries (loops com queries)
- Eager loading não utilizado
- Índices de banco de dados faltantes
- Loops aninhados excessivos
- Cálculos repetidos sem cache
- Queries sem paginação em grandes datasets
- Assets não minificados ou cacheados

#### Passo 3: Catalogar Problemas
Para cada problema encontrado, registre em `erros-encontrados.md`:

```markdown
### [ID] - [Título do Problema]

**Arquivo**: `app/Http/Controllers/UserController.php` (linha 45-52)
**Severidade**: 🔴 CRÍTICO | 🟠 ALTO | 🟡 MÉDIO | 🟢 BAIXO
**Categoria**: Segurança | Lógica | Performance | Code Smell
**Descrição**: 
Descrição clara do problema encontrado.

**Código Atual**:
\`\`\`php
$user = User::find($id);
$user->name = $request->name;
$user->role = $request->role; // PROBLEMA: Mass assignment desprotegido
$user->save();
\`\`\`

**Risco/Impacto**: 
Explicação do impacto potencial.

**Recomendação**:
\`\`\`php
// Solução recomendada
$user = User::findOrFail($id);
$user->update($request->only(['name'])); // Apenas campos permitidos
\`\`\`

**Padrão Recorrente**: Sim/Não
**Prioridade de Correção**: 🚨 Imediata | ⚠️ Próxima Sprint | 📌 Backlog
```

#### Passo 4: Atualizar Memória
Registre em `memoria.md`:

```markdown
## Análise de [Data] - [Projeto/Módulo]

**Arquivos Analisados**: 
- `app/Http/Controllers/UserController.php`
- `app/Models/User.php`
- `routes/api.php`

**Escopo**: Lógica, Segurança, Performance
**Problemas Encontrados**: 7
**Críticos**: 2 | Altos: 3 | Médios: 2 | Baixos: 0

**Padrões Identificados**:
- Falta de validação em endpoints de criação
- N+1 queries em listagens
- Mass assignment desprotegido em 3 controllers

**Próximos Passos**:
- Implementar Form Requests em todos os endpoints
- Adicionar eager loading nas queries
- Revisar fillable/guarded em todos os modelos
```

## Categorias de Severidade

| Severidade | Símbolo | Quando Usar | Exemplo |
|-----------|---------|-----------|---------|
| CRÍTICO   | 🔴     | Expõe dados, causa falha do app | SQL Injection, autenticação quebrada |
| ALTO      | 🟠     | Vulnerabilidade séria ou bug importante | Mass assignment, XSS | 
| MÉDIO     | 🟡     | Code smell ou problema de performance | N+1 queries, método longo |
| BAIXO     | 🟢     | Melhoramento de qualidade | Naming, padrões de código |

## Padrões Comuns em Laravel

### Anti-padrões Frequentes
- Controllers acessando banco diretamente (sem models/repositories)
- Lógica de negócio em controllers
- Sem uso de scopes em queries
- Validação espalhada no código
- Sem use de middleware de autorização
- Migrations desorganizadas

### Boas Práticas a Procurar
- Separação de responsabilidades
- Use de Form Requests
- Scopes e mutators bem utilizados
- Eager loading otimizado
- Cache estratégico
- Tratamento de exceções adequado

## Exemplo Prático

**Arquivo analisado**: `app/Http/Controllers/ProductController.php`

```php
// ❌ PROBLEMA: N+1 queries + massa assignment
public function store(Request $request)
{
    $product = Product::create($request->all()); // Mass assignment
    
    foreach($request->categories as $cat) {
        $category = Category::find($cat); // N+1
        $product->categories()->attach($category);
    }
    
    return response()->json($product);
}
```

**Saída catalogada**:
```markdown
### PRD-001 - Mass Assignment Desprotegido em ProductController

**Arquivo**: `app/Http/Controllers/ProductController.php` (linha 12)
**Severidade**: 🔴 CRÍTICO
**Categoria**: Segurança

**Risco**: Usuário pode injetar campos não autorizados como is_admin, price, etc.

**Recomendação**:
Usar Form Request ou definir fillable/guarded no Model

### PRD-002 - N+1 Queries em Attachment de Categorias

**Arquivo**: `app/Http/Controllers/ProductController.php` (linha 16-18)
**Severidade**: 🟠 ALTO
**Categoria**: Performance

**Risco**: 1 query para criar + 1 para cada categoria = n+1

**Recomendação**:
Usar whereIn() ou sync() com IDs diretamente
```

## Dicas para Máxima Efetividade

1. **Primeiro deve ser Segurança** - Revise vulnerabilidades antes de code smells
2. **Procure Padrões** - O terceiro N+1 é mais importante que o primeiro
3. **Contexto Importa** - Uma linha longa em migration é OK, em controller não
4. **Diferencie Produtos** - Um MVP pode ter menos requisitos que código em produção
5. **Comunique Claramente** - Mostre o problema, o impacto e a solução

## Checklist Pré-Revisão

- [ ] Código pode ser executado/testado?
- [ ] Existem testes unitários? (revisar cobertura)
- [ ] Qual versão do Laravel é usada?
- [ ] O ambiente é produção ou desenvolvimento?
- [ ] Há dependências externas críticas?
- [ ] Existem logs de erro/debug recentes?

## Formato dos Arquivos de Saída

### memoria.md
```
# Memória de Análises - [Projeto]

## Resumo Acumulativo
- Total de análises: X
- Problemas catalogados: Y
- Padrões recorrentes identificados: Z

## Análise [Data] - [Módulo]
[Detalhes da análise]

## Padrões Recorrentes Detectados
[Lista de padrões]

## Evolução
[Gráfico simples de melhorias ao longo do tempo]
```

### erros-encontrados.md
```
# Erros Encontrados - [Projeto]

## Resumo
- Críticos: X
- Altos: Y
- Médios: Z
- Baixos: W

## Erros por Categoria
### Segurança (X)
### Lógica (Y)
### Performance (Z)
### Code Smell (W)

## Detalhes dos Erros
[Cada erro com ID, detalhes, recomendação]
```

## Integração com Fluxo de Trabalho

### Para Code Review Contínuo
1. Rode a skill após cada PR
2. Atualize `memoria.md` com novos padrões
3. Feche issues automaticamente em `erros-encontrados.md`

### Para Auditoria de Projeto
1. Analise módulos críticos primeiro
2. Classifique por severidade
3. Crie roadmap de refatoração baseado em memória

### Para Onboarding Técnico
1. Identifique padrões do projeto em memória.md
2. Use erros-encontrados.md como referência de "o que não fazer"
3. Atualize com anti-padrões específicos do projeto

---

**Última atualização**: Versão 1.0
**Compatível com**: Laravel 8.x, 9.x, 10.x, 11.x
