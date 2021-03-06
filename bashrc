export PATH=/usr/local/opt/rbenv:$HOME/Library/Haskell/bin:/usr/local/opt/go/libexec/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:${HOME}/Library/Android/sdk/platform-tools:${HOME}/Library/Android/sdk/tools:$PATH

if command -v mvim &>/dev/null
then
    export EDITOR="mvim -v"
else
    export EDITOR=$(which vim)
fi

alias vi=$EDITOR
alias vim=$EDITOR

set -o vi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Don't put duplicate lines in the history. See bash(1) for more options.
export HISTCONTROL=ignoredups
# Ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# Increase histsize from default (500).
export HISTSIZE=20000

export GIT_PS1_SHOWSTASHSTATE=yes
export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_SHOWUPSTREAM=verbose

GIT_COMPLETION="${HOME}/.git-completion.bash"
if [ -f $GIT_COMPLETION ]
then
    source $GIT_COMPLETION
fi

PS1='\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\n$ '

# ls aliases.
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Git aliases.
alias g="git"

# Data pipeline aliases.
DATAPIPELINE_PATH="datapipeline-cli/datapipeline"
alias dpl="${DATAPIPELINE_PATH} --list-pipelines"
alias dpr="${DATAPIPELINE_PATH} --list-runs"
alias dpd="${DATAPIPELINE_PATH} --delete"

# Ruby aliases.
alias b="bundle exec"
alias rt="bundle exec ruby -I test"

# Rbenv shim.
type -P rbenv &>/dev/null && eval "$(rbenv init -)"

# Tmux
alias tmn="tmux new-session -s dev"

# Virtualenvwrapper.
export WORKON_HOME=~/.virtualenvs
export VIRTUALENV_USE_DISTRIBUTE="1"
VIRTUALENVWRAPPER="/usr/local/share/python/virtualenvwrapper.sh"
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

# Colourful nosetests, see http://pypi.python.org/pypi/rednose/0.1.4.
export NOSE_REDNOSE=1

# Spring, nope
export DISABLE_SPRING=1

alias ag="ag --path-to-agignore ~/.agignore"

type -P direnv &>/dev/null && eval "$(direnv hook bash)"

if [ -e ~/.ksr.rc ]; then source ~/.ksr.rc; fi # Provisioned by ksr laptop script
