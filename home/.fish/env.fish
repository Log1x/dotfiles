# Prefer VSCode locally, nano over SSH.
if test -n "$SSH_CONNECTION"
    set -x EDITOR nano
else
    set -x EDITOR code
    set -x VISUAL code
end

# Central timezone.
set -x TZ America/Chicago

# Consistent default $PATH.
set PATH /usr/local/sbin ~/.local/bin $PATH

if test -d /etc/paths
    set PATH (cat /etc/paths | tr "\\n" ":" | sed 's/:$//')
end

# Configure Homebrew
if type -q brew
    set PATH (brew --prefix coreutils)/libexec/gnubin $PATH
    set HOMEBREW_CASK_OPTS '--appdir=/Applications'
end

# Configure Yarn
if type -q yarn
    set PATH ~/.config/yarn/global/node_modules/.bin ./node_modules/.bin $PATH
end

# Configure Composer
if type -q composer
    set PATH ~/.composer/vendor/bin ./vendor/bin $PATH
end

# Configure Hub
if type -q hub
    eval (hub alias -s)
end
