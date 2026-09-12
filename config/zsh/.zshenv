# Sourced by every zsh, unlike ~/.zshrc which is only read by interactive ones,
# so these stay available to scripts and other non-interactive shells.
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

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
