# Copyright 2024 Chip USM - UTFSM
# Developed by: Aquiles Viza
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#----------------------------------------------------------------
# Helper functions
#----------------------------------------------------------------

puts "Imported sky130_handlers"

proc separation_handler {} {
    puts "---------------------------------"
}

proc default_placement { {llx 0} {lly 0} {urx 0} {ury 0} {rot 0} {half_overlap 0.19} } {
    # This default parameters SHOULD NOT be specified with "um". That's going to be implicit
    # The overlap is used mainly on standard cells, because that's a gap of wells (I guess)

    return [dict create \
        llx [ expr int([magic::u2l $llx]) ] \
        lly [ expr int([magic::u2l $lly]) ] \
        urx [ expr int([magic::u2l $urx]) ] \
        ury [ expr int([magic::u2l $ury]) ] \
        rot $rot \
        half_overlap [ expr int([magic::u2l $half_overlap]) ]
    ]
}

proc placement_move {placement dx dy} {
    # Since location is specified with the placement dictionary
    # I think movement should be done with internal units
    # Maybe is possible to use um, I haven't figured it out
    puts "placement_move | original: $placement"

    dict set placement llx [expr [dict get $placement llx] + int([magic::u2l $dx])]
    dict set placement urx [expr [dict get $placement urx] + int([magic::u2l $dx])]

    dict set placement lly [expr [dict get $placement lly] + int([magic::u2l $dy])]
    dict set placement ury [expr [dict get $placement ury] + int([magic::u2l $dy])]

    puts "placement_move | final: $placement"
    return $placement
}

proc _shift_placement { placement } {
    # Specially on standard cells, it's important to apply a overlap to make contact on the metals
    # This operation should be applied before and after cell placement.
    set half_overlap [dict get $placement half_overlap]
    set llx [expr [dict get $placement llx] - $half_overlap]

    set placement [dict set placement llx $llx]

    return $placement
}

proc place {placement} {
    # It's easier to use this than extract individual values outside
    set llx [dict get $placement llx]
    set lly [dict get $placement lly]
    set urx [dict get $placement urx]
    set ury [dict get $placement ury]
    box $llx $lly $urx $ury
}

proc adjust_screen {} {
    # Adjust view to see the cell
    select top cell
    view
    expand
}

#----------------------------------------------------------------
# insert_std_*: Instantiation of standard cells
#----------------------------------------------------------------

proc insert_std_cell { cellname placement  } {
    # This function assumes all stdcells has a overlap
    # getcell: create an instance of a cell with its lower-left corner aligned with the lower-left corner of the box
    global PDK_ROOT

    separation_handler

    puts "Placing stdcell $cellname"

    set placement [_shift_placement $placement]

    place $placement
    getcell $PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__$cellname.mag
    if {[expr 0 != [dict get $placement rot]]} {
        rotate [dict get $placement rot]
    }

    # TODO: This lines are ugly, fix them eventually with "dict update ..."
    set internal_unit_scale [expr [lindex [tech lambda] 1] / [lindex [tech lambda] 0]]
    set placement [dict set placement llx [expr [dict get $placement llx] + [box width] / $internal_unit_scale]]
    set placement [dict set placement urx [expr [dict get $placement urx] + [box width] / $internal_unit_scale]]

    set placement [_shift_placement $placement]

    separation_handler

    return [dict set placement rot 0]
}

#----------------------------------------------------------------
# insert_pcell_*: Instantiation of pcells
#----------------------------------------------------------------

proc insert_pcell { cellname params placement } {
    # It's possible to insert pcells without creating a specific method
    # for each one
    separation_handler

    puts "Placing pcell $cellname"
    place $placement

    set default_params [eval sky130::sky130_fd_pr__${cellname}_defaults]

    sky130::sky130_fd_pr__${cellname}_draw [
        sky130::sky130_fd_pr__${cellname}_check [
            dict merge $default_params $params
        ]
    ]

    if {[expr 0 != [dict get $placement rot]]} {
        rotate [dict get $placement rot]
    }

    # TODO: This lines are ugly, fix them eventually with "dict update ..."
    set internal_unit_scale [expr [lindex [tech lambda] 1] / [lindex [tech lambda] 0]]
    set placement [dict set placement llx [expr [dict get $placement llx] + [box width] / $internal_unit_scale]]
    set placement [dict set placement urx [expr [dict get $placement urx] + [box width] / $internal_unit_scale]]

    separation_handler

    return $placement
}

proc insert_box {layer placement} {
    place $placement
    paint $layer
}


proc insert_label {name layer placement} {
    place $placement
    paint $layer
    label $name south $layer
}

proc insert_port {name layer placement} {
    insert_label $name $layer placement
    select area label
    port make
}

#----------------------------------------------------------------
# Testing
#----------------------------------------------------------------

namespace eval testing {

    proc test_start {description} {
        separation_handler
        drc off
        puts "== TEST == "
        puts "Descr: $description"
    }

    namespace export place_inverters
    proc place_inverters {} {
        test_start "Basic test, just insert inverters"

        # Inserting inverters

        set placement [default_placement]
        set placement [insert_std_cell inv_2 $placement]
        set placement [insert_std_cell inv_2 $placement]

        adjust_screen
    }

    namespace export place_pcells
    proc place_pcells {} {
        test_start "Placing pcells"

        # Inserting a capacitor

        set placement [default_placement 0 0 10 10]
        dict set placement half_overlap 0

        set placement [insert_pcell res_iso_pw {} $placement]

        adjust_screen
        puts "It worked"
        return 1

        # puts "Placement 1: $placement"
        # set placement [insert_pcell res_iso_pw {} $placement]

        # dict set placement llx 10um
        # puts "Placement 2: $placement"
        # set placement [insert_pcell res_high_po_5p73 {} $placement]

        # puts "Placement 3: $placement"

    }

    namespace export placement_movement
    proc placement_movement {} {
        test_start "This tests is to evaluate if placement_move works"

        set placement [default_placement 0 0 1 1]
        puts "default placement: $placement"

        set placement [placement_move $placement 1 0]
        puts "after moving: $placement"
    }

    namespace export paint_boxes
    proc paint_boxes {} {
        test_start "Place and paint boxes"

        set placement [default_placement 0 0 1 1]
        puts "Original placement: $placement"
        insert_box li $placement

        set placement [placement_move $placement 2 0]
        puts "After moving: $placement"
        insert_box li $placement

        adjust_screen
    }
}
