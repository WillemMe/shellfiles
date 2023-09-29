
### zsh Functions ###

## Make dir and move in ##
mkdirmv() {
	mkdir $1 && cd $1
}
## Terminal Calculator ##
calc() python3 -c "from math import *; print($*);"

## List Stuff After CD ##
cd () { builtin cd "$@" && ls}

## Global Extract ##
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1 -C ${1%.*}  ;;
      *.tar.gz)    tar xvzf $1 -C ${1%.*}  ;;
      *.tar.xz)    tar xJf $1 -C ${1%.*}  ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        mkdir ${1%.*} & gunzip $1 > ${1%.*}   ;;
      *.tar)       tar xf $1 -C ${1%.*}   ;;
      *.tbz2)      tar xjf $1 -C ${1%.*}  ;;
      *.tgz)       tar xzf $1 -C ${1%.*}   ;;
      *.zip)       unzip $1 -d ${1%.*}     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via this, try again later:)" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

## Time zsh ##
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do time $shell -i -c exit; done
}

## Plugin Manager ##
function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$HOME/.config/zsh/plugins/$PLUGIN_NAME" ]; then
    else
        git clone "https://github.com/$1.git" "$HOME/.config/zsh/plugins/$PLUGIN_NAME"
    fi
}

## Plugins ##
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-history-substring-search"
zsh_add_plugin "Aloxaf/fzf-tab"
zsh_add_plugin "ohmyzsh/ohmyzsh"  
zsh_add_plugin "BlaineEXE/zsh-cmd-status"
zsh_add_plugin "hlissner/zsh-autopair"
