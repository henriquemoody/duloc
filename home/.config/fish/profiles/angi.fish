# ~/.env.angi
for line in (grep -v '^\s*#' $HOME/.env.angi | grep -v '^\s*$')
    set -l parts (string split -m 1 '=' $line)
    set -gx $parts[1] $parts[2]
end
