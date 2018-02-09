for dotfile in bash_profile bashrc profile zshrc
  do
    rm -rf "$HOME/.$dotfile"

    mv "$HOME/.$dotfile.backup" "$HOME/.$dotfile"
done
