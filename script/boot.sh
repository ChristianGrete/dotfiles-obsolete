echo 'Locating your home directory...'
echo

if [ -z ${HOME:+HOME} ]
  then
    printf 'Home directory not set, please enter your username: '
    read HOME && HOME="/Users/$HOME"
    echo

    if [ ! -d "$HOME" ]
      then
        echo 'Error! Unable to locate your home directory --' >&2
        echo "$HOME: directory not found" >&2
        echo
        exit 1
    fi

    echo "Success! Setting $HOME as your home directory..."
    echo

    export HOME="$HOME"
fi
