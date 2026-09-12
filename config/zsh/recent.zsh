autoload -Uz chpwd_recent_dirs cdr add-zsh-hook

add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':chpwd:*' recent-dirs-max 1000

# Defaults to $ZDOTDIR/.chpwd-recent-dirs, which is the repository.
zstyle ':chpwd:*' recent-dirs-file $zsh_cache/recent-dirs

zstyle ':completion:*' recent-dirs-insert always
