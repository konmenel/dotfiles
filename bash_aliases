# Alias for git
alias "gitc"="git add . ; git commit"

# Aliases for files
alias duh="du -sh * | sort -h -r"

# Alias for grep history
alias gh="history|grep"

## Aliases for conda 
# env setup from .yml
alias cenv="conda env create -f environment.yml"
# env export to .yml
alias cexp="conda env export --no-builds  > environment.yml"

# ICHEC
alias ichec="ssh -X konmenel@kay.ichec.ie"

# Alias for opening nautilus in current directory
alias ii="nautilus"

# Alias sciprog
alias sciprog="ssh sp25@sciprog.ichec.ie"

# Aliases for ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

