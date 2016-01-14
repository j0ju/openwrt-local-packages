#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 9396 2007-10-21 15:59:31Z blogic $

include $(TOPDIR)/rules.mk

PKG_NAME:=tinysid
PKG_VERSION:=0.94
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://google.de/
PKG_MD5SUM:=74e304c76720bbaefd1b14c7bab08bd7

include $(INCLUDE_DIR)/package.mk


define Package/tinysid
	SECTION:=sound
	CATEGORY:=Sound
	TITLE:=tinysid
      DEPENDS:=+libpthread
endef

define Package/tinysid/description
	a tiny SID player
endef

define Package/tinysid/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tinysid $(1)/usr/bin
endef

$(eval $(call BuildPackage,tinysid))

