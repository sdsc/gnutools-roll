#
# $Id$
#
# @Copyright@
#
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 7.0 (Manzanita)
#
# Copyright (c) 2000 - 2017 The Regents of the University of California.
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
# 	"This product includes software developed by the Rocks(r)
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
#

REDHAT.ROOT = $(PWD)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

ROLLCOMPILER = gnu
COMPILERNAME = gnu

AUTOCONF_CACHE = $(REDHAT.ROOT)/cache/autoconf

$(NAME).spec: DESCRIPTION LICENSE

DESCRIPTION:
	$(MODULE_LOAD_CC); \
	( \
	  $(DESCRIBE_PKG); \
	  $(DESCRIBE_CC) \
	) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo 'GPLv3+' > $@

build: $(SRC_DIRS)
	( \
	  $(MODULE_LOAD_CC); \
	  cd $(SOURCE_DIR); \
	  ./configure --prefix=$(PKGROOT); \
	  make \
	)

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	( \
	  $(MODULE_LOAD_CC); \
	  cd $(SOURCE_DIR); \
	  make prefix=$(ROOT)/$(PKGROOT) install \
	)
	$(INSTALL_LICENSE_FILES)
	# Handle gnutools inter-package file conflicts
	mv $(ROOT)/$(PKGROOT)/share/info info-autoconf
	mkdir -m 755 $(ROOT)/$(PKGROOT)/share/info
	mv info-autoconf $(ROOT)/$(PKGROOT)/share/info/autoconf
	# Cache autoconf for use by automake build
	mkdir -p -m 755 $(AUTOCONF_CACHE)
	cp -r $(ROOT)/$(PKGROOT)/* $(AUTOCONF_CACHE)/
	# Fix references to install dir in cached copy text files
	perl -pi -e "s#$(PKGROOT)#$(AUTOCONF_CACHE)#g" \
	  `find $(AUTOCONF_CACHE) -type f -exec grep -Il . {} ';'`

clean::
	rm -rf $(SOURCE_DIR) DESCRIPTION LICENSE
