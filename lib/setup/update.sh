if ! available git
  then
    echo "$(cat <<EOF
Unable to update repository. Please make sure that Git is correctly installed.
EOF)" >&2

    exit 1
fi

if [ "$(branch)" != master ]
  then
    git remote update

    git branch -l

    echo '----'

    git branch -r

    command git fetch --all && command git checkout master
fi

command git pull origin master
