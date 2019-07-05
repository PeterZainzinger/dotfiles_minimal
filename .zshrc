export ZSH=~/.oh-my-zsh
export PS1="\W \$"

set editing-mode vi
set -g status-keys vi

ZSH_THEME="agnoster"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export VISUAL=vim
export EDITOR="$VISUAL"

source ~/.zshalias


prompt_context() {}


bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward
