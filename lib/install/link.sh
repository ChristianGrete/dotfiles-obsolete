printf 'Creating symbolic links ... '

start=$(expr ${#DOTFILES_SOURCES} + 2)

if [ $? -ne 0 ]
  then
    echo 'failed!'

    echo; echo 'Error: Unable to determine start index.' >&2

    exit 1
fi

sources="$(walk "$DOTFILES_SOURCES")"

if [ $? -ne 0 ]
  then
    echo 'failed!'

    echo; echo 'Error: Unable to list source files.' >&2

    exit 1
fi

echo 'processing...'

for source in $sources
  do
    filename="$(
      echo $source | cut -c $start-${#source} | grep -vf "$DOTFILES/.dotfilesignore"
    )"

    [ -z "$(echo "$filename" | sed 's/[[:space:]]//g')" ] && continue

    dirname=$(dirname "$filename")
    target="$HOME/$filename"

    if [ "$dirname" != . ]
      then
        dirname="$HOME/$dirname"

        [ ! -e "$dirname" ] && mkdir -p "$dirname"
    fi

    symlink "$source" "$target"
done

unset dirname filename source sources start target
