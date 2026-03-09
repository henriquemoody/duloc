use std/util "path add"

## global
$env.EDITOR = "nvim"

## nushell
$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}

## personal
path add ~/bin
path add ~/.local/bin
path add /usr/local/bin

## composer
path add .composer/vendor/bin

## cargo
path add ~/.cargo/bin

## homebrew
path add /opt/homebrew/bin
path add /opt/homebrew/sbin

## coreutils
path add /opt/homebrew/opt/coreutils/libexec/gnubin

## sed
path add /opt/homebrew/opt/gnu-sed/libexec/gnubin

## grep
path add /opt/homebrew/opt/grep/libexec/gnubin

## getopt
path add /opt/homebrew/opt/gnu-getopt/bin

## Add ruby to the path
path add /opt/homebrew/opt/ruby/bin
path add /opt/homebrew/lib/ruby/gems/3.0.0/bin

path add /usr/local/opt/icu4c/bin
path add /usr/local/opt/icu4c/sbin

## carapace
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir $"($nu.cache-dir)"
carapace _carapace nushell | save --force $"($nu.cache-dir)/carapace.nu"

## starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

## pyenv
$env.PYENV_ROOT = "~/.pyenv" | path expand
if (( $"($env.PYENV_ROOT)/bin" | path type ) == "dir") {
  $env.PATH = $env.PATH | prepend $"($env.PYENV_ROOT)/bin" }
$env.PATH = $env.PATH | prepend $"(pyenv root)/shims"

## cargo
# source $"($nu.home-path)/.cargo/env.nu"
