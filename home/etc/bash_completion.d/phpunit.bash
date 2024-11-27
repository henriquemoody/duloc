# Bash-Completion script for PHPUnit
#
# Created by Henrique Moody <henriquemoody@gmail.com>
#

_HELP_CACHE=()

_rgrep() {
    local content=$(cat <&0)
    local partial
    local IFS=$'\n'

    for part in "${@}"; do
        content=$(grep "${part}" <<< "${content}")
    done

    echo "${content}"

    [[ ! -z "${content}" ]]
}

_phpunit()
{
    COMPREPLY=()

    if [[ -z "${_HELP_CACHE[phpunit]}" ]]; then
        _HELP_CACHE[phpunit]=$(phpunit --help 2> /dev/null)
    fi

    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"
    local opts="--atleast-version --bootstrap --cache-directory --cache-result --check-version --colors --columns --columns --configuration --coverage-clover --coverage-cobertura --coverage-crap4j --coverage-filter --coverage-html --coverage-php --coverage-text= --coverage-xml --covers --debug --default-time-limit --disable-coverage-ignore --disallow-test-output --display-deprecations --display-errors --display-incomplete --display-notices --display-phpunit-deprecations --display-skipped --display-warnings --do-not-cache-result --dont-report-useless-tests --enforce-time-limit --exclude-group --exclude-testsuite --fail-on-deprecation --fail-on-empty-test-suite --fail-on-incomplete --fail-on-notice --fail-on-phpunit-deprecation --fail-on-risky --fail-on-skipped --fail-on-warning --filter --generate-baseline --generate-configuration --globals-backup --group --help --ignore-baseline --include-path --list-groups --list-suites --list-tests --list-tests-xml --log-events-text --log-events-verbose-text --log-junit --log-teamcity --migrate-configuration --no-configuration --no-coverage --no-extensions --no-logging --no-output --no-progress --no-results --only-summary-for-coverage-text --order-by --path-coverage --process-isolation --random-order-seed --reverse-list --show-uncovered-for-coverage-text --static-backup --stderr --stop-on-defect --stop-on-deprecation --stop-on-error --stop-on-failure --stop-on-incomplete --stop-on-notice --stop-on-risky --stop-on-skipped --stop-on-warning --strict-coverage --strict-global-state --teamcity --test-suffix --testdox --testdox-html --testdox-text --testsuite --use-baseline --uses --version --warm-coverage-cache -c -d -h"
    local diropts="--cache-directory|--coverage-html|--coverage-xml|--coverage-filter"
    local nocompleteopts="-d|--testsuite|--exclude-testsuite|--group|--exclude-group|--covers|--uses|--filter|--test-suffix|--default-time-limit|--order-by|--random-order-seed|--colors|--columns|--atleast-version|-h|--help|--version|--check-version"

    if grep "\\${prev}" <<< "${_HELP_CACHE[phpunit]}" 2> /dev/null | grep -q '<dir>'; then
        COMPREPLY=( $(compgen -d -- ${cur}) )
        return 0

    elif [[ ${prev} =~ ${nocompleteopts} ]]; then
        return 0

    elif [[ ${prev} = --columns ]]; then
        COMPREPLY=( $(compgen -W "max" -- ${cur}) )
        return 0

    elif [[ ${prev} = --colors ]]; then
        COMPREPLY=( $(compgen -W "auto never always" -- ${cur}) )
        return 0

    elif [[ "${cur}" == -* ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0

    else
        COMPREPLY=( $(compgen -f -- "${cur}") )
        return 0
    fi
}

complete -o nospace -F _phpunit phpunit
