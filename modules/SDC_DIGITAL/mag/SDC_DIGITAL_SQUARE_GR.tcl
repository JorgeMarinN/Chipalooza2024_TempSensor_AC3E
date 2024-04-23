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



## Adding localinterconnect and metal1
# PAINTING
#     _______
#	  	     |
#	         |
#     _______|
#
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