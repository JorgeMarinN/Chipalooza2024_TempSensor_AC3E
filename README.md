# Chipalooza2024_TempSensor_AC3E

Time-based temperature sensor proposal for Chipalooza 2024

## Setup

Clone with the `--recurse-submodules` flag

~~~bash
git clone --recurse-submodules https://github.com/JorgeMarinN/Chipalooza2024_TempSensor_AC3E.git
~~~

If the repo it's cloned without submodules, or is required to update the commits, use

~~~bash
git submodule update --init --recursive
~~~

## Usage

This projects relies on `ic-makefile` to add an abstraction layer over the tools. The operations are made on the `./modules` directory.

~~~bash
make TOP=SDC xschem           # Open the schematic
make TOP=SDC xschem-tb        # Open the testbench
make TOP=SDC cace-gui         # Open CACE specification tool
make TOP=SDC USE_RESULTS=y cace-gui 
                                # Open CACE using a .txt with results
make TOP=SDC CACE_TEST=transient cace-tb
                                # Open a CACE testbench
make TOP=SDC cace-validation  # Shows cace variables related to a design
~~~

## Design

| Module         | Magic DRC | Klayout Precheck DRC | Magic LVS |
|----------------|-----------|----------------------|-----------|
| PASSGATE       | 0         | Y                    | Y         |
| DFF            | 0         | Y                    | Y         |
| INV            | 0         | Y                    | Y         |
| BUFFMIN        | 0         | Y                    | Y         |
| CAPOSC         | 0         | Y                    | Y         |
| INVandCAP      | 0         | Y                    | Y         |
| OSC            | 7         | Y                    | Y         |
| INTERNAL_SDC   | 14        | Y                    | Y         |
| ARRAY_RES_ISO  |           | Y                    | Y         |
| ARRAY_RES_HIGH |           | Y                    | Y         |
| SDC            |           | Y                    | Y         |
| ONES_COUNTER   | 0         | Y                    | -         |

Note: DRC errors can be fixed on subsequent designs.