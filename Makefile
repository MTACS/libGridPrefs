TARGET = iphone:clang:13.0:12.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = tweakprefs

tweakprefs_FILES = PrefsListController.m TweakCustomCell.m
tweakprefs_FRAMEWORKS = UIKit
tweakprefs_PRIVATE_FRAMEWORKS = Preferences
tweakprefs_INSTALL_PATH = /Library/PreferenceBundles
tweakprefs_CFLAGS = -fobjc-arc 

include $(THEOS_MAKE_PATH)/bundle.mk
