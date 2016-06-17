#!/bin/sh

# Path to my executables
export PATH=$HOME/.bin:$HOME/.sbin:$PATH

# Path to Homebrew’s executables
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Support for source command
if ! available source >/dev/null 2>&1
  then
    alias source='.'
fi

# Shortcut to list all Homebrew packages and their versions
alias brews='brew ls --versions'

# Shortcut to cleanly update Homebrew formulae and packages
alias rebrew='brew update; brew upgrade --cleanup'

# Shortcut to cleanly invoke `npm install` without progress bar
alias ni='npm cache -s clean; npm i --loglevel http --no-progress'

# Shortcut to cleanly install and save npm dev-dependencies
alias nid='ni -D'

# Shortcut to cleanly install and save npm dependencies
alias nis='ni -S'

# Shortcut to quietly invoke `npm run`
alias nr='npm run -q'

# Use `npm run bower` as if Bower was installed globally
if ! available bower >/dev/null 2>&1
  then
    alias bower='nr bower --'
fi

# Use `npm run grunt` as if Grunt was installed globally
if ! available grunt >/dev/null 2>&1
  then
    alias grunt='nr grunt --'
fi

# Use `npm run gulp` as if gulp was installed globally
if ! available gulp >/dev/null 2>&1
  then
    alias gulp='nr gulp --'
fi

# Use `npm run typings` as if Typings was installed globally
if ! available typings >/dev/null 2>&1
  then
    alias typings='nr typings --'
fi
