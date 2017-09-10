NAME           = sdsc-autoconf
VERSION        = 2.69
RELEASE        = 5
PKGROOT        = /opt/gnu

SRC_SUBDIR     = autoconf

SOURCE_NAME    = autoconf
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/bin/auto*\\n/opt/gnu/bin/ifnames\\n/opt/gnu/license-info/sdsc-autoconf/*\\n/opt/gnu/share/autoconf/*\\n/opt/gnu/share/emacs/site-lisp/autoconf-*\\n/opt/gnu/share/info/autoconf/*\\n/opt/gnu/share/man/man1/auto*\\n/opt/gnu/share/man/man1/config.*\\n/opt/gnu/share/man/man1/ifnames.1"
