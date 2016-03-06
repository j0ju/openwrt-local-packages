#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
# we use the $LINUX_DIR variable, which is defined in kernel.mk
#include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=lirc
PKG_VERSION:=0.9.3a
PKG_MD5SUM:=f9ed5dd0684a52c7cd98672e71e81b05
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/${PKG_NAME}

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define  Package/lirc/Default
    SECTION:=utils
    CATEGORY:=Utilities
    URL:=http://lirc.org/
    DEPENDS:=+libstdcpp +libusb-compat +libusb-1.0 portaudio +AUDIO_SUPPORT:alsa-lib +libftdi1
endef

define  Package/lirc
    $(call Package/lirc/Default)
    TITLE:=LIRC - Linux Infrared Remote Control
    MENU:=1
endef

define Package/lirc/description
  LIRC is a package that allows you to decode and send
  infra-red signals of many (but not all) commonly used
  remote controls.
  
  This package contains only lircd and lircd.conf!
  
endef

CONFIGURE_ARGS += \
	--disable-static \
	--without-x \
	--with-pic \
	--with-gnu-ld \

define  Package/lirc/install
	$(INSTALL_DIR) $(1)/etc/lirc
	$(CP) $(PKG_INSTALL_DIR)/etc/lirc/* $(1)/etc/lirc
	
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.so.* $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/*.la $(1)/usr/lib
	
	$(INSTALL_DIR) $(1)/usr/bin/
	for p in \
	  ircat irexec irpipe irpty irrecord irsend irsimreceive irsimsend irw lirc-lsremotes lircrcd mode2; do \
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$$$$p $(1)/usr/bin ; \
	done
	
	$(INSTALL_DIR) $(1)/usr/lib/lirc/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lirc/plugins/*.so $(1)/usr/lib/lirc/plugins
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/lirc/plugins/*.la $(1)/usr/lib/lirc/plugins
	
	$(INSTALL_DIR) $(1)/usr/sbin/
	for p in \
	  lircd  lirc-lsplugins  lircmd; do \
		$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/$$$$p $(1)/usr/sbin ; \
	done
	
	$(INSTALL_DIR) $(1)/usr/share/lirc
	$(CP) $(PKG_INSTALL_DIR)/usr/share/lirc/lirc.hwdb $(1)/usr/share/lirc
	$(INSTALL_DIR) $(1)/usr/share/lirc/configs
	$(CP) $(PKG_INSTALL_DIR)/usr/share/lirc/configs/* $(1)/usr/share/lirc/configs
	
endef


$(eval $(call BuildPackage,lirc))
