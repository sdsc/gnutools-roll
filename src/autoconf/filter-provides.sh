#! /bin/bash
#
# provides can confuse apps that are looking for perl modules provided
# by system RPMs in system locations. This will prefix all perl provides
# entries with `sdsc-` producing the following...
#
# rpm -q --provides -p ../../RPMS/x86_64/sdsc-autoconf-2.69-5.x86_64.rpm
# sdsc-autoconf = 2.69-5
# sdsc-autoconf(x86-64) = 2.69-5
# sdsc-perl(Autom4te::C4che)
# sdsc-perl(Autom4te::ChannelDefs)
# sdsc-perl(Autom4te::Channels)
# sdsc-perl(Autom4te::Configure_ac)
# sdsc-perl(Autom4te::FileUtils)
# sdsc-perl(Autom4te::General)
# sdsc-perl(Autom4te::Getopt)
# sdsc-perl(Autom4te::Request)
# sdsc-perl(Autom4te::XFile) = 1.2

/usr/lib/rpm/find-provides $* | sed -e 's/^perl/sdsc-perl/g' | sed -e '/^[[:space:]]*$/d' | sed -e '/^#/d'
