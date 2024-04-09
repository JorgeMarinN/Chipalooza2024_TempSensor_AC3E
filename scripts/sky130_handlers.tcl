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

proc default_placement { {llx 0} {lly 0} {urx 0} {ury 0} {rot 0} {half_overlap 0.19} } {
    # The overlap is used mainly on standard cells, because that's a gap of wells (I guess)

    box 0 0 1um 1um
    set um2db [expr int ([box width] * [lindex [tech lambda] 0] / [lindex [tech lambda] 1])]

    set half_overlap [expr int( $um2db * $half_overlap )]
    return [dict create llx $llx lly $lly urx $urx ury $ury rot $rot half_overlap $half_overlap]
}

# Specially on standard cells, it's important to apply a overlap to make contact on the metals
# This operation should be applied before and after cell placement.
proc _shift_placement { placement } {
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
    # This function assumes all stdcells has a overlap that should be
    # getcell: create an instance of a cell with its lower-left corner aligned with the lower-left corner of the box
    global PDK_ROOT

    puts "Placing standard cell $cellname"

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

    return [dict set placement rot 0]
}

#----------------------------------------------------------------
# insert_pcell_*: Instantiation of pcells
#----------------------------------------------------------------

# params = { w 2 l 2 }
proc insert_pcell_cap_mim_m3_1 { cellname params placement } {
    place $placement

    set default_params [eval sky130::sky130_fd_pr__cap_mim_m3_1_defaults]

    sky130::sky130_fd_pr__cap_mim_m3_1_draw [
        sky130::sky130_fd_pr__cap_mim_m3_1_check [
            dict merge $default_params $params
        ]
    ]
}

proc insert_pcell { cellname params placement } {
    place $placement

    set default_params [eval sky130::sky130_fd_pr__{$cellname}_defaults]

    sky130::sky130_fd_pr__{$cellname}_draw [
        sky130::sky130_fd_pr__{$cellname}_check [
            dict merge $default_params $params
        ]
    ]
}

#----------------------------------------------------------------
# Testing
#----------------------------------------------------------------

proc test_sky130_handlers {} {
    # DRC is not required when creating the layout
    drc off

    # ?

    # DRC is required when reviewing the layout
    drc style drc(full)
}