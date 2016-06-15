#!/bin/sh

# POSIX compliant function to test whether a program is cellared

cellared () {
  if [ -z ${1:+_} ]
    then
      echo 'formula: parameter not set or null' >&2
      return 1
  fi

  `. $HOME/.lib/available.sh && available $1`

  set -- $? $1

  if [ $1 -ne 0 ]
    then
      return $1
  fi

  `. $HOME/.lib/available.sh && available brew`

  set -- $? $2

  if [ $1 -ne 0 ]
    then
      return $1
  fi

  set $2 `a=$(brew ls --versions $2 2>&1); echo $? $a`

  if [ $# -lt 3 ] || [ $2 -ne 0 ]
    then
      echo "$1: formula not found" >&2

    if [ $2 -eq 0 ]
      then
        return 1
    fi

    return $2
  fi

  return 0
}
