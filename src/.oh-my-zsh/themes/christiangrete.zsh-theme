local ret_status="%(?:%{$fg[cyan]%}:%{$fg[magenta]%})"

PROMPT='%{$fg[yellow]%}%n%{$reset_color%} %c $(git_prompt_info) %{$fg[cyan]%}%(!.#.$)%{$reset_color%} '
RPROMPT='${ret_status}%*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}*%{$reset_color%}"
