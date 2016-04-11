#!/usr/bin/env bash

function usage()
{
echo -e "Usage:"
echo -e "";
echo -e "./merge.sh <bullhead|falcon|sprout>"
echo -e "";
exit 1;
}

if [ ! $1 ];
then
usage;
fi
case "$1" in
bullhead|falcon|sprout)
cd $THUGDIR/$1
;;
*)
usage;
esac

git reset --hard origin/master && git checkout master
git fetch $(cat upstream)
git merge $(cat upstream)
