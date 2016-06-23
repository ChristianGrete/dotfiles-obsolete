echo 'Verifying dependencies...'
echo

for dependency in curl expr find ruby
  do
    if ! available $dependency
      then
        echo '-- Error! Dependency verification failed.' >&2
        echo
        exit 1
    fi
done

unset dependency

if ! available brew
  then
    echo 'Installing Homebrew...'
    echo

    ruby -e `curl -fLSs https://raw.githubusercontent.com/Homebrew/install/master/install`

    if [ $? -ne 0 ]
      then
        echo '-- Error! Unable to install Homebrew.' >&2
        echo
        exit 1
    fi
fi
