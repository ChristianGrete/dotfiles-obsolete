if [ -z ${PWD:+PWD} ]
  then
    export PWD="$(pwd)"
fi

export PROJECT="$PWD"
export DOTFILES="$PROJECT/deploy"
export DOTFILES_LIBRARY="$DOTFILES/.lib"
export SCRIPTS="$PROJECT/script"
