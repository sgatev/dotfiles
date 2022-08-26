# ensure that a tmux session is attached
if [ -z "$TMUX" ]
then
  tmux attach -t TMUX || tmux new -s TMUX
fi

. ~/.dotfiles/zsh/aliases.zsh
. ~/.dotfiles/zsh/autosuggestions.zsh
. ~/.dotfiles/zsh/completions.zsh
. ~/.dotfiles/zsh/fzf.zsh
. ~/.dotfiles/zsh/highlighting.zsh
. ~/.dotfiles/zsh/options.zsh

export EDITOR="nvim"
export PROMPT='%F{blue}%~ %(?.%F{green}❯.%F{red}❯)%f '
