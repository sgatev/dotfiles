if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

eval "$(starship init zsh)"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias e=nvim
alias l="ls -alG"
