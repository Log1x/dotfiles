[[ -f /usr/local/share/antigen/antigen.zsh ]] && source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh library.
antigen use oh-my-zsh

# oh-my-zsh Bundles
antigen bundle ssh-agent
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
antigen bundle mafredri/zsh-async
antigen bundle jocelynmallon/zshmarks

# Theme
antigen bundle therealklanni/purity

# Apply our settings
antigen apply
