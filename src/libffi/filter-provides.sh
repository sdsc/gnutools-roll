#! /bin/bash
#
# provides can confuse apps that are looking for libffi provided
# by system RPMs
/usr/lib/rpm/find-provides $* | sed -e 's/^libffi/sdsc-libffi/g' | sed -e '/^[[:space:]]*$/d' | sed -e '/^#/d'
