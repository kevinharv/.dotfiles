# .bashrc - Kevin Harvey - 20230502

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/ccs/bin:/sbin:/usr/sbin:/usr/local/openwin/bin:/usr/openwin/bin:/home/kevin/.local/bin
export MANPATH=/usr/local/man:/usr/man:/usr/share/man
export HOST=`uname -n`
export EDITOR=/usr/bin/vim

umask 066
# ulimit -c 0		# Don't generate a core file

# Settings for interactive shells
# To turn off the following settings comment it 
export HISTCONTROL=ignoredups  # Ignore duplicate commands
export HISTFILESIZE=40         # Remember the last 40 commands
export HISTSIZE=40             
set ignoreeof         # Prevents usage of Control-D from logging out
# set noclobber         # Prevents '>' from overwriting files
# set noglob            # Prevents wildcard expansion from taking place
unset noglob
# set notify            # Informs you when a background job terminates

# Some aliased ls commands
alias   la='ls -la'
alias   lc='ls -C'
alias   ll='ls -l'
alias   lz='ls -lZ'
alias   lza='ls -laZ'
alias	ls='ls --color=auto'
#alias   ls='ls -F'
alias   ap='ansible-playbook'
alias   p='ping -c 1 '
alias	python='/bin/python3.11'

# Prompt
PS1='\[\e[0;34m\]\w \[\e[0;31m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2) \[\e[0m\]\$\[\e[0m\] '

# User Defined Specs
export NVM_DIR="/home/kevin/.nvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/kevin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "$HOME/.cargo/env"
