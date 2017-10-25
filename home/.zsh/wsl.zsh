# Set DISPLAY for Xming
export DISPLAY=localhost:0.0

# Enable Vagrant to access Windows outside of WSL
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

# Use Firefox with wp-cli-login-command
export WP_CLI_LOGIN_LAUNCH_WITH="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"

# WSL-specific Aliases
alias netsh='netsh.exe'
alias choco='choco.exe'
alias firefox='firefox.exe'
alias cscript='cscript.exe'
alias ipconfig='ipconfig.exe'
alias flushdns='ipconfig.exe /flushdns'
alias opendir='cmd.exe /c start .'
