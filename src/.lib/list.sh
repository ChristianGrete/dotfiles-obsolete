# POSIX compliant function to list the contents of a directory
list () (
  if [ ! -d "${1:=$(pwd)}" ] || [ ! -r "$1" ]
      then
        echo "$1: directory not found or not readable" >&2
        return 1
  fi

  if [ $(expr "$1" : '^\/') -eq 0 ]
    then
      set -- "$(pwd)/$1"
  fi

  if [ $(echo "$1" | cut -c ${#1}) = '/' ]
    then
      set -- "${1%?}"
  fi

  IFS='
'

  for entry in $(cd "$1" && find . -name '*' -depth 1)
    do
      if [ $(expr "$entry" : '^\.\/') -eq 0 ]
        then
          echo "$entry"
        else
          echo "$1/$(printf "$entry" | sed "s/^\.\///g")"
      fi
  done

  return 0
)
