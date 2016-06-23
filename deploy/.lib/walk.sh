#!/bin/sh

# POSIX compliant function to recursively walk directories
walk () {
  if [ -z ${1:+_} ]
    then
      echo 'path: parameter not set or null' >&2
      return 1
  fi

  for a in `find $1 -name '*' -depth 1`
    do
      if [ -d $a ]
        then
          walk $a
      else
        printf "$a "
      fi
  done

  return $?
}
