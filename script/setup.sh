if [ -z ${PWD:+PWD} ]
  then
    export PWD="$(pwd)"
fi

export PROJECT="$PWD"
export DOTFILES_ARTIFACT="$PROJECT/dist"
export DOTFILES_LIBRARY="$DOTFILES_ARTIFACT/.lib"
export SCRIPTS="$PROJECT/script"
