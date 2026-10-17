# Sourced by every zsh, unlike ~/.zshrc which is only read by interactive ones,
# so these stay available to scripts and other non-interactive shells.
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# Here rather than with the rest of the fzf setup so that fzf run from tmux
# popups, which are non-interactive shells, still picks up the theme.
FZF_DEFAULT_UI="--prompt='❯ ' --pointer='▶'"
FZF_DEFAULT_PREVIEW="bat --style=numbers --color=always --line-range :500 {}"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_UI --preview='$FZF_DEFAULT_PREVIEW'"

# The colors of fzf and bat are kept in files written by ~/.config/bin/theme.
# Both read them each time they start, so a switch also applies to shells and
# Neovim instances which are already running. fzf fails to start when the file
# is missing, as it is until the script has run once.
[ -r ~/.local/state/dotfiles/fzf ] && export FZF_DEFAULT_OPTS_FILE=~/.local/state/dotfiles/fzf
export BAT_CONFIG_PATH=~/.local/state/dotfiles/bat

export HOMEBREW_PREFIX="/opt/homebrew"

# Homebrew is not on the system default PATH, so without this nothing installed
# by it can be found from a script or any other non-interactive shell.
#
# macOS runs `path_helper` from /etc/zprofile, which rebuilds PATH with the
# /etc/paths entries first and everything set here appended after it, so
# ~/.zprofile calls this again to win the ordering back for login shells. The
# uniqueness attribute on `path` makes that second call reorder, not duplicate.
typeset -U path

prepend_path() {
  path=(
    $HOMEBREW_PREFIX/bin
    $HOMEBREW_PREFIX/sbin
    $HOMEBREW_PREFIX/opt/rustup/bin # Keg-only, so cargo and rustc live here.
    $HOME/.config/bin # Scripts from the dotfiles, such as `theme`.
    $path
  )
  export PATH
}

prepend_path
