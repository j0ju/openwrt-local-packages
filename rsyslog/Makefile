#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rsyslog
PKG_RELEASE:=1
PKG_SOURCE_URL:=http://www.rsyslog.com/files/download/rsyslog/

#PKG_VERSION:=7.2.5
#PKG_MD5SUM:=4fed56e6da4d6fedfccba190ce4d294e

PKG_VERSION:=5.8.11
PKG_MD5SUM:=0e5ea5228310bebc0f9f6ddf0c3f5a84

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/rsyslog
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=rsyslog - advanced syslog server
  URL:=http://rsyslog.com/
  DEPENDS:= +libpthread +libgnutls +libz
endef

define Package/rsyslog/DefaultModule
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=rsyslog -
  DEPENDS:=+rsyslog

  define Package/rsyslog/DefaultModule/description
    rsyslog - advanced syslog server
  endef
endef

define Package/rsyslog/description
	rsyslog - advanced syslog server
endef

define Package/rsyslog-relp
	$(call Package/rsyslog/DefaultModule)
	TITLE+= relp module
	DEPENDS+= +librelp
endef

#define Package/rsyslog-omudpspoof
#	$(call Package/rsyslog/DefaultModule)
#	TITLE+= udp output module with ip spoofing
#	DEPENDS+= +libnet1
#endef

define Package/rsyslog-mysql
	$(call Package/rsyslog/DefaultModule)
	TITLE+= mysql module
	DEPENDS+= +libmysqlclient
endef

define Package/rsyslog-pgsql
	$(call Package/rsyslog/DefaultModule)
	TITLE+= pgsql module
	DEPENDS+= +libpq
endef

CONFIGURE_ARGS += \
		--disable-testbench \
		--enable-mail \
		--enable-imfile \
		--enable-impstats \
		--enable-gnutls \
		--enable-pmaixforwardedfrom \
		--enable-pmcisconames \
		--enable-pmlastmsg \
		--enable-pmrfc3164sd \
		--enable-pmsnare \
		--enable-omprog \
		--enable-omuxsock \
    --enable-imptcp \
    --enable-impstats \
    --enable-omprog \
    --enable-omstdout \
    --enable-diagtools \
    --enable-imtemplate \
    --enable-omtemplate

ifneq ($(CONFIG_PACKAGE_rsyslog-mysql),)
CONFIGURE_ARGS += --enable-mysql
endif
ifneq ($(CONFIG_PACKAGE_rsyslog-pgsql),)
CONFIGURE_ARGS += --enable-pgsql
endif
ifneq ($(CONFIG_PACKAGE_rsyslog-mysql),)
CONFIGURE_ARGS += --enable-relp
endif
ifneq ($(CONFIG_PACKAGE_rsyslog-omudpspoof),)
CONFIGURE_ARGS += --enable-omudpspoof
endif

RSYSLOG_BASE_MODULES=\
 imfile.so impstats.so imudp.so lmnetstrms.so lmregexp.so lmtcpsrv.so \
 omuxsock.so pmlastmsg.so imklog.so imuxsock.so lmnsd_gtls.so lmstrmsrv.so \
 omruleset.so pmaixforwardedfrom.so pmrfc3164sd.so \
 immark.so imtcp.so lmnet.so lmnsd_ptcp.so lmtcpclt.so ommail.so \
 omprog.so omtesting.so pmcisconames.so pmsnare.so lmzlibw.so

define Package/rsyslog/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/rsyslogd $(1)/usr/sbin/rsyslogd
	$(INSTALL_DIR) $(1)/usr/lib/rsyslog
	for mod in $(RSYSLOG_BASE_MODULES); do\
		$(CP) $(PKG_INSTALL_DIR)/usr/lib/rsyslog/$$$$mod $(1)/usr/lib/rsyslog/$$$$mod; \
	done
endef

define Package/rsyslog-relp/install
	$(INSTALL_DIR) $(1)/usr/lib/rsyslog
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/rsyslog/imrelp.so $(1)/usr/lib/rsyslog/imrelp.so
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/rsyslog/omrelp.so $(1)/usr/lib/rsyslog/omrelp.so
endef

define Package/rsyslog-mysql/install
	$(INSTALL_DIR) $(1)/usr/lib/rsyslog
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/rsyslog/ommysql.so $(1)/usr/lib/rsyslog/ommysql.so
endef

define Package/rsyslog-pgsql/install
	$(INSTALL_DIR) $(1)/usr/lib/rsyslog
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/rsyslog/ompgsql.so $(1)/usr/lib/rsyslog/ompgsql.so
endef



$(eval $(call BuildPackage,rsyslog))
$(eval $(call BuildPackage,rsyslog-relp))
$(eval $(call BuildPackage,rsyslog-mysql))
$(eval $(call BuildPackage,rsyslog-pgsql))
#$(eval $(call BuildPackage,rsyslog-omudpspoof))
