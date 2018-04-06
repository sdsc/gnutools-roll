# SDSC "gnutools" roll

## Overview

This roll bundles a number of GNU tools into a single Rocks(r) roll and provides a Modules interface to allow loading of the tool paths into the user environment.

For more information about the various packages included in the gnutools roll please visit their official web pages:

### GNU Tools

- <a href="http://www.gnu.org/software/autoconf/" target="_blank">GNU
Autoconf</a> is an extensible package of M4 macros that produce shell scripts to
automatically configure software source code packages.
- <a href="http://www.gnu.org/software/automake/" target="_blank">GNU
Automake</a> is a tool for automatically generating Makefile.in files compliant
with the GNU Coding Standards. Automake requires the use of Autoconf.
- <a href="http://www.gnu.org/software/binutils/" target="_blank">GNU
Binutils</a> are a collection of binary tools.
- <a href="http://www.gnu.org/software/gdb/" target="_blank">GNU GDB</a> the GNU
Project debugger, allows you to see what is going on *inside* another program
while it executes -- or what another program was doing at the moment it crashed.
- <a href="http://www.gnu.org/software/libtool/" target="_blank">GNU Libtool</a>
is a generic library support script. Libtool hides the complexity of using
shared libraries behind a consistent, portable interface.
- <a href="https://www.gnu.org/software/parallel/" target="_blank">GNU
parallel</a> is a shell tool for executing jobs in parallel using one or more
computers.
- <a href="http://www.gnu.org/software/texinfo/" target="_blank">GNU Texinfo</a>
is the official documentation format of the GNU project.
- <a href="http://www.gnu.org/software/libunistring/" target="_blank">GNU
libunistring</a> provides functions for manipulating Unicode strings and for
manipulating C strings according to the Unicode standard.


### Other Tools

- <a href="http://sourceware.org/libffi/" target="_blank">libffi</a> provides a
portable, high level programming interface to various calling conventions. This
allows a programmer to call any function specified by a call interface
description at run-time.
- <a href="http://www.gnuplot.info/" target="_blank">gnutools</a> is a portable
command-line driven graphing utility.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate gnu source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.


## Dependencies

yum install texinfo

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.


## Building

To build the gnutools-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `gnutools-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.

If a "gnu" environment module is available on the system, the roll loads it
before building each software package.

## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll gnutools
% cd /export/rocks/install
% rocks create distro
```

Subsequent installs of compute and login nodes will then include the contents
of the gnutools-roll.  To avoid cluttering the cluster frontend with unused
software, the gnutools-roll is configured to install only on compute and
login nodes. To force installation on your frontend, run this command after
adding the gnutools-roll to your distro

```shell
% rocks run roll gnutools host=NAME | bash
```

where NAME is the DNS name of a compute or login node in your cluster.

In addition to the software itself, the roll installs gnutools environment
module files in:

```shell
/opt/modulefiles/applications/gnutools
```


## Testing

The gnutools-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/gnutools.t 
```
