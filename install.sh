#!/usr/bin/env bash
cd .config
for d in */
do
  [[ -F ~/.config/$d ]] && rm ~/.config/$d
  [[ -d ~/.config/$d ]] && rm -rf ~/.config/$d
  ln -sf $(pwd)/$d ~/.config
  echo "Symlink created for ${d%/}!"
done
cd ..

cd .local
for d in */
do
  [[ -F ~/.local/$d ]] && rm ~/.local/$d
  [[ -d ~/.local/$d ]] && rm -rf ~/.local/$d
  ln -sf $(pwd)/$d ~/.local
  echo "Symlink created for ${d%/}!"
done
cd ..
