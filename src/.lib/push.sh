# POSIX compliant function to update Git remote refs
push () {
  git push -v "${2:-origin}" "${1:-HEAD}"

  return $?
}
