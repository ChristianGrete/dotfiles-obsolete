# POSIX compliant function to update Git remote refs
push () {
  command git push -v "${2:-origin}" "${1:-$(branch)}" 2>/dev/null
}
