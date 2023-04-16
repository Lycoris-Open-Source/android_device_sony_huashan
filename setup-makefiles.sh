#!/bin/bash
#
# Copyright (C) 2023 The LineageOS Project
#

set -e

# Required!
export DEVICE=huashan
export VENDOR=sony
export INITIAL_COPYRIGHT_YEAR=2014

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

HELPER="$LINEAGE_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper for device
setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT"

# Copyright headers and guards
write_headers

# Sony/Device specific blobs
write_makefiles "$MY_DIR"/proprietary-files-sony.txt
printf '\n' >> "$PRODUCTMK"

# QCom common blobs
write_makefiles "$MY_DIR"/proprietary-files-qc.txt

# Vendor BoardConfig variables
printf 'USE_CAMERA_STUB := false\n' >> "$BOARDMK"

write_footers
