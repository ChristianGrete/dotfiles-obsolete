# POSIX compliant function to carefully create symbolic links

symlink () {
  if [ -z ${1:+_} ]
    then
      echo 'target: parameter not set or null' >&2
      return 1
  fi

  if [ -z ${2:+_} ]
    then
      echo 'link: parameter not set or null' >&2
      return 1
  fi

  if [ ! -f "$1" ]
    then
      echo "$1: file not found or invalid" >&2
      return 1
  fi

  if [ -e "$2" ]
    then
      printf "$2: file already exists, replace? (y/n [n]) " >&2

      set -- "$1" "$2" "`read a; echo $a | cut -c 1`"

      if [ "$3" != y ] && [ "$3" != Y ]
        then
          echo 'not replaced'
          return 1
      fi

      mv -i "$2" "$2.backup"

      if [ $? -ne 0 ] || [ -e "$2" ]
        then
          return 1
      fi
  fi

  ln -fs "$1" "$2"

  set -- $? "$1" "$2"

  if [ $1 -eq 0 ]
    then
      echo "$3 -> $2"
  fi

  return $1
}
