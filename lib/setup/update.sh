if ! available git
  then
    echo "$(cat <<EOF
Unable to update repository. Please make sure that Git is correctly installed.
EOF)" >&2

    exit 1
fi

[ "$(branch)" != master ] && command git checkout master

command git pull origin master
