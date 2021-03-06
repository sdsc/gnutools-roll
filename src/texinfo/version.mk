NAME           = sdsc-texinfo
VERSION        = 6.5
RELEASE        = 1
PKGROOT        = /opt/gnu

SRC_SUBDIR     = texinfo

SOURCE_NAME    = texinfo
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS="AutoReq:No\\n%define _use_internal_dependency_generator 0\\n%define __find_provides %{_builddir}/%{name}-%{version}/filter-provides.sh\\n%define __find_requires %{_rpmconfigdir}/find-requires\\n%define __os_install_post %{nil}"
RPM.PREFIX     = $(PKGROOT)
