NAME           = sdsc-bdwgc
VERSION        = 7.2alpha7
RELEASE        = 3
PKGROOT        = /opt/gnu

SRC_SUBDIR     = bdwgc

SOURCE_NAME    = bdwgc
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
