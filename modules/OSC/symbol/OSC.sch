v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 0 140 140 { lab=SENS_IN}
N 290 -0 320 0 { lab=N1}
N 840 0 870 0 { lab=#net1}
N 1010 0 1080 0 { lab=N3}
N 140 140 700 140 { lab=SENS_IN}
N 305 -100 305 0 { lab=N1}
N 305 -100 500 -100 { lab=N1}
N 855 -80 855 0 { lab=#net1}
N 100 0 150 0 { lab=SENS_IN}
N 185 120 185 180 { lab=VSS}
N 185 120 525 120 { lab=VSS}
N 905 100 905 120 { lab=VSS}
N 735 100 735 120 { lab=VSS}
N 185 -50 185 -30 { lab=VDD}
N 185 -50 525 -50 { lab=VDD}
N 905 -50 905 -30 { lab=VDD}
N 735 -50 735 -30 { lab=VDD}
N 185 -80 185 -50 { lab=VDD}
N 185 100 185 120 { lab=VSS}
N 1245 -150 1245 -110 { lab=VDD}
N 1245 -50 1245 -10 { lab=VSS}
N 1280 -80 1320 -80 { lab=N2}
N 1275 -80 1280 -80 { lab=N2}
N 1010 40 1040 40 { lab=CON_CV}
N 290 40 305 40 { lab=N1}
N 290 20 305 20 { lab=N1}
N 855 0 855 40 { lab=#net1}
N 840 40 855 40 { lab=#net1}
N 840 20 855 20 { lab=#net1}
N 305 20 305 40 { lab=N1}
N 305 -0 305 20 { lab=N1}
N 1010 20 1080 20 { lab=SENS_IN}
N 1080 20 1080 140 { lab=SENS_IN}
N 855 -80 1210 -80 { lab=#net1}
N 525 120 735 120 {
lab=VSS}
N 735 120 905 120 {
lab=VSS}
N 700 140 1080 140 {
lab=SENS_IN}
N 525 -50 905 -50 {
lab=VDD}
N 355 100 355 120 { lab=VSS}
N 355 -50 355 -30 { lab=VDD}
N 460 40 475 40 { lab=#net2}
N 460 20 475 20 { lab=#net2}
N 475 20 475 40 { lab=#net2}
N 475 0 475 20 { lab=#net2}
N 550 100 550 120 { lab=VSS}
N 550 -50 550 -30 { lab=VDD}
N 655 40 670 40 { lab=#net3}
N 655 20 670 20 { lab=#net3}
N 670 20 670 40 { lab=#net3}
N 670 0 670 20 { lab=#net3}
N 460 -0 515 0 {
lab=#net2}
N 655 0 700 0 {
lab=#net3}
C {devices/ipin.sym} 100 0 0 0 {name=p1 lab=SENS_IN}
C {devices/iopin.sym} 185 -80 3 0 {name=p2 lab=VDD}
C {devices/iopin.sym} 185 180 1 0 {name=p3 lab=VSS}
C {devices/opin.sym} 500 -100 0 0 {name=p4 lab=N1}
C {devices/opin.sym} 1320 -80 0 0 {name=p5 lab=N2}
C {devices/iopin.sym} 1040 40 0 0 {name=p6 lab=CON_CV}
C {symbol/INVandCAP.sym} 10 0 0 0 {name=XST1}
C {symbol/INVandCAP.sym} 560 0 0 0 {name=XST2}
C {symbol/INVandCAP.sym} 730 0 0 0 {name=XST3}
C {devices/lab_pin.sym} 1245 -150 0 0 {name=l25 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1245 -10 0 0 {name=l29 sig_type=std_logic lab=VSS}
C {symbol/BUFFMIN.sym} 1170 -80 0 0 {name=XBUFFS}
C {devices/opin.sym} 1080 0 0 0 {name=p7 lab=N3}
C {symbol/INVandCAP.sym} 180 0 0 0 {name=XST1B}
C {symbol/INVandCAP.sym} 375 0 0 0 {name=XST1C}
C {devices/code_shown.sym} 60 240 0 0 {name=s1
only_toplevel=1
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
