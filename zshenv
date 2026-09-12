# zsh reads this before ZDOTDIR exists, so it is the one file which has to live
# in the home directory. Everything else is kept with the other configuration.
export ZDOTDIR="$HOME/.config/zsh"

# Only .zprofile and .zshrc are picked up from ZDOTDIR; .zshenv has already been
# read by the time it is set, so it has to be sourced here.
source "$ZDOTDIR/.zshenv"
