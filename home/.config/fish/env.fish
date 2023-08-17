# Set Editor
if test -n "$SSH_CONNECTION"
    set -gx EDITOR nano
else
    set -gx EDITOR code
    set -gx VISUAL code
end

# Set Locale
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# Set Timezone
set -gx TZ America/Chicago

# Initial Paths
set PATH /opt/homebrew/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH ~/.local/bin $PATH

if test -d /etc/paths
    set PATH (cat /etc/paths | tr "\\n" ":" | sed 's/:$//')
end

# Homebrew
if type -q brew
    set HOMEBREW_CASK_OPTS '--appdir=/Applications'
    set PATH (brew --prefix coreutils)/libexec/gnubin $PATH
end

# Herd
if test -e /Applications/Herd.app
    set PATH $HOME/Library/Application\ Support/Herd/bin/ $PATH
end

# DBngin
if test -e /Applications/DBngin.app
    set PATH /Users/Shared/DBngin/mysql/8.0.33/bin $PATH
end

# Volta
if type -q volta
    set -gx VOLTA_HOME "$HOME/.volta"
    set -gx PATH "$VOLTA_HOME/bin" $PATH
end

# Composer
if type -q composer
    set PATH ~/.config/composer/vendor/bin ~/.composer/vendor/bin ./vendor/bin $PATH
end

# Cargo
if type -q rustup-init
    set PATH ~/.cargo/bin $PATH
end

# Hub
if type -q hub
    eval (hub alias -s)
end
