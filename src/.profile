# Path to my executables
export PATH="$HOME/.bin:$HOME/.sbin:$PATH"

# Path to Homebrew's executables
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Try to set `mate` as default editor
if available mate >/dev/null 2>&1
  then
    export EDITOR='/usr/local/bin/mate -w'
fi

# Use `npm run bower` as if Bower was installed globally
if ! available bower >/dev/null 2>&1
  then
    alias bower='node_modules/bower/bin/bower'
fi

# Shortcut to list all Homebrew packages and their versions
alias brews='brew ls --versions'

# Shortcut to run project based `build` scripts
alias build='run build'

# Shortcut to run project based `clean` scripts
alias clean='run clean'

# Shortcut to run project based `deploy` scripts
alias deploy='run deploy'

# Use `npm run grunt` as if Grunt was installed globally
if ! available grunt >/dev/null 2>&1
  then
    alias grunt='node_modules/grunt-cli/bin/grunt'
fi

# Use `npm run gulp` as if gulp was installed globally
if ! available gulp >/dev/null 2>&1
  then
    alias gulp='node_modules/gulp-cli/bin/gulp.js'
fi

# Shortcut to cleanly invoke `npm install` without progress bar
alias ni='npm cache -s clean; npm i --loglevel http --no-progress'

# Shortcut to cleanly install and save npm dev-dependencies
alias nid='ni -D'

# Shortcut to cleanly install and save npm dependencies
alias nis='ni -S'

# Shortcut to quietly invoke `npm run`
alias nr='npm run -q'

# Shortcut to cleanly update Homebrew formulae and packages
alias rebrew='brew update; brew upgrade --cleanup'

# Shortcut to run project based `release` scripts
alias release='run release'

# Support for source command
if ! available source >/dev/null 2>&1
  then
    alias source='.'
fi

# Use `npm run typings` as if Typings was installed globally
if ! available typings >/dev/null 2>&1
  then
    alias typings='node_modules/typings/dist/bin.js'
fi

# Shortcut to uninstall a specific Homebrew package
alias unbrew='brew rm'

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
