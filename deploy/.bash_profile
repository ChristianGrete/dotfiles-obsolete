# Executes “.bashrc” file for login shells
if [ -f $HOME/.bashrc ]
  then
    source $HOME/.bashrc
fi
