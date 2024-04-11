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

# The following files contains almost all the interesting functions

# /usr/lib/magic/tcl/bsitools.tcl
# - add_menu
# - add_menu_command
# - add_menu_separator

# /usr/lib/magic/tcl/cellmgr.tcl
# - instcallback
# - makecellmanager
# - addlistentry
# - addlistset
# - getwindowitem
# - cellmanager
# - mgrselect
# - findinstance
# - scantree

# /usr/lib/magic/tcl/console.tcl
# /usr/lib/magic/tcl/drcmgr.tcl
# - drccallback
# - makedrcmanager
# - adddrcentry
# - drcmanager
# - drc_save_report
# - drc_load_report

# /usr/lib/magic/tcl/libmgr.tcl
# - libcallback
# - makelibmanager
# - addlibentry
# - addtolibset
# - libmanager

# /usr/lib/magic/tcl/magic.tcl
# /usr/lib/magic/tcl/mazeroute.tcl
# /usr/lib/magic/tcl/readspice.tcl
# /usr/lib/magic/tcl/reorderLayers.tcl
# /usr/lib/magic/tcl/socketcmd.tcl
# /usr/lib/magic/tcl/strip_reflibs.tcl
# /usr/lib/magic/tcl/techbuilder.tcl
# /usr/lib/magic/tcl/texthelper.tcl
# - make_texthelper
# - analyze_labels
# - change_label
# - make_new_label
# - update_texthelper
# /usr/lib/magic/tcl/tkcon.tcl
# /usr/lib/magic/tcl/tkshell.tcl
# /usr/lib/magic/tcl/toolbar.tcl

# /usr/lib/magic/tcl/toolkit.tcl
# - add_toolkit_menu
# - add_toolkit_button
# - add_toolkit_command
# - add_toolkit_separator
# - move_forward_by_width
# - get_and_move_inst
# - create_new_pin
# - generate_layout_add
# - netlist_to_layout
# - gencell
# - gencell_makecell
# - gencell_getparams
# - gencell_setparams
# - gencell_change
# - gencell_change_orig
# - get_gencell_name
# - get_gencell_hash
# - gencell_create
# - add_entry
# - add_check_callbacks
# - add_dependency
# - update_dialog
# - add_checkbox
# - add_message
# - add_selectlist
# - add_selectindex
# - gencell_defaults
# - gencell_update
# - gencell_dialog

# /usr/lib/magic/tcl/toolkit_rev0.tcl
# /usr/lib/magic/tcl/tools.tcl
# /usr/lib/magic/tcl/wrapper.tcl

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

    # rot: http://opencircuitdesign.com/magic/commandref/getcell.html

    return [dict create \
        llx [ expr int([magic::u2l $llx]) ] \
        lly [ expr int([magic::u2l $lly]) ] \
        urx [ expr int([magic::u2l $urx]) ] \
        ury [ expr int([magic::u2l $ury]) ] \
        rot $rot \
        half_overlap [ expr int([magic::u2l $half_overlap]) ]
    ]
}

proc placement_get_current {} {
    set llx [magic::l2u [lindex [box values] 0]]
    set lly [magic::l2u [lindex [box values] 1]]
    set urx [magic::l2u [lindex [box values] 2]]
    set ury [magic::l2u [lindex [box values] 3]]

    return [ default_placement $llx $lly $urx $ury ]
}

proc placement_move {placement dx dy} {
    # Since location is specified with the placement dictionary
    # I think movement should be done with internal units
    # Maybe is possible to use um, I haven't figured it out
    #puts "placement_move | original: $placement"

    dict set placement llx [expr [dict get $placement llx] + int([magic::u2l $dx])]
    dict set placement urx [expr [dict get $placement urx] + int([magic::u2l $dx])]

    dict set placement lly [expr [dict get $placement lly] + int([magic::u2l $dy])]
    dict set placement ury [expr [dict get $placement ury] + int([magic::u2l $dy])]

    #puts "placement_move | final: $placement"
    return $placement
}

