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

# Utilities
alias grep='grep --color=auto'
alias g='git'
alias sudo='sudo'

# Print each PATH entry on a separate line
alias path="echo -e ($PATH//:/\\n)"

# Networking
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias ifactive="ifconfig | pcregrep -M -o='^[^\t:]+:([^\n]|\n\t)*status: active'"
alias flushdns='sudo dscacheutil -flushcache; and sudo killall -HUP mDNSResponder; and sudo killall mDNSResponderHelper'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name='*.DS_Store' -ls -delete"

# Valet
alias v='valet link; and valet park; and valet secure'
alias uv='valet unlink; and valet forget; and valet unsecure'

# Laravel
alias art='php artisan'
alias artisan='php artisan'

# WordPress
alias sage="cd web/app/themes/(wp option get template)"

# Git
alias ga='git add'
alias gm='git commit -m'
alias gp='git push'
alias gpu='git pull'

# Empty the Trash on all mounted volumes and clear system logs
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; and sudo rm -rfv ~/.Trash; and sudo rm -rfv /private/var/log/asl/*.asl; and sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV*='delete from LSQuarantineEvent'"

# Miscellaneous
alias cask='brew cask'
alias update='sudo softwareupdate -i -a; and brew update; and brew upgrade; and cask upgrade; and brew cleanup; and cask cleanup;'
