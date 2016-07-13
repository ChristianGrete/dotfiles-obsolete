echo 'Updating Homebrew...'
echo

brew update >/dev/null 2>&1

echo 'Upgrading outdated brews...'
echo

brew upgrade >/dev/null 2>&1

echo 'Installing dependencies...'
echo

brew install git node ruby zsh

if [ $? -ne 0 ]
  then
    echo '-- Error! Unable to install dependencies.' >&2
    echo
    exit 1
fi

echo

brew cleanup >/dev/null 2>&1

printf 'Locating Oh-My-Zsh installation... '

if [ -d "$HOME/.oh-my-zsh" ]
  then
    echo; echo
    echo 'Updating Oh-My-Zsh repository...'
    echo

    cd "$HOME/.oh-my-zsh"

    git pull -rv --stat origin master

    if [ $? -ne 0 ]
      then
        echo '-- Error! Unable to update Oh-My-Zsh.' >&2
        echo
        exit 1
    fi

    echo

    cd "$PROJECT"
else
  printf 'Not found!'
  echo; echo
  echo 'Installing Oh-My-Zsh...'
  echo

  git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"

  if [ $? -ne 0 ]
    then
      echo '-- Error! Unable to install Oh-My-Zsh.' >&2
      echo
      exit 1
  fi
fi

echo 'Updating dotfiles repository...'
echo

git checkout master && git pull origin master

if [ $? -ne 0 ]
  then
    echo '-- Error! Unable to update dotfiles.' >&2
    echo
    exit 1
fi

echo
echo 'Updating npm...'
echo

ni -g npm && npm up -g

if [ $? -ne 0 ]
  then
    echo '-- Error! Unable to update npm.' >&2
    echo
    exit 1
fi
