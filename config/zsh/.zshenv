# Sourced by every zsh, unlike ~/.zshrc which is only read by interactive ones,
# so these stay available to scripts and other non-interactive shells.
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# Here rather than with the rest of the fzf setup so that fzf run from tmux
# popups, which are non-interactive shells, still picks up the theme.
FZF_DEFAULT_UI="--prompt='❯ ' --pointer='▶'"
FZF_DEFAULT_COLOR='bg+:#2E3440,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'
FZF_DEFAULT_PREVIEW="bat --theme=Nord --style=numbers --color=always --line-range :500 {}"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_UI --color='$FZF_DEFAULT_COLOR' --preview='$FZF_DEFAULT_PREVIEW'"

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
    $path
  )
  export PATH
}

prepend_path
