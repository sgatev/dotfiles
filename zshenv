# Sourced by every zsh, unlike ~/.zshrc which is only read by interactive ones,
# so this stays available to scripts and other non-interactive shells.

# Homebrew keeps rustup keg-only, so cargo and rustc live in its own bin.
typeset -U path
path=(/opt/homebrew/opt/rustup/bin $path)
export PATH
