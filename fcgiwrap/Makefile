#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fcgiwrap
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.xz
PKG_SOURCE_URL:= http://http.debian.net/debian/pool/main/f/fcgiwrap/
PKG_MD5SUM:=7ccf9b7c6127b86260e8f16cb8eaa696

PKG_LICENSE:=GPL-2.0+
PKG_LICENSE_FILES:=COPYING

PKG_INSTALL:=1

PKG_FIXUP:=autoreconf

include $(INCLUDE_DIR)/package.mk

define Package/fcgiwrap
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Web Servers/Proxies
  TITLE:=FCGIwrap to execute CGI unter FCGI API
  DEPENDS:=+fcgi +spawn-fcgi
endef

define Package/fcgiwrap/description
 FCGIwrap to execute CGI unter FCGI API
endef

CONFIGURE_ARGS+= \
	--disable-debug \

define Package/fcgiwrap/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/usr/sbin/fcgiwrap $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/init.d
	#$(INSTALL_BIN) ./files/fcgiwrap.init $(1)/etc/init.d/fcgiwrap
endef

$(eval $(call BuildPackage,fcgiwrap))
