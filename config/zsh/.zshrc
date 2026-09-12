# Ensure that a tmux session is attached.
if [ -z "$TMUX" ]; then; tmux new -A -s tmux; fi

# Runtime state which zsh would otherwise write next to this file, and so into
# the dotfiles repository.
zsh_cache=~/.cache/zsh
mkdir -p $zsh_cache

# Source ZSH configuration. The dot-prefixed files above are not matched.
for file in $ZDOTDIR/*.zsh; do; source "$file"; done
