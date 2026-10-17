# https://github.com/Aloxaf/fzf-tab
. $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh
# fzf-tab passes its own match color, a light grey meant for dark backgrounds,
# so the theme's colors are passed again after it. Evaluated on every completion
# to follow ~/.config/bin/theme.
zstyle -e ':fzf-tab:complete:*:*' fzf-flags \
  'reply=(--preview= ${FZF_DEFAULT_OPTS_FILE:+$(<$FZF_DEFAULT_OPTS_FILE)})'

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
