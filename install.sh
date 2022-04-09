#!/usr/bin/env bash
cd .config
for d in */ 
do
  [[ -d ~/.local/${d%/} ]] && [[ ! -L ~/.config/${d%/} ]] && rm -rf ~/.config/$d
  ln -sf $(pwd)/$d ~/.config
  echo "Symlink created for ${d%/}!"
done
cd ..

cd .local
for d in */
do
  [[ -d ~/.local/${d%/} ]] && [[ ! -L ~/.local/${d%/} ]] && rm -rf ~/.local/$d
  ln -sf $(pwd)/$d ~/.local
  echo "Symlink created for ${d%/}!"
done
cd ..
