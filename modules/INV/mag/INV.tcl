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
    set placement [insert_std_cell tap_1 $placement]

    for {set i 0} {$i < 6} {incr i} {
        set placement [insert_std_cell inv_2 $placement]
    }

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
