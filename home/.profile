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
alias pgrep='ps aux | grep -v grep | grep'

git_branch_status()
{
    local parsed
    local shortstat
    local length
    local limit
    local parsed_start
    local parsed_end

    git rev-parse 2> /dev/null
    if [[ ${?} -gt 0 ]]; then
        return
    fi

    parsed=$(git branch 2>/dev/null | grep -e '^*' | awk '{print $2}')
    shortstat=$(git diff --shortstat HEAD 2>/dev/null | sed -E 's/[^0-9=,+-]//g')
    length=$(echo "${parsed}" | wc -c | sed 's/[^0-9]//g')

    if [[ ${length} -gt 40 ]]; then
        limit=$((length-17))
        parsed_start=$(echo "${parsed}" | cut -c 1-20)
        parsed_end=$(echo "${parsed}" | cut -c ${limit}-${length})
        parsed="${parsed_start}...${parsed_end}"
    fi

    if [[ ! -z "${shortstat}" ]]; then
        parsed="${parsed} * ${shortstat}"
    fi

    echo "(${parsed}) "
}

# Bash completion
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

for completion in ${HOME}/etc/bash_completion.d/*; do
    source "${completion}"
done

# dynamic PS1 for Git repositories
export PS1="\u [\w] \$(type git_branch_status &>/dev/null && git_branch_status)$ "

# dynamic PS1 for Git repositories
export PAGER="vimpager"

# Add /usr/local/sbin to the path
export PATH="/usr/local/sbin:${PATH}"

# coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

# sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:${MANPATH}"

# phpenv
export PATH="${HOME}/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# Add ~/.composer/vendor/bin to the path
export PATH="${HOME}/.composer/vendor/bin:${PATH}"

# Add ~/bin to the path - Use `chflags hidden bin` to hide it on Finder
export PATH="${HOME}/bin:${PATH}"

# Add vendor/bin to the path
export PATH="vendor/bin:${PATH}"

# Docker variables by docker-machine
eval "$(docker-machine env 2> /dev/null)"

# Bash history
export HISTSIZE=5000
export HISTFILESIZE=5000
