# Optimization of the PATH variable
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

# Support for source command
if ! available source >/dev/null 2>&1
  then
    alias source='.'
fi

# Import of machine specific settings
if [ -d "$HOME/.profiles" ]
  then
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

        if [ "$entry" != "$HOME/.profiles/README.md" ] && [ -r "$entry" ]
          then
            source "$entry"
        fi
    done

    IFS="$ifs" && unset field ifs
fi
