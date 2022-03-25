#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit from haydn device
$(call inherit-product, device/xiaomi/haydn/device.mk)

$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_NAME :=twrp_haydn
PRODUCT_DEVICE := haydn
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 11i
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=haydn
