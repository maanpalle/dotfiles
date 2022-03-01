export ZSH="/home/$USER/.oh-my-zsh"

ZSH_THEME="af-magic"

plugins=(git sudo web-search copypath dirhistory history)

source $ZSH/oh-my-zsh.sh

source ~/.cargo/env

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
source /usr/share/nvm/init-nvm.sh

export PATH=$PATH:/home/$USER/bin:/home/$USER/bin/custom

alias cat=bat
