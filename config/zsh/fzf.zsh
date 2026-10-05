# https://github.com/Aloxaf/fzf-tab
. $ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:complete:*:*' fzf-flags --preview=''

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
