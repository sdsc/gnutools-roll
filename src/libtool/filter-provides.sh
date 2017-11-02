#! /bin/bash
#
# provides can confuse apps that are looking for libltdl provided
# by system RPMs
/usr/lib/rpm/find-provides $* | sed -e 's/^libltdl/sdsc-libltdl/g' | sed -e '/^[[:space:]]*$/d' | sed -e '/^#/d'
