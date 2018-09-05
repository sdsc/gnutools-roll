REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Rules.mk

$(VERSION_INC): $(VERSION_SRC)
	/bin/grep 'VERSION.*=' $(VERSION_SRC) > $@
 
build:

install:: typical-modulefile-install
	if test "$(GNUCOMPILER)" = "yes"; then \
            echo "prepend-path PATH /opt/gnu/gcc/bin" >> $(ROOT)/$(PKGROOT)/$(VERSION); \
            echo "prepend-path LD_LIBRARY_PATH /opt/gnu/gcc/lib64:/opt/gnu/gmp/lib:/opt/gnu/mpfr/lib:/opt/gnu/mpc/lib" >> $(ROOT)/$(PKGROOT)/$(VERSION); \
        fi


clean::
	rm -f $(VERSION_INC)
