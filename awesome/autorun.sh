#!/bin/bash
run() {
    if ! pgrep -f "$1"; then # si no hay un proceso con el nombre del programa
        "$@" & # tira el programa con sus argumentos en background
    fi
}

run xrandr --output HDMI-1 --mode 1440x900
run setxkbmap -option ctrl:swapcaps
run flameshot
