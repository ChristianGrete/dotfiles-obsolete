if [ -z ${DOTFILES_VERSION:+DOTFILES_VERSION} ]
  then
    echo 'Error: Undefined dotfiles version.'

    exit 1
fi

echo "Successfully installed dotfiles v$DOTFILES_VERSION."
