export ZSH="/home/hector/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(git sudo web-search copydir dirhistory history)

source $ZSH/oh-my-zsh.sh

source ~/.cargo/env

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

fortune | cowsay
