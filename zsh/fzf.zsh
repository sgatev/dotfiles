FZF_DEFAULT_COLOR="bg+:-1,pointer:#88C0D0,marker:#A3BE8C,info:#4C566A,spinner:#4C566A"
FZF_DEFAULT_PREVIEW="bat --theme=Nord --style=numbers --color=always --line-range :500 {}"
export FZF_DEFAULT_OPTS="--color='$FZF_DEFAULT_COLOR' --preview '$FZF_DEFAULT_PREVIEW'"

# https://github.com/Aloxaf/fzf-tab
. ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:complete:*:*' fzf-flags --preview=''

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
