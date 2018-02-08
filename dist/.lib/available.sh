# POSIX compliant function to test whether a command is available
available () {
  if [ -z ${1:+command} ]
    then
      echo 'command: parameter not set or null' >&2

      return 1
  fi

  set -- $(
    location="$(command -v -- $1 2>/dev/null)"

    printf "$location $?"
  ) $1

  [ $# -gt 3 ] && set -- $2 $3 $4 # TODO: Check for 'alias'

  [ $# -lt 3 ] && set -- /dev/null $@

  if [ $2 -ne 0 ] || [ ! -e $1 ]
    then
      if [ $2 -eq 0 ]
        then
          $(
            available $(
              key='$'$(echo $3)

              eval $1

              eval 'printf "$key"'
            ) 2>/dev/null
          )

          [ $? -eq 0 ] && return
      fi

      echo "$3: command not found" >&2

      return 127
  elif [ -d $1 ] || [ ! -x $1 ]
    then
      echo "$3: command not executable" >&2

      return 126
  fi
}
