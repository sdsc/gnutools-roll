#!/usr/bin/perl -w
# gnutools roll installation test.  Usage:
# gnutools.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = 'Compute|Login';
my $isInstalled = -e "/opt/gnu/bin/autoconf";
my $output;

my $TESTFILE = 'tmpgnutools';

mkdir "$TESTFILE.dir";

open(OUT, ">$TESTFILE.dir/hello.c");
print OUT <<END;
#include <stdio.h>
int main() {
  printf("Hello\\n");
  return 0;
}
END
close(OUT);

open(OUT, ">$TESTFILE.dir/Makefile.am");
print OUT <<END;
bin_PROGRAMS = hello
hello_SOURCES = hello.c
END
close(OUT);

open(OUT, ">$TESTFILE.dir/configure.ac");
print OUT <<END;
AC_INIT([hello], [1.0])
AM_INIT_AUTOMAKE
AC_PROG_CC
AC_OUTPUT([Makefile])
END
close(OUT);

`cd $TESTFILE.dir && touch AUTHORS  ChangeLog  NEWS  README`;

# opt-gnu-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, "gnutools installed");
} else {
  ok(! $isInstalled, "gnutools not installed");
}

# automake
SKIP: {
  skip 'automake not installed', 1 if ! $isInstalled;
  `module load gnutools; cd $TESTFILE.dir; (aclocal && automake --add-missing) >/dev/null 2>&1`;
  ok(-e "$TESTFILE.dir/Makefile.in", 'automake works');
}

# autoconf
SKIP: {
  skip 'autoconf not installed', 1 if ! $isInstalled;
  `module load gnutools; cd $TESTFILE.dir; (autoconf && ./configure && make) > /dev/null 2>&1`;
  ok(-e "$TESTFILE.dir/hello", 'autoconf works');
}

# binutils
SKIP: {
  skip 'binutils not installed', 1 if ! $isInstalled;
  $output = `module load gnutools; size /bin/ls 2>&1`;
  like($output, qr/text/, 'binutils size works');
}

# gdb
SKIP: {
  skip 'gdb not installed', 1 if ! $isInstalled;
  $output = `module load gnutools; gdb --version 2>&1`;
  like($output, qr/GDB.*\d+\.\d+/, 'gdb works');
}

# gnuplot
SKIP: {
  skip 'gnuplot not installed', 1 if ! $isInstalled;
  $output = `module load gnutools; gnuplot --version 2>&1`;
  like($output, qr/gnuplot.*\d+\.\d+/, 'gnuplot works');
}

# libffi

# libffi example from http://www.atmark-techno.com/~yashi/libffi.html
open(OUT, ">$TESTFILE.ffi.c");
print OUT <<END;
#include <stdio.h>
#include <ffi.h>

int main() {
  ffi_cif cif;
  ffi_type *args[1];
  void *values[1];
  char *s;
  int rc;

  /* Initialize the argument info vectors */
  args[0] = &ffi_type_pointer;
  values[0] = &s;

  /* Initialize the cif */
  if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, 1, &ffi_type_uint, args) == FFI_OK) {
    s = "Hello World!";
    ffi_call(&cif, puts, &rc, values);
    /* rc now holds the result of the call to puts */
     
    /* values holds a pointer to the function's arg, so to
       call puts() again all we need to do is change the
       value of s */
    s = "This is cool!";
    ffi_call(&cif, puts, &rc, values);
  }
     
  return 0;
}
END
close(OUT);

SKIP: {
  skip 'libffi not installed', 2 if ! $isInstalled;
  `module load gnutools; gcc -I\$GNUTOOLSHOME/include -L\$GNUTOOLSHOME/lib64 -lffi -o $TESTFILE.ffi.exe $TESTFILE.ffi.c >/dev/null 2>&1`;
  ok(-e "$TESTFILE.ffi.exe", 'libffi compilation');
  $output = `module load gnutools; ./$TESTFILE.ffi.exe 2>&1`;
  like($output, qr/Hello/, 'libffi exec');
}

# libtool
SKIP: {
  skip 'libtool not installed', 1 if ! $isInstalled;
  `module load gnutools; cd $TESTFILE.dir; libtoolize > /dev/null 2>&1`;
  ok(-f "$TESTFILE.dir/ltmain.sh", 'libtool works');
}

# libunistring
open(OUT, ">$TESTFILE.unistr.c");
print OUT <<END;
#include <unistr.h>
#include <stdio.h>
#include <string.h>
int main() {
  uint8_t *str8 = (uint8_t *)"Hello";
  uint32_t str32[100];
  size_t size8 = u8_strlen(str8);
  size_t size32 = 100;
  u8_to_u32(str8, size8, str32, &size32);
  printf("char length is %d\\n", u32_mblen(str32, size32));
  return 0;
}
END
close(OUT);

SKIP: {
  skip 'libunistring not installed', 1 if ! $isInstalled;
  `module load gnutools; gcc -I\$GNUTOOLSHOME/include -L\$GNUTOOLSHOME/lib -lunistring -o $TESTFILE.unistr.exe $TESTFILE.unistr.c >/dev/null 2>&1`;
  ok(-e "$TESTFILE.unistr.exe", 'libunistring compilation');
  $output = `module load gnutools; ./$TESTFILE.unistr.exe 2>&1`;
  like($output, qr/char length is 1/, 'libunistring exec');
}

# parallel
SKIP: {
  skip 'parallel not installed', 1 if ! $isInstalled;
  $output = `module load gnutools; parallel echo ::: One Two Three 2>&1`;
  like($output, qr/^Two$/m, 'parallel works');
}

# texinfo
SKIP: {
  skip 'texinfo not installed', 1 if ! $isInstalled;
  $output = `module load gnutools; info --version 2>&1`;
  like($output, qr/info.*\d+\.\d+/, 'info works');
}

SKIP: {

  skip 'biotools not installed', 3 if ! $isInstalled;

  `/bin/ls /opt/modulefiles/applications/gnutools/[0-9]* 2>&1`;
  ok($? == 0, "gnutools module installed");
  `/bin/ls /opt/modulefiles/applications/gnutools/.version.[0-9]* 2>&1`;
  ok($? == 0, "gnutools version module installed");
  ok(-l "/opt/modulefiles/applications/gnutools/.version",
     "gnutools version module link created");

}

`rm -fr $TESTFILE*`;
