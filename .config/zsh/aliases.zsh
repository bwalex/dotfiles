alias psa="ps aux"
alias psg="ps aux | grep "
alias ll='ls -alh'

alias git='noglob git'

# http://zshwiki.org/home/builtin/functions/zmv
autoload -U zmv
alias zmv="noglob zmv -W"

alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME'
