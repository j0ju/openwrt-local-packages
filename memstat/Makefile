#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 9396 2007-10-21 15:59:31Z blogic $

include $(TOPDIR)/rules.mk

PKG_NAME:=memstat
PKG_VERSION:=0.9
PKG_RELEASE:=1

PKG_SOURCE:=memstat_$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/memstat
PKG_MD5SUM:=74e304c76720bbaefd1b14c7bab08bd7
PKG_BUILD_DIR:=$(BUILD_DIR)/memstattool

include $(INCLUDE_DIR)/package.mk

define Package/memstat
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=memory stats
endef

define Package/memstat/description
	Give some small statistics about memory usage.
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/memstat/install	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/memstat $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/memstat.conf $(1)/etc/
endef

$(eval $(call BuildPackage,memstat))

