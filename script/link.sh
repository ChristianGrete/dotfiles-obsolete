echo 'Creating symbolic links...'
echo

start=$(expr ${#DOTFILES} + 2)

if [ $? -ne 0 ]
  then
    echo '-- Error! Unable to determine start index.' >&2
    echo
    exit 1
fi

targets="$(walk "$DOTFILES")"

if [ $? -ne 0 ]
  then
    echo '-- Error! Listing dotfiles targets failed.' >&2
    echo
    exit 1
fi

for target in $targets
  do
    base=$(echo $target | cut -c $start-${#target} | grep -vf "$PROJECT/.dotfilesignore")

    if [ -z "$(echo "$base" | sed 's/[[:space:]]//g')" ]
      then
        unset base
        continue
    fi

    dir=$(dirname "$base")
    link="$HOME/$base"

    unset base

    if [ "$dir" != . ]
      then
        dir="$HOME/$dir"

        if [ ! -e "$dir" ]
          then
            mkdir -p "$dir"
        fi
    fi

    unset dir

    symlink $target "$link"

    if [ $? -ne 0 ]
      then
        unset link
        continue
    fi

    unset link
done

unset start target targets

echo
