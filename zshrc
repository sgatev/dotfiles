# Ensure that a tmux session is attached.
if [ -z "$TMUX" ]; then
  tmux attach -t tmux || tmux new -s tmux
fi

# Source ZSH configuration.
for file in ~/.dotfiles/zsh/*.zsh; do; source "$file"; done
