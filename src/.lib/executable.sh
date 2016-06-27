# POSIX compliant function to test whether a command is executable
executable () {
  if [ -z ${1:+.} ]
    then
      echo 'command: parameter not set or null' >&2
      return 1
  fi

  "$1" --version >/dev/null 2>&1

  if [ $? -eq 126 ] || [ $? -eq 127 ]
    then
      echo "$1: not executable" >&2
      return 126
  fi

  return 0
}
