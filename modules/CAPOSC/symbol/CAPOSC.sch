v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 40 560 40 { lab=BOT}
N 140 -20 280 -20 { lab=TOP_V}
N 420 -20 560 -20 { lab=TOP_B}
N 350 40 350 80 { lab=BOT}
N 210 -60 210 -20 { lab=TOP_V}
N 490 -60 490 -20 { lab=TOP_B}
N 560 -20 680 -20 { lab=TOP_B}
N 560 40 680 40 {
lab=BOT}
C {sky130_fd_pr/cap_mim_m3_1.sym} 140 10 0 0 {name=C1_V model=cap_mim_m3_1 W=10 L=10 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 280 10 0 0 {name=C2_V model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_1.sym} 420 10 0 0 {name=C1_B model=cap_mim_m3_1 W=10 L=10 MF=1 spiceprefix=X}
C {sky130_fd_pr/cap_mim_m3_2.sym} 560 10 0 0 {name=C2_B model=cap_mim_m3_2 W=10 L=10 MF=1 spiceprefix=X}
C {devices/iopin.sym} 210 -60 3 0 {name=p1 lab=TOP_V}
C {devices/iopin.sym} 490 -60 3 0 {name=p2 lab=TOP_B}
C {devices/iopin.sym} 350 80 1 0 {name=p3 lab=BOT}
C {sky130_fd_pr/cap_mim_m3_1.sym} 680 10 0 0 {name=C3_B model=cap_mim_m3_1 W=10 L=10 MF=1 spiceprefix=X}
