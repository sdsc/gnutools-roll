NAME           = sdsc-gdb
VERSION        = 7.9
RELEASE        = 1
PKGROOT        = /opt/gnu

SRC_SUBDIR     = gdb

SOURCE_NAME    = gdb
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/bin/*\\n/opt/gnu/include/gdb*\\n/opt/gnu/lib/gdb*\\n/opt/gnu/license-info/sdsc-gdb*\\n/opt/gnu/share/gdb*\\n/opt/gnu/share/info/gdb*\\n/opt/gnu/share/locale/gdb/*/LC_MESSAGES\*\\n/opt/gnu/share/man/man[15]/*"
