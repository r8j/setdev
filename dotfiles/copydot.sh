#!/usr/bin/env bash

# turn on nullglob to get array of files without wonky use of ls
shopt -s nullglob
DOTFILES=(dot-*)

# iterate through dot-* files and put them inside an array
for DF in ${DOTFILES[@]}; do
  # remove the dot- prefix off the name
  DOTFILE=$HOME/.${DF#dot-}
  # copy back the edited dotfiles from $HOME
  # don't worry - you can review changes since it's in Git
  [[ -e $DOTFILE ]] && cp -v $DOTFILE $(pwd)/$DF
done

# turn off nullglob
shopt -u nullglob
