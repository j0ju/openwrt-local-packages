#
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=netio
PKG_RELEASE:=1
PKG_VERSION:=132
PKG_SOURCE:=$(PKG_NAME)$(PKG_VERSION).zip
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/netio
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Buffer
  DEPENDS:=+libpthread
endef

define Package/netio/description
  A network performance meter
endef

define Build/Prepare
	cd $(PKG_BUILD_DIR)
	$(call Build/Prepare/Default)
endef

define Build/Compile
	cd $(PKG_BUILD_DIR); \
	make all \
    O=.o X= OUT=-o LIBS="-lpthread" \
		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -DUNIX" \
		LD="$(TARGET_LD)" LFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/netio/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/netio $(1)/usr/bin
endef

$(eval $(call BuildPackage,netio))
