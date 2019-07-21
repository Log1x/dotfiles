# Shortcuts
alias home='cd ~'
alias storage='cd ~/Storage'
alias desktop='cd ~/Desktop'
alias dev='cd ~/Development'
alias sites='cd ~/Development/web/'
alias master='cd ~/Development/git/master'
alias forks='cd ~/Development/git/forks'

# Replacements
if type -q exa
    alias ls='exa -a'
end

if type -q bat
    alias cat='bat'
end

if type -q vtop
    alias top='vtop'
end

if type -q fkill
    alias kill='fkill'
end

if type -q fd
    alias find='fd'
end

# Brew
alias cask='brew cask'
alias service='brew services'

# Valet
alias v='valet link; and valet park; and valet secure'
alias uv='valet unlink; and valet forget; and valet unsecure'

# Laravel
alias art='php artisan'
alias artisan='php artisan'

# Roots
alias acorn='wp acorn'

# Git
alias g='git'
alias ga='git add'
alias gm='git commit -m'
alias gp='git push'
alias gpu='git pull'
