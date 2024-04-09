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

#calma read $env(PDK_ROOT)/sky130A/libs.ref/


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

proc create_INV { {xmin 0} {xmax 0} {ymin 0} {ymax 0} } {
    #return

    set placement [default_placement]

    set placement [insert_std_cell tap_1 $placement]

    for {set i 0} {$i < 6} {incr i} {
        set placement [insert_std_cell inv_2 $placement]
    }

    # set placement {default_placement [expr 0.335 + 1.5]um 1.885um [expr 0.505 + 1.5]um 2.055um}
    # insert_port VCC li $placement

    # set placement [default_placement [expr 0.335 + 1.5]um 0.795um [expr 0.505 + 1.5]um 0.965um]
    # puts $placement
    #insert_port VSS li $placement

    # box [expr 0.335 + 1.5]um 0.795um [expr 0.505 + 1.5]um 0.965um
    # paint li
    # label VSS south li
    # select area label
    # port make




    # box [expr 1.260 + 1.5]um 1.315um [expr 1.430 + 1.5]um 1.485um
    # paint li
    # label VIN south li
    # select area label
    # port make

    # box [expr 2.065]um 17.675um [expr 3.325]um 17.885um
    # paint li
    # label VOUT south li
    # select area label
    # port make
}

# Why do a main function if is not required?
# Because you can test multiple main functions that validates a specific
# part of the work

proc main {} {
    # DRC is not required when creating the layout
    drc off

    select cell INV
    delete
    file delete INV.mag

    create_INV
    save INV
    select cell INV
    gds write ../layout/INV.gds

    adjust_screen

    # DRC is required when reviewing the layout
    drc style drc(full)

}

main
