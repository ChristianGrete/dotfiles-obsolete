#!/bin/sh

# Path to my executables
export PATH=$HOME/.bin:$HOME/.sbin:$PATH

# Path to Homebrew’s executables
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Shortcut to cleanly invoke `npm install` without progress bar
alias ni='npm cache -s clean && npm i --loglevel http --no-progress'

# Shortcut to quietly invoke `npm run`
alias nr='npm run -q'

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
