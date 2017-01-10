#!/bin/bash

cd $(dirname $0)
echo $(dirname $0)
pwd
f=`find * -mindepth 2`
d=`find * -mindepth 1 -type d`
echo $f
if [ -n "$d" ] || [ -n "$f" ]; then
    echo "invalid files:"
#    echo "$f"
    echo "dirs:"
#    echo "$d"
    exit -1
fi

httpup-repgen .
portspage --title="Wawrzek Niewodniczanski's Enligthenment (E21) CRUX Collections" --header="description.html" . > index.html

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
			--exclude ".*~" \
			--exclude "*~" \
        . wawrzek.name:crux/wawrzek
