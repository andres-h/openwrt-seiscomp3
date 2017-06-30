include $(TOPDIR)/rules.mk

PKG_NAME:=seiscomp3
PKG_VERSION:=2017.124

PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/SeisComP3/seiscomp3.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=89a1a1a941280b1baad64dbf8f455d5d0f52abf6
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_LICENSE:=GPL-2.0+, SeisComP Public License
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=GEOFON <geofon@gfz-potsdam.de>

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

CMAKE_OPTIONS += -DFLEX_INCLUDE_DIR=$(STAGING_DIR)/../host/include -DSC_DOC_GENERATE=OFF

define Build/Prepare
	$(call Build/Prepare/Default)
	for d in $(PKG_BUILD_DIR)/src/*; do echo "$$$$d" | egrep -q "system|seedlink|CMakeLists" || rm -rf "$$$$d"; done
	cp $(STAGING_DIR)/../host/include/FlexLexer.h $(PKG_BUILD_DIR)/src/seedlink/libs/slutils
endef

define Package/seiscomp3/install
	mkdir -p $(1)/root
	cp -r $(PKG_INSTALL_DIR)/usr $(1)/root/seiscomp3
endef

$(eval $(call BuildPackage,seiscomp3))
