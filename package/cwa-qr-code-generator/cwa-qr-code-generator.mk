#
# Buildroot package makefile for the CWA_QR_CODE_GENERATOR
#

#CWA_QR_CODE_GENERATOR_SITE=/home/dorian/Documents/git/cwa-qr-code-generator
#CWA_QR_CODE_GENERATOR_SITE_METHOD=local
CWA_QR_CODE_GENERATOR_VERSION=v1.0.2
CWA_QR_CODE_GENERATOR_SITE=$(call github,CodeCrafter912,cwa-qr-code-generator,$(CWA_QR_CODE_GENERATOR_VERSION))
CWA_QR_CODE_GENERATOR_INSTALL_TARGET=YES

define CWA_QR_CODE_GENERATOR_CONFIGURE_CMDS
	cd $(@D) && $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(QT5_QMAKE) cwa-qr-code-generator.pro
endef

define CWA_QR_CODE_GENERATOR_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define CWA_QR_CODE_GENERATOR_INSTALL_STAGING_CMDS
	install -Dm0755 $(@D)/cwa-qr-code-generator $(STAGING_DIR)/usr/bin/cwa-qr-code-generator
endef

define CWA_QR_CODE_GENERATOR_INSTALL_TARGET_CMDS
	install -Dm0755 $(@D)/cwa-qr-code-generator $(TARGET_DIR)/usr/bin/cwa-qr-code-generator
endef

define CWA_QR_CODE_GENERATOR_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 $(BR2_EXTERNAL)/package/cwa-qr-code-generator/S91cwa-qr-code-generator \
                $(TARGET_DIR)/etc/init.d/S91cwa-qr-code-generator
endef

$(eval $(generic-package))