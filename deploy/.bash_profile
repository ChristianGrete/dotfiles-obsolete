# Executes “.bashrc” file on login shells
if [ -f $HOME/.bashrc ]
  then
    source $HOME/.bashrc
fi
