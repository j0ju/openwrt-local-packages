#
# Copyright (C) 2009 Qi Hardware Inc.
# Author: Xiangfu Liu <xiangfu@qi-hardware.com>
# 
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ncmpc
PKG_VERSION:=0.20
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://downloads.sourceforge.net/musicpd/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

TARGET_CFLAGS+= \
	-std=gnu99

TARGET_LDFLAGS+= \
	-Wl,-rpath-link=$(STAGING_DIR)/usr/lib

define Package/ncmpc
    MAINTAINER:="Xiangfu Liu" <xiangfu@sharism.cc>
    TITLE:=ncmpc
    SECTION:=sound
    CATEGORY:=Sound
    DEPENDS:=+libncursesw $(ICONV_DEPENDS) $(INTL_DEPENDS) +libmpdclient +glib2
    URL:=http://mpd.wikia.com/wiki/Music_Player_Daemon_Wiki
endef

define Package/ncmpc/description
    ncmpc is a curses client for the Music Player Daemon (MPD)
endef

define Package/ncmpc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ncmpc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,ncmpc))
