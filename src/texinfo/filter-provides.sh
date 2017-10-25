#! /bin/bash
#
# provides can confuse apps that are looking for perl modules provided
# by system RPMs
/usr/lib/rpm/find-provides $* | sed -e 's/^perl/sdsc-perl/g' | sed -e '/^[[:space:]]*$/d' | sed -e '/^#/d'
