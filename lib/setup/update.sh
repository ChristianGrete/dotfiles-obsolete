if ! available git
  then
    echo "$(cat <<EOF
Unable to update repository. Please make sure that Git is correctly installed.
EOF)" >&2

    exit 1
fi

for branch in develop master
  do
    command git pull origin "$branch"

    echo
done

unset branch
