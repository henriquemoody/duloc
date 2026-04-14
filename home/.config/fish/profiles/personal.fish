# ~/.env.personal
load_dotenv $HOME/.env.personal

# ppv
set -gx DATE_TIMEZONE CET
set -gx LOGGER_LEVEL 3
set -gx DRY_RUN_MODE false
set -gx ARCHIVE_CANCELLED_EVENTS true

# replacer
set -gx REPLACE_IGNORED_PATTERN '(.git|vendor/)'
