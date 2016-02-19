# 
# Copyright (C) 2012-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=mtools
PKG_VERSION:=4.0.18

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@GNU/$(PKG_NAME)
PKG_MD5SUM:=17b9f525c1ae3583a478338deb7fbc19

HOST_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

HOST_CONFIGURE_VARS += \
	ac_cv_header_iconv_h=no

define Package/mtools
  TITLE:=mtools
  SECTION:=admin
  CATEGORY:=Administration
  DEPENDS+=libbsd
endef

define Package/mtools/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/mtools $(1)/usr/bin
	for f in \
	  mattrib mbadblocks mcat mcd mclasserase mcopy mdel mdeltree mdir mdu mformat minfo mlabel mmd mmount mmove mpartition mrd mren mshortname mshowfat mtoolstest mtype mzip; do \
		  $(LN) mtools $(1)/usr/bin/$$$$f; \
	done
endef

$(eval $(call BuildPackage,mtools))
