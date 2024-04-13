v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -95 0 -70 0 { lab=VIN}
N 160 -0 185 0 { lab=VOUT}
N -70 0 -35 -0 {
lab=VIN}
N 45 -0 80 -0 {
lab=#net1}
C {devices/iopin.sym} 75 -50 3 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 75 60 1 0 {name=p2 lab=VSS}
C {devices/ipin.sym} -95 0 0 0 {name=p3 lab=VIN}
C {devices/opin.sym} 185 0 0 0 {name=p4 lab=VOUT}
C {sky130_stdcells/inv_2.sym} 120 0 0 0 {name=xinvosc VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} 5 0 0 0 {name=xinvosc1 VGND=VSS VNB=VSS VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/code_shown.sym} -190 140 0 0 {name=s1
only_toplevel=1
format="tcleval( @value )"
value="
.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
"}
