
### Default config

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

setopt HIST_FIND_NO_DUPS       # don't show dupes when searching
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE       # [default] Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording an entry.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
setopt SHARE_HISTORY           # Share history between all sessions.
