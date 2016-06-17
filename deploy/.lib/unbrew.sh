#!/bin/sh

# POSIX compliant function to uninstall a specific Homebrew package
unbrew () {
  brew rm $@

  return $?
}
