#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=librelp
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://download.rsyslog.com/librelp/

PKG_VERSION:=1.0.1
PKG_MD5SUM:=cebee9d81974fe38c5c6160f632f2946

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/librelp
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=librelp - a reliable logging library
  URL:=http://librelp.com/
  DEPENDS:=
endef

define Package/librelp/description
  librelp - a reliable logging library
endef

define Package/librelp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librelp.so* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/librelp.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/librelp* $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/relp.pc $(1)/usr/lib/pkgconfig/relp.pc
endef

$(eval $(call BuildPackage,librelp))
