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

ln -sf $(pwd)/.zshenv ~/
echo "Symlink created for .zshenv"

CRONTAB_LOCATION="/var/spool/cron/$(whoami)"
[[ -f $CRONTAB_LOCATION ]] && doas rm -rf $CRONTAB_LOCATION
doas ln -sf $(pwd)/crontab /var/spool/cron/$(whoami)
echo "Symlink created for crontab"

