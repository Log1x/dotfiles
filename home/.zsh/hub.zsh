# Use hub if it is available.
[ -x "$(command -v hub)" ]; then
  eval "$(hub alias -s)"
fi
