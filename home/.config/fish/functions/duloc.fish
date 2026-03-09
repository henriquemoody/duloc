## Track loaded profiles per session (global, resets on new shell — matches original bash behavior)
if not set -q _duloc_loaded
    set -g _duloc_loaded
end

function _duloc_is_loaded
    contains -- $argv[1] $_duloc_loaded
end

function _duloc_list
    for filename in $HOME/.config/fish/profiles/*.fish
        set -l profile (string replace -r '.*profiles/(.+)\.fish$' '$1' $filename)
        printf "  %-10s" $profile
        if _duloc_is_loaded $profile
            printf "\033[32mLoaded\033[m\n"
        else
            printf "Not loaded\n"
        end
    end
end

function _duloc_load
    set -l profile $argv[1]
    set -l filename $HOME/.config/fish/profiles/$profile.fish

    if _duloc_is_loaded $profile
        echo "Profile \`$profile\` is already loaded."
        return 0
    end

    if not test -f $filename
        echo "Profile \`$profile\` not found." >&2
        return 1
    end

    set -ga _duloc_loaded $profile
    source $filename
    echo "Profile \`$profile\` has been loaded."
end

function _duloc_read
    set -l profile $argv[1]
    set -l filename $HOME/.config/fish/profiles/$profile.fish

    if not test -f $filename
        echo "Profile \`$profile\` not found." >&2
        return 1
    end

    less $filename
end

function _duloc_help
    switch $argv[1]
        case load
            echo "Usage: duloc load PROFILE"
            echo "Loads a profile to your shell."
            echo ""
            echo "You can run \`duloc list\` to see all available profiles."
        case read
            echo "Usage: duloc read PROFILE"
            echo "Reads the content of a profile file."
        case list
            echo "Usage: duloc list"
            echo "Lists all profiles and indicates which ones are loaded."
        case '*'
            echo "Usage: duloc COMMAND [OPTIONS]"
            echo "Manages profiles in your shell. Available commands: load, read, list, help"
    end
end

function duloc --description 'Manage shell profiles'
    set -l command $argv[1]
    set -e argv[1]

    switch $command
        case load
            _duloc_load $argv
        case read
            _duloc_read $argv
        case list
            _duloc_list
        case help
            _duloc_help $argv
        case '*'
            _duloc_help >&2
    end
end
