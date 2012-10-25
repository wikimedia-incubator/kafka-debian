#!/bin/bash

# buildpackage.sh
#   Builds .orig.tar.gz file and runs dpkg-buildpackage -rfakeroot.
#   Run with 'compile' as the first argument if you want to remcompile Kafka.

version=0.7.2
basedir=$(readlink -f $(dirname $0)/..)

cd $basedir

# remove build directory
[ -d $basedir/debian/kafka ] && echo "Removing kafka build directory at $basedir/debian/kafka" && rm -r $basedir/debian/kafka

compile=${1:-false}
if [ ${compile} == "compile" -o ! -f $basedir/core/target/scala_2.8.0/kafka-${version}.jar ]; then
    echo "Compiling and packaging Kafka before building .deb package."
    echo "./sbt update && ./sbt package"
    ./sbt update && ./sbt package
fi


# create source .orig directory
# echo "Creating source kafka_${version}.orig.tar.gz"
cd $basedir/..
rm -v kafka_${version}*
tar -czf kafka_${version}.orig.tar.gz $(basename $basedir)

# build the .deb
echo "Building .deb package..."
cd $basedir
dpkg-buildpackage -rfakeroot
