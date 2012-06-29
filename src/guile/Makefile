#
# $Id$
#
# @Copyright@
#
# 				Rocks(tm)
# 		         www.rocksclusters.org
# 		        version 4.3 (Mars Hill)
#
# Copyright (c) 2000 - 2011 The Regents of the University of California.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided
# with the distribution.
#
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement:
#
# 	"This product includes software developed by the Rocks(tm)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
#
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of
# the associated name, interested parties should contact Technology
# Transfer & Intellectual Property Services, University of California,
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910,
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
#
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# @Copyright@

PKGROOT = /opt/gnu/guile/$(VERSION)
SOURCE = guile-$(VERSION)
REDHAT.ROOT = $(PWD)/../../

-include $(ROCKSROOT)/etc/Rules.mk

build:
	mkdir -p -m 755 $(PKGROOT)
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	mkdir -p /opt/gnu/libtool/2.4
	mkdir -p /opt/gnu/libunistring/0.9.3
	mkdir -p /opt/gnu/gmp/4.3.2
	mkdir -p /opt/gnu/libffi/3.0.11
	mkdir -p /opt/gnu/bdwgc/7.2alpha7
	tar zxvf $(SOURCE).tar.gz
	mount --bind $(ROOT)/$(PKGROOT)  $(PKGROOT)
	mount --bind $(REDHAT.ROOT)/src/build-libtool /opt/gnu/libtool/2.4
	mount --bind $(REDHAT.ROOT)/src/build-gmp /opt/gnu/gmp/4.3.2
	mount --bind $(REDHAT.ROOT)/src/build-libunistring /opt/gnu/libunistring/0.9.3
	mount --bind $(REDHAT.ROOT)/src/build-libffi /opt/gnu/libffi/3.0.11
	mount --bind $(REDHAT.ROOT)/src/build-bdwgc /opt/gnu/bdwgc/7.2alpha7
	( \
          cp patch-files/gc.c $(SOURCE)/libguile; \
	  cd $(SOURCE); \
          export LIBFFI_LIBS="-L/opt/gnu/libffi/3.0.11/lib -lffi"; \
          export LIBFFI_CFLAGS=-I/opt/gnu/libffi/3.0.11/lib/libffi-3.0.11/include; \
          export BDW_GC_LIBS="-L/opt/gnu/bdwgc/7.2alpha7/lib -lgc"; \
          export BDW_GC_CFLAGS=-I/opt/gnu/bdwgc/7.2alpha7/include; \
          export CFLAGS=-I/opt/gnu/bdwgc/7.2alpha7/include; \
          export PATH=/opt/gnu/libtool/2.4/bin:$${PATH}; \
	  ./configure --prefix=$(PKGROOT) --with-libltdl-prefix=/opt/gnu/libtool/2.4 --with-libgmp-prefix=/opt/gnu/gmp/4.3.2 --with-libunistring-prefix=/opt/gnu/libunistring/0.9.3; \
          make \
	)
	umount $(PKGROOT)
	umount /opt/gnu/libtool/2.4
	umount /opt/gnu/gmp/4.3.2
	umount /opt/gnu/libunistring/0.9.3
	umount /opt/gnu/bdwgc/7.2alpha7
	umount /opt/gnu/libffi/3.0.11

install::
	mkdir -p -m 755 $(PKGROOT)
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	mkdir -p /opt/gnu/libtool/2.4
	mkdir -p /opt/gnu/libunistring/0.9.3
	mkdir -p /opt/gnu/gmp/4.3.2
	mkdir -p /opt/gnu/libffi/3.0.11
	mkdir -p /opt/gnu/bdwgc/7.2alpha7
	mount --bind $(REDHAT.ROOT)/src/build-bdwgc /opt/gnu/bdwgc/7.2alpha7
	mount --bind $(ROOT)/$(PKGROOT) $(PKGROOT)
	mount --bind $(REDHAT.ROOT)/src/build-libtool /opt/gnu/libtool/2.4
	mount --bind $(REDHAT.ROOT)/src/build-libunistring /opt/gnu/libunistring/0.9.3
	mount --bind $(REDHAT.ROOT)/src/build-gmp /opt/gnu/gmp/4.3.2
	mount --bind $(REDHAT.ROOT)/src/build-libffi /opt/gnu/libffi/3.0.11
	( \
            cd $(SOURCE); \
            export PATH=/opt/gnu/libtool/2.4/bin:$${PATH}; \
            make install \
        )
	mkdir -p $(REDHAT.ROOT)/src/build-gnu-modules
	cat guile.mod| perl -pi -e "s!VERSION!$(VERSION)!g" > guile.mod.tmp
	cp guile.mod.tmp $(REDHAT.ROOT)/src/build-gnu-modules/guile.mod
	umount $(PKGROOT)
	umount /opt/gnu/libtool/2.4
	umount /opt/gnu/gmp/4.3.2
	umount /opt/gnu/libunistring/0.9.3
	umount /opt/gnu/bdwgc/7.2alpha7
	umount /opt/gnu/libffi/3.0.11

clean::
	rm -rf $(SOURCE)
