# POSIX compliant function to update Git local refs
pull () {
  command git pull -vr "${2:-origin}" "${1:-$(branch)}" 2>/dev/null
}
