#!/bin/bash
run() {
    if ! pgrep -f "$1"; then # si no hay un proceso con el nombre del programa
        "$@" & # tira el programa con sus argumentos en background
    fi
}



run flameshot
