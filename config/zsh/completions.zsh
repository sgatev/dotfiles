fpath=("/opt/homebrew/share/zsh/site-functions" $fpath)

# The dump would otherwise be written to $ZDOTDIR, which is the repository.
autoload -Uz compinit && compinit -d $zsh_cache/zcompdump

zstyle ':completion:*' completer _expand_alias _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $zsh_cache/cache
