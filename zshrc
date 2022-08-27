# ensure that a tmux session is attached
if [ -z "$TMUX" ]
then
  tmux attach -t tmux || tmux new -s tmux
fi

. ~/.dotfiles/zsh/aliases.zsh
. ~/.dotfiles/zsh/autosuggestions.zsh
. ~/.dotfiles/zsh/completions.zsh
. ~/.dotfiles/zsh/environment.zsh
. ~/.dotfiles/zsh/fzf.zsh
. ~/.dotfiles/zsh/highlighting.zsh
. ~/.dotfiles/zsh/options.zsh
