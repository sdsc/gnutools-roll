NAME           = sdsc-libunistring
VERSION        = 0.9.5
RELEASE        = 1
PKGROOT        = /opt/gnu

SRC_SUBDIR     = libunistring

SOURCE_NAME    = libunistring
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/include/*\\n/opt/gnu/include/unistring*\\n/opt/gnu/lib/*\\n/opt/gnu/license-info/sdsc-libunistring*\\n/opt/gnu/share/doc/libunistring*\\n/opt/gnu/share/info/libunistring*"
