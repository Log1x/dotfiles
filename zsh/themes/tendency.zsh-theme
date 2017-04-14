# Tendency

# Color shortcuts
RED=$fg[red]
GREEN=$fg[green]
RESET=$reset_color

# Return Code
local returnCode="%(?..%{$RESET%}%? %{$RED%}← %{$RESET%})"

# Git Status
function gitStatusF() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    user=$(git remote -v | grep "fetch" | cut -d'/' -f 4) || return
    repo=$(git remote -v | grep "fetch" | cut -d'/' -f 5 | cut -d'.' -f 1) || return
    echo "%{$RED%}(%{$RESET%}%B${ref#refs/heads/}@${user}/${repo}%b%{$RED%})%{$RESET%} "
}

# Prompt
PROMPT='%{$RED%}[%{$RESET%}%B%2~%b%{$RED%}]%{$RESET%} $(gitStatusF)%{$RED%}→ %{$RESET%}'
RPS1="${returnCode}"
