include $(TOPDIR)/rules.mk

PKG_NAME:=cube
#PKG_VERSION:=2017.306
PKG_RELEASE:=2018.106

PKG_SOURCE:=cube-plugin-2016-343.01-src.tar.gz
PKG_SOURCE_URL:=https://geofon.gfz-potsdam.de/software/cube/
PKG_HASH:=91fbce39ebca8005216c6efd65784eb041b7a8738aee8817f9a8d638cf6d130a

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/cubeplugin3
  SECTION:=applications
  CATEGORY:=SeisComP 3
  TITLE:=Cube plugin for SC3
  URL:=https://www.seiscomp3.org
  DEPENDS:=+libstdcpp
endef

define Package/cubeplugin3/description
  SeisComP is a seismological software for data acquisition, processing,
  distribution and interactive analysis. This package contains the cube
  plugin.
endef

define Package/cubeplugin2
  SECTION:=applications
  CATEGORY:=SeisComP 3
  TITLE:=Cube plugin for SC2.5
  URL:=https://www.seiscomp3.org
  DEPENDS:=+libstdcpp
endef

define Package/cubeplugin2/description
$(call Package/cubeplugin3/description)
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	$(CP) $(STAGING_DIR)/../host/include/FlexLexer.h $(PKG_BUILD_DIR)/3rd-party/slutils/
	for lib in assert bind chrono config container_hash core date_time detail filesystem function integer move mpl numeric_conversion predef preprocessor ratio smart_ptr static_assert system thread throw_exception type_index type_traits utility; do curl -Ls "https://github.com/boostorg/$$$$lib/tarball/boost-1.67.0" | tar --strip-components=2 --wildcards -C $(PKG_BUILD_DIR) -xzf - "*/include/boost"; done
endef

define Build/Install
endef

define Package/cubeplugin3/install
	$(INSTALL_DIR) $(1)/root/seiscomp3/share/plugins/seedlink
	$(CP) $(PKG_BUILD_DIR)/cube_plugin $(1)/root/seiscomp3/share/plugins/seedlink/
endef

define Package/cubeplugin2/install
	$(INSTALL_DIR) $(1)/root/seiscomp/acquisition/bin
	$(CP) $(PKG_BUILD_DIR)/cube_plugin $(1)/root/seiscomp/acquisition/bin/
endef

$(eval $(call BuildPackage,cubeplugin3))
$(eval $(call BuildPackage,cubeplugin2))
