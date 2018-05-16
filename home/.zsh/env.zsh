# Export our paths
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Use Node@8 until Node@10 is stable
export PATH=/usr/local/opt/node@8/bin:$PATH
