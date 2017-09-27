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
RPM.PREFIX     = $(PKGROOT)
