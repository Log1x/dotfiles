# Prefer VSCode locally, nano over SSH.
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="nano"
else
  export EDITOR="code"
  export VISUAL="code"
fi

# Central timezone.
export TZ="America/Chicago"

# Consistent default $PATH.
export PATH=`cat /etc/paths | tr "\\n" ":" | sed 's/:$//'`
export PATH="/usr/local/sbin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

# GNU Command Line Tools.
export PATH="$(brew --prefix coreutils)/libexec/gnubin:${PATH}"

# Dotfiles location.
export DOTFILES=`homesick show_path dotfiles`

# Global Composer bin.
export GLOBAL_COMPOSER_BIN="${HOME}/.composer/vendor/bin"

# Global yarn bin.
export GLOBAL_YARN_BIN="$(yarn global dir)/node_modules/.bin"

# Local node modules bin.
export LOCAL_NODE_MODULES_BIN="./node_modules/.bin"

# Local Composer bin.
export LOCAL_COMPOSER_BIN="./vendor/bin"

# Add our own paths to $PATH.
export PATH="${PATH}:${DOTFILES}/bin"
export PATH="${PATH}:${GLOBAL_COMPOSER_BIN}"
export PATH="${PATH}:${LOCAL_COMPOSER_BIN}"
export PATH="${PATH}:${GLOBAL_YARN_BIN}"
export PATH="${PATH}:${LOCAL_NODE_MODULES_BIN}"

# Cask needs to keep all applications together.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Android Emulation.
export ANDROID_HOME="${HOME}/Library/Android/sdk"

# For historical purposes.
export HISTSIZE=10000
export SAVEHIST=8500
