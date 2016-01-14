# 
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=incron
PKG_VERSION:=0.5.10
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://inotify.aiken.cz/download/incron
PKG_MD5SUM:=038190dc64568883a206f3d58269b850

include $(INCLUDE_DIR)/package.mk

define Package/incron
  SECTION:=utils
  CATEGORY:=Utilities
  SUBMENU:=Filesystem
  TITLE:=Cron-like daemon which handles filesystem events
  MAINTAINER:=Zhifeng Gu <guzhifeng1979@hotmail.com>
  URL:=http://inotify.aiken.cz/
  DEPENDS:=+uclibcxx 
endef

define Package/incron/description
 incron is an "inotify cron" system. It works like the regular cron but is
 driven by filesystem events instead of time events. This package provides two
 programs, a daemon called "incrond" (analogous to crond) and a table
 manipulator "incrontab" (like "crontab").
 incron uses the Linux Kernel inotify syscalls.
 like cron, each user can edit its own incron tables.
endef

MAKE_VARS += \
	CXXFLAGS="$$$$CXXFLAGS -fno-builtin -nostdinc++ -I$(STAGING_DIR)/usr/include/uClibc++" \
	LDFLAGS="$$$$LDFLAGS -nodefaultlibs -luClibc++ -lgcc_s -lc"

#MAKE_FLAGS += \
	CXX=g++-uc

define Package/incron/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/incrond $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/incrontab $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/incrontabs
	$(INSTALL_DIR) $(1)/etc/incron.d
	$(INSTALL_DATA) ./files/incron.conf $(1)/etc
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/incron.init $(1)/etc/init.d/incron
endef

$(eval $(call BuildPackage,incron))
