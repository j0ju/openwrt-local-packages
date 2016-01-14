#
# Copyright (C) 2007 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id: Makefile 9396 2007-10-21 15:59:31Z blogic $

include $(TOPDIR)/rules.mk

PKG_NAME:=swissfileknife
PKG_VERSION:=1.5.5
PKG_RELEASE:=0.0.2

PKG_SOURCE:=sfk155.zip
#PKG_SOURCE_URL:=http://garr.dl.sourceforge.net/sourceforge/swissfileknife/
PKG_SOURCE_URL:=http://surfnet.dl.sourceforge.net/sourceforge/swissfileknife/
#PKG_MD5SUM:=74e304c76720bbaefd1b14c7bab08bd7

include $(INCLUDE_DIR)/package.mk

define Package/swissfileknife
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=swissfileknife
  DEPENDS:=+libstdcpp
endef

define Package/swissfileknife/description
	Swiss File Knife
endef

define Build/Compile
	cd "$(PKG_BUILD_DIR)"; \
		rm -rf src ; \
		mv ../sfk155 src ; \
		cd src ;\
		$(TARGET_CXX) $(TARGET_CXXFLAGS) sfk.cpp patch.cpp inst.cpp -o ../sfk
endef

define Package/swissfileknife/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sfk $(1)/usr/bin
endef

$(eval $(call BuildPackage,swissfileknife))

