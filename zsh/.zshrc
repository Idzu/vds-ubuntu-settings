# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
#export PATH=${PATH}:/usr/local/mysql/bin

# Path to your Oh My Zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export MYSQL_USER="root"
export MYSQL_PASSWORD="81eJa6j%XoT@X0iV"

export PATH="$PATH:/opt/nvim-linux64/bin"

ZSH_THEME="eastwood"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# bun completions
[ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias ni="npm install"
alias nr="npm run"
alias ns="npm start"
alias nb="npm run build"

alias dps="docker ps"  # Показать запущенные контейнеры
alias dpa="docker ps -a"  # Показать все контейнеры
alias di="docker images"  # Показать доступные образы
alias drm="docker rm $(docker ps -a -q)"  # Удалить все остановленные контейнеры
alias drmi="docker rmi $(docker images -q)"  # Удалить все образы

alias ll="ls -alF"  # Список файлов с подробностями
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias h="history"  # Показать историю команд
alias c="clear"  # Очистить экран
alias gst="git status"
alias gp="git pull"
alias gcm="git commit -m"
alias ga="git add ."
alias gl="git log"

alias v="nvim"
alias vim="nvim"
