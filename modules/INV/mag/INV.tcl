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

source ../../../scripts/sky130_handlers.tcl

proc create_INV { {xmin 0} {xmax 0} {ymin 0} {ymax 0} } {

    set placement [default_placement]
    set placement [insert_std_cell tapvpwrvgnd_1  $placement]

    ## vias
    set width 0.17
    set viali_space 1.38
    set init_x 0.93
    set init_y 1.095
    set vias_placement [default_placement $init_x $init_y [expr $init_x + $width] [expr $init_y + $width] 0 0]

    for {set i 0} {$i < 6} {incr i} {
        set placement [insert_std_cell inv_2 $placement]

        # Place Vias
        #set vias_placement [default_placement [expr $init_x + $viali_space] $init_y [expr $init_x + $width + $viali_space] [expr $init_y + $width] 0 0]
        #insert_box viali $vias_placement
    }

    # Routing VIN
    box -0.380um 0.995um 8.145um 1.325um
    paint poly

    # Routing VOUT
    box 0.800um 0.995um 8.740um 1.325um
    paint m1    

    # Vias hardcoded
    box 0.93um 1.095um 1.100um  1.265um
    paint viali
    box 2.31um 1.095um 2.48um  1.265um
    paint viali
    box 3.65um 1.095um 3.865um  1.265um
    paint viali
    box 5.08um 1.095um 5.25um  1.265um
    paint viali
    box 6.465um 1.095um 6.635um  1.265um 
    paint viali
    box 7.850um 1.095um 8.020um  1.265um
    paint viali

}

proc main {} {
    drc off

    select cell INV
    delete
    file delete INV.mag

    create_INV
    select cell INV
    save INV
    gds write ../layout/INV.gds

    adjust_screen

    drc style drc(full)
    drc check
}

main
