#!/bin/bash
bat_status_arr=("󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")

get_battery_status() {
    percentage=$(cat /sys/class/power_supply/BAT0/capacity)
    status=$(($percentage / 10))
    echo ${bat_status_arr[$status]}
}

get_battery_status
