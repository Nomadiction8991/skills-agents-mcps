# organizar-documentacao

Skill para manter a documentação do **projeto alvo** organizada em `./docs`.

## Como usar
1. Instale/copiar a skill.
2. Rode primeiro a inspeção de Git (`git status --short`, `git diff --name-only`, `git diff --stat` e, se necessário, `git diff`).
3. Aplique as regras sobre a pasta `./docs` do projeto alvo.
4. Use `templates/` para criar arquivos novos.
5. Use `examples/docs-template/` apenas como referência estrutural.
6. Se não houver nada útil em Git para documentar, rode a skill em modo de auditoria de legado.

## Estrutura deste pacote
```text
organizar-documentacao/
  SKILL.md
  README.md
  skill-creator-integration.md
  subskills/
  templates/
  examples/
```

## Importante
- A documentação final **não** fica dentro desta skill.
- O destino padrão é sempre `./docs` na raiz do projeto alvo.
- A skill documenta mudanças a partir da leitura do Git.
- A skill não pode criar branch, commitar ou alterar o histórico; Git aqui é só leitura.
- A skill também pode reorganizar markdowns antigos já existentes em `./docs`.
