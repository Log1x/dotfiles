# Dotfiles

This repository consists of all of my custom dotfiles for macOS.

I highly recommend [homesick](https://github.com/technicalpickles/homesick) for maintaining your dotfiles.

## Installation

```sh
$ brew install antigen
$ sudo gem install homesick
$ homesick clone log1x/dotfiles
$ homesick link dotfiles
```

## iTerm 2

Import the theme located at `~/.themes/material-design-dark.itermcolors`

## Font

```sh
brew cask install caskroom/fonts/font-fira-code
```

## Debug

If Antigen is not updating, run `antigen reset` and restart your terminal.
