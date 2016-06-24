start=`expr ${#DOTFILES} + 2`

for target in `walk $DOTFILES`
  do
    base=`echo $target | cut -c $start-${#target} | grep -vf $PROJECT/.dotfilesignore`

    if [ -z "`echo "$base" | sed 's/[[:blank:]]//g'`" ]
      then
        unset base
        continue
    fi

    dir=`dirname "$base"`
    link=$HOME/$base

    unset base

    if [ "$dir" != . ]
      then
        dir=$HOME/$dir

        if [ ! -e "$dir" ]
          then
            mkdir -p "$dir"
        fi
    fi

    unset dir

    symlink $target "$link"

    unset link
done

unset start
unset target
