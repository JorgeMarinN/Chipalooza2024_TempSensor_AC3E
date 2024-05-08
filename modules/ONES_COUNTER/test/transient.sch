v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 270 440 290 { lab=GND}
N 440 160 440 210 { lab=VDD}
N 960 30 960 70 { lab=VDD}
N 960 90 1050 90 { lab=DOUT}
N 540 160 540 210 { lab=VSS}
N 960 130 960 170 { lab=VSS}
N 440 270 540 270 {
lab=GND}
N 960 110 1050 110 { lab=N2_R}
N 540 320 540 370 { lab=rst}
N 470 270 470 430 {
lab=GND}
N 470 430 540 430 {
lab=GND}
C {devices/vsource.sym} 440 240 0 0 {name=V1 value=1.8}
C {devices/gnd.sym} 440 290 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 440 160 0 0 {name=l6 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 960 30 0 0 {name=l14 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 995 90 1 0 {name=l18 sig_type=std_logic lab=DOUT}
C {devices/vsource.sym} 540 240 0 0 {name=V2 value=0}
C {devices/lab_pin.sym} 540 160 0 0 {name=l24 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 960 170 0 0 {name=l10 sig_type=std_logic lab=VSS}
C {symbol/SDC.sym} 810 90 0 0 {name=X1}
C {devices/code_shown.sym} 1080 40 0 0 {name=Transient
only_toplevel=false
spice_ignore=0
value="
.control
*tran 0.1n 10u 9.5u
tran 0.1n 1u
plot n2_r dout rst
plot o0 o1 o2 o3 o4 o5 o6 o7 o8 o9 o10
wrdata data.txt dout
.endc"}
C {devices/code_shown.sym} 700 450 0 0 {name=OPTIONS
only_toplevel=false
spice_ignore=0
value="
.option TEMP=20
.option warn=1

.ic v(x1.SENS_IN) = 0
.ic v(x1.REF_IN) = 1.8
"}
C {devices/code.sym} 410 -130 0 0 {name=MODELS_TT
only_toplevel=true
spice_ignore=0
format="tcleval( @value )"
value="
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice tt

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 650 -130 0 0 {name=MODELS_FF
only_toplevel=true
spice_ignore=1
format="tcleval( @value )"
value="
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice ff

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 530 -130 0 0 {name=MODELS_SS
only_toplevel=true
spice_ignore=1
format="tcleval( @value )"
value="
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice ss

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code_shown.sym} 670 200 0 0 {name=s1 only_toplevel=false value="
*.include ../../../spice/ONES_COUNTER_xspice.spice
.include ../../../spice/ONES_COUNTER_clean.spice

*  a_VGND a_VPWR a_clk a_ones_0_ a_ones_10_ a_ones_1_ a_ones_2_ a_ones_3_ a_ones_4_ a_ones_5_ a_ones_6_ a_ones_7_ a_ones_8_ a_ones_9_ 
*  +                                                     a_pulse a_ready a_rst ONES_COUNTER_clean

*  VGND   VPWR   clk   ones[0] ones[10] ones[1] ones[2] ones[3] ones[4] ones[5] ones[6] ones[7] ones[8] ones[9] 
*  +                                                     pulse   ready   rst   ONES_COUNTER_clean

x0 VSS    VDD    N2_R  o0 o10 o1 o2 o3 o4 o5 o6 o7 o8 o9 DOUT    ready   rst   ONES_COUNTER_clean
"}
C {devices/lab_pin.sym} 985 110 3 0 {name=l1 sig_type=std_logic lab=N2_R}
C {devices/vsource.sym} 540 400 0 0 {name=Vrst value="PULSE(0 1.8 0 0.1n 0.1n 20n 30n 1)"}
C {devices/lab_pin.sym} 540 320 0 0 {name=Vrst1 sig_type=std_logic lab=rst
value=PULSE()}
