NAME           = sdsc-automake
VERSION        = 1.15
RELEASE        = 1
PKGROOT        = /opt/gnu

SRC_SUBDIR     = automake

SOURCE_NAME    = automake
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/bin/aclocal*\\n/opt/gnu/share/aclocal\\n/opt/gnu/share/aclocal-1.15\\n/opt/gnu/bin/automake*\\n/opt/gnu/license-info/sdsc-automake*\\n/opt/gnu/share/automake*\\n/opt/gnu/share/doc/automake*\\n/opt/gnu/share/info/automake*\\n/opt/gnu/share/man/man1/aclocal*\\n/opt/gnu/share/man/man1/automake*"
