# Plugins

Plugins disponíveis neste repositório, prontos para instalação local no Claude Code e no Codex.

## Plugins disponíveis

| Plugin | O que faz |
|--------|-----------|
| [caveman](caveman/) | Comprime respostas do agente em ~75% menos tokens mantendo precisão técnica |

---

## Instalação no Claude Code

### Via sistema de plugins (recomendado)

```bash
# A partir da raiz deste repositório
claude plugin install caveman@./plugins/caveman
```

Isso registra o plugin localmente. Hooks de sessão e skills são carregados automaticamente.

### Via hooks standalone (sem sistema de plugins)

```bash
# Linux / macOS
bash plugins/caveman/hooks/install.sh

# Windows (PowerShell — execute como Administrador)
powershell -File plugins\caveman\hooks\install.ps1
```

Para desinstalar:

```bash
bash plugins/caveman/hooks/uninstall.sh
# ou
powershell -File plugins\caveman\hooks\uninstall.ps1
```

---

## Instalação no Codex

### Linux / macOS

1. Abra o Codex dentro deste repositório
2. Digite `/plugins`
3. Procure pelo nome do plugin (ex: `Caveman`)
4. Clique em **Install**

O arquivo `.agents/plugins/marketplace.json` na raiz já aponta para os plugins locais — o Codex os detecta automaticamente.

### Windows

1. Habilite symlinks antes de tudo:
   ```bat
   git config --global core.symlinks true
   ```
   Requer **Developer Mode** ou execução como Administrador.

2. Abra o repositório no VS Code com o Codex ativo
3. Vá em **Codex Settings → Plugins**
4. Encontre o plugin em *local marketplace* → **Install** → **Reload Window**

> No Windows os hooks do Codex estão desativados por padrão. Use `$caveman` para ativar manualmente após instalar.

---

## Adicionar um novo plugin

1. Crie a pasta `plugins/<nome>/`
2. Inclua o `plugin.json` com metadados do plugin
3. Adicione a linha correspondente na tabela acima
4. Registre no `plugins/caveman/.agents/plugins/marketplace.json` (ou crie um `marketplace.json` próprio na raiz de `plugins/`)
