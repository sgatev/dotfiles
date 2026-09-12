HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY       # Append to the history file.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
setopt EXTENDED_HISTORY     # Save command’s beginning timestamp and duration.
setopt HIST_FIND_NO_DUPS    # Do not display duplicates.
setopt HIST_IGNORE_ALL_DUPS # Remove older duplicate from history.
setopt SHARE_HISTORY        # Share history between sessions.
setopt AUTOCD               # Move to directories without cd.
