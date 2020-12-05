# Geeetech A10 Marlin 1.1.8 with BLTouch (2020 version)

This is the stock standard Geeetech A10 1.1.8 firmware from their Github [here](https://github.com/Geeetech3D/Prusa_I3_3Dprinter/tree/master/A10_marlin1.1.8_3DTtouch/Marlin) running BigTreeTech S42B steppers on the X & Y axis. I have since removed these steppers as I found they caused issues with print accuracy that the original steppers didnt have. I would not recommend anyone purchases these motors as the [source code](https://github.com/bigtreetech/BIGTREETECH-S42B-V1.0) is _very_ messy (making fixing bugs almost impossible) and the circuit diagram/pcb layout are not open source. If you are desperate for a closed loop NEMA 17, look at the [Maker Base MKS-SERVO42B](https://github.com/makerbase-mks/MKS-SERVO42B) instead (I have not tried it, but the source code is readable and circuit diagrams are available).

The following items have been changed:

##### Configuration.h 
- FAN_SOFT_PWM: Part cooler fan wont run at less then 100% duty cycle unless this is enabled.
- Z_PROBE_OFFSET_FROM_EXTRUDER: Specific to my BL Touch location
- DEFAULT_XJERK: from 20->10 because it improved print quality
- DEFAULT_YJERK: from 20->10 because it improved print quality
- FILAMENT_RUNOUT_SENSOR: Enabled to make Filament runout sensor work
- uncommented `#define FILAMENT_RUNOUT_SENSOR` to enable built in filament runout sensor. This should be enough if printing from sd card, but if using OctoPrint you will need Action Commands plugin and to make futher changes listed in Configuration_adv.h below.

##### Configuration_adv.h 
- THERMAL_PROTECTION_HYSTERESIS: from 4->10 because I installed [this](https://www.thingiverse.com/thing:4319230) cooler which was cooling the bed too much and causing thermal runaway error to trigger incorrectly.
- uncommented `#define ACTION_ON_PAUSE "pause"`
- uncommented `#define ACTION_ON_RESUME "resume"`
- uncommented `#define PARK_HEAD_ON_PAUSE`: Wont send action:pause correctly to OctoPrint without this uncommented.

### Filament Runout  & OctoPrint

Action Commands plugin must be installed for Filament Runout to work with action:pause that Marlin will send when the filament runs out. I also observed a bug in that the filament runout sensor will only ever trigger once during a print, this means if you went thru more then two spools you might not detect runout of the second spool.

## License

Marlin is published under the [GPLv3 license](https://github.com/MarlinFirmware/Marlin/blob/1.0.x/COPYING.md) because we believe in open development. The GPL comes with both rights and obligations. Whether you use Marlin firmware as the driver for your open or closed-source product, you must keep Marlin open, and you must provide your compatible Marlin source code to end users upon request. The most straightforward way to comply with the Marlin license is to make a fork of Marlin on Github, perform your modifications, and direct users to your modified fork.
