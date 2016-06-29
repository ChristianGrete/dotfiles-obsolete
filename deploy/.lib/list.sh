# POSIX compliant function to list the contents of a directory
list () (
  if [ ! -d "${1:=$(pwd)}" ] || [ ! -r "$1" ]
      then
        echo "$1: directory not found or not readable" >&2

        return 1
  fi

  [ $(expr "$1" : '^\/') -eq 0 ] && set -- "$(pwd)/$1"

  [ "$(echo "$1" | cut -c ${#1})" = / ] && set -- "${1%?}"

  IFS='
'

  for field in $(cd "$1" && find . -name '*' -depth 1 2>/dev/null)
    do
      if [ $(expr "$field" : '^\.\/') -eq 0 ]
        then
          echo "$field"
        else
          echo "$1/$(printf "$field" | sed 's/^\.\///')"
      fi
  done
)
