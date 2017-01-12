echo 'Initializing...'
echo

REAL_HOME="$HOME"

export HOME="$DOTFILES_ARTIFACT"
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

echo 'Loading profile...'
echo

. "$HOME/.profile"

export HOME="$REAL_HOME"

unset REAL_HOME

echo 'Loading functions...'
echo

for function in available list symlink walk
  do
    source "$DOTFILES_LIBRARY/$function.sh"
done

unset function
