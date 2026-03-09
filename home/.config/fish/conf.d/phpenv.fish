set -gx PHPENV_ROOT $HOME/.phpenv

if test -d $PHPENV_ROOT
    fish_add_path $PHPENV_ROOT/bin
    phpenv init - | source
end
