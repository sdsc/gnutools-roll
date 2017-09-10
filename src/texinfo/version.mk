NAME           = sdsc-texinfo
VERSION        = 5.2
RELEASE        = 3
PKGROOT        = /opt/gnu

SRC_SUBDIR     = texinfo

SOURCE_NAME    = texinfo
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/bin/*\\n/opt/gnu/license-info/sdsc-texinfo*\\n/opt/gnu/share/info/texinfo*\\n/opt/gnu/share/locale/*/LC_MESSAGES/*\\n/opt/gnu/share/man/man[15]/*\\n/opt/gnu/share/texinfo*"
