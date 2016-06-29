# POSIX compliant function to test whether a command is executable
executable () {
  if [ -z ${1:+command} ]
    then
      echo 'command: parameter not set or null' >&2

      return 1
  fi

  command "$1" --version >/dev/null 2>&1

  set -- $? "$1"

  if [ $1 -eq 126 ] || [ $1 -eq 127 ]
    then
      echo "$2: not executable" >&2

      return 126
  fi
}
