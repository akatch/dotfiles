#!/bin/bash
set -e

DATE="$(date +%F)"
SOURCES="$HOME/pictures $HOME/code $HOME/documents $HOME/ebooks/archive /etc/fstab"
DEST="$HOME/backups"
OFFSITE_DEST="/vault/al"

mkdir -p "$DEST/$HOSTNAME"
cd "$DEST/$HOSTNAME"

# Back up cron jobs
crontab -l > cron.tab

# TODO encrypt tarball
# TODO find a way to not output 'removing leading / from [...]'
tar --create \
    --file "$USER@$HOSTNAME-$DATE.tar.zst" \
    --use-compress-program=zstd \
    --exclude='*.qcow2' \
    --exclude='*.img' $SOURCES
find ./ -mindepth 1 -maxdepth 1 -ctime +1 -exec rm -rf '{}' \;

rsync -az --delete ./ "$OFFSITE_DEST/"
