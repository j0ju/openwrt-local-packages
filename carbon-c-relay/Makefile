#
# Copyright (C) 2017 Joerg Jungermann
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=carbon-c-relay
PKG_VERSION:=3.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL=https://github.com/grobian/carbon-c-relay.git
PKG_SOURCE_VERSION:=ac8cc10

PKG_INSTALL:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=Joerg Jungermann

PKG_FLAGS:=nonshared

include $(INCLUDE_DIR)/package.mk

define Package/carbon-c-relay
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Command-line tool for sharing terminal over the web
	DEPENDS:=+libpthread
	URL:=https://github.com/grobian/carbon-c-relay
	MAINTAINER:=jj+lede@02xf.org
endef

CONFIGURE_VARS += \
	CC="$(TARGET_CC)" \
	CPP="$(TARGET_CPP)" \
	LD="$(TARGET_LD)" \
  CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
	CPPFLAGS="$(TARGET_CPPFLAGS)" \
#

define Package/carbon-c-relay/conffiles
/etc/carbon-c-relay.conf
/etc/init.d/carbon-c-relay
endef


define Package/carbon-c-relay/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/carbon-c-relay.conf $(1)/etc/carbon-c-relay.conf
	#
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/carbon-c-relay.init $(1)/etc/init.d/carbon-c-relay
	#
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/relay $(1)/usr/bin/carbon-c-relay
endef

$(eval $(call BuildPackage,carbon-c-relay))

# vim: ts=2 sw=2 noet ft=make
