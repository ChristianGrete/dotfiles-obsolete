if [ ! -d "$HOME" ] || [ ! -w "$HOME" ]
  then
    echo "$(cat <<EOF
Your home directory is either invalid or not writable. Please make sure that the
\`\$HOME\` variable and the user permissions are properly set. Then try again.
EOF)" >&2

    exit 1
fi

dotfiles_sources="$PWD/dist"

commit="$(git rev-list --max-count=1 --tags)"
version="$(git describe --tags $commit)"

echo "$(cat <<EOF
export DOTFILES='$PWD'
export DOTFILES_VENDORS='$PWD/vendor'
export DOTFILES_VERSION='$version'
EOF)" > "$dotfiles_sources/.profiles/dotfiles.sh"

unset commit version

real_home="$HOME"

export HOME="$dotfiles_sources"
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

. "$HOME/.profile"

export HOME="$real_home"

unset real_home

for function in list symlink walk
  do
    source "$dotfiles_sources/.lib/$function.sh"
done

unset function
