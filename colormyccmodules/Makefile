ARCHS = armv7 arm64
SDK = iPhoneOS8.1
TARGET = iphone:clang:latest
include theos/makefiles/common.mk

BUNDLE_NAME = ColorMyCCModules
ColorMyCCModules_FILES = ColorMyCCModules.mm 
ColorMyCCModules_FILES += HBColorPickerCell.m 
ColorMyCCModules_FILES += DarkMessagesTheme.m 
ColorMyCCModules_FILES += ccwallcustomizer2.mm
ColorMyCCModules_INSTALL_PATH = /Library/PreferenceBundles
ColorMyCCModules_FRAMEWORKS = UIKit MessageUI CoreGraphics
ColorMyCCModules_PRIVATE_FRAMEWORKS = Preferences
ColorMyCCModules_LIBRARIES += cepheiprefs cephei MobileGestalt colorpicker
ColorMyCCModules_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ColorMyCCModules.plist$(ECHO_END)
