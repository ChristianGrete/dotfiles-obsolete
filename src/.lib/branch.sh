# POSIX compliant function to get the current Git branch name
branch () {
  set -- "$(command git symbolic-ref --quiet HEAD 2>/dev/null)" $?

  if [ $2 -ne 0 ]
    then
      [ $2 -eq 128 ] && return

      set -- "$(command git rev-parse --short HEAD 2>/dev/null)" $?

      [ $2 -ne 0 ] && return $2
  fi

  echo "${1#refs/heads/}"
}
