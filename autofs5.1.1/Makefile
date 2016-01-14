# 
# Copyright (C) 2006-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
#include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=autofs5
PKG_RELEASE:=1

PKG_VERSION:=5.1.1
PKG_MD5SUM:=889c9d2f0e76f08ae0ff0d206f119098

PKG_SOURCE_URL:=http://www.kernel.org/pub/linux/daemons/autofs/v5/
PKG_SOURCE:=autofs-$(PKG_VERSION).tar.xz
PKG_BUILD_DIR:=$(BUILD_DIR)/autofs-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/autofs5
	SECTION:=Utilities
	CATEGORY:=Utilities
	TITLE:=Autofs
	URL:=http://kernel.org/
	DEPENDS:=+libpthread
endef

define Package/autofs5/description
 Autofs
endef

define Package/autofs5/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/daemon/automount $(1)/usr/sbin/automount
	$(INSTALL_DIR) $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/lookup_dir.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/lookup_file.so $(1)/usr/lib/autofs
	ln -s lookup_file.so $(1)/usr/lib/autofs/lookup_files.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/lookup_hosts.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/lookup_program.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/lookup_multi.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/lookup_userhome.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/mount_autofs.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/mount_bind.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/mount_generic.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/mount_nfs.so $(1)/usr/lib/autofs
	ln -s mount_nfs.so $(1)/usr/lib/autofs/mount_nfs4.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/mount_ext2.so $(1)/usr/lib/autofs
	ln -s mount_ext2.so $(1)/usr/lib/autofs/mount_ext3.so
	ln -s mount_ext2.so $(1)/usr/lib/autofs/mount_ext4.so
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/parse_sun.so $(1)/usr/lib/autofs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/modules/parse_amd.so $(1)/usr/lib/autofs
endef

$(eval $(call BuildPackage,autofs5))
