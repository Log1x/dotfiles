[[ -f /usr/share/zsh-antigen/antigen.zsh ]] && source /usr/share/zsh-antigen/antigen.zsh

# Load the oh-my-zsh library.
antigen use oh-my-zsh

# oh-my-zsh Bundles
antigen bundle ssh-agent
antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found

# Theme
antigen theme carloscuesta/materialshell materialshell

# Apply our settings
antigen apply
