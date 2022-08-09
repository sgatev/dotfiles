# ensure that a tmux session is attached
if [ -z "$TMUX" ]
then
  tmux attach -t TMUX || tmux new -s TMUX
fi

# set up autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# set up syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# initialize https://starship.rs
eval "$(starship init zsh)"

setopt APPEND_HISTORY         # append history list to the history file
setopt EXTENDED_HISTORY       # save command’s beginning timestamp and duration
setopt HIST_FIND_NO_DUPS      # do not display duplicates
setopt HIST_IGNORE_ALL_DUPS   # remove older duplicate from history
setopt SHARE_HISTORY          # share history between sessions

# enable completion
autoload -Uz compinit && compinit

# set up aliases
alias b=bat
alias e=nvim
alias l="ls -alG"
