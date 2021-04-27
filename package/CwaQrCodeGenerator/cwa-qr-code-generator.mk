#
# Buildroot package makefile for the CWAQRCODEGENERATOR
#

#CWAQRCODEGENERATOR_SITE=/home/dorian/Documents/git/cwa-qr-code-generator
#CWAQRCODEGENERATOR_SITE_METHOD=local
CWAQRCODEGENERATOR_VERSION=v1.0.0
CWAQRCODEGENERATOR_SITE=$(call github,CodeCrafter912,cwa-qr-code-generator,$(CWAQRCODEGENERATOR_VERSION))
CWAQRCODEGENERATOR_INSTALL_TARGET=YES

define CWAQRCODEGENERATOR_CONFIGURE_CMDS
	cd $(@D) && $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(QT5_QMAKE) cwa-qr-code-generator.pro
endef

define CWAQRCODEGENERATOR_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define CWAQRCODEGENERATOR_INSTALL_STAGING_CMDS
	install -Dm0755 $(@D)/cwa-qr-code-generator $(STAGING_DIR)/usr/bin/cwa-qr-code-generator
endef

define CWAQRCODEGENERATOR_INSTALL_TARGET_CMDS
	install -Dm0755 $(@D)/cwa-qr-code-generator $(TARGET_DIR)/usr/bin/cwa-qr-code-generator
endef

define CWAQRCODEGENERATOR_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 $(BR2_EXTERNAL)/package/CwaQrCodeGenerator/S91cwa-qr-code-generator \
                $(TARGET_DIR)/etc/init.d/S91cwa-qr-code-generator
endef

$(eval $(generic-package))