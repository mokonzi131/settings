# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

## use vi as cli editor
set -o vi
MYVIMRC=~/.vimrc

## setup git function call and git completions
if [ -r /usr/share/git ]; then
    . /usr/share/git/completion/git-completion.bash
    . /usr/share/git/git-prompt.sh
elif [ -r /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
    if [ -r /usr/share/git-core/ ]; then
        . /usr/share/git-core/contrib/completion/git-prompt.sh
    fi
else
    function __git_ps1() { true; }
fi
#source /etc/bash_completion.d/git
#source /usr/share/git-core/contrib/completion/git-prompt.sh

## my version of the cli prompt with git branch attached
PS1="\[\033[0;30m\][\[\033[0;32m\]\u\[\033[0;30m\]@\[\033[0;33m\]\h\[\033[0;30m\] \[\033[0;31m\]\W\[\033[0;30m\]]\[\033[0;35m\]\$(__git_ps1 '(%s)')\[\033[0m\]$ "

