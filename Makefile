INSTALL_TARGET_PROCESSES = Maple

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YM.Subscriber

${TWEAK_NAME}_FILES = YM.Subscriber.xm
${TWEAK_NAME}_CFLAGS = -fobjc-arc
${TWEAK_NAME}_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
