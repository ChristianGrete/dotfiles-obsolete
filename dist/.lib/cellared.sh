# POSIX compliant function to test whether a program is cellared
cellared () {
  if [ -z ${1:+formula} ]
    then
      echo 'formula: parameter not set or null' >&2

      return 1
  fi

  available brew

  set -- $? "$1"

  [ $1 -ne 0 ] && return $1

  set -- "$2" $(
    brews=$(brew ls --versions "$2" 2>/dev/null)

    printf "$? $brews"
  )

  if [ $# -lt 3 ] || [ $2 -ne 0 ]
    then
      echo "$1: brew not found" >&2

      [ $2 -eq 0 ] && return 1

      return $2
  fi
}
