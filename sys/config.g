; Configuration file for Duet WiFi (firmware version 1.17)
; executed by the firmware on start-up

; General preferences
M111 S0 ; Debugging off
G21 ; Work in millimetres
G90 ; Send absolute coordinates...
M82 ; Absolute extruder moves (Cura)
M555 P2 ; Set firmware compatibility to look like Marlin
M564 H0	; Enable moves before homing

M667 S1 ; Select CoreXY mode
M208 X-14 Y0 Z0 S1 ; Set axis minima
M208 X300 Y185 Z300 S0 ; Set axis maxima

; Endstops
M574 X1 Y2 Z1 S0 ; Define active low and unused microswitches

; BLTouch Probe
M307 H3 A-1 C-1 D-1 ; Remap Heater 3
M558 P5 X0 Y0 Z1 H5 F100 T2000 ; Mode 5 probe - see https://duet3d.com/wiki/Connecting_a_Z_probe#BLTouch

; Set Z probe trigger value, offset and trigger height (higher pushes the first layer into the bed, lower lifts it up)
G31 X37 Y0 Z0.46 P25 ; Sensor pin offset, 25 signal threshold

; Mesh Bed Compensation Config
M557 X40:290 Y15:165 S50
M376 H2 ; Taper off the compensation over 2mm

; Drives
M569 P0 S1 ; Drive 0 goes forwards
M569 P1 S1 ; Drive 1 goes backwards
M569 P2 S1 ; Drive 2 goes forwards
M569 P3 S0 ; Drive 3 goes backwards
M350 X16 Y16 Z16 E16 I1 ; Configure microstepping with interpolation
M92 X100 Y100 Z398 E445 ; Set steps per mm

; Accel & Jerk
M203 X6000 Y6000 Z600 E1200 ; Set maximum speeds (mm/min)
M201 X250 Y250 Z150 E350; Set accelerations (mm/s^2)
M566 X1000 Y1000 Z12 E120 ; Set maximum instantaneous speed changes (mm/min)
M906 X800 Y800 Z800 E800 I30 ; Set motor currents (mA) and motor idle factor in per cent
M84 S30 ; Set idle timeout

; Heaters
M143 S275 ; Set maximum heater temperature to 275C
M305 P0 T100000 B3950 R4700 ; Set thermistor + ADC parameters for heater 0
M305 P1 T100000 B4388 R4700 ; Set thermistor + ADC parameters for heater 1

; Tools
M563 P0 D0 H1 ; Define tool 0
G10 P0 X0 Y0 ; Set tool 0 axis offsets
G10 P0 R0 S0 ; Set initial tool 0 active and standby temperatures to 0C

; Network
M550 PDuetWifi; Set machine name
M552 S1 ; Enable network and acquire dynamic address via DHCP

; Fans
M106 P0 S0 I0 F500 H-1 ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1 I0 F500 H1 T45 ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S1 I0 F500 H1 T45 ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on

; Custom settings are not configured

; Miscellaneous
T0 ; Select first tool
