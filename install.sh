#!/usr/bin/env bash
[[ "$1" == "pkg-update" ]] && yay -Qe | awk '{print $1}' > packages.yay && exit

cd config
for d in */ 
do
  [[ -d ~/.local/${d%/} ]] && [[ ! -L ~/.config/${d%/} ]] && rm -rf ~/.config/$d
  ln -sf $(pwd)/$d ~/.config
  echo "Symlink created for ${d%/}!"
done
cd ..

[[ -d ~/.local/bin/ ]] && [[ ! -L ~/.local/bin/ ]] && rm -rf ~/.local/bin
ln -sf $(pwd)/scripts ~/.local/bin
echo "Symlink created for ~/.local/bin!"

ln -sf $(pwd)/.zshenv ~/
echo "Symlink created for .zshenv!"

CRONTAB_LOCATION="/var/spool/cron/$(whoami)"
[[ -f $CRONTAB_LOCATION ]] && doas rm -rf $CRONTAB_LOCATION
doas ln -sf $(pwd)/crontab /var/spool/cron/$(whoami)
echo "Symlink created for crontab!"

