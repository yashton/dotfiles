if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/usr/bin" ] ; then
    PATH="$HOME/usr/bin:$PATH"
fi
PATH="/usr/local/bin:$PATH"

export EDITOR='emacs -nw'
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

alias py2='python'
alias py='python3'
alias e='emacs'
alias g='git'
alias gr='gradle'

GRADLE_OPTS=-Xmx2G

SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS` trap "kill $SSH_AGENT_PID" 0
fi

PATH=$PATH:~/.npm-global/bin

if [ -e "$HOME/.profile-local" ] ; then
    source "$HOME/.profile-local"
fi

export PATH="$HOME/.cargo/bin:$PATH"
