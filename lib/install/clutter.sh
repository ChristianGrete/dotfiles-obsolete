printf 'Locating Oh My Zsh ... '

if [ -d "${ZSH:=$HOME/.oh-my-zsh}" ]
  then
    cd "$ZSH"

    echo 'success.'

    echo 'Updating...'

    git pull -vr --stat origin master

    cd "$DOTFILES"
else
  echo 'not found.'

  echo 'Installing...'

  git clone git://github.com/robbyrussell/oh-my-zsh.git "$ZSH"

  if [ $? -ne 0 ]
    then
      echo; echo 'Error: Unable to install Oh My Zsh.' >&2
      exit 1
  fi
fi
