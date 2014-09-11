NAME           = opt-libffi
VERSION        = 3.0.13
RELEASE        = 1
PKGROOT        = /opt/gnu

SRC_SUBDIR     = libffi

SOURCE_NAME    = libffi
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
