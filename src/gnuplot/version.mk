NAME           = sdsc-gnuplot
VERSION        = 5.0.0
RELEASE        = 2
PKGROOT        = /opt/gnu

SRC_SUBDIR     = gnuplot

SOURCE_NAME    = gnuplot
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.FILES      = "/opt/gnu/bin/*\\n/opt/gnu/libexec\\n/opt/gnu/libexec/gnuplot*\\n/opt/gnu/license-info/sdsc-gnuplot*\\n/opt/gnu/share/gnuplot*\\n/opt/gnu/share/man/man1/*\\n/opt/gnu/share/texmf/tex/latex/gnuplot*"
