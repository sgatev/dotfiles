# ensure that a tmux session is attached
if [ -z "$TMUX" ]
then
  tmux attach -t TMUX || tmux new -s TMUX
fi

source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/completions.zsh
source ~/.dotfiles/zsh/fzf.zsh
source ~/.dotfiles/zsh/options.zsh

# set up autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# set up syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# initialize https://starship.rs
eval "$(starship init zsh)"

export EDITOR="nvim"
