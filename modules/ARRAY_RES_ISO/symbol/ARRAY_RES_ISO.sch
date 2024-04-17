v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 780 10 810 10 {
lab=IN}
N 780 10 780 90 {
lab=IN}
N 780 90 810 90 {
lab=IN}
N 810 10 810 20 {
lab=IN}
N 780 50 790 50 {
lab=IN}
N 810 80 810 90 {
lab=IN}
N 640 -20 640 20 {
lab=N3}
N 640 80 640 120 {
lab=IN}
N 610 50 620 50 {
lab=B}
C {sky130_fd_pr/res_iso_pw.sym} 640 50 0 0 {name=R3
rho=3050
W=180
L=30.5
model=res_iso_pw
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_iso_pw.sym} 810 50 0 0 {name=R2
rho=3050
W=20
L=30.5
model=res_iso_pw
spiceprefix=X
mult=6}
C {devices/lab_pin.sym} 780 20 0 0 {name=l2 sig_type=std_logic lab=B}
C {devices/iopin.sym} 640 -20 0 0 {name=p2 lab=N3}
C {devices/iopin.sym} 640 120 0 0 {name=p3 lab=IN}
C {devices/iopin.sym} 610 50 2 0 {name=p1 lab=B}
