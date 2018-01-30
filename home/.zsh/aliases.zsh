# SSH
alias centos='ssh root@server.hostleaf.net -p 2222'
alias xen='ssh root@158.69.27.186 -p 22'
alias pbx='ssh root@voice.log1x.com -p 22'
alias vpn='ssh root@vpn.log1x.com -p 22'
alias tomato='ssh root@192.168.1.1'

# SHORTCUTS
alias home='cd ~'
alias storage='cd ~/Storage'
alias desktop='cd ~/Desktop'
alias dev='cd ~/Development'
alias sites='cd ~/Development/web/sites'
alias work='cd ~/Development/work'
alias forks='cd ~/Development/git/forks'

# APPLICATIONS
alias download='aria2c -m 0'

# MISCELLANEOUS
alias q='exit'
alias cls='clear'

# DIRECTORIES
alias la="ls -laF ${colorflag}"

# GREP
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# DATETIME
alias week='date +%V'
alias timer='echo "Timer started. Stop with Cmd-D." && date && time cat && date'

# PATH
alias path='echo -e ${PATH//:/\\n}'

# NETWORK
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# VALET
alias v='valet link && valet park && valet secure'
alias uv='valet unlink && valet forget && valet unsecure'

# GIT
alias ga='git add'
alias gm='git commit -m'
alias gp='git push'
alias gpu='git pull'

# ZSHMARKS
alias g='jump'
alias s='bookmark'
alias d='deletemark'
alias p='showmarks'
alias l='showmarks'

# MAC
alias cask='brew cask'
