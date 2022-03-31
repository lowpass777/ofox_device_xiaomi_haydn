#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Release name
PRODUCT_RELEASE_NAME := haydn
DEVICE_PATH := device/xiaomi/haydn
LOCAL_PATH := device/xiaomi/haydn

# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Inherit from haydn device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

#$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_NAME := twrp_haydn
PRODUCT_DEVICE := haydn
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 11i
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=haydn
