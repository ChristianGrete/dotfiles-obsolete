if [ "$(uname)" != Darwin ]
  then
    continue
fi

if ! available brew
  then
    printf 'Installing Homebrew ... '

    ruby -e $(curl -fLSs https://raw.githubusercontent.com/Homebrew/install/master/install)

    if [ $? -eq 0 ]
      then
        echo 'success.'
    else
      echo 'failed.'

      echo; echo 'Error: Unable to install Homebrew.' >&2

      exit 1
    fi
fi

printf 'Updating Homebrew ... '

brew update >/dev/null 2>&1

if [ $? -eq 0 ]
  then
    echo 'success.'
else
  echo 'failed.'

  echo; echo 'Warning: Unable to update Homebrew.' >&2
fi
