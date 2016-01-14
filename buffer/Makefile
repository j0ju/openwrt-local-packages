# 
# Copyright (C) 2006-2008 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=buffer
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://ftp.de.debian.org/debian/pool/main/b/buffer

PKG_VERSION:=1.19
PKG_MD5SUM:=b70069294bee462107fa35e7a12df28a

PKG_SOURCE:=$(PKG_NAME)_$(PKG_VERSION).orig.tar.gz

include $(INCLUDE_DIR)/package.mk

define Package/buffer
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Buffer
  DEPENDS:= +@BUSYBOX_CONFIG_GETOPT
#  MDEPENDS:=@USE_EGLIBC
endef

define Package/buffer/description
	A buffered pipe
endef

define Package/buffer/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/buffer $(1)/usr/bin
endef

$(eval $(call BuildPackage,buffer))
