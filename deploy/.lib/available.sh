# POSIX compliant function to test whether a program is available
available () {
  if [ -z ${1:+_} ]
    then
      echo 'program: parameter not set or null' >&2
      return 1
  fi

  set -- `a=$(command -v $1 2>&1); echo $a $?` $1

  if [ $# -gt 3 ]
    then
      set -- $2 $3 $4
  fi

  if [ $# -lt 3 ]
    then
      set -- /dev/null $@
  fi

  if [ $2 -ne 0 ] || [ ! -e $1 ]
    then
      if [ $2 -eq 0 ]
        then
          $(available `a='$'$(echo $3); eval $1; eval "echo $a"` >/dev/null 2>&1)

        if [ $? -eq 0 ]
          then
            return 0
        fi
      fi

      echo "$3: program not found" >&2
      return 127
  elif [ -d $1 ] || [ ! -x $1 ]
    then
      echo "$3: file not executable" >&2
      return 126
  fi

  return 0
}
