# @vitepress-node

## Papel
Instalar Node.js quando não existe no ambiente Linux/WSL.
Usar NVM — não instalar Node diretamente via apt (versão desatualizada).

## Por que NVM e não apt

```
apt install nodejs  →  Node v12 (Ubuntu 22) — muito antigo para VitePress
nvm                 →  Node LTS mais recente, sem sudo, sem conflitos
```

## Instalação via NVM (Linux e WSL)

```bash
# 1) instalar NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 2) carregar NVM na sessão atual (sem precisar reiniciar terminal)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 3) instalar Node LTS
nvm install --lts

# 4) definir como padrão
nvm use --lts
nvm alias default node

# 5) verificar
node --version
npm --version
```

## Persistência no shell

Adicionar ao `~/.bashrc` ou `~/.zshrc` se ainda não estiver:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

```bash
# recarregar sem fechar terminal
source ~/.bashrc   # ou source ~/.zshrc
```

## Instalação no macOS (alternativa)

```bash
# via Homebrew (se disponível)
brew install node

# ou via NVM (mesmo processo do Linux)
```

## Instalação no Windows nativo (sem WSL)

```
Baixar instalador LTS em: https://nodejs.org/en/download/
Executar o .msi e seguir o wizard.
Reiniciar o terminal após instalação.
```

## Verificação final

```bash
node --version   # deve retornar v20.x.x ou superior
npm --version    # deve retornar 10.x.x ou superior
```

## Após instalar
→ @vitepress-configurar
