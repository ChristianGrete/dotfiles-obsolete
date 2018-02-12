# Executes ".bashrc" file for login shells
if [ -f "$HOME/.bashrc" ]
  then
    . "$HOME/.bashrc"
fi
