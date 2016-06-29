# POSIX compliant function to run executable files
run () (
  file="$(pwd)"

  if [ -d "$file/bin" ] && [ -r "$file/bin" ] && [ -x "$file/bin/$1" ]
    then
      file="$file/bin/$1"
  elif [ -d "$file/.bin" ] && [ -r "$file/.bin" ] && [ -x "$file/.bin/$1" ]
    then
      file="$file/.bin/$1"
  elif [ -x "$file/$1" ]
    then
      file="$file/$1"
  else
    echo "$1: file not found or not executable" >&2

    return 127
  fi

  shift 1

  command $file $@
)
