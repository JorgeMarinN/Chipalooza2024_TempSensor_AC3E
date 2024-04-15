set_units -time ns

create_clock -period 4 [get_ports clk] -name clk

set_input_delay -max 0.6 -clock clk [get_ports pulse]
set_input_delay -max 0.6 -clock clk [get_ports rst]

set_output_delay -max 0.6 -clock clk [get_ports ones]
set_output_delay -max 0.6 -clock clk [get_ports ready]

#set_clock_uncertainty -setup 0.3 [get_ports clk]
#set_propagated_clock [get_ports clk]
