FZF_DEFAULT_UI="--prompt='❯ ' --pointer='▶'"
FZF_DEFAULT_COLOR='bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'
FZF_DEFAULT_PREVIEW="bat --theme=Nord --style=numbers --color=always --line-range :500 {}"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_UI --color='$FZF_DEFAULT_COLOR' --preview='$FZF_DEFAULT_PREVIEW'"

# https://github.com/Aloxaf/fzf-tab
. ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:complete:*:*' fzf-flags --preview=''

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
