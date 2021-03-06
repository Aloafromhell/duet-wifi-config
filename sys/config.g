; ##############   Configuration file for Duet WiFi    ##############
; ############## executed by the firmware on start-up  ##############
;
; Firmware Name:	RepRapFirmware for Duet 2 WiFi/Ethernet
; Firmware Electronics:	Duet WiFi 1.0 or 1.01
; Firmware Version:	2.02(RTOS) (2018-12-24b1)
; WiFi Server Version:	1.22
; Web Interface Version:	1.22.6
;
; Drive 0 as X
; Drive 1 as Y
; Drive 2 as Z -> 1st Z-motor (left one, viewed from ahead) which is normal Z
; Drive 3 as Extruder
; Drive 4 as U -> 2nd Z-motor (right one, viewd from ahead) which is now U

; ##############  General preferences  ##############
M111 S0             ; Debugging off
M667 S1             ; Select CoreXY mode
G21                 ; Work in millimetres
G90                 ; Send absolute coordinates...
M82                 ; ... and absolute extruder moves (Cura)
M555 P2             ; Set firmware compatibility to look like Marlin
M564 H0	            ; Enable moves before homing

; ##############  Network setup  ##############
M552 S0             	; Turn off network
M550 PDuetWifi      	; Set machine name
M552 S1 ; Enable network and acquire dynamic address via DHCP
M586 P0 S1          	; Enable HTTP
M586 P1 S0          	; Disable FTP
M586 P2 S0          	; Disable Telnet

; ##############  Drives  ##############
; Drives
M569 P0 S1                  ; Drive 0 (X) goes forwards
M569 P1 S1                  ; Drive 1 (Y) goes backwards
M569 P2 S1                  ; Drive 2 (Z) goes forwards
M569 P3 S0                  ; Drive 3 (E) goes backwards
M569 P4 S1                  ; Drive 4 (U) goes forwards

; ##############  Drives - Dual Z motors  ##############
M584 X0 Y1 Z2:4 U4 E3 P3    ; Driver 0 = X, 1 = Y, 2+4 = Z, 4 = U, 3 = Extruder, 3 axis visible
M671 X-50:340 Y10:10 S1.5   ; leadscrews at left and right of X axis

; ##############  Drives - Microstepping  ##############
M350 X16 Y16 Z16  I1        ; Configure microstepping with interpolation for X,Y,Z...
M350 E16 I1                 ; ...and E
M92 X100 Y100 Z398          ; Set axis steps per mm
M92 E445                    ; Set extruder steps per mm

; ##############  Drives - Other settings  ##############
M566 X1000 Y1000 Z12 E120       	; Set maximum instantaneous speed changes (mm/min)
M203 X9000 Y9000 Z600 E1200     	; Set maximum speeds (mm/min)
M201 X3000 Y3000 Z150 U150 E350		; Set accelerations (mm/s^2)
M906 X800 Y800 Z800 E850 I30		; Set motor currents (mA) and motor idle factor in per cent
M84 S30					; Set idle timeout

; ##############  Drives - Axis Limits  ##############
M208 X-10 Y0 Z0 S1              ; Set axis minima
M208 X320 Y190 Z300 S0          ; Set axis maxima

; ##############  End stops  ##############
M574 X1 Y2 Z1 U0 S0                ; Define active low and unused microswitches

; ##############  Z-Probe (BLTouch)  ##############
M307 H3 A-1 C-1 D-1             ; Remap Heater 3
M558 P5 X0 Y0 Z1 H5 F100 T2000  ; Mode 5 probe - see https://duet3d.com/wiki/Connecting_a_Z_probe#BLTouch

; G31 - Sets Z probe trigger value, offset and trigger height
;       higher Z parameter pushes the first layer into the bed
;       lower Z-parameter lifts it up
G31 X37 Y0 Z1.05 P25            ; Sensor pin offset, 25 signal threshold

; ##############  Define bed mesh grid  ##############
M557 X30:300 Y10:180 S25        ; 25mm grid with 20mm edge buffer on 300x185 bed

; M376 H2                       ; Taper off the compensation over 2mm

; ##############  Heaters  ##############
M307 H0 B0 S0.8				; Enable PWM mode (B0) for the bed heater and set PWM limit (Sx.xx)
M305 P0 T100000 B4508 C8.66e-8		; Set thermistor + ADC parameters for heater 0 (bed)
M143 H0 S160				; Set maximum bed heater temperature to 120C

M305 P1 T100000 B4388			; Set thermistor + ADC parameters for heater 1 (hotend)
M143 H1 S280				; Set maximum hotend heater temperature to 280C

; ##############  Fans  ##############
M106 P0 S0.0 I0 F500 H-1          	; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1.0 I0 F500 H1 T45		; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S1.0 I0 F500 H1 T45		; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on

; ##############  Tools  ##############
M563 P0 D0 H1               ; Define tool 0
G10 P0 X0 Y0                ; Set tool 0 axis offsets
G10 P0 R0 S0                ; Set initial tool 0 active and standby temperatures to 0C

; ##############  Custom settings  ##############
; Nothing here, move along...

; ##############  Misc  ##############
T0                          ; Select first tool

