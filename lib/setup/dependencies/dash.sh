if [ "$(uname)" != Darwin ] || ! available brew
  then
    continue
fi

! brew ls --versions dash >/dev/null 2>&1 && brew install dash
