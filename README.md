# Geeetech A10 Marlin 1.1.8 with BLTouch (2020 version)

This is the stock standard Geeetech A10 1.1.8 firmware from their Github [here](https://github.com/Geeetech3D/Prusa_I3_3Dprinter/tree/master/A10_marlin1.1.8_3DTtouch/Marlin).

The following items have been changed:

##### Configuration.h 
- FAN_SOFT_PWM: Part cooler fan wont run at less then 100% duty cycle unless this is enabled.
- Z_PROBE_OFFSET_FROM_EXTRUDER: Specific to my BL Touch location
- DEFAULT_XJERK: from 20->10 because it improved print quality
- DEFAULT_YJERK: from 20->10 because it improved print quality

##### Configuration_adv.h 
- THERMAL_PROTECTION_HYSTERESIS: from 4->10 because I installed [this](https://www.thingiverse.com/thing:4319230) cooler which was cooling the bed too much and causing thermal runaway error to trigger incorrectly.

## License

Marlin is published under the [GPLv3 license](https://github.com/MarlinFirmware/Marlin/blob/1.0.x/COPYING.md) because we believe in open development. The GPL comes with both rights and obligations. Whether you use Marlin firmware as the driver for your open or closed-source product, you must keep Marlin open, and you must provide your compatible Marlin source code to end users upon request. The most straightforward way to comply with the Marlin license is to make a fork of Marlin on Github, perform your modifications, and direct users to your modified fork.
