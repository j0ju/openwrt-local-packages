# 
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=keyutils
PKG_VERSION:=1.5.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://people.redhat.com/dhowells/keyutils/
PKG_MD5SUM:=7f8ac985c45086b5fbcd12cecd23cf07

PKG_FIXUP:=libtool
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libkeyutils
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=Key utilities library
	URL:=http://people.redhat.com/dhowells/keyutils/
endef

define Package/libkeyutils/description
	Key utilities library
endef

define Package/keyutils
	SECTION:=base
	CATEGORY:=Base system
	TITLE:=Key utilities
	DEPENDS:=+libkeyutils
	URL:=http://people.redhat.com/dhowells/keyutils/
endef

define Package/keyutils/description
	Key utilities
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libkeyutils.{a,so*} $(1)/usr/lib/
endef

define Package/libkeyutils/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/libkeyutils.so* $(1)/usr/lib/
endef

define Package/keyutils/install
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/request-key.d
	$(CP) $(PKG_INSTALL_DIR)/etc/request-key.conf $(1)/etc
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/bin/keyctl $(1)/bin
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/sbin/request-key $(1)/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/share/keyutils/request-key-debug.sh $(1)/sbin/request-key-debug.sh
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/sbin/key.dns_resolver	$(1)/sbin
endef

$(eval $(call BuildPackage,libkeyutils))
$(eval $(call BuildPackage,keyutils))
