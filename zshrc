# ensure that a tmux session is attached
if [ -z "$TMUX" ]
then
  tmux attach -t TMUX || tmux new -s TMUX
fi

# set up zsh plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# initialize https://starship.rs
eval "$(starship init zsh)"

# configure history
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# set up aliases
alias e=nvim
alias l="ls -alG"
