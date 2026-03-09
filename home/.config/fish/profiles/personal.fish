# ~/.env.personal
for line in (grep -v '^\s*#' $HOME/.env.personal | grep -v '^\s*$')
    set -l parts (string split -m 1 '=' $line)
    set -gx $parts[1] $parts[2]
end

# ppv
set -gx DATE_TIMEZONE CET
set -gx LOGGER_LEVEL 3
set -gx DRY_RUN_MODE false
set -gx ARCHIVE_CANCELLED_EVENTS true

# replacer
set -gx REPLACE_IGNORED_PATTERN '(.git|vendor/)'
