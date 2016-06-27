# POSIX compliant function to list the contents of a directory
list () {
  if [ ! -d "${1:=$(pwd)}" ] || [ ! -r "$1" ]
      then
        echo "$1: directory not found or not readable" >&2
        return 1
  fi

  if [ $(expr "$1" : '^\/') -eq 0 ]
    then
      set -- "$(pwd)/$1"
  fi

  loops=0

  for entry in $(cd "$1" && find . -name '*' -depth 1)
    do
      loops=$(expr $loops + 1)

      if [ $(expr $entry : '^\.\/') -eq 0 ]
        then
          printf " $entry"
        else
          if [ $loops -ne 1 ]
            then
              echo
          fi

          printf "$1/$(echo $entry | sed "s/^\.\///g")"
      fi
  done

  unset entry loops

  echo

  return 0
}
