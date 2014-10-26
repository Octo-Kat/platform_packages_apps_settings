LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_JAVA_LIBRARIES := bouncycastle conscrypt telephony-common telephony-msim
LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4 android-support-v13 jsr305

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
        $(call all-java-files-under, src) \
        src/com/android/settings/EventLogTags.logtags

LOCAL_SRC_FILES += \
        src/com/android/display/IPPService.aidl

LOCAL_PACKAGE_NAME := Settings
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

LOCAL_AAPT_INCLUDE_ALL_RESOURCES := true
LOCAL_AAPT_FLAGS += --auto-add-overlay \
                    --extra-packages com.koushikdutta.superuser \
                    --extra-packages com.koushikdutta.widgets \
                    --extra-packages com.oct.tentacles \
                    --extra-packages com.brewcrewfoo.performance

LOCAL_SRC_FILES += $(call all-java-files-under, ../../../external/koush/Superuser/Superuser/src) \
                   $(call all-java-files-under, ../../../external/koush/Widgets/Widgets/src) \
                   $(call all-java-files-under, ../Tentacles/src) \
                   $(call all-java-files-under, ../PerformanceControl/src)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res \
                      $(LOCAL_PATH)/../Tentacles/res \
                      $(LOCAL_PATH)/../../../external/koush/Widgets/Widgets/res \
                      $(LOCAL_PATH)/../../../external/koush/Superuser/Superuser/res \
                      $(LOCAL_PATH)/../PerformanceControl/res

LOCAL_ASSET_DIR += $(LOCAL_PATH)/../PerformanceControl/assets

LOCAL_JAVA_LIBRARIES += org.cyanogenmod.hardware

include $(BUILD_PACKAGE)

# Use the following include to make our test apk.
include $(call all-makefiles-under,$(LOCAL_PATH))
