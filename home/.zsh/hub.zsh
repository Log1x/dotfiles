# Use hub if it is available.
if [ -r /usr/local/bin/hub ]; then
  eval "$(hub alias -s)"
fi
