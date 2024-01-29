# bashrc config - Kevin Harvey 2024
# Some content borrowed from Azure bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Bash history config
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Update window rows/columns on resize
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# bash theme - partly inspired by https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme
__bash_prompt() {
    local userpart='`export XIT=$? \
        && echo -n "\[\033[0;32m\]\u " && [ "$XIT" -ne "0" ] && echo -n "\[\033[1;31m\]➜" || echo -n "\[\033[0m\]➜"`'
    local gitbranch='`\
            export BRANCH=$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git --no-optional-locks rev-parse --short HEAD 2>/dev/null); \
            if [ "${BRANCH}" != "" ]; then \
                echo -n "\[\033[0;36m\](\[\033[1;31m\]${BRANCH}" \
                && echo -n "\[\033[0;36m\]) "; \
            fi;`'
    local lightblue='\[\033[1;34m\]'
    local removecolor='\[\033[0m\]'
    PS1="${userpart} ${lightblue}\w ${gitbranch}${removecolor}\$ "
    unset -f __bash_prompt
}
__bash_prompt

# Base PATH
PATH=/usr/local/bin:/usr/bin:/bin:/usr/ccs/bin:/sbin:/usr/sbin:/usr/local/openwin/bin:/usr/openwin/bin

# Add Rust Cargo
PATH=$PATH:$HOME/.cargo/bin
# Add VS Code
PATH=$PATH:/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin

export PROMPT_DIRTRIM=4
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/ccs/bin:/sbin:/usr/sbin:/usr/local/openwin/bin:/usr/openwin/bin:$HOME/.cargo/bin:/mnt/c/Program\ Files/Microsoft\ VS\ Code/bin
export PATH=$PATH
export MANPATH=/usr/local/man:/usr/man:/usr/share/man
export HOST=`uname -n`
export EDITOR=/usr/bin/vim

umask 066
# ulimit -c 0		# Don't generate a core file         
set ignoreeof         # Prevents usage of Control-D from logging out
unset noglob
set notify            # Informs you when a background job terminates

# Command aliases
alias   la='ls -la'
alias   lc='ls -C'
alias   ll='ls -l'
alias   lz='ls -lZ'
alias   lza='ls -laZ'
alias	ls='ls -lt --color=auto'
#alias   ls='ls -F'
alias   python="python3.11"
alias   py="python"
alias   pip="python -m pip"

# Configure Node Version Manager (NVM)
export NVM_DIR="/home/kevin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
. "$HOME/.cargo/env"
