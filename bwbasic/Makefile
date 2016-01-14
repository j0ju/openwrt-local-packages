# 
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=bwbasic
PKG_RELEASE:=1
PKG_SOURCE_URL:=@SF/bwbasic
PKG_VERSION:=2.50
PKG_MD5SUM:=f492ca13bd69ffbbadf7c59544cb6a8c
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).zip
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)/src

include $(INCLUDE_DIR)/package.mk

define Package/bwbasic
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=BWBasic
  URL:=http://bwbasic.sourceforge.net/
endef

define Package/bwbasic/description
 A simple basic interpreter.
endef

#CONFIGURE_ARGS += \
#	--with-linux-headers="$(LINUX_DIR)" \

define Build/Prepare
  cd $(PKG_BUILD_DIR) && ( cd ..; mv * src; rm -rf src; mkdir -p src) ;\
  $(call Build/Prepare/Default)
	mv $(PKG_BUILD_DIR)/../* $(PKG_BUILD_DIR) || : ;\
  cd $(PKG_BUILD_DIR) || exit 1 ;\
  mv configure configure.dos ; \
  tr -d '\r' < configure.dos > configure ;\
  chmod 755 configure ;\
  CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LD_FLAGS="$(TARGET_LDFLAGS)" ./configure
endef

define Package/bwbasic/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bwbasic $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/renum $(1)/usr/bin/bwrenum
endef

$(eval $(call BuildPackage,bwbasic))
