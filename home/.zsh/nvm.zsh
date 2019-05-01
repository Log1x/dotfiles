# Use nvm if it is available.
if [ -r ~/.nvm ]; then
  export NVM_DIR="${HOME}/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
fi
