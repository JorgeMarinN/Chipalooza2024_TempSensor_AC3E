v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 60 210 60 {
lab=VIN}
N 290 60 360 60 {
lab=VOUT}
C {devices/ipin.sym} 160 60 0 0 {name=p1 lab=VIN}
C {devices/iopin.sym} 350 -40 2 0 {name=p2 lab=VDD}
C {devices/iopin.sym} 230 -40 2 0 {name=p4 lab=VSS}
C {devices/opin.sym} 360 60 0 0 {name=p5 lab=VOUT}
C {sky130_stdcells/inv_2.sym} 250 60 0 0 {name=xinvosc[0:5] VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/code_shown.sym} 90 200 0 0 {name=s1
only_toplevel=1
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
