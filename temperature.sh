#!/bin/bash
echo "GPU: $(/opt/vc/bin/vcgencmd measure_temp)"
cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "CPU: $((cpu/1000))°C"
