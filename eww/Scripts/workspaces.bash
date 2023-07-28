#!/bin/bash

workspaces() {
  # initial check for occupied workspaces
  for num in $(hyprctl workspaces | grep ID | sed 's/()/(1)/g' | awk 'NR>1{print $1}' RS='(' FS=')'); do
    export o"$num"="$num"
  done

  #initial check for focused workspace
  for num in $(hyprctl monitors | grep active | sed 's/()/(1)/g' | awk 'NR>1{print $1}' RS='(' FS=')'); do
    export f"$num"="$num"
    export fnum=f"$num"
  done

  case $num in
  1)
    echo "(box (label :text \"󰄯  󰄰  󰄰  󰄰  󰄰\" ))"
    ;;
  2)
    echo "(box (label :text \"󰄰  󰄯  󰄰  󰄰  󰄰\" ))"
    ;;
  3)
    echo "(box (label :text \"󰄰  󰄰  󰄯  󰄰  󰄰\" ))"
    ;;
  4)
    echo "(box (label :text \"󰄰  󰄰  󰄰  󰄯  󰄰\" ))"
    ;;
  5)
    echo "(box (label :text \"󰄰  󰄰  󰄰  󰄰  󰄯\" ))"
    ;;
  esac
}

socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r event; do
  workspaces "$event"
done
