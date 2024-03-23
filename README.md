# Chipalooza2024_TempSensor_AC3E

Time-based temperature sensor proposal for Chipalooza 2024

## Setup

Clone with the `--recurse-submodules` flag

~~~
$ git clone --recurse-submodules https://github.com/JorgeMarinN/Chipalooza2024_TempSensor_AC3E.git
~~~

If the repo it's cloned without submodules, or is required to update the commits, use

~~~
$ git submodule update --init --recursive
~~~

## Usage

This projects relies on `ic-makefile` to add an abstraction layer over the tools. The operations are made on the `./modules` directory.

~~~
$ make TOP=SDC xschem           # Open the schematic
$ make TOP=SDC xschem-tb        # Open the testbench
$ make TOP=SDC cace-gui         # Open CACE specification tool
$ make TOP=SDC USE_RESULTS=y cace-gui 
                                # Open CACE using a .txt with results
$ make TOP=SDC CACE_TEST=transient cace-tb
                                # Open a CACE testbench
$ make TOP=SDC cace-validation  # Shows cace variables related to a design
~~~