fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)

autoload -Uz compinit && compinit

zstyle ':completion:*' completer _expand_alias _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
