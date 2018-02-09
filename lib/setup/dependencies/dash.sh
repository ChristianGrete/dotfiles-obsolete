if [ "$(uname)" != Darwin ] || ! available brew
  then
    continue
fi

if ! brew ls --versions dash >/dev/null 2>&1
  then
    printf 'Installing DASH ... '

    brew install dash >/dev/null 2>&1

    if [ $? -eq 0 ]
      then
        echo 'success.'
    else
      echo 'failed.'

      echo; echo 'Error: Unable to install DASH.' >&2

      exit 1
    fi
fi
