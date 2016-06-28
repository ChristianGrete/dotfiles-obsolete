# POSIX compliant function to carefully create symbolic links
symlink () {
  if [ -z ${1:+target} ]
    then
      echo 'target: parameter not set or null' >&2

      return 1
  fi

  if [ -z ${2:+link} ]
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
      printf "$2: file already exists" >&2
      printf ', replace? (y/n [n]) '

      set -- "$1" "$2" "$(read answer; echo $anwser | cut -c 1)"

      if [ "$3" != y ] && [ "$3" != Y ]
        then
          echo 'not replaced'

          return
      fi

      mv -i "$2" "$2.backup" 2>/dev/null

      if [ $? -ne 0 ] || [ -e "$2" ]
        then
          echo "$2: backup failed" >&2

          return 1
      fi
  fi

  ln -fs "$1" "$2" >/dev/null 2>&1

  set -- $? "$1" "$2"

  if [ $1 -ne 0 ]
    then
      echo "$3: cannot create symlink"

      return $1
  fi

  echo "$3 -> $2"
}
