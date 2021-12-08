#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. $SCRIPT_DIR/functions.sh

ALL=0
TEST=0

while [[ $# -gt 0 ]] && [[ "$1" == "--"* ]] ;
do
    opt="$1";
    shift;              #expose next argument
    case "$opt" in
        "--" ) break 2;;
        "--all" )
           ALL="1"; shift;;
        "--test" )
           TEST="1"; shift;;
        *) echo >&2 "Invalid option: $@";;
   esac
done

if [ "$ALL" = "1" ]; then
    install_all
else
  menu
fi

. ~/.bashrc
