#!/bin/bash
set -e

DATE=`date +%F`
SOURCES="$HOME/pictures $HOME/code $HOME/documents $HOME/ebooks/archive"
RSYNCOPTS="-rzxl --delete --delete-excluded --exclude-from=$HOME/.config/rsync/exclude"
DEST="$HOME/backups"

mkdir -p $DEST/$HOSTNAME
cd $DEST/$HOSTNAME

# TODO encrypt tarball
tar --create --file backup-$DATE.tar.zst --zstd $SOURCES
find ./ -mindepth 1 -maxdepth 1 -ctime +3 -exec rm -rf '{}' \;
