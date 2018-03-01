include $(TOPDIR)/rules.mk

PKG_NAME:=seiscomp3
PKG_VERSION:=2017.334

PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/SeisComP3/seiscomp3.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=708608ebf0c283348ffc9088751427d4bb5075bb
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_LICENSE:=GPL-2.0+, SeisComP Public License
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=GEOFON <geofon@gfz-potsdam.de>
PKG_BUILD_DEPENDS:=+python-base

CMAKE_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/seiscomp3
  SECTION:=applications
  CATEGORY:=SeisComP 3
  TITLE:=SC3 acquisition module
  URL:=https://www.seiscomp3.org
  DEPENDS:=+libstdcpp +libpthread +librt +libxml2-seiscomp3 +python-light +python-logging +python-openssl
endef

define Package/seiscomp3/description
  SeisComP is a seismological software for data acquisition, processing,
  distribution and interactive analysis. This package contains the acquisition
  module only.
endef

define Package/seiscomp2
  SECTION:=applications
  CATEGORY:=SeisComP 3
  TITLE:=SC2.5 acquisition module
  URL:=https://www.seiscomp3.org
  DEPENDS:=+libstdcpp +libpthread +librt +libxml2-seiscomp3 +bash
endef

define Package/seiscomp2/description
$(call Package/seiscomp3/description)

  This package contains the SC2.5 bash scripts instead of the newer SC3
  Python-based CLI.
endef

CMAKE_OPTIONS += -DFLEX_INCLUDE_DIR=$(STAGING_DIR)/../host/include -DSC_DOC_GENERATE=OFF

define Build/Prepare
	$(call Build/Prepare/Default)
	for d in $(PKG_BUILD_DIR)/src/*; do echo "$$$$d" | egrep -q "/(system|seedlink|CMakeLists\.txt)$$$$" || $(RM) -r "$$$$d"; done
	$(CP) $(STAGING_DIR)/../host/include/FlexLexer.h $(PKG_BUILD_DIR)/src/seedlink/libs/slutils/
endef

define Package/seiscomp3/install
	$(INSTALL_DIR) $(1)/root/seiscomp3
	$(CP) $(PKG_INSTALL_DIR)/usr/* $(1)/root/seiscomp3/
endef

define Package/seiscomp2/install
	$(INSTALL_DIR) $(1)/root/seiscomp
	$(CP) ./files/seiscomp/* $(1)/root/seiscomp/
	$(INSTALL_DIR) $(1)/root/seiscomp/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/run_with_lock $(1)/root/seiscomp/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/trylock $(1)/root/seiscomp/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/waitlock $(1)/root/seiscomp/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/timeout $(1)/root/seiscomp/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/slinktool $(1)/root/seiscomp/bin/
	$(INSTALL_DIR) $(1)/root/seiscomp/acquisition/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/load_timetable $(1)/root/seiscomp/acquisition/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/slarchive $(1)/root/seiscomp/acquisition/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/sbin/seedlink $(1)/root/seiscomp/acquisition/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/share/plugins/seedlink/* $(1)/root/seiscomp/acquisition/bin/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libmseed.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,seiscomp3))
$(eval $(call BuildPackage,seiscomp2))
