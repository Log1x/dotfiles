# Use rbenv if it is available.
if [ -r ~/.rbenv/bin ]; then
  export PATH="${HOME}/.rbenv/bin:${PATH}"
  eval "$(rbenv init -)"
fi
