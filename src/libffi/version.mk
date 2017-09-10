NAME           = sdsc-libffi
VERSION        = 3.2.1
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
RPM.FILES      = "/opt/gnu/include/*\\n/opt/gnu/lib/pkgconfig/*\\n/opt/gnu/lib64/*\\n/opt/gnu/license-info/sdsc-libffi*\\n/opt/gnu/share/info/*\\n/opt/gnu/share/man/man3/*"
