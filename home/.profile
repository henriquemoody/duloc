# .bashrc
declare -x CLICOLOR=1

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
alias grep='grep --color'
alias egrep='egrep --color'
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

# dynamic PS1 for Git repositories
export PS1="\u [\w] \$(type git_branch_status &>/dev/null && git_branch_status)$ "

# phpenv
export PATH="${HOME}/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
