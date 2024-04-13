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

proc create_BUFFMIN { {xmin 0} {xmax 0} {ymin 0} {ymax 0} } {

    set placement [default_placement]
    set placement [insert_std_cell tapvpwrvgnd_1  $placement]

    ## vias
    set width 0.17
    set viali_space 1.38
    set init_x 0.93
    set init_y 1.095
    set vias_placement [default_placement $init_x $init_y [expr $init_x + $width] [expr $init_y + $width] 0 0]

    # Placing 1st inverter
    set placement [insert_std_cell inv_1 $placement]
    # Placing 2nd inverter
    set placement [insert_std_cell inv_2 $placement]

    # Routing VSS
    box -0.38um -0.240um 3.22um 0.24um
    paint m1

    # Routing VDD
    box -0.38um 2.48um 3.22um 2.96um
    paint m1

    # Routing VIN
    box -0.380um 0.995um 0.59um 1.325um
    paint poly

    # Routing VOUT1-VIN2
    box 1.09um 1.075um 2.080um 1.325um
    paint li    

    # Via
    box 2.31um 1.095um 2.48um  1.265um
    paint viali

    # Routing VOUT
    box 2.25um 0.995um 3.22um 1.325um
    paint m1 

    # Labels and ports
    box -0.38um 1.14um -0.38um 1.14um 
    label VIN w poly
    port make 1

    box 3.22um 1.17um 3.22um 1.17um
    label VOUT e m1 
    port make 2

    box -0.38um -0.02um -0.38um -0.02um 
    label VSS w m1
    port make 3

    box -0.38um 2.7um -0.38um 2.7um 
    label VDD w m1
    port make 4
}

proc main {} {
    drc off

    select cell BUFFMIN
    delete
    file delete BUFFMIN.mag

    create_BUFFMIN
    select cell BUFFMIN
    save BUFFMIN
    gds write ../layout/BUFFMIN.gds

    adjust_screen

    drc style drc(full)
    drc check
}

main
