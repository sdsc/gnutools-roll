NAME           = sdsc-parallel
VERSION        = 20170222
RELEASE        = 1
PKGROOT        = /opt/gnu

SRC_SUBDIR     = parallel

SOURCE_NAME    = parallel
SOURCE_SUFFIX  = tar.bz2
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS   = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/bin/*\\n/opt/gnu/license-info/sdsc-parallel*\\n/opt/gnu/share/doc/parallel*\\n/opt/gnu/share/man/man[17]/*"
