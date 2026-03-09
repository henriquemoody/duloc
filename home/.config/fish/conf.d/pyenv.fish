set -gx PYENV_ROOT $HOME/.pyenv

if test -d $PYENV_ROOT/bin
    fish_add_path $PYENV_ROOT/bin
end

if command -q pyenv
    pyenv init - | source
end
