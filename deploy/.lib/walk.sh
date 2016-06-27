# POSIX compliant function to recursively walk directories
walk () (
  if [ ! -d "${1:=$(pwd)}" ] || [ ! -r "$1" ]
      then
        echo "$1: directory not found or not readable" >&2
        return 1
  fi

  IFS='
'

  for field in $(list "$1")
    do
      if [ $(expr "$field" : '^\/') -ne 0 ]
        then
          entry="$field"
        else
          entry="$entry
$field"
      fi

      if [ -e "$entry" ]
        then
          if [ -d "$entry" ] && [ -r "$entry" ]
            then
              walk "$entry"
            else
              echo "$entry"
          fi
      fi
  done

  return $?
)
