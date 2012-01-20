export PATH="$HOME/.rbenv/bin:$PATH"
export EDITOR=$(which vim)
alias vi=$(which vim)

set -o vi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history. See bash(1) for more options.
export HISTCONTROL=ignoredups
# Ignore same sucessive entries.
export HISTCONTROL=ignoreboth

PS1="\u@\h:\w $ "

# Aliases.
alias da="django-admin.py"
alias pm="python manage.py"
alias rs="python manage.py runserver 0.0.0.0:8000"
alias rsd="python manage.py runserver 0.0.0.0:8000 --settings=development"

# Rbenv shim.
eval "$(rbenv init -)"

# Virtualenvwrapper.
export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER="/usr/local/bin/virtualenvwrapper.sh"
if [ -f $VIRTUALENVWRAPPER ]
then
    source $VIRTUALENVWRAPPER
fi
