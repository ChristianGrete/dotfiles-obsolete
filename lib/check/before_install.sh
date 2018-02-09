for dotfile in bash_profile bashrc profile zshrc
  do
    mv "$HOME/.$dotfile" "$HOME/.$dotfile.backup"
done
