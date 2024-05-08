v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {symbol/SDC.sym} -710 -350 0 0 {name=x1}
C {devices/lab_pin.sym} -560 -350 2 0 {name=p1 sig_type=std_logic lab=PULSE}
C {devices/lab_pin.sym} -560 -330 2 0 {name=p2 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} -560 -310 2 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -480 -390 0 0 {name="Clean Simulation"
spice_ignore=0
only_toplevel=false
value="

*.include ./ONES_COUNTER/spice/ONES_COUNTER.spice
* .include ../../ONES_COUNTER/spice/ONES_COUNTER.spice
.include ../../../ONES_COUNTER/spice/ONES_COUNTER.spice

*  VGND VPWR clk  rst pulse ready ones[0] ones[1] ones[2] ones[3] ones[4] ones[5]
* + ones[6] ones[7] ones[8] ones[9] ones[10] ONES_COUNTER

x0 
+ vss  vdd
+ CLK  rst PULSE ready 
+ ones_0 ones_10 ones_1 ones_2 ones_3 ones_4 ones_5 ones_6 ones_7 ones_8 ones_9 
+ ONES_COUNTER
"}
C {devices/lab_pin.sym} -560 -370 2 0 {name=p4 sig_type=std_logic lab=vdd}
C {devices/iopin.sym} -790 -520 0 0 {name=p5 lab=vdd}
C {devices/iopin.sym} -790 -490 0 0 {name=p6 lab=vss}
C {devices/ipin.sym} -670 -520 0 0 {name=p7 lab=rst}
C {devices/opin.sym} -640 -560 0 0 {name=p8 lab=ready}
C {devices/opin.sym} -640 -530 0 0 {name=p9 lab=ones_0}
C {devices/opin.sym} -640 -500 0 0 {name=p10 lab=ones_1}
C {devices/opin.sym} -640 -470 0 0 {name=p11 lab=ones_2}
C {devices/opin.sym} -640 -440 0 0 {name=p12 lab=ones_3}
C {devices/opin.sym} -550 -530 0 0 {name=p13 lab=ones_4}
C {devices/opin.sym} -550 -500 0 0 {name=p14 lab=ones_5}
C {devices/opin.sym} -550 -470 0 0 {name=p15 lab=ones_6}
C {devices/opin.sym} -550 -440 0 0 {name=p16 lab=ones_7}
C {devices/opin.sym} -460 -530 0 0 {name=p17 lab=ones_8}
C {devices/opin.sym} -460 -500 0 0 {name=p18 lab=ones_9}
C {devices/opin.sym} -460 -470 0 0 {name=p19 lab=ones_10}
