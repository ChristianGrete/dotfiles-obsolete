# POSIX compliant function to test whether a command exists
exists () {
  if [ -z ${1:+.} ]
    then
      echo 'command: parameter not set or null' >&2
      return 1
  fi

  "$1" --version >/dev/null 2>&1

  if [ $? -eq 127 ]
    then
      echo "$1: not found" >&2
      return 127
  fi

  return 0
}
