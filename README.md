# [![dotfiles](https://cdn.rawgit.com/ChristianGrete/dotfiles/master/logo.svg "dotfiles")](https://github.com/ChristianGrete/dotfiles)

`master`: [![Travis CI (master)][shield-travis-ci-master]][travis-ci-url]
`develop`: [![Travis CI (develop)][shield-travis-ci-develop]][travis-ci-branches-url]

> Christian Grete’s personal dotfiles

These are my __dotfiles__ to personalize and setup my machine.

## Getting started

### Installation
__This has currently only been tested on a Mac!__

Run the following command in your terminal to install the dotfiles:
```sh
curl -fLSs https://git.io/viFK3 | sh
```
This command will clone the Git repository into your home directory, check for a [Homebrew](http://brew.sh) installation and install it if necessary. It will also update Homebrew itself and all of its packages, install a few dependencies (`git`, `node`, `ruby` and `zsh` with _Oh-My-Zsh_ — if any of these have not already been installed) and update `npm` and its global packages to the latest versions. After that it will create symbolic links to the dotfiles into your home directory.

__Existing files won’t be harmed:__ This script will ask you whether to replace existing files and create a backup of the old files if you choose to do so.

## Policy

This is communist software. It is crafted with heart and soul to the best of the author’s knowledge and belief: _Not for profit but to satisfy the concrete needs._ Do whatever you want with it (as long as you keep the author’s copyright notice in all copies or substantial portions of it included) for free. Imagine how the world could be if others would produce and distribute their products for the same benefits and ask yourself why they’re actually not.

## License

This software is licensed under [MIT License](LICENSE.md).

Copyright © 2015–2018 [Christian Grete](https://christiangrete.com)
- [GitHub](https://github.com/ChristianGrete)
- [npm](https://www.npmjs.com/~christiangrete)
- [Twitter](https://twitter.com/ChristianGrete)
- [LinkedIn](https://www.linkedin.com/in/ChristianGrete)
- [XING](https://www.xing.com/profile/Christian_Grete2)

[shield-travis-ci-develop]: https://img.shields.io/travis/ChristianGrete/dotfiles/develop.svg
[shield-travis-ci-master]: https://img.shields.io/travis/ChristianGrete/dotfiles/master.svg
[travis-ci-branches-url]: https://travis-ci.org/ChristianGrete/dotfiles/branches
[travis-ci-url]: https://travis-ci.org/ChristianGrete/dotfiles