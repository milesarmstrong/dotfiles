# Miles' Dotfiles

These are my dotfiles for a basic *nix setup

## Installation

Dotfiles are managed by [dotbot](https://github.com/anishathalye/dotbot), to install:

```
$ git clone https://github.com/milesarmstrong/dotfiles.git ~/.dotfiles
$ ~/.dotfiles/install
```

Vim plugins are managed using [vundle](https://github.com/VundleVim/Vundle.vim), before opening vim for the first time do:

```
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ vim +PluginInstall +qall
```

## Credits
 - Mathias Bynens' [OS X defaults](https://github.com/mathiasbynens/dotfiles/blob/master/.osx).
 - Jamie Davies' [dotfiles](https://github.com/daviesjamie/dotfiles) before he lost it and went [all minimal](https://github.com/daviesjamie/dotfiles/commit/9e904dacac4cb810d8be57be58b5558b10981ddb)