proc _placement_overlap_shift { placement } {
    # Specially on standard cells, it's important to apply a overlap to make contact on the metals
    # This operation should be applied before and after cell placement.
    set half_overlap [dict get $placement half_overlap]
    set shifting -[magic::l2u $half_overlap]
    set placement [placement_move $placement $shifting 0]
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
# insert_*: Instantiation of standard cells, pcells and other devices
#----------------------------------------------------------------

proc insert_std_cell { cellname placement  } {
    # description
    #   Instanciate standard cell, assuming it has an overlap
    # args
    #   cellname: sky130 stdcell
    #   placement: llx, lly are the position of the cell
    # returns
    #   Placement updated. rotation is cleared.
    global PDK_ROOT

    separation_handler

    puts "Placing stdcell $cellname"

    set placement [_placement_overlap_shift $placement]

    set target_cell $PDK_ROOT/sky130A/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__$cellname.mag
    set rot [dict get $placement rot]

    # getcell: create an instance of a cell with its lower-left corner aligned with the lower-left corner of the box
    place $placement
    getcell $target_cell $rot

    set placement [placement_move $placement [magic::i2u [box width]] 0]
    set placement [_placement_overlap_shift $placement]

    separation_handler

    return [dict set placement rot 0]
}

proc insert_pcell {cellname params placement} {
    # description
    #   This procedure is based on magic::gencell, stripping everything related with
    #   dialogs, .spice and existing instances
    # args
    #   cellname: sky130A cell name-only (without sky130_fd_pr__)
    #   params: Specific parameters for $cellname.
    #   placement: llx, lly are the position of the cell.
    # returns
    #   instance name

    set library sky130
    set gencell_type sky130_fd_pr__$cellname

    # Check that the device exists as a gencell, or else return an error
    if {[namespace eval ::${library} info commands ${gencell_type}_draw] == ""} {
        error "No import routine for ${library} library cell ${gencell_type}!"
    }

    set base_parameters [${library}::${gencell_type}_defaults]
    set parameters [dict merge $base_parameters $params]

    set rot [dict get $placement rot]
    place $placement
    set inst_defaultname [magic::gencell_create $gencell_type $library $parameters $rot]
    select cell $inst_defaultname

    return $inst_defaultname
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

    namespace export place_rotated_inverter
    proc place_rotated_inverter {} {
        test_start "Basic test, just insert inverters"

        # Inserting inverters

        set placement [default_placement 0 0 0 0 90]

        set placement [insert_std_cell inv_2 $placement]
        set placement [insert_std_cell inv_2 $placement]

        puts "Second inverter should be moved on the right and over the first one"

        adjust_screen
    }

    namespace export placement_test_movement
    proc placement_test_movement {} {
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

    namespace export place_rotated_pcells
    proc place_rotated_pcells {} {
        test_start "Placing a rotated pcells"

        set placement [default_placement 0 0 0 0 90]
        place $placement

        set placement [insert_pcell res_iso_pw {} $placement]

        adjust_screen
    }

    namespace export place_a_nfet
    proc place_a_nfet {} {
        # Placement not necessary has to be used in this function
        test_start "Placing only one resistor"
        set placement [default_placement]
        dict set placement rot 90

        puts $placement

        insert_pcell nfet_01v8 {w 10 l 1 nf 5 guard 0} $placement

        adjust_screen
    }

    namespace export place_two_nfets    
    proc place_two_nfets {} {
        # Placement should change pcell position
        puts "Placing only one resistor"
        set placement [default_placement]
        set placement [placement_move $placement 3 0]
        dict set placement rot 90
        dict set placement half_overlap 0
        puts "First nfet placement: $placement"

        # Original set of parameters (orient is get from placement)
        # TODO: which one has precedence
        set parameters {w 10 l 1 nf 5 guard 0}
        set inst_name [insert_pcell nfet_01v8 $parameters $placement]
        select cell $inst_name
        set cell_position [box position]
        puts "Created first cell $inst_name "
        set a 0
        puts ". Cell positioned on $cell_position"
        puts "If it says 0 0, then 'placement' was not used :("


        separation_handler

        # This nfet should be moved
        set placement [placement_move $placement 13 0]
        puts "Second nfet placement: $placement"
        #dict set parameters nf 3 ; # If this line is commented
        set inst_name [insert_pcell nfet_01v8 $parameters $placement]
        select cell $inst_name
        set cell_position [box position]
        puts "Created second cell $inst_name "
        puts ". Cell positioned on $cell_position"
        puts "If it says 0 0, then 'placement' was not used :("

        adjust_screen
    }
}
