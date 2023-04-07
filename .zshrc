# User configuration
ZSH_HOME="$HOME/.config/zsh"

export PATH="$HOME/bin:/usr/local/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

if command -v rbenv rbenv >/dev/null 2>&1 ; then
	eval "$(rbenv init - zsh)"
fi

if command -v starship >/dev/null 2>&1 ; then
  eval "$(starship init zsh)"
elif [[ -f "${ZSH_HOME}/oh-my-zsh.zsh" ]] && [[ -d "${HOME}/.oh-my-zsh" ]]; then
  . "${ZSH_HOME}/oh-my-zsh.zsh"
fi

[ -f "${ZSH_HOME}/keybindings.zsh" ] && . "${ZSH_HOME}/keybindings.zsh"
[ -f "${ZSH_HOME}/aliases.zsh" ] && . "${ZSH_HOME}/aliases.zsh"
[ -f "${ZSH_HOME}/fzf.zsh" ] && . "${ZSH_HOME}/fzf.zsh"

# Customize to your needs...
REPORTTIME=1
TIMEFMT="%E=%U+%S"

# Bell off
xset b off 2> /dev/null

if [[ $TERM == xterm ]]; then
	export TERM=xterm-256color
fi

export EDITOR=vim
export VISUAL=vim
