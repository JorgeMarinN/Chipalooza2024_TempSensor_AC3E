v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 270 440 290 { lab=GND}
N 440 160 440 210 { lab=VDD}
N 540 160 540 210 { lab=VSS}
N 440 270 540 270 {
lab=GND}
N 540 320 540 370 { lab=rst}
N 470 270 470 430 {
lab=GND}
N 470 430 540 430 {
lab=GND}
N 540 480 540 530 { lab=N2_R}
N 470 430 470 590 {
lab=GND}
N 470 590 540 590 {
lab=GND}
C {devices/vsource.sym} 440 240 0 0 {name=V1 value=1.8}
C {devices/gnd.sym} 440 290 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 440 160 0 0 {name=l6 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 540 240 0 0 {name=V2 value=0}
C {devices/lab_pin.sym} 540 160 0 0 {name=l24 sig_type=std_logic lab=VSS}
C {devices/code_shown.sym} 1080 40 0 0 {name=Transient
only_toplevel=false
spice_ignore=0
value="

.tran 0.1n \{1680*period\}

.control
*tran 0.1n 10u 9.5u
*tran 0.1n 5u

* Sim worked with 10u
*tran 100n 50u

run

*plot n2_r

plot n2_r o0 o1 o2 o3 ready
.endc"}
C {devices/code_shown.sym} 610 60 0 0 {name=OPTIONS
only_toplevel=false
spice_ignore=0
value="
.option TEMP=20
.option warn=1

.param period = 4n

.ic v(o0) = 0
.ic v(o1) = 0
.ic v(o2) = 0
.ic v(o3) = 0
.ic v(o4) = 0
.ic v(o5) = 0
.ic v(o6) = 0
.ic v(o7) = 0
.ic v(o8) = 0
.ic v(o9) = 0
.ic v(o10) = 0
.ic v(ready) = 0
"}
C {devices/code.sym} 410 -130 0 0 {name=MODELS_TT
only_toplevel=true
spice_ignore=0
format="tcleval( @value )"
value="
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/combined/sky130.lib.spice tt
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice tt

*.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 650 -130 0 0 {name=MODELS_FF
only_toplevel=true
spice_ignore=1
format="tcleval( @value )"
value="
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/combined/sky130.lib.spice ff
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice.ff.red ff

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 530 -130 0 0 {name=MODELS_SS
only_toplevel=true
spice_ignore=1
format="tcleval( @value )"
value="
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/combined/sky130.lib.spice ss
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice.ss.red ss

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code_shown.sym} 870 430 0 0 {name=s1 only_toplevel=false value="
.include ../layout_clean/ONES_COUNTER_clean.spice

*  VGND VPWR clk ones[0] ones[10] ones[1] ones[2] ones[3] ones[4] 
*           ones[5] ones[6] ones[7] ones[8] ones[9] pulse ready rst ONES_COUNTER_clean

x0 VSS  VDD  N2_R o0 o10 o1 o2 o3 o4 o5 o6 o7 o8 o9 VDD   ready rst ONES_COUNTER_clean
"}
C {devices/lab_pin.sym} 540 495 0 0 {name=l1 sig_type=std_logic lab=N2_R}
C {devices/vsource.sym} 540 400 0 0 {name=Vrst value="PULSE(0 1.8 0 0.1n 0.1n \{3*period\} \{3*period\} 1)"}
C {devices/lab_pin.sym} 540 340 0 0 {name=Vrst1 sig_type=std_logic lab=rst}
C {devices/vsource.sym} 540 560 0 0 {name=Vclk value="PULSE(0 1.8 0 0.1n 0.1n \{period/2\} \{period\})"}
