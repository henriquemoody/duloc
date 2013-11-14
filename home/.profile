# .bashrc
declare -x CLICOLOR=1

alias grep='grep --color'
alias egrep='egrep --color'
alias pgrep='ps aux | grep -v grep | grep'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# User specific aliases and functions
PATH="${HOME}/.local/bin:/usr/local/opt/php55/bin:${PATH}"

git_parse_dirty()
{
    local diff=$(git diff HEAD --name-only 2>/dev/null)

    if [[ ! -z "${diff}" ]]; then
        echo " *"
    fi
}

git_branch_name()
{
    local branch=$(git branch 2>/dev/null | grep -e '^*' | awk '{print $2}')

    echo "${branch}" | egrep -q '^[0-9]+'
    if [[ ${?} -eq 0 ]]; then
        branch="#$(echo "${branch}" | cut -d '-' -f 1)"
    fi

    echo "${branch}" |
        sed -E "s/^(.+)$/(\1$(git_parse_dirty)) /"
}

PS1="\u [\w] \$(type git_branch_name &>/dev/null && git_branch_name)$ "

export PS1
export PATH
