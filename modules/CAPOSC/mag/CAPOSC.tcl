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


proc draw_multi_mimcap {parameters placement} {
    set inst_name [insert_pcell cap_mim_m3_1 $parameters $placement]
    set placement [placement_move $placement -0.2 -0.2]
    set inst_name [insert_pcell cap_mim_m3_2 $parameters $placement]
}

proc create_CAPOSC { {xmin 0} {xmax 0} {ymin 0} {ymax 0} } {

    set placement [default_placement]

    set parameters {w 10 l 10}
    
    draw_multi_mimcap $parameters $placement

    set placement [placement_move $placement 20 0]

    draw_multi_mimcap $parameters $placement

    set placement [placement_move $placement 20 0]
    set inst_name [insert_pcell cap_mim_m3_1 $parameters $placement]

}

proc hide_layers {} {
    see no *
    # see mvndiffusion
    # see mvpdiffusion
    # see mvndcontact
    # see mvpdcontact
    # see pcontact
    # see mvpsubstratepdiff
    # see mvnsubstratendiff
    # see mvpsubstratepcontact
    # see mvnsubstratencontact
    # see mvntransistor
    # see polysilicon
    # see locali
    # see viali
    # see metal1
    # see m2contact
    # see m3contact
    # see via3
    # see via4
    see mimcap
    see mimcap2
    # see mimcapcontact
    # see mimcap2contact
}

proc main {} {
    drc off

    select cell CAPOSC
    delete

    create_CAPOSC
    select cell CAPOSC
    
    # file delete CAPOSC.mag
    cellname rename [cellname list self] CAPOSC
    #save CAPOSC                    ; # To generate mag
    #gds write ../layout/CAPOSC.gds ; # To generate gds

    adjust_screen

    drc style drc(full)
    drc check

    #hide_layers
}

#main
