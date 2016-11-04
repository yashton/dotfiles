# The following lines were added by compinstall
zstyle :compinstall filename '/home/yashton/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=$HISTSIZE
bindkey -e
# End of lines configured by zsh-newuser-install

#autoload -U promptinit
#promptinit
#prompt redhat

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
export PS1='%* %l %j [%B%F{blue}%n%f@%F{magenta}%m%f%b : %F{green}%~%f]
%# '
fi
#export PS1='%n@%m %# '
#export RPROMPT='[%~] %t'
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"' 

alias ls='ls -B'
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

case $TERM in
     *xterm*|rxvt|(dt|k|E)term)
          precmd () { print -Pn "\e]0;%n@%m: [%~]\a" }
          preexec () { print -Pn "\e]0;%n@%m: $1\a" }
          ;;
esac 

source ~/.profile

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/usr/bin" ] ; then
    PATH="$HOME/usr/bin:$PATH"
fi

autoload -U select-word-style
select-word-style Normal
bindkey '\033[3~' delete-char
bindkey '\033\033[3~' delete-word
