#!/usr/bin/env bash
cd .config
for d in */
do
  [[ -d ~/.config/$d ]] && rm -rf ~/.config/$d
  ln -sf $(pwd)/$d ~/.config
  echo "Symlink created for ${d%/}!"
done
