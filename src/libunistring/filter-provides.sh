#! /bin/bash
#
# provides can confuse apps that are looking for libunistring provided
# by system RPMs
/usr/lib/rpm/find-provides $* | sed -e 's/^libunistring/sdsc-libunistring/g' | sed -e '/^[[:space:]]*$/d' | sed -e '/^#/d'
