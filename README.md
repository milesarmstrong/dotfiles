# Miles' Dotfiles

These are my dotfiles for a basic *nix setup, they configure fish shell, vim, and git; and install
the patched powerline fonts used by the vim airline plugin.

## Installation

Dotfiles are managed by [dotbot](https://github.com/anishathalye/dotbot), to install:

```
$ git clone https://github.com/milesarmstrong/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/install
```

Vim plugins are managed using [vundle](https://github.com/VundleVim/Vundle.vim), which is installed by dotbot, when opening vim for the first time do:

```
$ vim +PluginInstall +qall
```

## Credits
 - Mathias Bynens' [OS X defaults](https://github.com/mathiasbynens/dotfiles/blob/master/.osx).
 - Jamie Davies' [dotfiles](https://github.com/daviesjamie/dotfiles) before he lost it and went [all minimal](https://github.com/daviesjamie/dotfiles/commit/9e904dacac4cb810d8be57be58b5558b10981ddb)
