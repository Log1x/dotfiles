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

# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo'ed
alias sudo='sudo '

# Print each PATH entry on a separate line
alias path="echo -e ($PATH//:/\\n)"

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Valet
alias v='valet link && valet park && valet secure'
alias uv='valet unlink && valet forget && valet unsecure'

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
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Miscellaneous
alias cask='brew cask'
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; cask upgrade; brew cleanup; cask cleanup;'
