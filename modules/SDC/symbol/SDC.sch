v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 820 -70 820 -30 { lab=VDD}
N 960 90 1050 90 { lab=DOUT}
N 820 210 820 250 { lab=VSS}
N 570 70 660 70 { lab=SENS_IN}
N 570 -20 720 -20 { lab=N3_S}
N 550 270 720 270 { lab=#net1}
N 720 240 720 270 { lab=#net1}
N 480 270 550 270 { lab=#net1}
N 960 170 1060 170 {
lab=N2_R}
N 530 70 570 70 {
lab=SENS_IN}
N 530 50 530 70 {
lab=SENS_IN}
N 530 -20 530 -10 {
lab=N3_S}
N 530 -20 570 -20 {
lab=N3_S}
N 610 190 660 190 {
lab=REF_IN}
N 610 190 610 240 {
lab=REF_IN}
N 530 240 610 240 {
lab=REF_IN}
N 530 220 530 240 {
lab=REF_IN}
N 530 140 530 160 {
lab=#net1}
N 460 140 460 270 {
lab=#net1}
N 460 270 480 270 {
lab=#net1}
N 460 140 530 140 {
lab=#net1}
C {devices/lab_pin.sym} 530 60 2 0 {name=l5 sig_type=std_logic lab=SENS_IN}
C {devices/lab_pin.sym} 820 -70 0 0 {name=l14 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 995 90 1 0 {name=l18 sig_type=std_logic lab=DOUT}
C {devices/lab_pin.sym} 820 250 0 0 {name=l10 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 530 230 2 0 {name=l9 sig_type=std_logic lab=REF_IN}
C {symbol/INTERNAL_SDC.sym} 600 50 0 0 {name=X1}
C {devices/iopin.sym} 610 -160 0 0 {name=p2 lab=VDD}
C {devices/iopin.sym} 610 -130 0 0 {name=p3 lab=VSS}
C {devices/opin.sym} 840 -160 0 0 {name=p5 lab=DOUT}
C {devices/opin.sym} 840 -130 0 0 {name=p1 lab=N2_R}
C {devices/lab_pin.sym} 995 170 1 0 {name=l1 sig_type=std_logic lab=N2_R}
C {symbol/ARRAY_RES_ISO.sym} 530 20 0 0 {name=x2}
C {symbol/ARRAY_RES_HIGH.sym} 530 190 0 0 {name=x3}
C {devices/lab_pin.sym} 460 260 2 0 {name=l2 sig_type=std_logic lab=N3_R}
C {devices/lab_pin.sym} 610 -20 1 0 {name=l3 sig_type=std_logic lab=N3_S}
C {devices/code_shown.sym} 410 320 0 0 {name=s1
only_toplevel=1
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
C {devices/lab_pin.sym} 510 190 0 0 {name=l6 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 510 20 0 0 {name=l7 sig_type=std_logic lab=VDD}
