#!/usr/bin/env bash
cd .config
for d in */
do
  [ -z ~/.config/$d ] && rm -rf ~/.config/$d
  ln -sf $(pwd)/$d ~/.config/$d
  echo "Symlink created for ${d%/}!"
done
