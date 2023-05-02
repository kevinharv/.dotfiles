# .bashrc file - 20230501 - Kevin Harvey
# Individual per-interactive-shell startup file

export HOST=`uname -n`

umask 066
# ulimit -c 0		# Don't generate a core file

# Settings for interactive shells
export HISTCONTROL=ignoredups  # Ignore duplicate commands
export HISTFILESIZE=40         # Remember the last 40 commands
export HISTSIZE=40             
unset noglob
set notify            # Informs you when a background job terminates

# Some aliased ls commands
alias   la='ls -la'
alias   lc='ls -C'
alias   ll='ls -l'
alias   lz='ls -lZ'
alias   lza='ls -laZ'
# alias   kubectl='minikube kubectl'

# Some prompts
PS1='\[\033[38;5;12m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\] \\$\[$(tput sgr0)\] '

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# NVM/Cargo config
export NVM_DIR="/home/kevin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
. "$HOME/.cargo/env"