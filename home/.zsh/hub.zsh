# Use hub if it is available.
if [ -x "$(command -v hub)" ]; then
  eval "$(hub alias -s)"
fi
