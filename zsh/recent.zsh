autoload -Uz chpwd_recent_dirs cdr add-zsh-hook

add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':chpwd:*' recent-dirs-max 1000

zstyle ':completion:*' recent-dirs-insert always
