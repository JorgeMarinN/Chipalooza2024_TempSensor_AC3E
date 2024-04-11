v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 60 -10 120 -10 { lab=N1_R}
N 60 30 120 30 { lab=#net1}
N 0 -90 0 -50 { lab=VDD}
N 120 30 200 30 { lab=#net1}
N -100 30 -60 30 { lab=REF_IN}
N -140 -120 -140 -80 { lab=VDD}
N -120 -120 -120 -70 { lab=VDD}
N -140 -40 -140 0 { lab=VSS}
N -80 -60 -80 -10 { lab=#net2}
N -180 -60 -140 -60 { lab=REF_IN}
N -180 30 -100 30 { lab=REF_IN}
N -140 -120 -120 -120 { lab=VDD}
N -100 -60 -80 -60 { lab=#net2}
N -80 -10 -60 -10 { lab=#net2}
N 0 70 0 110 { lab=VSS}
N -180 -60 -180 30 { lab=REF_IN}
N 60 40 120 40 { lab=N3_R}
N -330 -50 -330 -30 { lab=REF_IN}
N -370 -80 -350 -80 { lab=REF_IN}
N -370 -80 -370 -40 { lab=REF_IN}
N -370 -40 -330 -40 { lab=REF_IN}
N -400 -110 -330 -110 { lab=#net3}
N -490 -110 -400 -110 { lab=#net3}
N -330 -30 -330 30 {
lab=REF_IN}
N -330 30 -180 30 {
lab=REF_IN}
N 120 40 120 160 {}
N -490 160 120 160 {}
N -490 -110 -490 160 {}
C {OSC_v7p1.sym} -120 10 0 0 {name=XOSC_REF}
C {devices/lab_pin.sym} 120 -10 2 0 {name=l11 sig_type=std_logic lab=N1_R}
C {devices/lab_pin.sym} 0 -90 0 0 {name=l14 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -180 10 0 0 {name=l9 sig_type=std_logic lab=REF_IN}
C {PASSGATE_v1p2.sym} -140 -60 0 0 {name=XPG1}
C {devices/lab_pin.sym} -140 -120 0 0 {name=l2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -140 0 0 0 {name=l8 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 0 110 0 0 {name=l20 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 120 40 2 0 {name=l13 sig_type=std_logic lab=N3_R}
C {sky130_fd_pr/res_high_po_5p73.sym} -330 -80 0 0 {name=R1
W=5.73
L=8
model=res_high_po_5p73
spiceprefix=X
mult=1}
