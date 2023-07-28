#!/bin/bash
icons=("󰕾" "󰖁")

get_volume() {
    is_mute=$(pulsemixer --get-mute)
    echo ${icons[$is_mute]}
}

get_volume