# Fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Environment
for file in ~/.config/fish/*.fish
    set filename (basename $file)

    if test $filename = 'config.fish'
        continue
    end

    source $file
end

# iTerm 2
if test -e ~/.iterm2_shell_integration.fish
    source ~/.iterm2_shell_integration.fish
end