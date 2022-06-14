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
echo "Symlink created for .zshenv!"

CRONTAB_LOCATION="/var/spool/cron/$(whoami)"
[[ -f $CRONTAB_LOCATION ]] && doas rm -rf $CRONTAB_LOCATION
doas ln -sf $(pwd)/crontab /var/spool/cron/$(whoami)
echo "Symlink created for crontab!"

FF_DIR="/home/$(whoami)/.mozilla/firefox"
FF_PROFILES_PATH=(
  $(sed -n '/^\[Profile.]$/,/^$/p' $FF_DIR/profiles.ini | grep 'Path' | cut -c 6-)
)
FF_VALID_PROFILES=()
for f in ${FF_PROFILES_PATH[@]}; do
  TMP_PROFILE_PATH=$FF_DIR/$f
  if [[ -f $TMP_PROFILE_PATH/prefs.js ]]; then
    FF_VALID_PROFILES+=($TMP_PROFILE_PATH)
  fi
done
for v in ${FF_VALID_PROFILES[@]}; do
  USERCHROME_DIR=$v/chrome
  USERCHROME=$USERCHROME_DIR/userChrome.css
  [[ ! -d $USERCHROME_DIR ]] && mkdir -p $USERCHROME_DIR
  [[ -f $USERCHROME ]] && [[ ! -L $USERCHROME ]] && rm -rf $USERCHROME
  ln -sf $(pwd)/userChrome.css $USERCHROME
  echo "Symlink created for userChrome.css!"
done

AUTOLOGIN_DIR=/etc/systemd/system/getty@tty1.service.d
AUTOLOGIN_FILE=$AUTOLOGIN_DIR/autologin.conf
[[ ! -d $AUTOLOGIN_DIR ]] && doas mkdir -p $AUTOLOGIN_DIR
[[ -f $AUTOLOGIN_FILE ]]  && [[ ! -L $AUTOLOGIN_FILE ]] && doas rm -rf $AUTOLOGIN_FILE
ACTUAL_PWD=$(pwd)
sudo -E ln -sf $ACTUAL_PWD/autologin.conf $AUTOLOGIN_FILE
echo "Autologin enabled!"

# create directories for mpd
mkdir -p ~/.cache/mpd
touch ~/.cache/mpd/db
touch ~/.cache/mpd/pid
touch ~/.cache/mpd/state
touch ~/.cache/mpd/sticker.sql
mkdir -p ~/.local/share/mpd/playlists

# create directories for ncmpcpp
mkdir -p ~/.cache/ncmpcpp
mkdir -p ~/.local/share/ncmpcpp/lyrics
ln -sf /mnt/backup/music /home/$(whoami)/Music
echo "music player daemon setup!"

