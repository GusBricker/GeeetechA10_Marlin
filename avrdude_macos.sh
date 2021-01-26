#!/bin/bash

MCU="atmega2560"
BAUD_RATE=115200
CONF="/Applications/Arduino.app/Contents/Java/hardware/tools/avr/etc/avrdude.conf"

function pleh()
{
    echo "Usage: avrdude_macos.sh <serial port> <hex file>"
    echo "Example: avrdude_macos.sh /dev/cu.usbserial-1410 ~/ardunio-output/Marlin.ino.hex"
    echo "This script assumes microcontroller $MCU with baud rate $BAUD_RATE"
}

PORT=$1
if [[ "x$PORT" == "x" ]]
then
    echo "Missing first argument <serial port>"
    pleh
    exit 1
fi
HEX_FILE=$2
if [[ "x$HEX_FILE" == "x" ]]
then
    echo "Missing second argument <hex file>"
    pleh
    exit 1
fi

set -ex
/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avrdude "-C$CONF" -v "-p$MCU" -cwiring "-P$PORT" "-b$BAUD_RATE" -D "-Uflash:w:$HEX_FILE:i"
