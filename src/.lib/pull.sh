# POSIX compliant function to update Git local refs
pull () {
  git pull -v "${2:-origin}" "${1:-$(branch)}"
}
