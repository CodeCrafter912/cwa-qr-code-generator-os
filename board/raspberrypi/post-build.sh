#!/bin/bash

set -u
set -e

# create mountpoint for boot fs
mkdir -p $TARGET_DIR/boot

# patch config.txt file
CONFIG_TXT_FILE_PATH="$BINARIES_DIR/rpi-firmware/config.txt"

#APPEND_LINES="boot_delay=1 disable_splash=1 dtparam=audio=on"
APPEND_LINES="boot_delay=1"

for LINE in $APPEND_LINES; do
    if [ -z $(grep "$LINE" "$CONFIG_TXT_FILE_PATH")]; then
        echo $LINE >> $CONFIG_TXT_FILE_PATH
    fi
done

# patch cmdline.txt file
CMDLINE_TXT_FILE_PATH="$BINARIES_DIR/rpi-firmware/cmdline.txt"

#APPEND_PARAMETERS="logo.nologo quiet vt.global_cursor_default=0"
APPEND_PARAMETERS=""
for PARAMETER in $APPEND_PARAMETERS; do
    if [ -z $(grep "$PARAMETER" "$CMDLINE_TXT_FILE_PATH")]; then
        sed -i " 1 s/.*/& $PARAMETER/" $CMDLINE_TXT_FILE_PATH
    fi
done

#sed -i 's/console=tty1/console=tty3/g' $CMDLINE_TXT_FILE_PATH


exit 0