#!/bin/bash

function command_exists {
    cmd=$1
    if ! command -v $cmd &> /dev/null
    then
        echo "-> $cmd could not be found... NOK"
        ./setup_${cmd}.sh
    else
        echo "-> $cmd already installed... OK"
    fi
}

command_exists testcmd
command_exists pyenv
command_exists tfenv


. ~/.bashrc
