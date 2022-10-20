#!/bin/sh -e

VERSION=$2
TAR=../xmlbeans-maven-plugin_$VERSION.orig.tar.gz
DIR=xmlbeans-maven-plugin-$VERSION
TAG=$(echo "xmlbeans-maven-plugin-$VERSION" | sed -re's/~(alpha|beta)/-\1-/')

svn export http://svn.codehaus.org/mojo/tags/${TAG}/ $DIR
GZIP=--best tar -c -z -f $TAR --exclude '*.jar' --exclude '*.class' $DIR
rm -rf $DIR ../$TAG
