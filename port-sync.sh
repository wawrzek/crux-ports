#!/bin/bash

cd $(dirname $0)
echo $(dirname $0)
pwd
f=`find . -mindepth 3`
d=`find . -mindepth 2 -type d`

if [ -n "$d" ] || [ -n "$f" ]; then
    echo "invalid files:"
    echo "$f"
    echo "dirs:"
    echo "$d"
    exit -1
fi

httpup-repgen .
portspage --title="Wawrzek Niewodniczanski's E19 (Enligthenment) CRUX Collections" --header="description.html" . > index.html

export RSYNC_RSH=ssh
rsync -avz --delete --delete-excluded \
      --exclude "*tar.gz"   \
      --exclude "*tar.bz2"  \
      --exclude "*.gem"  \
      --exclude "*tgz"  \
      --exclude "*.zip"     \
      --exclude "sync.sh"   \
      --exclude "*CVS/"     \
			--exclude "*git*" \
        . www:/var/www/html/wawrzek.name/crux/repos/wawrzek
