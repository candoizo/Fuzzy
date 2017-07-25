export THEOS_DEVICE_IP=localhost
export THEOS_DEVICE_PORT=2222
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Fuzzy
Fuzzy_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += sigh
include $(THEOS_MAKE_PATH)/aggregate.mk
