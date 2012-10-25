#!/bin/bash

basedir=$1
destdir=$2

# Install all files in $basedir 
# (minus the debian/ and config/ directory) 
# into $destdir
for file in $(ls $basedir | grep -v 'debian' | grep -v 'config'); do
    cp -r $file $destdir/$file
done
