# POSIX compliant function to check whether an executable exists or not
executable () {
  url=`command -v $1 2>&1`
  exit_status=$?

  if [ $exit_status -eq 0 ] && [ -x $url ]
    then
      return 0
  else
    return $exit_status
  fi
}

# Path to my binaries
export PATH=$HOME/.bin:$HOME/.sbin:$PATH

# Path to Homebrew’s binaries
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
