# PATH additions — fish_add_path is idempotent; paths are prepended in order listed.
# Requires brew.fish to have run first (for HOMEBREW_PREFIX).

# Homebrew extras
fish_add_path /opt/homebrew/sbin

# GNU coreutils (replaces macOS built-ins)
fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin

# GNU sed
fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin

# GNU grep
fish_add_path /opt/homebrew/opt/grep/libexec/gnubin

# GNU getopt
fish_add_path /opt/homebrew/opt/gnu-getopt/bin

# GNU make
fish_add_path $HOMEBREW_PREFIX/opt/make/libexec/gnubin

# MySQL client
fish_add_path /opt/homebrew/opt/mysql-client/bin

# PostgreSQL
fish_add_path /opt/homebrew/opt/postgresql@15/bin

# Ruby
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path /opt/homebrew/lib/ruby/gems/3.0.0/bin

# ICU
fish_add_path /usr/local/opt/icu4c/bin
fish_add_path /usr/local/opt/icu4c/sbin

# Go
fish_add_path $HOME/go/bin

# Composer global binaries
fish_add_path $HOME/.composer/vendor/bin

# Personal scripts — use `chflags hidden bin` to hide in Finder
fish_add_path $HOME/bin

# pip/pipx user installs
fish_add_path $HOME/.local/bin

# Rust/Cargo
fish_add_path $HOME/.cargo/bin

# LM Studio CLI
fish_add_path $HOME/.lmstudio/bin
