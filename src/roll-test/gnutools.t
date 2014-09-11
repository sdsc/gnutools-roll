#!/usr/bin/perl -w
# gnutools roll installation test.  Usage:
# gnutools.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/boost';
my $output;

my $TESTFILE = 'rollgnutools';

# opt-gnu-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok(-e "/opt/gnu/bin/autoconf", "autoconf installed");
} else {
  ok(! -e "/opt/gnu/bin/autoconf", "autoconf not installed");
}

# TODO: test whether installed s/w works

SKIP: {

  skip 'gnutools not installed', 8 if ! $isInstalled;
  my $modulesInstalled = -f '/etc/profile.d/modules.sh';
  my $setup = $modulesInstalled ?
              ". /etc/profile.d/modules.sh; module load gnutools" :
              'echo > /dev/null'; # noop

  skip 'modules not installed', 3 if ! $modulesInstalled;
  skip 'gnutools not installed', 3 if ! $isInstalled;
  `/bin/ls /opt/modulefiles/applications/gnutools/[0-9]* 2>&1`;
  ok($? == 0, "gnutools module installed");
  `/bin/ls /opt/modulefiles/applications/gnutools/.version.[0-9]* 2>&1`;
  ok($? == 0, "gnutools version module installed");
  ok(-l "/opt/modulefiles/applications/gnutools/.version",
     "gnutools version module link created");

}

`rm -fr $TESTFILE*`;
