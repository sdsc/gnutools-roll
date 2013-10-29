# Triton gnu-roll

The Triton gnu-roll bundles a number of tools into a single Rocks(r) roll and provides a Modules interface to allow loading of the tool paths into the user environment.

## Installed Tools

### GNU Tools

- GNU Autoconf - [Autoconf](http://www.gnu.org/software/autoconf/) is an extensible package of M4 macros that produce shell scripts to automatically configure software source code packages. These scripts can adapt the packages to many kinds of UNIX-like systems without manual user intervention. Autoconf creates a configuration script for a package from a template file that lists the operating system features that the package can use, in the form of M4 macro calls.
- GNU Automake - [Automake](http://www.gnu.org/software/automake/) is a tool for automatically generating Makefile.in files compliant with the GNU Coding Standards. Automake requires the use of Autoconf.
- GNU Binutils - The GNU [Binutils](http://www.gnu.org/software/binutils/) are a collection of binary tools.
- GNU GDB - [GDB](http://www.gnu.org/software/gdb/), the GNU Project debugger, allows you to see what is going on `inside' another program while it executes -- or what another program was doing at the moment it crashed.
- GNU Guile - [Guile](http://www.gnu.org/software/guile/) is a library designed to help programmers create flexible applications. Using Guile in an application allows the application's functionality to be 'extended' by users or other programmers with plug-ins, modules, or scripts. Guile provides what might be described as "practical software freedom," making it possible for users to customize an application to meet their needs without digging into the application's internals.
- GNU Libtool - GNU [libtool](http://www.gnu.org/software/libtool/) is a generic library support script. Libtool hides the complexity of using shared libraries behind a consistent, portable interface.
- GNU Texinfo - [Texinfo](http://www.gnu.org/software/texinfo/) is the official documentation format of the GNU project. It was invented by Richard Stallman and Bob Chassell many years ago, loosely based on Brian Reid's Scribe and other formatting languages of the time. It is used by many non-GNU projects as well.
- GNU libunistring - The [libunistring](http://www.gnu.org/software/libunistring/) library provides functions for manipulating Unicode strings and for manipulating C strings according to the Unicode standard.

### Other Tools

- libffi - The [libffi](http://sourceware.org/libffi/) library provides a portable, high level programming interface to various calling conventions. This allows a programmer to call any function specified by a call interface description at run-time.
- bdwgc - The [Boehm-Demers-Weiser conservative garbage collector](http://www.hpl.hp.com/personal/Hans_Boehm/gc/) can be used as a garbage collecting replacement for C malloc or C++ new. It allows you to allocate memory basically as you normally would, without explicitly deallocating memory that is no longer useful. The collector automatically recycles memory when it determines that it can no longer be otherwise accessed.

### Module File

- gnu-modules - Installs/configures module files for the gnu tools.


## Roll Dependencies

The gnu-roll requires that you first build and install the [gnucompiler-roll](https://github.com/sdsc/gnucompiler-roll) onto your Rocks(r) frontend or development appliance.


