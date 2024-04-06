# #####################	#
#   AC3E - UTFSM      	#
#   Project:    	#
#   OSC_v3p2 layout	#
#   04-04-2024        	#
# #####################	#

if {0} {
    see no mvndiffusion
    see no mvpdiffusion
    see no mvndcontact
    see no mvpdcontact
    see no pcontact
    see no mvpsubstratepdiff
    see no mvnsubstratendiff
    see no mvpsubstratepcontact
    see no mvnsubstratencontact
    see no mvntransistor
    see no polysilicon
    see no locali
    see no viali
    see no metal1
    see no m2contact
    see no m3contact
    see no via3
    see no via4
    see no mimcap
    see no mimcap2
    see no mimcapcontact
    see no mimcap2contact
}

proc insert_std_cell { xmin xmax ymin ymax cellname } {
    global PDK_ROOT
    # getcell: create an instance of a cell with its lower-left corner aligned with the lower-left corner of the box
    box $xmin $xmax $ymin $ymax
    getcell $PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/mag/$cellname
}

proc insert_std_tap_1 { xmin xmax ymin ymax } {
    insert_std_cell $xmin $xmax $ymin $ymax sky130_fd_sc_hd__tap_1.mag
}

proc insert_std_inv_2 { xmin xmax ymin ymax } {
    insert_std_cell $xmin $xmax $ymin $ymax sky130_fd_sc_hd__inv_2.mag
}

proc insert_std_clkdlybuf4s50_2 { xmin xmax ymin ymax } {
    insert_std_cell $xmin $xmax $ymin $ymax sky130_fd_sc_hd__clkdlybuf4s50_2.mag
}

proc insert_pcell_nfet {} {
    # HOWWWWW TO DO THIS
}

proc create_osc { {xmin 0} {xmax 0} {ymin 0} {ymax 0} } {
    set w_tap_cell 0.84
    set w_inv2_cell 1.38
    set w_dly_cell 4.52

    insert_std_tap_1 $xmin $xmax $ymin $ymax

    set xmin [expr $xmin + $w_tap_cell]um
    set ymin [expr $ymin + $w_tap_cell]um

    insert_std_inv_2 $xmin $xmax $ymin $ymax
}

# Why do a main function if is not required?
# Because you can test multiple main functions that validates a specific
# part of the work

proc main {} {
    # DRC is not required when creating the layout
    drc off

    select cell OSC
    delete

    # ????
    tech unlock glass

    create_osc 10 10 10 10
    save OSC

    # DRC is required when reviewing the layout
    drc style drc(full)

}

proc main_no_osc_resiliance {} {
    # Tests if the script is blocked by "select cell OSC" if there's no OSC

    select cell OSC
    delete
    puts "If you see this, the script didn't crash and there's no more logic required"
}


#main_no_osc_resiliance
main



#box [expr $w_tap_cell + 1*$w_dly_cell]um 0um [expr $w_tap_cell + 1*$w_dly_cell]um 0um
#getcell $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__clkdlybuf4s50_2.mag
#box [expr $w_tap_cell + 2*$w_dly_cell]um 0um [expr $w_tap_cell + 2*$w_dly_cell]um 0um
#getcell $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__clkdlybuf4s50_2.mag
#box [expr $w_tap_cell + 3*$w_dly_cell]um 0um [expr $w_tap_cell + 3*$w_dly_cell]um 0um
#getcell $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__clkdlybuf4s50_2.mag
#box [expr $w_tap_cell + 4*$w_dly_cell]um 0um [expr $w_tap_cell + 4*$w_dly_cell]um 0um
#getcell $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__clkdlybuf4s50_2.mag
#box [expr $w_tap_cell + 5*$w_dly_cell]um 0um [expr $w_tap_cell + 5*$w_dly_cell]um 0um
#getcell $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__clkdlybuf4s50_2.mag
#box [expr $w_tap_cell + 6*$w_dly_cell]um 0um [expr $w_tap_cell + 6*$w_dly_cell]um 0um
#getcell $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__tap_1.mag
#getcell $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__clkdlybuf4s50_2.mag

#connect vdd and gnd
#box 0um -0.24um 28.42um 0.24um
#paint m1
#box 0um [expr 2.48]um 28.42um [expr 0.48 + 2.48]um
#paint m1

#connect cells in/out
#box 4.465um 1.075um 5.445um 1.285um
#paint li
#box [expr 4.465 + 1*$w_dly_cell]um 1.075um [expr 5.445 + 1*$w_dly_cell]um 1.285um
#paint li
#box [expr 4.465 + 2*$w_dly_cell]um 1.075um [expr 5.445 + 2*$w_dly_cell]um 1.285um
#paint li
#box [expr 4.465 + 3*$w_dly_cell]um 1.075um [expr 5.445 + 3*$w_dly_cell]um 1.285um
#paint li
#box [expr 4.465 + 4*$w_dly_cell]um 1.075um [expr 5.445 + 4*$w_dly_cell]um 1.285um
#paint li
#box [expr 4.465 + 5*$w_dly_cell]um 1.075um [expr 5.445 + 5*$w_dly_cell]um 1.285um
#paint li

#connect bulk
#box 0.085um 0.085um 0.375um  0.265um
#paint li
#box 0.085um 2.455um 0.375um  2.635um
#paint li

#complete pwell
#box 0.015um 0.190um 28.405um 0.975um
#paint pwell

#save sp_delay.mag






###################################

#LVS --> netgen -batch lvs "/foss/designs/Open3LFCC_V2_GD12V/LS_boot_20230921/sch/sp_delay_sch.spice sp_delay" "/foss/designs/Open3LFCC_V2_GD12V/magic/tcl/sp_delay_lyt.spice sp_delay" $env(PDK_ROOT)/$env(PDK)/libs.tech/netgen/sky130A_setup.tcl lvs_delay.log
# extract/ ext2spice lvs/ ext2spice
# cp ~/.xschem/simulations/sp_delay.spice ./sp_delay_sch.spice

#.include $env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice

#generate rotated version
# s + a
# rotate 180
# save sp_delay_rot.mag

