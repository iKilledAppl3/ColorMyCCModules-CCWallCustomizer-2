ARCHS = armv7 arm64
TARGET = iphone:clang:latest
SDK = iPhoneOS8.1
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

TWEAK_NAME = ColorMyCCModules
ColorMyCCModules_FILES = Tweak.xm
ColorMyCCModules_FILES += CCWallCustomizer2.xm
ColorMyCCModules_FRAMEWORKS = UIKit CoreGraphics
ColorMyCCModules_LIBRARIES += cephei colorpicker
ColorMyCCModules += -Wl,-segalign,4000
ColorMyCCModules_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += colormyccmodules
include $(THEOS_MAKE_PATH)/aggregate.mk
