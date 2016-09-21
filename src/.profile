# Path to my executables
export PATH="${HOME:=}/.bin:$HOME/.sbin:$PATH"

# Path to Homebrew's executables
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Support for source command
if ! available source >/dev/null 2>&1
  then
    alias source='.'
fi

# Shortcut for `brew` command
alias b='command brew'

# Shortcut to install a specific Homebrew package
alias bi='b install'

# Shortcut to list all installed Homebrew packages
alias bl='b ls'

# Shortcut to uninstall a specific Homebrew package
alias bu='b rm'

# Shortcut to list all installed Homebrew packages and their versions
alias brews='bl --versions'

# Shortcut to cleanly update Homebrew formulae and packages
alias rebrew='b update; b upgrade --cleanup'

# Alias to uninstall a specific Homebrew package
alias unbrew='bu'

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
