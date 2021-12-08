#!/bin/bash
# Bash Menu Script Example

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
CURR_DIR="${PWD}"

function menu {
    local available_tools
    list_tools available_tools
    createmenu "${#available_tools[@]}" "${available_tools[@]}"
}

function createmenu {
    arrsize=$1
    PS3="Select your option (0 to select all): "
    select option in "${@:2}"; do
        if [ "$REPLY" -eq 0 ]; then
            install_all
            exit 0
        elif [ 1 -le "$REPLY" ] && [ "$REPLY" -le $((arrsize)) ]; then
            echo "You selected $option which is option $REPLY"
            command_exists $option
            break
        else
            echo "Incorrect Input: Select a number 1-$arrsize"
            exit 1
        fi
    done
}

function install_all {
    local available_tools
    list_tools available_tools
    for t in "${available_tools[@]}"; do
        #printf "Validating: %s\n" "$t"
        command_exists $t
    done


}

function command_exists {
    cmd=$1
    if ! command -v $cmd &>/dev/null; then
        echo "-> $cmd could not be found... NOK"
        $SCRIPT_DIR/tools/${cmd}
    else
        echo "-> $cmd already installed... OK"
    fi
}

function list_tools {
    local -n tools=$1
    for file in $SCRIPT_DIR/tools/*; do
        tools+=( "$(basename "$file")" )
    done
}
