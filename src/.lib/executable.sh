# POSIX compliant function to test whether a command is executable

executable () {
  `. $HOME/.lib/exists.sh && exists $1`

  set -- $? $1

  if [ $1 -ne 0 ]
    then
      return $1
  fi

  $2 --version >/dev/null 2>&1

  if [ $? -eq 126 ]
    then
      echo "$2: not executable" >&2
      return 126
  fi

  return 0
}
