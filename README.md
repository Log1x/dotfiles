# Dotfiles

This repository consists of all of my custom dotfiles for macOS. Linux and WSL should also work as long as dependencies such as `antigen` are installed using [Linuxbrew](https://github.com/Linuxbrew/brew).

I highly recommend [homesick](https://github.com/technicalpickles/homesick) for maintaining your dotfiles.

## Installation

```sh
$ brew install antigen
$ sudo gem install homesick
$ homesick clone log1x/dotfiles
$ homesick link dotfiles
```

## Replacement Binaries

These dotfiles alias various default binaries such as `ls`, `cat`, `top`, `kill`, and `find` to better, more well-rounded alternatives. 

```sh
$ brew install exa bat fd
$ yarn global add vtop fkill
```

## iTerm 2

Import the theme located at `~/.themes/material-design-dark.itermcolors`

## Font

```sh
$ brew cask install caskroom/fonts/font-fira-code
```

## Debug

If Antigen is not updating, run `antigen reset` and restart your terminal.
