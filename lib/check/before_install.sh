echo '... Preparing installation:
'

for dotfile in bash_profile bashrc profile zshrc
  do
    printf "Backupping ~/.$dotfile ... "

    mv "$HOME/.$dotfile" "$HOME/.$dotfile.backup" >/dev/null 2>&1

    if [ $? -eq 0 ]
      then
        echo 'success.'
    else
      echo 'failed.'

      echo; echo "Error: Unable to backup ~/.$dotfile." >&2

      exit 1
    fi
done
