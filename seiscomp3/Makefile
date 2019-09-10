include $(TOPDIR)/rules.mk

PKG_NAME:=seiscomp3
PKG_VERSION:=2019.252

PKG_RELEASE=$(PKG_SOURCE_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/andres-h/seiscomp3.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=4486235150c6b2521264e5c7a9858171d08b272b
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

$(eval $(call BuildPackage,seiscomp3))
