proc routing {} {
    ## DOUT to PULSE
    #1st route:
    box  -57.815um  -37.31um -56.815um -21.185um
    paint m2
    #2nd route
    box  -56.815um -37.31um -12.06um  -36.71um
    paint m2
    # Vias/Contacts manually added

    ## N2_R to CLK
    #1st route
    box  -49.510um -90.415um -16.040um -90.085um
    paint m1
    #2nd route
    box -16.640um -90.085um  -16.040um -82.950um
    paint m1
    #3rd route
    box -16.040um  -83.550um -12.040um -82.950um
    paint m1
    paint m2
    # Vias/Contacts manually added
}

proc erase_box {layer placement} {
    place $placement
    erase $layer
}

proc drawing {} {
    # routing

    ##  dnwell in square-shape
    #     _______
    #	 |	     |
    #	 |       |
    #    |_______|
    #
    box  -150.58um -93.650um 91.905um 124.37um
    paint dnwell


    ## nwell in perimeter / 1.03um over dnwell and 0.4um in psub
    # PAINTING
    #     _______
    #	  	     |
    #	         |
    #     _______|
    #
    box -150.98um -93.65um  -149.55um  124.37um
    paint nwell

    # PAINTING
    #      
    #	 |	     |
    #	 |       |
    #    |_______|
    #
    box  -150.98um 123.34um 92.305um 124.77um
    paint nwell

    # PAINTING
    #     _______
    #	 |	     
    #	 |       
    #    |_______
    #
    box  90.875um -94.050um 92.305um 124.37um
    paint nwell

    # PAINTING
    #     _______
    #	 |	     |
    #	 |       |
    #    |       |
    #
    box  -150.98um -94.050um 91.905um -92.620um
    paint nwell

    # return

    ## Adding localinterconnect and metal1
    # PAINTING
    #     _______
    #	  	     |
    #	         |
    #     _______|
    #
    # NWELL: box -150.98um -93.65um  -149.55um  124.37um
    box -150.58um -93.65um  -149.55um  124.37um
    paint m1
    paint li

    # PAINTING
    #       
    #	 |	     |
    #	 |       |
    #    |_______|
    #
    box  -150.58um 123.34um 91.905um 124.37um
    paint m1
    paint li

    # PAINTING
    #     _______
    #	 |	     
    #	 |       
    #    |_______
    #
    box  90.875um -93.650um 91.905um 124.37um
    paint m1
    paint li

    # PAINTING
    #     _______
    #	 |	     |
    #	 |       |
    #    |       |
    #
    box  -150.58um -93.650um 91.905um -92.620um
    paint m1
    paint li


    #box 0.8umx0.85um
    #paint ntap
    #box 0.2umx0.2um
    #paint ntapc x4
    #then copy through the ring/ space=10um
    #select area
    #copy north 10um
}

proc insert_bottom_gr_side { {llx 0} {lly 0} {urx 0} {ury 0} {rot 0} } {
    # lly == ury
    if {$lly != $ury} {
        puts "Coordinates are not a horizontal line."
    }

    set internal_gap 1.03
    set external_gap 0.4

    set metal_half_anchor 0.5  ; # Should be inside nwell
    set metal_shift [expr $external_gap - ($internal_gap + $external_gap)/2] ; # Should be centered in nwell

    puts "Placing DNWELL"

    set dnwell_llx [expr $llx]um
    set dnwell_urx [expr $urx]um

    set dnwell_lly [expr $lly]um
    set dnwell_ury [expr $lly + $internal_gap + 1.97]um

    box $dnwell_llx $dnwell_lly $dnwell_urx $dnwell_ury
    paint dnwell

    puts "Placing NWELL"

    # Placing nwell
    set nwell_llx [expr $llx - $external_gap]um
    set nwell_urx [expr $urx + $external_gap]um

    set nwell_lly [expr $lly - $external_gap]um
    set nwell_ury [expr $ury + $internal_gap]um

    puts "$nwell_llx $nwell_lly $nwell_urx $nwell_ury"

    box $nwell_llx $nwell_lly $nwell_urx $nwell_ury
    paint nwell

    puts "Placing li and metal"

    set metal_llx [expr $llx]um
    set metal_urx [expr $urx]um

    set metal_lly [expr $lly - $metal_shift - $metal_half_anchor]um
    set metal_ury [expr $ury - $metal_shift + $metal_half_anchor]um

    box $metal_llx $metal_lly $metal_urx $metal_ury
    # paint li
    # paint metal1

    puts "Placing taps"

    set ntap_half_width 0.8
    set ntapc_half_width 0.8

    set ntap_llx [expr $llx]um
    set ntap_lly [expr $lly]um
    set ntap_urx [expr $llx + $ntap_width]um
    set ntap_ury [expr $lly + $ntap_width]um
    box $ntap_llx $ntap_lly $ntap_urx $ntap_ury
    paint ntap
    paint ntapc

    puts "Placing contacts"

}

proc insert_top_gr_side { {llx 0} {lly 0} {urx 0} {ury 0} {rot 0} } {
    # lly == ury
    if {$lly != $ury} {
        puts "Coordinates are not a horizontal line."
    }

    set internal_gap 1.03
    set external_gap 0.4

    puts "Placing DNWELL"

    set dnwell_llx [expr $llx]um
    set dnwell_urx [expr $urx]um

    set dnwell_lly [expr $lly - $internal_gap - 1.97]um
    set dnwell_ury [expr $lly]um

    box $dnwell_llx $dnwell_lly $dnwell_urx $dnwell_ury
    paint dnwell

    puts "Placing NWELL"

    # Placing nwell
    set nwell_llx [expr $llx - $external_gap]um
    set nwell_urx [expr $urx + $external_gap]um

    set nwell_lly [expr $lly - $internal_gap]um
    set nwell_ury [expr $lly + $external_gap]um

    puts "$nwell_llx $nwell_lly $nwell_urx $nwell_ury"

    box $nwell_llx $nwell_lly $nwell_urx $nwell_ury
    paint nwell
}

