#!/bin/bash

set -x

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

export RSYNC_RSH=ssh
rsync -avz --delete --delete-excluded \
      --exclude "*tar.gz" \
      --exclude "*tar.xz" \
      --exclude "*tar.bz2" \
      --exclude "*.gem" \
      --exclude "*tgz" \
      --exclude "*.zip" \
      --exclude "*CVS/" \
      --exclude "*git*" \
      --exclude ".*~" \
      --exclude "*~" \
      --exclude "port-sync.sh" \
      --exclude "portspage.py" \
      --exclude "README.md" \
      . wawrzek@server.wawrzek.name:crux/wawrzek
