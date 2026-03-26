# @vitepress-node

## Papel
Instalar Node somente quando ele não existir e o fluxo não for Docker.

## Regras
- Linux/WSL: usar NVM
- macOS: NVM ou Homebrew
- Windows nativo: usar instalador oficial do Node LTS
- não usar `apt install nodejs`

## Linux / WSL via NVM
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts
nvm alias default node
node --version
npm --version
```

## Persistência no shell
Adicionar ao `~/.bashrc` ou `~/.zshrc` se faltar:
```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
```

## Próximo passo
`@vitepress-configurar`
