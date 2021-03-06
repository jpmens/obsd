set -o noclobber
set -o nounset
set -o vi

LC_CTYPE=en_US.UTF-8
export LC_CTYPE

export PATH=$HOME/bin:$PATH
export SSH_AUTH_SOCK=~/.ssh/ssh-socket
export PS1="$ "

alias g="git"

ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
  # No ssh-agent running
  rm -rf $SSH_AUTH_SOCK
  eval `ssh-agent -a $SSH_AUTH_SOCK`
  echo $SSH_AGENT_PID >| ~/.ssh/ssh-agent-pid
fi
