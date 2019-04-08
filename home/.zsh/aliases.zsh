# SSH
alias tomato='ssh root@192.168.1.1'

# Shortcuts
alias home='cd ~'
alias storage='cd ~/Storage'
alias desktop='cd ~/Desktop'
alias dev='cd ~/Development'
alias sites='cd ~/Development/web/'
alias master='cd ~/Development/git/master'
alias forks='cd ~/Development/git/forks'

# Apps
alias download='aria2c -m 0'
alias firefox='/Applications/Firefox.app/Contents/MacOS/firefox'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -laF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Alias for Color LS <https://github.com/athityakumar/colorls>
alias lc='colorls'
alias lca='colorls -la'

# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo'ed
alias sudo='sudo '

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# IP addresses
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; sudo killall mDNSResponderHelper'

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Valet
alias v='valet link && valet park && valet secure'
alias uv='valet unlink && valet forget && valet unsecure'

# Git
alias ga='git add'
alias gm='git commit -m'
alias gp='git push'
alias gpu='git pull'

# zshmarks
alias g='jump'
alias s='bookmark'
alias d='deletemark'
alias lm='showmarks'

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine.
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

# Miscellaneous
alias cask='brew cask'
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; cask upgrade; brew cleanup; cask cleanup;'
alias q='exit'
alias cls='clear'
