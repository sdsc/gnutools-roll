NAME           = sdsc-gnuplot
VERSION        = 5.2.2
RELEASE        = 0
PKGROOT        = /opt/gnu

SRC_SUBDIR     = gnuplot

SOURCE_NAME    = gnuplot
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
