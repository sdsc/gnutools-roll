NAME           = sdsc-autoconf
VERSION        = 2.69
RELEASE        = 4
PKGROOT        = /opt/gnu

SRC_SUBDIR     = autoconf

SOURCE_NAME    = autoconf
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
