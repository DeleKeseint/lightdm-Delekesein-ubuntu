#!/bin/sh
# Run this to generate all the initial makefiles, etc.

libtoolize --force --copy
intltoolize --force --copy
gtkdocize --copy
aclocal
autoconf
autoheader
automake --add-missing --copy --foreign

YELP=`which yelp-build`
if test -z $YELP; then
  echo "not found yelp, install…"
  sudo apt update
  sudo apt install yelp-tools
  t 
fi

if [ -z "$NOCONFIGURE" ]; then
    ./configure $@
fi
