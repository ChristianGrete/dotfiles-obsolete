# POSIX compliant function to check whether an executable exists
exists () {
  url=`command -v $1 2>&1`
  exit_status=$?

  if [ $exit_status -eq 0 ] && [ -x $url ]
    then
      return 0
  else
    echo "$1: command not found" >&2
    return $exit_status
  fi
}

# Path to my executables
export PATH=$HOME/.bin:$HOME/.sbin:$PATH

# Path to Homebrew’s executables
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
