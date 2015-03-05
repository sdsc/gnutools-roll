REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Rules.mk
ifeq ($(ROLLOPTS),)
    ROLLOPTS=no
endif

$(VERSION_INC): $(VERSION_SRC)
	/bin/grep 'VERSION.*=' $(VERSION_SRC) > $@
 
build:

install:: typical-modulefile-install
	if [[ $(ROLLOPTS) == *"gnucompiler"* ]]; then \
	   cat *.module2 >> $(ROOT)/$(PKGROOT)/$(VERSION); \
        fi


clean::
	rm -f $(VERSION_INC)
