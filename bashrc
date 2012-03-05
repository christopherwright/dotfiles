RBENV_BIN_PATH="${HOME}/.rbenv/bin"
if [ -d $RBENV_BIN_PATH ]
then
    export PATH="$RBENV_BIN_PATH:$PATH"
fi
export EDITOR=$(which vim)
alias vi=$(which vim)

set -o vi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history. See bash(1) for more options.
export HISTCONTROL=ignoredups
# Ignore same sucessive entries.
export HISTCONTROL=ignoreboth

export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_SHOWUPSTREAM=verbose

GIT_COMPLETION="${HOME}/.git-completion.bash"
echo $GIT_COMPLETION
if [ -f $GIT_COMPLETION ]
then
    source $GIT_COMPLETION
fi

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\nλ '

# ls aliases.
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Django aliases.
alias da="django-admin.py"
alias pm="python manage.py"
alias rs="python manage.py runserver 0.0.0.0:8000"
alias rsd="python manage.py runserver 0.0.0.0:8000 --settings=development"

# Rbenv shim.
hash rbenv &> /dev/null
if [ $? -eq 1 ]; then
    eval "$(rbenv init -)"
fi

# Virtualenvwrapper.
export WORKON_HOME=~/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE="1"
VIRTUALENVWRAPPER="/usr/local/bin/virtualenvwrapper.sh"
if [ -f $VIRTUALENVWRAPPER ]
then
    source $VIRTUALENVWRAPPER
fi

# Env file, for setting configuration using environment variables.
ENV_FILE="${HOME}/.env"
if [ -f $ENV_FILE ]
then
    source $ENV_FILE
fi

# Autoenv, see https://github.com/kennethreitz/autoenv
AUTOENV_FILE="${HOME}/.autoenv/activate.sh"
if [ -f $AUTOENV_FILE ]
then
    source $AUTOENV_FILE
fi

# Colourful grep.
export GREP_OPTIONS='--color=auto'
