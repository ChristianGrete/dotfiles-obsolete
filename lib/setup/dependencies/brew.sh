if [ "$(uname)" != Darwin ]
  then
    continue
fi

if ! available brew
  then
    ruby -e $(curl -fLSs https://raw.githubusercontent.com/Homebrew/install/master/install)

    if [ $? -ne 0 ]
      then
        echo "$(cat <<EOF
Homebrew installation failed.
EOF)" >&2

        exit 1
    fi
fi

brew update >/dev/null 2>&1
