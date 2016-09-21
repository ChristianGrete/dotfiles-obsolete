# Path to my executables
export PATH="${HOME:=}/.bin:$HOME/.sbin:$PATH"

# Path to Homebrew's executables
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

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
