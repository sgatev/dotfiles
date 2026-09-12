# Zsh infers its keymap from $EDITOR, and "nvim" matches *vi*, so the emacs
# bindings below have to be asked for explicitly.
bindkey -e

# <Command+Delete> deletes from current position until beginning of line.
bindkey "^U" backward-kill-line
