# POSIX compliant function to update Git remote refs
push () {
  git push "${2:-origin}" "${1:-HEAD}"

  return $?
}
