NAME           = sdsc-binutils
VERSION        = 2.25
RELEASE        = 1
PKGROOT        = /opt/gnu

SRC_SUBDIR     = binutils

SOURCE_NAME    = binutils
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/bin/*\\n/opt/gnu/include/*\\n/opt/gnu/lib/*\\n/opt/gnu/license-info/sdsc-binutils*\\n/opt/gnu/share/info/binutils*\\n/opt/gnu/share/locale/*/LC_MESSAGES/*\\n/opt/gnu/share/man/man1/*\\n/opt/gnu/x86_64-unknown-linux-gnu/bin/*\\n/opt/gnu/x86_64-unknown-linux-gnu/lib/ldscripts/*"
