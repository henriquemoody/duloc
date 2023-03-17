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
alias k="kubectl"
alias psgrep='ps aux | grep -v grep | grep'
alias pskill='awk '"'"'{print $2}'"'"' | sort -d | xargs -n1 kill -9'
alias from-dutch='translate --from=nl --to=en --say=text'
alias to-dutch='translate --from=en --to=nl --say=translation'

# Bash completion
if [ -f /opt/homebrew/etc/bash_completion ]; then
  . /opt/homebrew/etc/bash_completion
fi

for completion in ${HOME}/etc/bash_completion.d/*; do
  source "${completion}"
done

# Custom PS1
export PS1="\u [\w] $ "

# My pager
export PAGER="vimpager"

# Add /opt/homebrew/sbin to the path
export PATH="/opt/homebrew/sbin:${PATH}"
export MANPATH="/opt/homebrew/share/man:${MANPATH}"

# coreutils
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"

# sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:${PATH}"
export MANPATH="/opt/homebrew/opt/gnu-sed/libexec/gnuman:${MANPATH}"

# grep
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:${PATH}"
export MANPATH="/opt/homebrew/opt/grep/libexec/gnuman:${MANPATH}"

# getopt
export PATH="/opt/homebrew/opt/gnu-getopt/bin:${PATH}"
export MANPATH="/opt/homebrew/opt/gnu-getopt/share/man:${MANPATH}"

# mysql
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Add ~/.composer/vendor/bin to the path
export PATH="${HOME}/.composer/vendor/bin:${PATH}"

# Add ~/bin to the path - Use `chflags hidden bin` to hide it on Finder
export PATH="${HOME}/bin:${PATH}"

# Add ruby to the path
export PATH="/opt/homebrew/opt/ruby/bin:${PATH}"
export PATH="/opt/homebrew/lib/ruby/gems/3.0.0/bin:${PATH}"

# Bash history
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%F %T '

# phpenv
export PHPENV_ROOT="${HOME}/.phpenv"

# jdk
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_361.jdk/Contents/Home/"
export PATH="${JAVA_HOME}/bin:${PATH}"

if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi

# nvm
export NVM_DIR="${HOME}/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Locale settings
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US"
export C_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US"
export LC_TIME="en_US.UTF-8"

eval "$(/opt/homebrew/bin/brew shellenv)"
