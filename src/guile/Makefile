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

PKGROOT = /opt/gnu
SOURCE = guile-$(VERSION)
REDHAT.ROOT = $(PWD)/../../

-include $(ROCKSROOT)/etc/Rules.mk

build:
	mkdir -p -m 755 $(PKGROOT)
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	mkdir -p $(REDHAT.ROOT)/src/build-guile/
	mkdir -p $(REDHAT.ROOT)/src/build/gmp
	tar zxvf $(SOURCE).tar.gz
	cp -r /opt/gnu/gmp/* $(REDHAT.ROOT)/src/build/gmp
	mount --bind $(REDHAT.ROOT)/src/build-guile $(PKGROOT)
	( \
          cp patch-files/gc.c $(SOURCE)/libguile; \
	  cd $(SOURCE); \
          export LIBFFI_LIBS="-L$(REDHAT.ROOT)/src/build/lib -lffi"; \
          export LIBFFI_CFLAGS=-I$(REDHAT.ROOT)/src/build/lib/libffi-3.0.11/include; \
          export BDW_GC_LIBS="-L$(REDHAT.ROOT)/src/build/lib -lgc"; \
          export BDW_GC_CFLAGS=-I$(REDHAT.ROOT)/src/build/include; \
          export CFLAGS=-I$(REDHAT.ROOT)/src/build/lib; \
          export PATH=$(REDHAT.ROOT)/src/build/bin:$${PATH}; \
	  ./configure --prefix=$(PKGROOT) --with-libltdl-prefix=$(REDHAT.ROOT)/src/build-libtool --with-libgmp-prefix=$(REDHAT.ROOT)/src/build/gmp --with-libunistring-prefix=$(REDHAT.ROOT)/src/build; \
          make \
	)
	umount $(PKGROOT)

install::
	mkdir -p -m 755 $(PKGROOT)
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	mount --bind $(REDHAT.ROOT)/src/build-guile $(PKGROOT)
	( \
            cd $(SOURCE); \
            export PATH=$(REDHAT.ROOT)/src/build/bin:$${PATH}; \
            make install \
        )
	mkdir -p $(REDHAT.ROOT)/src/build
	cp -r $(REDHAT.ROOT)/src/build-guile/* $(REDHAT.ROOT)/src/build
	cp -r $(REDHAT.ROOT)/src/build-guile/* $(ROOT)/$(PKGROOT)
	umount $(PKGROOT)

clean::
	rm -rf $(SOURCE)
