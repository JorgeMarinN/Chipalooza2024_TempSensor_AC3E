v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 780 10 810 10 {
lab=B}
N 780 10 780 90 {
lab=B}
N 780 90 810 90 {
lab=B}
N 810 10 810 20 {
lab=B}
N 780 50 790 50 {
lab=B}
N 810 80 810 90 {
lab=B}
N 640 -20 640 20 {
lab=N3}
N 640 80 640 120 {
lab=IN}
N 610 50 620 50 {
lab=#net1}
C {devices/lab_pin.sym} 780 20 0 0 {name=l2 sig_type=std_logic lab=B}
C {devices/iopin.sym} 640 -20 0 0 {name=p2 lab=N3}
C {devices/iopin.sym} 640 120 0 0 {name=p3 lab=IN}
C {sky130_fd_pr/res_high_po_5p73.sym} 640 50 0 0 {name=R1
W=5.73
L=8
model=res_high_po_5p73
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_high_po_5p73.sym} 810 50 0 0 {name=R4
L=8
model=res_high_po_5p73
spiceprefix=X
mult=2}
C {devices/iopin.sym} 610 50 2 0 {name=p1 lab=B}
