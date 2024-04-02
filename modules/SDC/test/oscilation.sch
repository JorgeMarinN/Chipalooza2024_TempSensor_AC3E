v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 465 100 495 100 { lab=N1}
N 635 100 665 100 { lab=#net1}
N 480 0 480 100 { lab=N1}
N 275 100 325 100 { lab=SENS_IN}
N 360 220 360 280 { lab=VSS}
N 360 220 700 220 { lab=VSS}
N 700 200 700 220 { lab=VSS}
N 530 200 530 220 { lab=VSS}
N 360 50 360 70 { lab=VDD}
N 360 50 700 50 { lab=VDD}
N 700 50 700 70 { lab=VDD}
N 530 50 530 70 { lab=VDD}
N 360 200 360 220 { lab=VSS}
N 715 -145 715 -105 { lab=VDD}
N 750 -75 790 -75 { lab=N2}
N 745 -75 750 -75 { lab=N2}
N 805 140 835 140 { lab=VSS}
N 465 140 480 140 { lab=N1}
N 465 120 480 120 { lab=N1}
N 650 100 650 140 { lab=#net1}
N 635 140 650 140 { lab=#net1}
N 635 120 650 120 { lab=#net1}
N 480 120 480 140 { lab=N1}
N 480 100 480 120 { lab=N1}
N 270 -10 270 10 { lab=GND}
N 270 -70 360 -70 { lab=VDD}
N 360 -70 360 50 { lab=VDD}
N 805 120 835 120 { lab=VSS}
N 480 0 505 0 { lab=N1}
N 650 -75 650 100 { lab=#net1}
N 650 -75 680 -75 { lab=#net1}
N 715 -45 715 -25 { lab=VSS}
N 805 100 995 100 { lab=#net2}
N 1055 100 1135 100 { lab=SENS_IN}
N 1135 100 1135 140 { lab=SENS_IN}
N 1180 -85 1180 -45 { lab=VDD}
N 1200 -85 1200 -35 { lab=VDD}
N 1180 -5 1180 35 { lab=VSS}
N 1180 -85 1200 -85 { lab=VDD}
N 40 -10 40 10 { lab=GND}
N 40 -70 130 -70 { lab=VSS}
N 1115 120 1115 140 { lab=TOP_V}
N 1100 120 1115 120 { lab=TOP_V}
N 1155 -25 1180 -25 { lab=TOP_V}
N 1220 -25 1245 -25 { lab=SENS_IN}
N 835 120 835 140 { lab=VSS}
N 295 100 295 335 { lab=SENS_IN}
N 295 335 1210 335 { lab=SENS_IN}
N 1210 100 1210 335 { lab=SENS_IN}
N 1135 100 1210 100 { lab=SENS_IN}
N 1125 220 1125 240 { lab=VSS}
C {devices/code_shown.sym} 50 -470 0 0 {name=SPICE only_toplevel=false value="
.param VDD = 1.8
.ic v(SENS_IN) = 1.8
*.option temp = -40
.control
compose vin_var start=0k stop=2k step=0.2k
foreach val $&vin_var
  alter R_SENS $val
  tran 0.05n 10u
  run
end
*plot tran1.v(N2) tran2.v(N2) tran3.v(N2) tran4.v(N2) tran5.v(N2) tran6.v(N2) tran7.v(N2) tran8.v(N2) tran9.v(N2) tran10.v(N2) tran11.v(N2)
wrdata ringosc_RINsweep_v6p1.txt tran1.v(N2) tran2.v(N2) tran3.v(N2) tran4.v(N2) tran5.v(N2) tran6.v(N2) tran7.v(N2) tran8.v(N2) tran9.v(N2) tran10.v(N2) tran11.v(N2)
.endc"}
C {devices/res.sym} 1025 100 1 0 {name=R_SENS
value=1k
footprint=1206
device=resistor
m=1}
C {devices/ipin.sym} 275 100 0 0 {name=p1 lab=SENS_IN}
C {devices/opin.sym} 505 0 0 0 {name=p4 lab=N1}
C {devices/opin.sym} 790 -75 0 0 {name=p5 lab=N2}
C {symbol/INVandCAP.sym} 185 100 0 0 {name=XST1}
C {symbol/INVandCAP.sym} 355 100 0 0 {name=XST2}
C {symbol/INVandCAP.sym} 525 100 0 0 {name=XST3}
C {devices/lab_pin.sym} 715 -145 0 0 {name=l25 sig_type=std_logic lab=VDD}
C {symbol/BUFFMIN.sym} 640 -75 0 0 {name=XBUFFS}
C {devices/vsource.sym} 270 -40 0 0 {name=V2 value=VDD}
C {devices/gnd.sym} 270 10 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 360 -70 2 0 {name=l9 sig_type=std_logic lab=VDD}
C {symbol/CAPOSC.sym} 1035 180 0 0 {name=XCN}
C {symbol/PASSGATE.sym} 1180 -25 0 0 {name=XPG1}
C {devices/lab_pin.sym} 1180 -85 0 0 {name=l2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1180 35 0 0 {name=l1 sig_type=std_logic lab=VSS}
C {devices/vsource.sym} 40 -40 0 0 {name=V1 value=0}
C {devices/gnd.sym} 40 10 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 130 -70 2 0 {name=l4 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 715 -25 0 0 {name=l5 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 360 280 0 0 {name=l6 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1100 120 0 0 {name=l7 sig_type=std_logic lab=TOP_V}
C {devices/lab_pin.sym} 1155 -25 0 0 {name=l10 sig_type=std_logic lab=TOP_V}
C {devices/lab_pin.sym} 1245 -25 0 1 {name=l12 sig_type=std_logic lab=SENS_IN}
C {devices/lab_pin.sym} 835 140 0 1 {name=l13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1125 240 0 0 {name=l11 sig_type=std_logic lab=VSS}
C {devices/code.sym} 730 -490 0 0 {name=MODELS_TT
only_toplevel=true
spice_ignore=0
format="tcleval( @value )"
value="
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/combined/sky130.lib.spice tt
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice.tt.red tt

.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 970 -490 0 0 {name=MODELS_FF
only_toplevel=true
spice_ignore=1
format="tcleval( @value )"
value="
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/combined/sky130.lib.spice ff
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice.ff.red ff
.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hg/spice/sky130_fd_sc_hd.spice
"}
C {devices/code.sym} 850 -490 0 0 {name=MODELS_SS
only_toplevel=true
spice_ignore=1
format="tcleval( @value )"
value="
*.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/combined/sky130.lib.spice ss
.lib $env(PDK_ROOT)/$env(PDK)/libs.tech/ngspice/sky130.lib.spice.ss.red ss
.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hg/spice/sky130_fd_sc_hd.spice
"}
