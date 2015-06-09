# Bash-Completion script for PHP.
#
# Created by Henrique Moody <henriquemoody@gmail.com>
#
_php()
{
    COMPREPLY=()

    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"
    local opts="-a -c -n -d -e -f -h -i -l -m -r -B -R -F -E -H -S -t -s -v -w -z --ini --rf --rc --re --rz --ri --help -h"
    local diropts="-t"
    local nocompleteopts="-d|-r|-B|-R|-E|-S|--ini|-h|--help|--rf|--rc|--re|--rz|--ri"

    if [[ ${prev} =~ ${diropts} ]]; then
        COMPREPLY=( $(compgen -d -- ${cur}) )
        return 0

    elif [[ ${prev} =~ ${nocompleteopts} ]]; then
        return 0

    elif [[ "${cur}" == -* ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0

    else
        COMPREPLY=( $(compgen -f -- "${cur}") )
        return 0
    fi
}

complete -F _php php
