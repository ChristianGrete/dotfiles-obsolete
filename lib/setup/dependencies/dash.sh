if [ "$(uname)" != Darwin ] || ! available brew
  then
    continue
fi

brew install dash
