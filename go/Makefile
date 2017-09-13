#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 9396 2007-10-21 15:59:31Z blogic $

include $(TOPDIR)/rules.mk

PKG_NAME:=go
PKG_VERSION:=1.7
PKG_RELEASE:=1

PKG_SOURCE:=go$(PKG_VERSION).src.tar.gz
PKG_SOURCE_URL:=https://storage.googleapis.com/golang/
PKG_MD5SUM:=a30c3bd1a7fcc6a48acfb74936a19b4c
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

READELF=:
OBJCOPY=:

define Package/go
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=go
#  DEPENDS:=@USE_GLIBC
endef

define Package/go/description
	Go
endef

define Package/go-doc
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=go-doc
  DEPENDS:=go
endef

define Package/go-doc/description
	Go docs and tests
endef

define Build/Compile
	if [ -z "$$$$GOROOT" ]; then echo "E: GOROOT environment variable not set!"; exit 1; fi
	if ! [ -x "$$$$GOROOT/bin/go" ]; then echo 'E: $$$$GOROOT/bin/go can not create binaries!'; exit 1; fi

	export GOOS=linux GOARCH=$(ARCH) GOARM=5 GO386=387 GOROOT_FINAL="/usr/lib/go" \
		GOROOT_BOOTSTRAP="$$$$GOROOT" CGO_ENABLED=1 \
		CC_FOR_TARGET="$(TARGET_CC)" CXX_FOR_TARGET="$(TARGET_CXX)"; \
			cd "$(PKG_BUILD_DIR)/src"; \
			./bootstrap.bash; \
	#

	set -x; \
	export GOOS=linux GOARCH=$(ARCH) GOARM=5 GO386=387 GOROOT_FINAL="/usr/lib/go" GOHOME="$(PKG_BUILD_DIR)" GOPATH="$(PKG_BUILD_DIR)"; \
	  go get golang.org/x/tools/cmd/godoc; \
	  go install golang.org/x/tools/cmd/godoc; \
		[ -f "$(PKG_BUILD_DIR)/bin/$$$${GOOS}_$$$$GOARCH/godoc" ] && \
		  mv "$(PKG_BUILD_DIR)/bin/$$$${GOOS}_$$$$GOARCH/godoc" "$(PKG_BUILD_DIR)/bin/godoc"; \
	#

endef

define Package/go/install
	$(INSTALL_DIR)                             $(1)/usr/lib/go
	$(INSTALL_DIR)                             $(1)/usr/lib/go/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/go     $(1)/usr/lib/go/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/gofmt  $(1)/usr/lib/go/bin
	$(CP) $(PKG_BUILD_DIR)/lib                 $(1)/usr/lib/go
	$(CP) $(PKG_BUILD_DIR)/pkg                 $(1)/usr/lib/go
	$(CP) $(PKG_BUILD_DIR)/src                 $(1)/usr/lib/go
	$(FIND) $(1)/usr/lib/go/bin                $(1)/usr/lib/go/pkg/tool -type f -exec $(STRIP) -g {} +
	:
	$(INSTALL_DIR)              $(1)/usr/bin
	$(LN) -s ../lib/go/bin/go    $(1)/usr/bin/go
	$(LN) -s ../lib/go/bin/gofmt $(1)/usr/bin/gofmt
endef

define Package/go-doc/install
	$(INSTALL_DIR)                             $(1)/usr/lib/go
	$(INSTALL_DIR)                             $(1)/usr/lib/go/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/godoc  $(1)/usr/lib/go/bin
	$(CP) $(PKG_BUILD_DIR)/doc                 $(1)/usr/lib/go
	$(CP) $(PKG_BUILD_DIR)/misc                $(1)/usr/lib/go
	$(CP) $(PKG_BUILD_DIR)/api                 $(1)/usr/lib/go
	$(CP) $(PKG_BUILD_DIR)/test                $(1)/usr/lib/go
	:
	$(INSTALL_DIR)                             $(1)/usr/bin
	$(LN) -s ../lib/go/bin/godoc               $(1)/usr/bin/godoc
	$(FIND) $(PKG_BUILD_DIR) -maxdepth 1 -type f  -name "[A-Z]*" -exec $(CP) {} $(1)/usr/lib/go \;
endef

$(eval $(call BuildPackage,go))
$(eval $(call BuildPackage,go-doc))

# vim: noexpandtab
