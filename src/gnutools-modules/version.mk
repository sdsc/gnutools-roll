PACKAGE     = gnutools
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 7
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/autoconf/version.mk
VERSION_INC = version.inc

GNUCOMPILER=no
ifneq ("$(ROLLOPTS)", "$(subst gnucompiler=,,$(ROLLOPTS))")
  GNUCOMPILER = $(subst gnucompiler=,,$(filter gnucompiler=%,$(ROLLOPTS)))
endif

include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
RPM.PREFIX  = $(PKGROOT)
