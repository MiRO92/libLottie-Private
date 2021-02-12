TARGET := iphone:clang:latest:11.0
PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libLottie

libLottie_FILES = $(wildcard *.mm *.m)
libLottie_CFLAGS = -fobjc-arc
libLottie_INSTALL_PATH = /usr/lib

include $(THEOS_MAKE_PATH)/library.mk


before-stage::
	$(ECHO_NOTHING)find . -name ".DS_Store" -type f -delete$(ECHO_END)
	@echo ""
	@echo -ne "Removing old lib dylib... "
	@rm -f /Users/miro/theos/lib/$(LIBRARY_NAME).dylib
	@echo "Done"
	@echo -ne "Copying dylib into theos libraryies... "
	@cp -v $(THEOS_OBJ_DIR)/$(LIBRARY_NAME).dylib /Users/miro/theos/lib/$(LIBRARY_NAME).dylib &>/dev/null
	@echo "Done"
	@echo ""
