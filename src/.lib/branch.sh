# POSIX compliant function to get the current Git branch name
branch () {
  set -- $(
    ref=$(command git symbolic-ref --quiet HEAD 2>/dev/null)

    echo $? $ref
  )

  if [ $1 -ne 0 ]
    then
      [ $1 -eq 128 ] && return $1

      set -- $(
        ref=$(command git rev-parse --short HEAD 2>/dev/null)

        echo $? $ref
      )

      [ $1 -ne 0 ] && return $1
  fi

  echo ${2#refs/heads/}
}
