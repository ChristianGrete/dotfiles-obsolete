[ -f "$HOME/.profile" ] && [ -r "$HOME/.profile" ] && . "$HOME/.profile"

if [ -d "$HOME/.oh-my-zsh" ] && [ -r "$HOME/.oh-my-zsh" ]
  then
    # Path to Oh-My-Zsh's repository
    export ZSH="$HOME/.oh-my-zsh"

    CASE_SENSITIVE=true
    COMPLETION_WAITING_DOTS=true
    ZSH_THEME=christiangrete

    plugins=(git)

    [ -r "$ZSH/oh-my-zsh.sh" ] && . "$ZSH/oh-my-zsh.sh"
fi
