NAME           = sdsc-libtool
VERSION        = 2.4.6
RELEASE        = 1
PKGROOT        = /opt/gnu

SRC_SUBDIR     = libtool

SOURCE_NAME    = libtool
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/bin/*\\n/opt/gnu/include/libltdl*\\n/opt/gnu/include/*\\n/opt/gnu/lib/*\\n/opt/gnu/license-info\\n/opt/gnu/license-info/sdsc-libtool*\\n/opt/gnu/share/aclocal/*\\n/opt/gnu/share/info/libtool*\\n/opt/gnu/share/libtool*\\n/opt/gnu/share/man/man1/*"
