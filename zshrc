# Ensure that a tmux session is attached.
if [ -z "$TMUX" ]; then; tmux new -A -s tmux; fi

# Source ZSH configuration.
for file in ~/.zsh/init/*.zsh; do; source "$file"; done
