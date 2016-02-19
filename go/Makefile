#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 9396 2007-10-21 15:59:31Z blogic $

include $(TOPDIR)/rules.mk

PKG_NAME:=go
PKG_VERSION:=1.6
PKG_RELEASE:=1

PKG_SOURCE:=go$(PKG_VERSION).src.tar.gz
PKG_SOURCE_URL:=https://storage.googleapis.com/golang/
PKG_MD5SUM:=e67833ea37fbc002fbe38efe6c1bcd98
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/go
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=go
  DEPENDS:=@USE_GLIBC
endef

define Package/go/description
	Go
endef

define Package/go-doc
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=go-doc
  DEPENDS:=@USE_GLIBC
endef

define Package/go-doc/description
	Go docs and tests
endef

define Build/Compile
	if [ -z "$$$$GOROOT" ]; then echo "E: GOROOT environment variable not set!"; exit 1; fi
	if ! [ -x "$$$$GOROOT/bin/go" ]; then echo 'E: $$$$GOROOT/bin/go can not create binaries!'; exit 1; fi

	export GOOS=linux GOARCH=$(ARCH) GOARM=5 GO386=387 GOROOT_FINAL="/usr/go" \
		GOROOT_BOOTSTRAP="$$$$GOROOT" CGO_ENABLED=1 \
		CC_FOR_TARGET="$(TARGET_CC)" CXX_FOR_TARGET="$(TARGET_CXX)"; \
			cd "$(PKG_BUILD_DIR)/src"; \
			./bootstrap.bash; \
	#

endef

define Package/go/install
	$(INSTALL_DIR)              $(1)/usr/go
	$(CP) $(PKG_BUILD_DIR)/bin  $(1)/usr/go
	$(CP) $(PKG_BUILD_DIR)/lib  $(1)/usr/go
	$(CP) $(PKG_BUILD_DIR)/pkg  $(1)/usr/go
	$(CP) $(PKG_BUILD_DIR)/src  $(1)/usr/go
	$(FIND) $(1)/usr/go/bin $(1)/usr/go/pkg/tool -type f -exec $(STRIP) -g {} +
	:
	$(INSTALL_DIR)              $(1)/usr/bin
	$(LN) -s ../go/bin/go    $(1)/usr/bin/go
	$(LN) -s ../go/bin/gofmt $(1)/usr/bin/gofmt
endef

define Package/go-doc/install
	$(INSTALL_DIR)                $(1)/usr/go
	$(CP) $(PKG_BUILD_DIR)/doc    $(1)/usr/go
	$(CP) $(PKG_BUILD_DIR)/misc   $(1)/usr/go
	$(CP) $(PKG_BUILD_DIR)/api    $(1)/usr/go
	$(CP) $(PKG_BUILD_DIR)/test   $(1)/usr/go
	$(FIND) $(PKG_BUILD_DIR) -maxdepth 1 -type f  -name "[A-Z]*" -exec $(CP) {} $(1)/usr/go \;
endef

$(eval $(call BuildPackage,go))
$(eval $(call BuildPackage,go-doc))

# vim: noexpandtab
