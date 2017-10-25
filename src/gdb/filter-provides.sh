#! /bin/bash
#
# provides can confuse apps that are looking for libinproctrace provided
# by system RPMs
/usr/lib/rpm/find-provides $* | sed -e 's/^libinproctrace/sdsc-libinproctrace/g' | sed -e '/^[[:space:]]*$/d' | sed -e '/^#/d'
