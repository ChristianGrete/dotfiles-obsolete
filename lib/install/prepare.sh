if [ ! -d "$HOME" ] || [ ! -w "$HOME" ]
  then
    echo "$(cat <<EOF
Your home directory is either invalid or not writable. Please make sure that the
\`\$HOME\` variable and the user permissions are properly set. Then try again.
EOF
)" >&2

    exit 1
fi

DOTFILES_SOURCES="$PWD/dist"

commit="$(git rev-list --max-count=1 --tags)"
version="$(git describe --tags $commit)"

echo "$(cat <<EOF
export DOTFILES='$PWD'
export DOTFILES_PACKAGES='$PWD/opt'
export DOTFILES_VERSION='$version'
export PROFILES='$HOME/.profiles'
export PROJECTS='$HOME/.projects'
EOF
)" > "$DOTFILES_SOURCES/.profiles/dotfiles.sh"

unset commit version

real_home="$HOME"

export HOME="$DOTFILES_SOURCES"
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

. "$HOME/.profile"

export HOME="$real_home"

unset real_home

for function in list symlink walk
  do
    source "$DOTFILES_SOURCES/.lib/$function.sh"
done

unset function
