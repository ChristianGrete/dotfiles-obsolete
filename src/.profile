# Optimization of PATH variable
ifs="$IFS" && IFS=':'

for directory in $(printf "$PATH")
  do
    if [ "${directory#*'/usr/local/'}" = "$directory" ]
      then
        directories="$directories:$directory"
    fi
done

PATH="${directories#?}"

IFS="$ifs" && unset directories directory ifs

# Path to local system executables
[ -d '/usr/local/sbin' ] && PATH="/usr/local/sbin:$PATH"

# Path to local executables
[ -d '/usr/local/bin' ] && PATH="/usr/local/bin:$PATH"

# Path to my system executables
[ -d "${HOME:=}/.sbin" ] && PATH="$HOME/.sbin:$PATH"

# Path to my executables
export PATH="$HOME/.bin:$PATH"

# Import of base aliases
[ -r "$HOME/.aliases" ] && . "$HOME/.aliases"

# Import of machine specific settings
if [ -d "$HOME/.profiles" ]
  then
    [ -r "$HOME/.profiles/dotfiles.sh" ] && . "$HOME/.profiles/dotfiles.sh"

    ifs="$IFS" && IFS='
'

    for field in $(list "$HOME/.profiles")
      do
        if [ $(expr "$field" : '^\/') -ne 0 ]
          then
            entry="$field"
          else
            entry="$entry
$field"
        fi

        [ "$entry" = "$HOME/.profiles/dotfiles.sh" ] && continue

        [ "$entry" = "$HOME/.profiles/README.md" ] && continue

        [ ! -r "$entry" ] && continue

        . "$entry"
    done

    IFS="$ifs" && unset entry field ifs
fi
