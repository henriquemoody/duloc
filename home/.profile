# .bashrc
declare -x CLICOLOR=1

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
alias egrep='egrep --color'
alias grep='grep --color'
alias jless='python -m json.tool | less'
alias ls="ls --color=auto"
alias psgrep='ps aux | grep -v grep | grep'
alias pskill='awk '"'"'{print $2}'"'"' | sort -d | xargs -n1 kill -9'

# Bash completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

for completion in ${HOME}/etc/bash_completion.d/*; do
  source "${completion}"
done

# Custom PS1
export PS1="\u [\w] $ "

# My pager
export PAGER="vimpager"

# Add /usr/local/sbin to the path
export PATH="/usr/local/sbin:${PATH}"

# coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

# sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:${MANPATH}"

# grep
export PATH="/usr/local/opt/grep/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/grep/libexec/gnuman:${MANPATH}"

# Add ~/.composer/vendor/bin to the path
export PATH="${HOME}/.composer/vendor/bin:${PATH}"

# Add ~/bin to the path - Use `chflags hidden bin` to hide it on Finder
export PATH="${HOME}/bin:${PATH}"

# Add vendor/bin to the path
export PATH="vendor/bin:${PATH}"

# Bash history
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%F %T '

# Locale settings
export LC_ALL="en_US.utf-8"
export LANG="en_US.utf-8"
export LANGUAGE="en_US"
export C_CTYPE="en_US.utf-8"
export LC_NUMERIC="en_US"
export LC_TIME="en_US.utf-8"
