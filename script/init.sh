echo 'Initializing...'
echo

REAL_HOME=$HOME

export HOME=$DOTFILES
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

echo 'Loading profile...'
echo

. $HOME/.profile

export HOME=$REAL_HOME

unset REAL_HOME

echo 'Loading utilities...'
echo

for utility in available list symlink walk
  do
    source $DOTFILES_LIBRARY/$utility.sh
done

unset utility
