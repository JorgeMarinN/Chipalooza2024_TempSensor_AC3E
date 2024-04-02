#!/bin/bash

docker run -it --rm \
	-v .:/home/designer/Chipalooza2024_TempSensor_AC3E \
	-e PDK=sky130A \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	--net=host \
	-e DISPLAY \
	-e XDG_RUNTIME_DIR \
	-e PULSE_SERVER \
	akilesalreadytaken/chipathon-tools:latest bash
