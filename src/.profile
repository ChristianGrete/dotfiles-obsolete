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

# FIXME ----
# The stuff below needs to be outsourced into their own profile packages!
# ----

# TODO: Move to `dotfiles-textmate-profile`
# Try to set `mate` as default editor
if available mate >/dev/null 2>&1
  then
    export EDITOR='/usr/local/bin/mate -w'
fi

# TODO: Move to `dotfiles-npm-profile`
# Shortcut for `npm` command
alias n='command npm'

# TODO: Move to `dotfiles-npm-profile`
# Shortcut to cleanly invoke `npm install` without progress bar
alias ni='n cache -s clean; n i --loglevel http --no-progress'

# TODO: Move to `dotfiles-npm-profile`
# Shortcut to cleanly install and save npm dev-dependencies
alias nid='ni -D'

# TODO: Move to `dotfiles-npm-profile`
# Shortcut to cleanly install and save npm dependencies
alias nis='ni -S'

# TODO: Move to `dotfiles-npm-profile`
# Shortcut to quietly invoke `npm run`
alias nr='n run -q'

# TODO: Move to `dotfiles-npm-profile`
# Shortcut to invoke `npm uninstall`
alias nu='n r'

# TODO: Move to `dotfiles-npm-profile`
# Shortcut to cleanly uninstall npm dev-dependencies
alias nud="nu -D"

# TODO: Move to `dotfiles-npm-profile`
# Shortcut to cleanly uninstall npm dependencies
alias nud="nu -S"

# TODO: Move to `dotfiles-bower-profile`
# Use local `bower` as if Bower was installed globally
if ! available bower >/dev/null 2>&1
  then
    alias bower='command ./node_modules/bower/bin/bower'
fi

# TODO: Move to `dotfiles-grunt-profile`
# Use local `grunt` as if Grunt was installed globally
if ! available grunt >/dev/null 2>&1
  then
    alias grunt='command ./node_modules/grunt-cli/bin/grunt'
fi

# TODO: Move to `dotfiles-gulp-profile`
# Use local `gulp` as if gulp was installed globally
if ! available gulp >/dev/null 2>&1
  then
    alias gulp='command ./node_modules/gulp-cli/bin/gulp.js'
fi

# TODO: Move to `dotfiles-typings-profile`
# Use local `typings` as if Typings was installed globally
if ! available typings >/dev/null 2>&1
  then
    alias typings='command ./node_modules/typings/dist/bin.js'
fi
