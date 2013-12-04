#!/usr/bin/env zsh -f


# RPROMPT is just messy if you are going to resize the window...
#RPROMPT='%{$fg_bold[blue]%}[%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_HG_PROMPT_CLEAN=""

ZSH_THEME_SVN_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_SVN_PROMPT_CLEAN=""


function prompt_generate {
	PROMPT=""
	# time
	PROMPT="$PROMPT%{${fg_bold[blue]}%}%*%{$reset_color%} "
	# switch to red background when root
	#PROMPT="$PROMPT%(#.%{${bg[red]}%}.)"
	# hostname
	#PROMPT="$PROMPT%{${fg_bold[magenta]}%}%n%{$reset_color%}%B@%{${fg_bold[yellow]}%}%m%{$reset_color%}:"
	#PROMPT="$PROMPT%B%n%{$reset_color%}%B@%{${fg_bold[yellow]}%}%m%{$reset_color%}:"
	#PROMPT="$PROMPT%n%{${fg[green]}%}@%{$reset_color%}%B%m%b:"
	#PROMPT="$PROMPT%n%{${fg_bold[blue]}%}@%{$reset_color%}%B%m%b:"
	PROMPT="$PROMPT%B%n%{${fg_bold[blue]}%}%B@%{${fg_bold[yellow]}%}%m%{$reset_color%}:"
	# path
	PROMPT="$PROMPT%{${fg_bold[black]}%}%~%b "
	# git dynamic content, i.e. branch name
	PROMPT="$PROMPT$(git_prompt_info)"
	# history number
	#PROMPT="$PROMPT%{${fg[magenta]}%}!%!$reset_color "
	# jobs display
	prompt_jobs
	# shell nesting
	#PROMPT="$PROMPT%(2L.%{${fg_bold[yellow]}%}<%L>%{$reset_color%} .)"
	# tty name
	#PROMPT="$PROMPT%l "
	# start second line
	PROMPT="$PROMPT
"
	# If we're in paste mode, forget all the fancyness and only do
	# the basic prompt.
	#if [[ -n $paste_mode ]] {
	#	PROMPT=""
	#}
	# return value
	PROMPT="$PROMPT%(?..%{${fg_bold[red]}%}%?%{$reset_color%} )"
	# prompt!
	PROMPT="$PROMPT%(!.%{$fg_bold[red]%}.%{$fg[green]%})%# %{$reset_color%}"
}

function prompt_jobs {
	# from http://www.miek.nl/blog/archives/2008/02/20/my_zsh_prompt_setup/index.html
	local js
	local jobno

	js=()
	for jobno (${(k)jobstates}) {
		local fullstate=$jobstates[$jobno]
		local state="${${(@s,:,)fullstate}[2]}"
		js+=($jobno${state//[^+-]/})
	}
	if [[ $#js -gt 0 ]]; then
		PROMPT="$PROMPT%{${fg[yellow]}%}[${(j:,:)js}]%{$reset_color%} "
	fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd prompt_generate
