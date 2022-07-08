#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2022 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="haydn"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w \"$FDEVICE\")
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export OF_USE_GREEN_LED=0
        export FOX_ENABLE_APP_MANAGER=0
   	export TW_DEFAULT_LANGUAGE="en"
	export LC_ALL="C"
 	export ALLOW_MISSING_DEPENDENCIES=true
	export TARGET_DEVICE_ALT="haydnin"
	export OF_TARGET_DEVICES="haydnin,haydn"
	export OF_VIRTUAL_AB_DEVICE=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export OF_ENABLE_LPTOOLS=1
	export FOX_USE_NANO_EDITOR=1
    export OF_QUICK_BACKUP_LIST="/boot;/data;"
    export FOX_DELETE_AROMAFM=1
	#export FOX_BUILD_FULL_KERNEL_SOURCES=1

	# use magisk 24.3 for the magisk addon
	export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v24.3.zip

	# screen settings
	export OF_SCREEN_H=2400
	export OF_STATUS_H=100
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
  	export OF_HIDE_NOTCH=1
	export OF_CLOCK_POS=1

	# maximum permissible splash image size (in kilobytes)
	#export OF_SPLASH_MAX_SIZE=2048

	# run a process after formatting data to recreate /data/media/0 (only when forced-encryption is being disabled)
	export OF_RUN_POST_FORMAT_PROCESS=1

	# ensure that /sdcard is bind-unmounted before f2fs data repair or format
	export OF_UNBIND_SDCARD_F2FS=1

	# instruct magiskboot v24+ to always patch the vbmeta header when patching the recovery/boot image; do *not* remove!
    export OF_PATCH_VBMETA_FLAG="1"

	# no special MIUI stuff
    export OF_VANILLA_BUILD=1
	export OF_NO_MIUI_PATCH_WARNING=1

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#

