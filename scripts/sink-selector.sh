#!/bin/bash

#sink_list=$(pactl list short sinks)
#sink_running=$(pactl list short sinks | grep -v SUSPENDED)

sink_id=$(pactl list short sinks | grep -v -i SUSPENDED | awk '{print $1; exit}')
pactl set-default-sink $sink_id
# Obtener información detallada del sink en uso

# Imprimir la información del sink en uso
echo "$sink_id"

