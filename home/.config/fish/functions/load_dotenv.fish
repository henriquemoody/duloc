function load_dotenv --description 'Load environment variables from a dotenv file with a timeout'
    set -l env_file $argv[1]
    set -l timeout_secs 120

    if not test -e $env_file
        return 0
    end

    set -l timeout_cmd
    if command -q timeout
        set timeout_cmd timeout $timeout_secs
    else if command -q gtimeout
        set timeout_cmd gtimeout $timeout_secs
    else
        set timeout_cmd perl -e "alarm($timeout_secs); exec @ARGV" --
    end

    set -l lines ($timeout_cmd grep -v '^\s*#' $env_file 2>/dev/null | string match -rv '^\s*$')

    if test $pipestatus[1] -ne 0
        echo "load_dotenv: timed out or failed to read $env_file" >&2
        return 1
    end

    for line in $lines
        set -l parts (string split -m 1 '=' $line)
        set -gx $parts[1] $parts[2]
    end
end
