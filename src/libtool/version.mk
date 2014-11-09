NAME           = sdsc-libtool
VERSION        = 2.4.2
RELEASE        = 3
PKGROOT        = /opt/gnu

SRC_SUBDIR     = libtool

SOURCE_NAME    = libtool
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
