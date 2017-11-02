#! /bin/bash
#
# provides can confuse apps that are looking for perl modules provided
# by system RPMs in system locations. This will prefix all perl provides
# entries with `sdsc-` producing the following...
#
# rpm -q --provides -p ../../RPMS/x86_64/sdsc-automake-1.15-1.x86_64.rpm
# sdsc-automake = 1.15-1
# sdsc-automake(x86-64) = 1.15-1
# sdsc-perl(Automake::ChannelDefs)
# sdsc-perl(Automake::Channels)
# sdsc-perl(Automake::Condition)
# sdsc-perl(Automake::Config) = 1.15
# sdsc-perl(Automake::Configure_ac)
# sdsc-perl(Automake::DisjConditions)
# sdsc-perl(Automake::FileUtils)
# sdsc-perl(Automake::General)
# sdsc-perl(Automake::Getopt)
# sdsc-perl(Automake::Item)
# sdsc-perl(Automake::ItemDef)
# sdsc-perl(Automake::Language)
# sdsc-perl(Automake::Location)
# sdsc-perl(Automake::Options)
# sdsc-perl(Automake::Rule)
# sdsc-perl(Automake::RuleDef)
# sdsc-perl(Automake::VarDef)
# sdsc-perl(Automake::Variable)
# sdsc-perl(Automake::Version)
# sdsc-perl(Automake::Wrap)
# sdsc-perl(Automake::XFile) = 1.2

/usr/lib/rpm/find-provides $* | sed -e 's/^perl/sdsc-perl/g' | sed -e '/^[[:space:]]*$/d' | sed -e '/^#/d'
