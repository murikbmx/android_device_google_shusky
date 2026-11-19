#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# gmscompat: no microG (sandboxed Google Play is installed by the user).
# Keep partition sizing as with WITH_GMS.
WITHOUT_RESERVED_SIZE := true

# Inherit device configuration
DEVICE_CODENAME := shiba
DEVICE_PATH := device/google/shusky
VENDOR_PATH := vendor/google/shiba
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

# Battery ring around the front camera cutout (OLED screen)
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.lineage.battery_ring.supported=true

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="shiba-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildSystemDesc="generic_system_google-user 17 CP3A.261005.005 16271449 release-keys" \
    BuildFingerprint=google/shiba/shiba:17/CP3A.261005.005/16271449:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/CP3A.261005.005/16271449:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
