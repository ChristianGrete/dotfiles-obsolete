# POSIX compliant function to test whether a string contains a sequence

contains () {
  if [ -z ${1:+_} ]
    then
      echo 'string: parameter not set or null' >&2
      return 1
  fi

  if [ -z ${2:+_} ]
    then
      echo 'sequence: parameter not set or null' >&2
      return 1
  fi

  if [ "${1#*$2}" = "$1" ]
    then
      return 1
  fi

  return 0
}
