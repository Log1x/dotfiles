# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="tendency"

# Set custom zsh directory
ZSH_CUSTOM=~/.zsh

# Set plugins to load
plugins=(git ssh-agent wp-cli common-aliases iwhois zsh_reload)

# Export our paths
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='atom'
  export VISUAL='atom --launch --wait'
fi

# Set $DISPLAY for Xming
export DISPLAY=localhost:0.0

# nvm
if [ -r ~/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
fi

# Yarn
if [ -r ~/.yarn/bin ]; then
  export PATH=$HOME/.yarn/bin:$PATH
fi

# rbenv
if [ -r ~/.rbenv/bin ]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

# Aliases
if [ -r ~/.aliases ]; then
  source ~/.aliases
fi