proc insert_left_gr_side { {llx 0} {lly 0} {urx 0} {ury 0} {rot 0} } {
    # lly == ury
    if {$llx != $urx} {
        puts "Coordinates are not a vertical line."
    }

    set internal_gap 1.03
    set external_gap 0.4

    puts "Placing DNWELL"

    set dnwell_llx [expr $llx]um
    set dnwell_urx [expr $urx + $internal_gap + 1.97]um

    set dnwell_lly [expr $lly]um
    set dnwell_ury [expr $ury]um

    box $dnwell_llx $dnwell_lly $dnwell_urx $dnwell_ury
    paint dnwell

    puts "Placing NWELL"

    # Placing nwell
    set nwell_llx [expr $llx - $external_gap ]um
    set nwell_urx [expr $urx + $internal_gap ]um

    set nwell_lly [expr $lly - $external_gap]um
    set nwell_ury [expr $ury + $external_gap]um

    puts "$nwell_llx $nwell_lly $nwell_urx $nwell_ury"

    box $nwell_llx $nwell_lly $nwell_urx $nwell_ury
    paint nwell
}

proc insert_right_gr_side { {llx 0} {lly 0} {urx 0} {ury 0} {rot 0} } {
    # lly == ury
    if {$llx != $urx} {
        puts "Coordinates are not a vertical line."
    }

    set internal_gap 1.03
    set external_gap 0.4

    puts "Placing DNWELL"

    set dnwell_llx [expr $llx - $internal_gap - 1.97]um
    set dnwell_urx [expr $urx]um

    set dnwell_lly [expr $lly]um
    set dnwell_ury [expr $ury]um

    box $dnwell_llx $dnwell_lly $dnwell_urx $dnwell_ury
    paint dnwell

    puts "Placing NWELL"

    # Placing nwell
    set nwell_llx [expr $llx - $internal_gap ]um
    set nwell_urx [expr $urx + $external_gap ]um

    set nwell_lly [expr $lly - $external_gap]um
    set nwell_ury [expr $ury + $external_gap]um

    puts "$nwell_llx $nwell_lly $nwell_urx $nwell_ury"

    box $nwell_llx $nwell_lly $nwell_urx $nwell_ury
    paint nwell
}

grid 0.005um
snap grid
grid ; # Not visible

# insert_bottom_gr_side   0   0   6   0   0
# insert_top_gr_side      0   6   6   6   0
# insert_left_gr_side     0   0   0   6   0
# insert_right_gr_side    6   0   6   6   0

box -10um -10um 10um 10um
paint nwell

set ntapc_half_width 0.5
set licon_half_width 0.5
set mcon_half_width 0.5
set ntap_half_width  [expr $ntapc_half_width + 0.12]
set li_half_width  [expr $licon_half_width + 0.08]
set metal1_half_width  [expr $mcon_half_width + 0.03]

set ntap_llx [expr 0 - $ntap_half_width]um
set ntap_urx [expr 0 + $ntap_half_width]um
set ntap_lly [expr 0 - $ntap_half_width]um
set ntap_ury [expr 0 + $ntap_half_width]um
box $ntap_llx $ntap_lly $ntap_urx $ntap_ury
paint ntap


set ntapc_llx [expr 0 - $ntapc_half_width]um
set ntapc_urx [expr 0 + $ntapc_half_width]um
set ntapc_lly [expr 0 - $ntapc_half_width]um
set ntapc_ury [expr 0 + $ntapc_half_width]um
box $ntapc_llx $ntapc_lly $ntapc_urx $ntapc_ury
paint ntapc


set licon_llx [expr 0 - $licon_half_width]um
set licon_urx [expr 0 + $licon_half_width]um
set licon_lly [expr 0 - $licon_half_width]um
set licon_ury [expr 0 + $licon_half_width]um
box $licon_llx $licon_lly $licon_urx $licon_ury
paint licon

set li_llx [expr 0 - $li_half_width]um
set li_urx [expr 0 + $li_half_width]um
set li_lly [expr 0 - $li_half_width]um
set li_ury [expr 0 + $li_half_width]um
box $li_llx $li_lly $li_urx $li_ury
paint li

set mcon_llx [expr 0 - $mcon_half_width]um
set mcon_urx [expr 0 + $mcon_half_width]um
set mcon_lly [expr 0 - $mcon_half_width]um
set mcon_ury [expr 0 + $mcon_half_width]um
box $mcon_llx $mcon_lly $mcon_urx $mcon_ury
paint mcon

set metal1_llx [expr 0 - $metal1_half_width]um
set metal1_urx [expr 0 + $metal1_half_width]um
set metal1_lly [expr 0 - $metal1_half_width]um
set metal1_ury [expr 0 + $metal1_half_width]um
box $metal1_llx $metal1_lly $metal1_urx $metal1_ury
paint metal1



# box -$licon_half_width -$licon_half_width $licon_half_width $licon_half_width
# paint licon

# paint metal1

# box 0 0 1um 1um

# paint 


drc euclidean on
drc style drc(full)
select
drc check
#drc list 
drc catchup

return


source ../../../scripts/sky130_handlers.tcl

set name SDC_DIGITAL
cellname rename [cellname list self] $name
load $name

drawing

select
view

drc style drc(full)
drc check
drc catchup