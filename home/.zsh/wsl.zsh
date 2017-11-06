# Workaround for issue: https://github.com/Microsoft/WSL/issues/2448
if ! mount | grep -q "D: on /mnt/d type drvfs (rw,noatime,fallback=1)"; then
  echo 'Remount of /mnt/d required due to #2448 bug...'
  pushd ~ > /dev/null
  sudo umount /mnt/d
  sudo mount -t drvfs -o noatime,fallback=1 D: /mnt/d
  popd > /dev/null
fi

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
